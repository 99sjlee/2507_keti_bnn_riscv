`default_nettype wire
module Queue_37(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_read,
  input  [23:0] io_enq_bits_index,
  input  [31:0] io_enq_bits_data,
  input  [3:0]  io_enq_bits_mask,
  input  [9:0]  io_enq_bits_extra_tlrr_extra_source,
  input  [1:0]  io_enq_bits_extra_tlrr_extra_size,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_read,
  output [23:0] io_deq_bits_index,
  output [31:0] io_deq_bits_data,
  output [3:0]  io_deq_bits_mask,
  output [9:0]  io_deq_bits_extra_tlrr_extra_source,
  output [1:0]  io_deq_bits_extra_tlrr_extra_size
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  ram_read [0:0];
  wire  ram_read_io_deq_bits_MPORT_en;
  wire  ram_read_io_deq_bits_MPORT_addr;
  wire  ram_read_io_deq_bits_MPORT_data;
  wire  ram_read_MPORT_data;
  wire  ram_read_MPORT_addr;
  wire  ram_read_MPORT_mask;
  wire  ram_read_MPORT_en;
  reg [23:0] ram_index [0:0];
  wire  ram_index_io_deq_bits_MPORT_en;
  wire  ram_index_io_deq_bits_MPORT_addr;
  wire [23:0] ram_index_io_deq_bits_MPORT_data;
  wire [23:0] ram_index_MPORT_data;
  wire  ram_index_MPORT_addr;
  wire  ram_index_MPORT_mask;
  wire  ram_index_MPORT_en;
  reg [31:0] ram_data [0:0];
  wire  ram_data_io_deq_bits_MPORT_en;
  wire  ram_data_io_deq_bits_MPORT_addr;
  wire [31:0] ram_data_io_deq_bits_MPORT_data;
  wire [31:0] ram_data_MPORT_data;
  wire  ram_data_MPORT_addr;
  wire  ram_data_MPORT_mask;
  wire  ram_data_MPORT_en;
  reg [3:0] ram_mask [0:0];
  wire  ram_mask_io_deq_bits_MPORT_en;
  wire  ram_mask_io_deq_bits_MPORT_addr;
  wire [3:0] ram_mask_io_deq_bits_MPORT_data;
  wire [3:0] ram_mask_MPORT_data;
  wire  ram_mask_MPORT_addr;
  wire  ram_mask_MPORT_mask;
  wire  ram_mask_MPORT_en;
  reg [9:0] ram_extra_tlrr_extra_source [0:0];
  wire  ram_extra_tlrr_extra_source_io_deq_bits_MPORT_en;
  wire  ram_extra_tlrr_extra_source_io_deq_bits_MPORT_addr;
  wire [9:0] ram_extra_tlrr_extra_source_io_deq_bits_MPORT_data;
  wire [9:0] ram_extra_tlrr_extra_source_MPORT_data;
  wire  ram_extra_tlrr_extra_source_MPORT_addr;
  wire  ram_extra_tlrr_extra_source_MPORT_mask;
  wire  ram_extra_tlrr_extra_source_MPORT_en;
  reg [1:0] ram_extra_tlrr_extra_size [0:0];
  wire  ram_extra_tlrr_extra_size_io_deq_bits_MPORT_en;
  wire  ram_extra_tlrr_extra_size_io_deq_bits_MPORT_addr;
  wire [1:0] ram_extra_tlrr_extra_size_io_deq_bits_MPORT_data;
  wire [1:0] ram_extra_tlrr_extra_size_MPORT_data;
  wire  ram_extra_tlrr_extra_size_MPORT_addr;
  wire  ram_extra_tlrr_extra_size_MPORT_mask;
  wire  ram_extra_tlrr_extra_size_MPORT_en;
  reg  maybe_full;
  wire  empty = ~maybe_full;
  wire  do_enq = io_enq_ready & io_enq_valid;
  wire  do_deq = io_deq_ready & io_deq_valid;
  assign ram_read_io_deq_bits_MPORT_en = 1'h1;
  assign ram_read_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_read_io_deq_bits_MPORT_data = ram_read[ram_read_io_deq_bits_MPORT_addr];
  assign ram_read_MPORT_data = io_enq_bits_read;
  assign ram_read_MPORT_addr = 1'h0;
  assign ram_read_MPORT_mask = 1'h1;
  assign ram_read_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_index_io_deq_bits_MPORT_en = 1'h1;
  assign ram_index_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_index_io_deq_bits_MPORT_data = ram_index[ram_index_io_deq_bits_MPORT_addr];
  assign ram_index_MPORT_data = io_enq_bits_index;
  assign ram_index_MPORT_addr = 1'h0;
  assign ram_index_MPORT_mask = 1'h1;
  assign ram_index_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr];
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = 1'h0;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_mask_io_deq_bits_MPORT_en = 1'h1;
  assign ram_mask_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_mask_io_deq_bits_MPORT_data = ram_mask[ram_mask_io_deq_bits_MPORT_addr];
  assign ram_mask_MPORT_data = io_enq_bits_mask;
  assign ram_mask_MPORT_addr = 1'h0;
  assign ram_mask_MPORT_mask = 1'h1;
  assign ram_mask_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_extra_tlrr_extra_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_extra_tlrr_extra_source_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_extra_tlrr_extra_source_io_deq_bits_MPORT_data =
    ram_extra_tlrr_extra_source[ram_extra_tlrr_extra_source_io_deq_bits_MPORT_addr];
  assign ram_extra_tlrr_extra_source_MPORT_data = io_enq_bits_extra_tlrr_extra_source;
  assign ram_extra_tlrr_extra_source_MPORT_addr = 1'h0;
  assign ram_extra_tlrr_extra_source_MPORT_mask = 1'h1;
  assign ram_extra_tlrr_extra_source_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_extra_tlrr_extra_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_extra_tlrr_extra_size_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_extra_tlrr_extra_size_io_deq_bits_MPORT_data =
    ram_extra_tlrr_extra_size[ram_extra_tlrr_extra_size_io_deq_bits_MPORT_addr];
  assign ram_extra_tlrr_extra_size_MPORT_data = io_enq_bits_extra_tlrr_extra_size;
  assign ram_extra_tlrr_extra_size_MPORT_addr = 1'h0;
  assign ram_extra_tlrr_extra_size_MPORT_mask = 1'h1;
  assign ram_extra_tlrr_extra_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_read = ram_read_io_deq_bits_MPORT_data;
  assign io_deq_bits_index = ram_index_io_deq_bits_MPORT_data;
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data;
  assign io_deq_bits_mask = ram_mask_io_deq_bits_MPORT_data;
  assign io_deq_bits_extra_tlrr_extra_source = ram_extra_tlrr_extra_source_io_deq_bits_MPORT_data;
  assign io_deq_bits_extra_tlrr_extra_size = ram_extra_tlrr_extra_size_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_read_MPORT_en & ram_read_MPORT_mask) begin
      ram_read[ram_read_MPORT_addr] <= ram_read_MPORT_data;
    end
    if (ram_index_MPORT_en & ram_index_MPORT_mask) begin
      ram_index[ram_index_MPORT_addr] <= ram_index_MPORT_data;
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data;
    end
    if (ram_mask_MPORT_en & ram_mask_MPORT_mask) begin
      ram_mask[ram_mask_MPORT_addr] <= ram_mask_MPORT_data;
    end
    if (ram_extra_tlrr_extra_source_MPORT_en & ram_extra_tlrr_extra_source_MPORT_mask) begin
      ram_extra_tlrr_extra_source[ram_extra_tlrr_extra_source_MPORT_addr] <= ram_extra_tlrr_extra_source_MPORT_data;
    end
    if (ram_extra_tlrr_extra_size_MPORT_en & ram_extra_tlrr_extra_size_MPORT_mask) begin
      ram_extra_tlrr_extra_size[ram_extra_tlrr_extra_size_MPORT_addr] <= ram_extra_tlrr_extra_size_MPORT_data;
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
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_read[initvar] = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_index[initvar] = _RAND_1[23:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_mask[initvar] = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_extra_tlrr_extra_source[initvar] = _RAND_4[9:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_extra_tlrr_extra_size[initvar] = _RAND_5[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  maybe_full = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule