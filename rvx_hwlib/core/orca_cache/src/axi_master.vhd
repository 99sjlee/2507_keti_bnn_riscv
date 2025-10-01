library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.utils_pkg.all;
use work.rv_components.all;
use work.constants_pkg.all;

-------------------------------------------------------------------------------
-- AXI master from OIMM master.
-------------------------------------------------------------------------------

entity axi_master is
  generic (
    ADDRESS_WIDTH            : positive;
    DATA_WIDTH               : positive;
    ID_WIDTH                 : positive;
    LOG2_BURSTLENGTH         : positive;
    MAX_OUTSTANDING_REQUESTS : natural;
    REQUEST_REGISTER         : request_register_type;
    RETURN_REGISTER          : boolean
    );
  port (
    clk     : in std_logic;
    reset   : in std_logic;
    aresetn : in std_logic;

    master_idle : out std_logic;

    --ORCA-internal memory-mapped slave
    oimm_address            : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    oimm_burstlength_minus1 : in  std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
    oimm_byteenable         : in  std_logic_vector((DATA_WIDTH/8)-1 downto 0);
    oimm_requestvalid       : in  std_logic;
    oimm_readnotwrite       : in  std_logic;
    oimm_writedata          : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    oimm_writelast          : in  std_logic;
    oimm_readdata           : out std_logic_vector(DATA_WIDTH-1 downto 0);
    oimm_readdatavalid      : out std_logic;
    oimm_waitrequest        : out std_logic;

    --AXI memory-mapped master
    AWID    : out std_logic_vector(ID_WIDTH-1 downto 0);
    AWADDR  : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    AWLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
    AWSIZE  : out std_logic_vector(2 downto 0);
    AWBURST : out std_logic_vector(1 downto 0);
    AWLOCK  : out std_logic_vector(1 downto 0);
    AWCACHE : out std_logic_vector(3 downto 0);
    AWPROT  : out std_logic_vector(2 downto 0);
    AWVALID : out std_logic;
    AWREADY : in  std_logic;

    WID    : out std_logic_vector(ID_WIDTH-1 downto 0);
    WSTRB  : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
    WVALID : out std_logic;
    WLAST  : out std_logic;
    WDATA  : out std_logic_vector(DATA_WIDTH-1 downto 0);
    WREADY : in  std_logic;

    BID    : in  std_logic_vector(ID_WIDTH-1 downto 0);
    BRESP  : in  std_logic_vector(1 downto 0);
    BVALID : in  std_logic;
    BREADY : out std_logic;

    ARID    : out std_logic_vector(ID_WIDTH-1 downto 0);
    ARADDR  : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    ARLEN   : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
    ARSIZE  : out std_logic_vector(2 downto 0);
    ARBURST : out std_logic_vector(1 downto 0);
    ARLOCK  : out std_logic_vector(1 downto 0);
    ARCACHE : out std_logic_vector(3 downto 0);
    ARPROT  : out std_logic_vector(2 downto 0);
    ARVALID : out std_logic;
    ARREADY : in  std_logic;

    RID    : in  std_logic_vector(ID_WIDTH-1 downto 0);
    RDATA  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    RRESP  : in  std_logic_vector(1 downto 0);
    RLAST  : in  std_logic;
    RVALID : in  std_logic;
    RREADY : out std_logic
    );
end entity axi_master;

architecture rtl of axi_master is
  constant CACHE_LINE_SIZE : positive := 32;
  signal busy : std_logic;
begin

  ervp_master : ERVP_ORCA_CACHE_AXI_MASTER_OLD
  generic map (
    BW_ADDR            => ADDRESS_WIDTH,
    BW_DATA            => DATA_WIDTH,
    BW_AXI_TID         => ID_WIDTH,
    BW_BURST_LENGTH    => LOG2_BURSTLENGTH,
    CACHE_LINE_SIZE    => CACHE_LINE_SIZE
  )
  port map (
    clk     => clk,
    rstnn => aresetn,
    busy => busy,

    c_oimm_address            => oimm_address,
    c_oimm_burstlength_minus1 => oimm_burstlength_minus1,
    c_oimm_byteenable         => oimm_byteenable,
    c_oimm_requestvalid       => oimm_requestvalid,
    c_oimm_readnotwrite       => oimm_readnotwrite,
    c_oimm_writedata          => oimm_writedata,
    c_oimm_writelast          => oimm_writelast,
    c_oimm_readdata           => oimm_readdata,
    c_oimm_readdatavalid      => oimm_readdatavalid,
    c_oimm_waitrequest        => oimm_waitrequest,

    sxawid    => AWID,
    sxawaddr  => AWADDR,
    sxawlen   => AWLEN,
    sxawsize  => AWSIZE,
    sxawburst => AWBURST,
    sxawvalid => AWVALID,
    sxawready => AWREADY,

    sxwid    => WID,
    sxwstrb  => WSTRB,
    sxwvalid => WVALID,
    sxwlast  => WLAST,
    sxwdata  => WDATA,
    sxwready => WREADY,

    sxbid    => BID,
    sxbresp  => BRESP,
    sxbvalid => BVALID,
    sxbready => BREADY,

    sxarid    => ARID,
    sxaraddr  => ARADDR,
    sxarlen   => ARLEN,
    sxarsize  => ARSIZE,
    sxarburst => ARBURST,
    sxarvalid => ARVALID,
    sxarready => ARREADY,

    sxrid    => RID,
    sxrdata  => RDATA,
    sxrresp  => RRESP,
    sxrlast  => RLAST,
    sxrvalid => RVALID,
    sxrready => RREADY
  );

  AWLOCK <= (others =>'0');
  AWCACHE <= (others =>'0');
  AWPROT <= (others =>'0');
  ARLOCK <= (others =>'0');
  ARCACHE <= (others =>'0');
  ARPROT <= (others =>'0');

  master_idle <= not busy;

end architecture;
