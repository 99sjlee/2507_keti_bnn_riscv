`default_nettype wire
module Queue_42(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [3:0]  io_enq_bits_id,
  input  [31:0] io_enq_bits_data,
  input  [1:0]  io_enq_bits_resp,
  input         io_enq_bits_echo_real_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [3:0]  io_deq_bits_id,
  output [31:0] io_deq_bits_data,
  output [1:0]  io_deq_bits_resp,
  output        io_deq_bits_echo_real_last,
  output        io_deq_bits_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_id [0:1];
  wire  ram_id_io_deq_bits_MPORT_en;
  wire  ram_id_io_deq_bits_MPORT_addr;
  wire [3:0] ram_id_io_deq_bits_MPORT_data;
  wire [3:0] ram_id_MPORT_data;
  wire  ram_id_MPORT_addr;
  wire  ram_id_MPORT_mask;
  wire  ram_id_MPORT_en;
  reg [31:0] ram_data [0:1];
  wire  ram_data_io_deq_bits_MPORT_en;
  wire  ram_data_io_deq_bits_MPORT_addr;
  wire [31:0] ram_data_io_deq_bits_MPORT_data;
  wire [31:0] ram_data_MPORT_data;
  wire  ram_data_MPORT_addr;
  wire  ram_data_MPORT_mask;
  wire  ram_data_MPORT_en;
  reg [1:0] ram_resp [0:1];
  wire  ram_resp_io_deq_bits_MPORT_en;
  wire  ram_resp_io_deq_bits_MPORT_addr;
  wire [1:0] ram_resp_io_deq_bits_MPORT_data;
  wire [1:0] ram_resp_MPORT_data;
  wire  ram_resp_MPORT_addr;
  wire  ram_resp_MPORT_mask;
  wire  ram_resp_MPORT_en;
  reg  ram_echo_real_last [0:1];
  wire  ram_echo_real_last_io_deq_bits_MPORT_en;
  wire  ram_echo_real_last_io_deq_bits_MPORT_addr;
  wire  ram_echo_real_last_io_deq_bits_MPORT_data;
  wire  ram_echo_real_last_MPORT_data;
  wire  ram_echo_real_last_MPORT_addr;
  wire  ram_echo_real_last_MPORT_mask;
  wire  ram_echo_real_last_MPORT_en;
  reg  ram_last [0:1];
  wire  ram_last_io_deq_bits_MPORT_en;
  wire  ram_last_io_deq_bits_MPORT_addr;
  wire  ram_last_io_deq_bits_MPORT_data;
  wire  ram_last_MPORT_data;
  wire  ram_last_MPORT_addr;
  wire  ram_last_MPORT_mask;
  wire  ram_last_MPORT_en;
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
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = value_1;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr];
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_resp_io_deq_bits_MPORT_en = 1'h1;
  assign ram_resp_io_deq_bits_MPORT_addr = value_1;
  assign ram_resp_io_deq_bits_MPORT_data = ram_resp[ram_resp_io_deq_bits_MPORT_addr];
  assign ram_resp_MPORT_data = io_enq_bits_resp;
  assign ram_resp_MPORT_addr = value;
  assign ram_resp_MPORT_mask = 1'h1;
  assign ram_resp_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_echo_real_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_echo_real_last_io_deq_bits_MPORT_addr = value_1;
  assign ram_echo_real_last_io_deq_bits_MPORT_data = ram_echo_real_last[ram_echo_real_last_io_deq_bits_MPORT_addr];
  assign ram_echo_real_last_MPORT_data = io_enq_bits_echo_real_last;
  assign ram_echo_real_last_MPORT_addr = value;
  assign ram_echo_real_last_MPORT_mask = 1'h1;
  assign ram_echo_real_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = value_1;
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr];
  assign ram_last_MPORT_data = 1'h1;
  assign ram_last_MPORT_addr = value;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data;
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data;
  assign io_deq_bits_resp = ram_resp_io_deq_bits_MPORT_data;
  assign io_deq_bits_echo_real_last = ram_echo_real_last_io_deq_bits_MPORT_data;
  assign io_deq_bits_last = ram_last_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data;
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data;
    end
    if (ram_resp_MPORT_en & ram_resp_MPORT_mask) begin
      ram_resp[ram_resp_MPORT_addr] <= ram_resp_MPORT_data;
    end
    if (ram_echo_real_last_MPORT_en & ram_echo_real_last_MPORT_mask) begin
      ram_echo_real_last[ram_echo_real_last_MPORT_addr] <= ram_echo_real_last_MPORT_data;
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data;
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
    ram_data[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_resp[initvar] = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_echo_real_last[initvar] = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_last[initvar] = _RAND_4[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  value_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  maybe_full = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule