`default_nettype wire
module Queue_4(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [3:0]  io_enq_bits_id,
  input  [31:0] io_enq_bits_addr,
  input  [7:0]  io_enq_bits_len,
  input  [2:0]  io_enq_bits_size,
  input  [1:0]  io_enq_bits_burst,
  input         io_enq_bits_lock,
  input  [3:0]  io_enq_bits_cache,
  input  [2:0]  io_enq_bits_prot,
  input  [3:0]  io_enq_bits_qos,
  input         io_deq_ready,
  output        io_deq_valid,
  output [3:0]  io_deq_bits_id,
  output [31:0] io_deq_bits_addr,
  output [7:0]  io_deq_bits_len,
  output [2:0]  io_deq_bits_size,
  output [1:0]  io_deq_bits_burst,
  output        io_deq_bits_lock,
  output [3:0]  io_deq_bits_cache,
  output [2:0]  io_deq_bits_prot,
  output [3:0]  io_deq_bits_qos
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_id [0:1];
  wire  ram_id_io_deq_bits_MPORT_en;
  wire  ram_id_io_deq_bits_MPORT_addr;
  wire [3:0] ram_id_io_deq_bits_MPORT_data;
  wire [3:0] ram_id_MPORT_data;
  wire  ram_id_MPORT_addr;
  wire  ram_id_MPORT_mask;
  wire  ram_id_MPORT_en;
  reg [31:0] ram_addr [0:1];
  wire  ram_addr_io_deq_bits_MPORT_en;
  wire  ram_addr_io_deq_bits_MPORT_addr;
  wire [31:0] ram_addr_io_deq_bits_MPORT_data;
  wire [31:0] ram_addr_MPORT_data;
  wire  ram_addr_MPORT_addr;
  wire  ram_addr_MPORT_mask;
  wire  ram_addr_MPORT_en;
  reg [7:0] ram_len [0:1];
  wire  ram_len_io_deq_bits_MPORT_en;
  wire  ram_len_io_deq_bits_MPORT_addr;
  wire [7:0] ram_len_io_deq_bits_MPORT_data;
  wire [7:0] ram_len_MPORT_data;
  wire  ram_len_MPORT_addr;
  wire  ram_len_MPORT_mask;
  wire  ram_len_MPORT_en;
  reg [2:0] ram_size [0:1];
  wire  ram_size_io_deq_bits_MPORT_en;
  wire  ram_size_io_deq_bits_MPORT_addr;
  wire [2:0] ram_size_io_deq_bits_MPORT_data;
  wire [2:0] ram_size_MPORT_data;
  wire  ram_size_MPORT_addr;
  wire  ram_size_MPORT_mask;
  wire  ram_size_MPORT_en;
  reg [1:0] ram_burst [0:1];
  wire  ram_burst_io_deq_bits_MPORT_en;
  wire  ram_burst_io_deq_bits_MPORT_addr;
  wire [1:0] ram_burst_io_deq_bits_MPORT_data;
  wire [1:0] ram_burst_MPORT_data;
  wire  ram_burst_MPORT_addr;
  wire  ram_burst_MPORT_mask;
  wire  ram_burst_MPORT_en;
  reg  ram_lock [0:1];
  wire  ram_lock_io_deq_bits_MPORT_en;
  wire  ram_lock_io_deq_bits_MPORT_addr;
  wire  ram_lock_io_deq_bits_MPORT_data;
  wire  ram_lock_MPORT_data;
  wire  ram_lock_MPORT_addr;
  wire  ram_lock_MPORT_mask;
  wire  ram_lock_MPORT_en;
  reg [3:0] ram_cache [0:1];
  wire  ram_cache_io_deq_bits_MPORT_en;
  wire  ram_cache_io_deq_bits_MPORT_addr;
  wire [3:0] ram_cache_io_deq_bits_MPORT_data;
  wire [3:0] ram_cache_MPORT_data;
  wire  ram_cache_MPORT_addr;
  wire  ram_cache_MPORT_mask;
  wire  ram_cache_MPORT_en;
  reg [2:0] ram_prot [0:1];
  wire  ram_prot_io_deq_bits_MPORT_en;
  wire  ram_prot_io_deq_bits_MPORT_addr;
  wire [2:0] ram_prot_io_deq_bits_MPORT_data;
  wire [2:0] ram_prot_MPORT_data;
  wire  ram_prot_MPORT_addr;
  wire  ram_prot_MPORT_mask;
  wire  ram_prot_MPORT_en;
  reg [3:0] ram_qos [0:1];
  wire  ram_qos_io_deq_bits_MPORT_en;
  wire  ram_qos_io_deq_bits_MPORT_addr;
  wire [3:0] ram_qos_io_deq_bits_MPORT_data;
  wire [3:0] ram_qos_MPORT_data;
  wire  ram_qos_MPORT_addr;
  wire  ram_qos_MPORT_mask;
  wire  ram_qos_MPORT_en;
  reg  value;
  reg  value_1;
  reg  maybe_full;
  wire  ptr_match = value == value_1;
  wire  empty = ptr_match & ~maybe_full;
  wire  full = ptr_match & maybe_full;
  wire  do_enq = io_enq_ready & io_enq_valid;
  wire  do_deq = io_deq_ready & io_deq_valid;
  assign ram_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_id_io_deq_bits_MPORT_addr = value_1;
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr];
  assign ram_id_MPORT_data = io_enq_bits_id;
  assign ram_id_MPORT_addr = value;
  assign ram_id_MPORT_mask = 1'h1;
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_addr_io_deq_bits_MPORT_addr = value_1;
  assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr];
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = value;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_len_io_deq_bits_MPORT_en = 1'h1;
  assign ram_len_io_deq_bits_MPORT_addr = value_1;
  assign ram_len_io_deq_bits_MPORT_data = ram_len[ram_len_io_deq_bits_MPORT_addr];
  assign ram_len_MPORT_data = io_enq_bits_len;
  assign ram_len_MPORT_addr = value;
  assign ram_len_MPORT_mask = 1'h1;
  assign ram_len_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = value_1;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr];
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = value;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_burst_io_deq_bits_MPORT_en = 1'h1;
  assign ram_burst_io_deq_bits_MPORT_addr = value_1;
  assign ram_burst_io_deq_bits_MPORT_data = ram_burst[ram_burst_io_deq_bits_MPORT_addr];
  assign ram_burst_MPORT_data = io_enq_bits_burst;
  assign ram_burst_MPORT_addr = value;
  assign ram_burst_MPORT_mask = 1'h1;
  assign ram_burst_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_lock_io_deq_bits_MPORT_en = 1'h1;
  assign ram_lock_io_deq_bits_MPORT_addr = value_1;
  assign ram_lock_io_deq_bits_MPORT_data = ram_lock[ram_lock_io_deq_bits_MPORT_addr];
  assign ram_lock_MPORT_data = io_enq_bits_lock;
  assign ram_lock_MPORT_addr = value;
  assign ram_lock_MPORT_mask = 1'h1;
  assign ram_lock_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cache_io_deq_bits_MPORT_en = 1'h1;
  assign ram_cache_io_deq_bits_MPORT_addr = value_1;
  assign ram_cache_io_deq_bits_MPORT_data = ram_cache[ram_cache_io_deq_bits_MPORT_addr];
  assign ram_cache_MPORT_data = io_enq_bits_cache;
  assign ram_cache_MPORT_addr = value;
  assign ram_cache_MPORT_mask = 1'h1;
  assign ram_cache_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_prot_io_deq_bits_MPORT_en = 1'h1;
  assign ram_prot_io_deq_bits_MPORT_addr = value_1;
  assign ram_prot_io_deq_bits_MPORT_data = ram_prot[ram_prot_io_deq_bits_MPORT_addr];
  assign ram_prot_MPORT_data = io_enq_bits_prot;
  assign ram_prot_MPORT_addr = value;
  assign ram_prot_MPORT_mask = 1'h1;
  assign ram_prot_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_qos_io_deq_bits_MPORT_en = 1'h1;
  assign ram_qos_io_deq_bits_MPORT_addr = value_1;
  assign ram_qos_io_deq_bits_MPORT_data = ram_qos[ram_qos_io_deq_bits_MPORT_addr];
  assign ram_qos_MPORT_data = io_enq_bits_qos;
  assign ram_qos_MPORT_addr = value;
  assign ram_qos_MPORT_mask = 1'h1;
  assign ram_qos_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data;
  assign io_deq_bits_addr = ram_addr_io_deq_bits_MPORT_data;
  assign io_deq_bits_len = ram_len_io_deq_bits_MPORT_data;
  assign io_deq_bits_size = ram_size_io_deq_bits_MPORT_data;
  assign io_deq_bits_burst = ram_burst_io_deq_bits_MPORT_data;
  assign io_deq_bits_lock = ram_lock_io_deq_bits_MPORT_data;
  assign io_deq_bits_cache = ram_cache_io_deq_bits_MPORT_data;
  assign io_deq_bits_prot = ram_prot_io_deq_bits_MPORT_data;
  assign io_deq_bits_qos = ram_qos_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data;
    end
    if (ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data;
    end
    if (ram_len_MPORT_en & ram_len_MPORT_mask) begin
      ram_len[ram_len_MPORT_addr] <= ram_len_MPORT_data;
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data;
    end
    if (ram_burst_MPORT_en & ram_burst_MPORT_mask) begin
      ram_burst[ram_burst_MPORT_addr] <= ram_burst_MPORT_data;
    end
    if (ram_lock_MPORT_en & ram_lock_MPORT_mask) begin
      ram_lock[ram_lock_MPORT_addr] <= ram_lock_MPORT_data;
    end
    if (ram_cache_MPORT_en & ram_cache_MPORT_mask) begin
      ram_cache[ram_cache_MPORT_addr] <= ram_cache_MPORT_data;
    end
    if (ram_prot_MPORT_en & ram_prot_MPORT_mask) begin
      ram_prot[ram_prot_MPORT_addr] <= ram_prot_MPORT_data;
    end
    if (ram_qos_MPORT_en & ram_qos_MPORT_mask) begin
      ram_qos[ram_qos_MPORT_addr] <= ram_qos_MPORT_data;
    end
    if (reset) begin
      value <= 1'h0;
    end else if (do_enq) begin
      value <= value + 1'h1;
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else if (do_deq) begin
      value_1 <= value_1 + 1'h1;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (do_enq != do_deq) begin
      maybe_full <= do_enq;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_addr[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_len[initvar] = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_burst[initvar] = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_lock[initvar] = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cache[initvar] = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_prot[initvar] = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_qos[initvar] = _RAND_8[3:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  value = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  value_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  maybe_full = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule