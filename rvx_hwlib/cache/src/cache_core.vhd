library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.cache_utils_pkg.all;
use work.cache_pkg.all;

entity cache_core is
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

    done_from_cache_walker        : in std_logic;

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

    cache_tag_renable	: out	std_logic;
    cache_tag_raddr	: out	std_logic_vector(log2_min1(NUM_LINES)-1 downto 0);
    cache_tag_rdata	: in	std_logic_vector(ADDRESS_WIDTH-log2(NUM_LINES*LINE_SIZE)+DIRTY_BITS downto 0);
    cache_tag_wenable	: out	std_logic;
    cache_tag_waddr	: out	std_logic_vector(log2_min1(NUM_LINES)-1 downto 0);
    cache_tag_wdata	: out	std_logic_vector(ADDRESS_WIDTH-log2(NUM_LINES*LINE_SIZE)+DIRTY_BITS downto 0);

    cache_data_renable	: out	std_logic;
    cache_data_raddr	: out	std_logic_vector(log2_min1(NUM_LINES)+log2(LINE_SIZE/(WIDTH/8))-1 downto 0);
    cache_data_rdata	: in	std_logic_vector(WIDTH-1 downto 0);
    cache_data_wenable	: out	std_logic;
    cache_data_waddr	: out	std_logic_vector(log2_min1(NUM_LINES)+log2(LINE_SIZE/(WIDTH/8))-1 downto 0);
    cache_data_wstrb	: out	std_logic_vector((WIDTH/8)-1 downto 0);
    cache_data_wdata	: out	std_logic_vector(WIDTH-1 downto 0)
    );
end entity;

architecture rtl of cache_core is
  constant WORDS_PER_LINE  : positive := LINE_SIZE/(WIDTH/8);
  constant TAG_BITS        : positive := ADDRESS_WIDTH-log2(NUM_LINES*LINE_SIZE);
  constant TAG_LEFT        : natural  := ADDRESS_WIDTH-1;
  constant TAG_RIGHT       : natural  := log2(NUM_LINES)+log2(LINE_SIZE);
  constant CACHELINE_BITS  : positive := log2(NUM_LINES);
  constant CACHELINE_RIGHT : natural  := log2(LINE_SIZE);
  constant CACHEWORD_BITS  : positive := log2(NUM_LINES)+log2(WORDS_PER_LINE);
  constant CACHEWORD_LEFT  : natural  := log2(NUM_LINES)+log2(LINE_SIZE)-1;
  constant CACHEWORD_RIGHT : natural  := log2(WIDTH/8);

  signal read_speculationinflight : std_logic;
  signal read_hit                 : std_logic;

  signal read_dirty_valid_tag : std_logic_vector(TAG_BITS+DIRTY_BITS downto 0);
  alias read_valid            : std_logic is
    read_dirty_valid_tag(TAG_BITS);
  signal read_tag_equal : std_logic;

  signal write_dirty_valid_tag_in : std_logic_vector(TAG_BITS+DIRTY_BITS downto 0);

  signal read_cacheline  : unsigned(CACHELINE_BITS-1 downto 0);
  signal write_cacheline : unsigned(CACHELINE_BITS-1 downto 0);
  signal read_cacheword  : unsigned(CACHEWORD_BITS-1 downto 0);
  signal write_cacheword : unsigned(CACHEWORD_BITS-1 downto 0);

  alias write_tag : std_logic_vector(TAG_BITS-1 downto 0)
    is write_address(TAG_LEFT downto TAG_RIGHT);
  alias read_request_tag : std_logic_vector(TAG_BITS-1 downto 0)
    is read_lastaddress(TAG_LEFT downto TAG_RIGHT);

  signal memory_renable : std_logic;

begin
  read_miss <= read_requestinflight and (not read_hit);

  process(clk,reset)
  begin
		if reset = '1' then
      memory_renable <= '0';
    elsif rising_edge(clk) then
      if memory_renable = '0' and done_from_cache_walker = '1' then
        memory_renable <= '1';
      end if;
    end if;
  end process;

  cache_tag_renable <= memory_renable;
  cache_data_renable <= memory_renable;

  process(clk,reset)
  begin
		if reset = '1' then
			read_requestinflight <= '0';
			read_lastaddress         <= (others =>'0');
			read_speculationinflight <= '0';
		elsif rising_edge(clk) then
      read_speculationinflight <= '0';
      if read_hit = '1' then
        read_requestinflight <= '0';
      end if;

      if read_requestvalid = '1' and read_miss = '0' then
        read_lastaddress         <= read_address;
        read_requestinflight     <= not read_speculative;
        read_speculationinflight <= read_speculative;
      end if;
    end if;
  end process;

  read_tag_equal <= '1' when read_tag = read_request_tag else '0';

  read_dirty_valid(0) <= read_valid;
  read_tag            <= read_dirty_valid_tag(TAG_BITS-1 downto 0);
  dirty_gen : if DIRTY_BITS > 0 generate
    alias read_dirty : std_logic_vector(DIRTY_BITS-1 downto 0) is
      read_dirty_valid_tag(TAG_BITS+DIRTY_BITS downto TAG_BITS+1);
  begin
    read_dirty_valid(DIRTY_BITS downto 1) <= read_dirty;
  end generate dirty_gen;
  read_hit           <= read_valid and read_tag_equal;
  read_readdatavalid <= read_hit and (read_requestinflight or read_speculationinflight);
  read_readabort     <= (not read_hit) and read_speculationinflight;

  write_dirty_valid_tag_in <= write_dirty_valid & write_tag;

  --This block contains the tag, with a valid bit.
  read_cacheline  <= unsigned(read_address(TAG_RIGHT-1 downto CACHELINE_RIGHT));
  write_cacheline <= unsigned(write_address(TAG_RIGHT-1 downto CACHELINE_RIGHT));

  cache_tag_raddr <= std_logic_vector(read_cacheline);
  read_dirty_valid_tag <= cache_tag_rdata;
  cache_tag_waddr <= std_logic_vector(write_cacheline);
  cache_tag_wenable <= write_tag_update;
  cache_tag_wdata <= write_dirty_valid_tag_in;

  --For each byte generate a separate data cache RAM
  read_cacheword  <= unsigned(read_address(CACHEWORD_LEFT downto CACHEWORD_RIGHT));
  write_cacheword <= unsigned(write_address(CACHEWORD_LEFT downto CACHEWORD_RIGHT));

  cache_data_raddr <= std_logic_vector(read_cacheword);
  read_readdata <= cache_data_rdata;
  cache_data_waddr <= std_logic_vector(write_cacheword);
  cache_data_wenable <= write_requestvalid;
  byteenable_gen : for gbyte in (WIDTH/8)-1 downto 0 generate
    cache_data_wstrb(gbyte) <= write_requestvalid and write_byteenable(gbyte);
  end generate byteenable_gen;
  cache_data_wdata <= write_writedata;

end architecture;
