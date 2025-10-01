library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.rv_components.all;

entity a4l_master is
  generic (
    ADDRESS_WIDTH            : positive;
    DATA_WIDTH               : positive;
    MAX_OUTSTANDING_REQUESTS : natural
    );
  port (
    clk     : in std_logic;
    reset   : in std_logic;
    aresetn : in std_logic;

    master_idle : out std_logic;

    --ORCA-internal memory-mapped slave
    oimm_address       : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    oimm_byteenable    : in  std_logic_vector((DATA_WIDTH/8)-1 downto 0);
    oimm_requestvalid  : in  std_logic;
    oimm_readnotwrite  : in  std_logic;
    oimm_writedata     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    oimm_readdata      : out std_logic_vector(DATA_WIDTH-1 downto 0);
    oimm_readdatavalid : out std_logic;
    oimm_waitrequest   : out std_logic;

    --AXI4-Lite memory-mapped master
    AWADDR  : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    AWPROT  : out std_logic_vector(2 downto 0);
    AWVALID : out std_logic;
    AWREADY : in  std_logic;

    WSTRB  : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
    WVALID : out std_logic;
    WDATA  : out std_logic_vector(DATA_WIDTH-1 downto 0);
    WREADY : in  std_logic;

    BRESP  : in  std_logic_vector(1 downto 0);
    BVALID : in  std_logic;
    BREADY : out std_logic;

    ARADDR  : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    ARPROT  : out std_logic_vector(2 downto 0);
    ARVALID : out std_logic;
    ARREADY : in  std_logic;

    RDATA  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    RRESP  : in  std_logic_vector(1 downto 0);
    RVALID : in  std_logic;
    RREADY : out std_logic
    );
end entity a4l_master;

architecture rtl of a4l_master is
  constant LOG2_BURSTLENGTH : positive := 8;
  constant ID_WIDTH : positive := 4;
  constant CACHE_LINE_SIZE : positive := 8;

  signal busy : std_logic;
  signal oimm_burstlength_minus1 : std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
  signal oimm_writelast : std_logic;

 signal AWID : std_logic_vector(ID_WIDTH-1 downto 0);
 signal AWLEN : std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
 signal AWSIZE : std_logic_vector(2 downto 0);
 signal AWBURST : std_logic_vector(1 downto 0);

 signal WID : std_logic_vector(ID_WIDTH-1 downto 0);
 signal WLAST : std_logic;
 
 signal BID : std_logic_vector(ID_WIDTH-1 downto 0);
 
 signal ARID : std_logic_vector(ID_WIDTH-1 downto 0);
 signal ARLEN : std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
 signal ARSIZE : std_logic_vector(2 downto 0);
 signal ARBURST : std_logic_vector(1 downto 0);
 
 signal RID : std_logic_vector(ID_WIDTH-1 downto 0);
 signal RLAST : std_logic;

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

  master_idle <= not busy;
  oimm_burstlength_minus1 <= (others =>'0');
  oimm_writelast <= '1';

  AWPROT <= (others =>'0');
  ARPROT <= (others =>'0');

  BID <= (others =>'0');
  RID <= (others =>'0');
  RLAST <= '1';

end architecture;
