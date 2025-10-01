`default_nettype wire
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
  input  [1:0]  io_enq_bits_param,
  input  [3:0]  io_enq_bits_size,
  input  [1:0]  io_enq_bits_source,
  input  [2:0]  io_enq_bits_sink,
  input         io_enq_bits_denied,
  input  [31:0] io_enq_bits_data,
  input         io_enq_bits_corrupt,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [1:0]  io_deq_bits_param,
  output [3:0]  io_deq_bits_size,
  output [1:0]  io_deq_bits_source,
  output [2:0]  io_deq_bits_sink,
  output        io_deq_bits_denied,
  output [31:0] io_deq_bits_data,
  output        io_deq_bits_corrupt
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
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram_opcode [0:1];
  wire  ram_opcode_io_deq_bits_MPORT_en;
  wire  ram_opcode_io_deq_bits_MPORT_addr;
  wire [2:0] ram_opcode_io_deq_bits_MPORT_data;
  wire [2:0] ram_opcode_MPORT_data;
  wire  ram_opcode_MPORT_addr;
  wire  ram_opcode_MPORT_mask;
  wire  ram_opcode_MPORT_en;
  reg [1:0] ram_param [0:1];
  wire  ram_param_io_deq_bits_MPORT_en;
  wire  ram_param_io_deq_bits_MPORT_addr;
  wire [1:0] ram_param_io_deq_bits_MPORT_data;
  wire [1:0] ram_param_MPORT_data;
  wire  ram_param_MPORT_addr;
  wire  ram_param_MPORT_mask;
  wire  ram_param_MPORT_en;
  reg [3:0] ram_size [0:1];
  wire  ram_size_io_deq_bits_MPORT_en;
  wire  ram_size_io_deq_bits_MPORT_addr;
  wire [3:0] ram_size_io_deq_bits_MPORT_data;
  wire [3:0] ram_size_MPORT_data;
  wire  ram_size_MPORT_addr;
  wire  ram_size_MPORT_mask;
  wire  ram_size_MPORT_en;
  reg [1:0] ram_source [0:1];
  wire  ram_source_io_deq_bits_MPORT_en;
  wire  ram_source_io_deq_bits_MPORT_addr;
  wire [1:0] ram_source_io_deq_bits_MPORT_data;
  wire [1:0] ram_source_MPORT_data;
  wire  ram_source_MPORT_addr;
  wire  ram_source_MPORT_mask;
  wire  ram_source_MPORT_en;
  reg [2:0] ram_sink [0:1];
  wire  ram_sink_io_deq_bits_MPORT_en;
  wire  ram_sink_io_deq_bits_MPORT_addr;
  wire [2:0] ram_sink_io_deq_bits_MPORT_data;
  wire [2:0] ram_sink_MPORT_data;
  wire  ram_sink_MPORT_addr;
  wire  ram_sink_MPORT_mask;
  wire  ram_sink_MPORT_en;
  reg  ram_denied [0:1];
  wire  ram_denied_io_deq_bits_MPORT_en;
  wire  ram_denied_io_deq_bits_MPORT_addr;
  wire  ram_denied_io_deq_bits_MPORT_data;
  wire  ram_denied_MPORT_data;
  wire  ram_denied_MPORT_addr;
  wire  ram_denied_MPORT_mask;
  wire  ram_denied_MPORT_en;
  reg [31:0] ram_data [0:1];
  wire  ram_data_io_deq_bits_MPORT_en;
  wire  ram_data_io_deq_bits_MPORT_addr;
  wire [31:0] ram_data_io_deq_bits_MPORT_data;
  wire [31:0] ram_data_MPORT_data;
  wire  ram_data_MPORT_addr;
  wire  ram_data_MPORT_mask;
  wire  ram_data_MPORT_en;
  reg  ram_corrupt [0:1];
  wire  ram_corrupt_io_deq_bits_MPORT_en;
  wire  ram_corrupt_io_deq_bits_MPORT_addr;
  wire  ram_corrupt_io_deq_bits_MPORT_data;
  wire  ram_corrupt_MPORT_data;
  wire  ram_corrupt_MPORT_addr;
  wire  ram_corrupt_MPORT_mask;
  wire  ram_corrupt_MPORT_en;
  reg  value;
  reg  value_1;
  reg  maybe_full;
  wire  ptr_match = value == value_1;
  wire  empty = ptr_match & ~maybe_full;
  wire  full = ptr_match & maybe_full;
  wire  do_enq = io_enq_ready & io_enq_valid;
  wire  do_deq = io_deq_ready & io_deq_valid;
  assign ram_opcode_io_deq_bits_MPORT_en = 1'h1;
  assign ram_opcode_io_deq_bits_MPORT_addr = value_1;
  assign ram_opcode_io_deq_bits_MPORT_data = ram_opcode[ram_opcode_io_deq_bits_MPORT_addr];
  assign ram_opcode_MPORT_data = io_enq_bits_opcode;
  assign ram_opcode_MPORT_addr = value;
  assign ram_opcode_MPORT_mask = 1'h1;
  assign ram_opcode_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_param_io_deq_bits_MPORT_en = 1'h1;
  assign ram_param_io_deq_bits_MPORT_addr = value_1;
  assign ram_param_io_deq_bits_MPORT_data = ram_param[ram_param_io_deq_bits_MPORT_addr];
  assign ram_param_MPORT_data = io_enq_bits_param;
  assign ram_param_MPORT_addr = value;
  assign ram_param_MPORT_mask = 1'h1;
  assign ram_param_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = value_1;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr];
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = value;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_source_io_deq_bits_MPORT_addr = value_1;
  assign ram_source_io_deq_bits_MPORT_data = ram_source[ram_source_io_deq_bits_MPORT_addr];
  assign ram_source_MPORT_data = io_enq_bits_source;
  assign ram_source_MPORT_addr = value;
  assign ram_source_MPORT_mask = 1'h1;
  assign ram_source_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sink_io_deq_bits_MPORT_en = 1'h1;
  assign ram_sink_io_deq_bits_MPORT_addr = value_1;
  assign ram_sink_io_deq_bits_MPORT_data = ram_sink[ram_sink_io_deq_bits_MPORT_addr];
  assign ram_sink_MPORT_data = io_enq_bits_sink;
  assign ram_sink_MPORT_addr = value;
  assign ram_sink_MPORT_mask = 1'h1;
  assign ram_sink_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_denied_io_deq_bits_MPORT_en = 1'h1;
  assign ram_denied_io_deq_bits_MPORT_addr = value_1;
  assign ram_denied_io_deq_bits_MPORT_data = ram_denied[ram_denied_io_deq_bits_MPORT_addr];
  assign ram_denied_MPORT_data = io_enq_bits_denied;
  assign ram_denied_MPORT_addr = value;
  assign ram_denied_MPORT_mask = 1'h1;
  assign ram_denied_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = value_1;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr];
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_corrupt_io_deq_bits_MPORT_en = 1'h1;
  assign ram_corrupt_io_deq_bits_MPORT_addr = value_1;
  assign ram_corrupt_io_deq_bits_MPORT_data = ram_corrupt[ram_corrupt_io_deq_bits_MPORT_addr];
  assign ram_corrupt_MPORT_data = io_enq_bits_corrupt;
  assign ram_corrupt_MPORT_addr = value;
  assign ram_corrupt_MPORT_mask = 1'h1;
  assign ram_corrupt_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_opcode = ram_opcode_io_deq_bits_MPORT_data;
  assign io_deq_bits_param = ram_param_io_deq_bits_MPORT_data;
  assign io_deq_bits_size = ram_size_io_deq_bits_MPORT_data;
  assign io_deq_bits_source = ram_source_io_deq_bits_MPORT_data;
  assign io_deq_bits_sink = ram_sink_io_deq_bits_MPORT_data;
  assign io_deq_bits_denied = ram_denied_io_deq_bits_MPORT_data;
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data;
  assign io_deq_bits_corrupt = ram_corrupt_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_opcode_MPORT_en & ram_opcode_MPORT_mask) begin
      ram_opcode[ram_opcode_MPORT_addr] <= ram_opcode_MPORT_data;
    end
    if (ram_param_MPORT_en & ram_param_MPORT_mask) begin
      ram_param[ram_param_MPORT_addr] <= ram_param_MPORT_data;
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data;
    end
    if (ram_source_MPORT_en & ram_source_MPORT_mask) begin
      ram_source[ram_source_MPORT_addr] <= ram_source_MPORT_data;
    end
    if (ram_sink_MPORT_en & ram_sink_MPORT_mask) begin
      ram_sink[ram_sink_MPORT_addr] <= ram_sink_MPORT_data;
    end
    if (ram_denied_MPORT_en & ram_denied_MPORT_mask) begin
      ram_denied[ram_denied_MPORT_addr] <= ram_denied_MPORT_data;
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data;
    end
    if (ram_corrupt_MPORT_en & ram_corrupt_MPORT_mask) begin
      ram_corrupt[ram_corrupt_MPORT_addr] <= ram_corrupt_MPORT_data;
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
    ram_opcode[initvar] = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_param[initvar] = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_source[initvar] = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_sink[initvar] = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_denied[initvar] = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_corrupt[initvar] = _RAND_7[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  value = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  value_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  maybe_full = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule