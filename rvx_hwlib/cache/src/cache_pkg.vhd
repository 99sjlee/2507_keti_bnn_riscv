library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.cache_utils_pkg.all;

package cache_pkg is

  -- cache_policy
	constant READ_ONLY : natural := 0;
	constant WRITE_THROUGH : natural := 1;
	constant WRITE_BACK : natural := 2;

	-- request_register_type
  constant OFF : natural := 0;
	constant LIGHT : natural := 1;
	constant FULL : natural := 2;

	constant BW_CACHE_COMMAND : positive := 2;
	constant INITIALIZE : std_logic_vector(BW_CACHE_COMMAND-1 downto 0) := "00";
	constant INVALIDATE : std_logic_vector(BW_CACHE_COMMAND-1 downto 0) := "01";
	constant FLUSH : std_logic_vector(BW_CACHE_COMMAND-1 downto 0) := "10";
	constant WRITEBACK : std_logic_vector(BW_CACHE_COMMAND-1 downto 0) := "11";
	
	component cache_core_controller is
    generic (
      CACHE_SIZE            : natural;
      LINE_SIZE             : positive range 16 to 256;
      ADDRESS_WIDTH         : positive;
      INTERNAL_WIDTH        : positive;
      EXTERNAL_WIDTH        : positive;
      LOG2_BURSTLENGTH      : positive;
      POLICY                : natural;
      REGION_OPTIMIZATIONS  : boolean;
      WRITE_FIRST_SUPPORTED : boolean;
      DIRTY_BITS            : natural
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      --Cache control (Invalidate/flush/writeback)
      from_cache_control_ready : out std_logic;
      to_cache_control_valid   : in  std_logic;
      to_cache_control_command : in  std_logic_vector(BW_CACHE_COMMAND-1 downto 0);
      to_cache_control_base    : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      to_cache_control_last    : in  std_logic_vector(ADDRESS_WIDTH-1 downto 0);

      precache_idle : in  std_logic;
      cache_idle    : out std_logic;

      --Cache interface ORCA-internal memory-mapped slave
      cacheint_oimm_address       : in     std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      cacheint_oimm_byteenable    : in     std_logic_vector((INTERNAL_WIDTH/8)-1 downto 0);
      cacheint_oimm_requestvalid  : in     std_logic;
      cacheint_oimm_readnotwrite  : in     std_logic;
      cacheint_oimm_writedata     : in     std_logic_vector(INTERNAL_WIDTH-1 downto 0);
      cacheint_oimm_readdata      : out    std_logic_vector(INTERNAL_WIDTH-1 downto 0);
      cacheint_oimm_readdatavalid : out    std_logic;
      cacheint_oimm_waitrequest   : buffer std_logic;

      --Cached ORCA-internal memory-mapped master
      c_oimm_address            : out std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      c_oimm_burstlength        : out std_logic_vector(LOG2_BURSTLENGTH downto 0);
      c_oimm_burstlength_minus1 : out std_logic_vector(LOG2_BURSTLENGTH-1 downto 0);
      c_oimm_byteenable         : out std_logic_vector((EXTERNAL_WIDTH/8)-1 downto 0);
      c_oimm_requestvalid       : out std_logic;
      c_oimm_readnotwrite       : out std_logic;
      c_oimm_writedata          : out std_logic_vector(EXTERNAL_WIDTH-1 downto 0);
      c_oimm_writelast          : out std_logic;
      c_oimm_readdata           : in  std_logic_vector(EXTERNAL_WIDTH-1 downto 0);
      c_oimm_readdatavalid      : in  std_logic;
      c_oimm_waitrequest        : in  std_logic;
      
      cache_tag_renable     : out   std_logic;
      cache_tag_raddr     : out   std_logic_vector(log2_min1(CACHE_SIZE/LINE_SIZE)-1 downto 0);
      cache_tag_rdata        : in    std_logic_vector(ADDRESS_WIDTH-log2(CACHE_SIZE)+DIRTY_BITS downto 0);
      cache_tag_wenable     : out   std_logic;
      cache_tag_waddr    : out   std_logic_vector(log2_min1(CACHE_SIZE/LINE_SIZE)-1 downto 0);
      cache_tag_wdata       : out   std_logic_vector(ADDRESS_WIDTH-log2(CACHE_SIZE)+DIRTY_BITS downto 0);
  
      cache_data_renable : out   std_logic;
      cache_data_raddr     : out   std_logic_vector(log2_min1(CACHE_SIZE/LINE_SIZE)+log2(LINE_SIZE/(EXTERNAL_WIDTH/8))-1 downto 0);
      cache_data_rdata        : in    std_logic_vector(EXTERNAL_WIDTH-1 downto 0);
      cache_data_wenable : out   std_logic;
      cache_data_waddr    : out   std_logic_vector(log2_min1(CACHE_SIZE/LINE_SIZE)+log2(LINE_SIZE/(EXTERNAL_WIDTH/8))-1 downto 0);
      cache_data_wstrb : out   std_logic_vector((EXTERNAL_WIDTH/8)-1 downto 0);
      cache_data_wdata       : out   std_logic_vector(EXTERNAL_WIDTH-1 downto 0);
  
      spill_raddr   : out   std_logic_vector(log2_min1(LINE_SIZE/(EXTERNAL_WIDTH/8))-1 downto 0);
      spill_rdata      : in    std_logic_vector(EXTERNAL_WIDTH-1 downto 0);
      spill_waddr  : out   std_logic_vector(log2_min1(LINE_SIZE/(EXTERNAL_WIDTH/8))-1 downto 0);
      spill_wenable   : out   std_logic;
      spill_wdata     : out   std_logic_vector(EXTERNAL_WIDTH-1 downto 0)
      );
  end component cache_core_controller;

  component cache_core is
    generic (
      NUM_LINES             : positive;
      LINE_SIZE             : positive;
      ADDRESS_WIDTH         : positive;
      WIDTH                 : positive;
      DIRTY_BITS            : natural;
      WRITE_FIRST_SUPPORTED : boolean
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      done_from_cache_walker : in std_logic;

      --Read-only data ORCA-internal memory-mapped slave
      read_address         : in     std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      read_requestvalid    : in     std_logic;
      read_speculative     : in     std_logic;
      read_readdata        : out    std_logic_vector(WIDTH-1 downto 0);
      read_readdatavalid   : out    std_logic;
      read_readabort       : out    std_logic;
      read_miss            : buffer std_logic;
      read_requestinflight : buffer std_logic;
      read_lastaddress     : buffer std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      read_tag             : buffer std_logic_vector((ADDRESS_WIDTH-log2(NUM_LINES*LINE_SIZE))-1 downto 0);
      read_dirty_valid     : out    std_logic_vector(DIRTY_BITS downto 0);

      --Write-only data ORCA-internal memory-mapped slave
      write_address      : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
      write_byteenable   : in std_logic_vector((WIDTH/8)-1 downto 0);
      write_requestvalid : in std_logic;
      write_writedata    : in std_logic_vector(WIDTH-1 downto 0);
      write_tag_update   : in std_logic;
      write_dirty_valid  : in std_logic_vector(DIRTY_BITS downto 0);

      cache_tag_renable     : out   std_logic;
      cache_tag_raddr     : out   std_logic_vector(log2_min1(NUM_LINES)-1 downto 0);
      cache_tag_rdata        : in    std_logic_vector(ADDRESS_WIDTH-log2(NUM_LINES*LINE_SIZE)+DIRTY_BITS downto 0);
      cache_tag_wenable     : out   std_logic;
      cache_tag_waddr    : out   std_logic_vector(log2_min1(NUM_LINES)-1 downto 0);
      cache_tag_wdata       : out   std_logic_vector(ADDRESS_WIDTH-log2(NUM_LINES*LINE_SIZE)+DIRTY_BITS downto 0);
  
      cache_data_renable : out   std_logic;
      cache_data_raddr     : out   std_logic_vector(log2_min1(NUM_LINES)+log2(LINE_SIZE/(WIDTH/8))-1 downto 0);
      cache_data_rdata        : in    std_logic_vector(WIDTH-1 downto 0);
      cache_data_wenable : out   std_logic;
      cache_data_waddr    : out   std_logic_vector(log2_min1(NUM_LINES)+log2(LINE_SIZE/(WIDTH/8))-1 downto 0);
      cache_data_wstrb : out   std_logic_vector((WIDTH/8)-1 downto 0);
      cache_data_wdata       : out   std_logic_vector(WIDTH-1 downto 0)
      );
  end component cache_core;

end package cache_pkg;
