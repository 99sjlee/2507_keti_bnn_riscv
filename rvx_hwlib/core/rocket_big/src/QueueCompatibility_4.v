`default_nettype wire
module QueueCompatibility_4(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [3:0] io_enq_bits_tl_state_size,
  input  [4:0] io_enq_bits_tl_state_source,
  input        io_deq_ready,
  output       io_deq_valid,
  output [3:0] io_deq_bits_tl_state_size,
  output [4:0] io_deq_bits_tl_state_source
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_tl_state_size [0:7];
  wire  ram_tl_state_size_io_deq_bits_MPORT_en;
  wire [2:0] ram_tl_state_size_io_deq_bits_MPORT_addr;
  wire [3:0] ram_tl_state_size_io_deq_bits_MPORT_data;
  wire [3:0] ram_tl_state_size_MPORT_data;
  wire [2:0] ram_tl_state_size_MPORT_addr;
  wire  ram_tl_state_size_MPORT_mask;
  wire  ram_tl_state_size_MPORT_en;
  reg [4:0] ram_tl_state_source [0:7];
  wire  ram_tl_state_source_io_deq_bits_MPORT_en;
  wire [2:0] ram_tl_state_source_io_deq_bits_MPORT_addr;
  wire [4:0] ram_tl_state_source_io_deq_bits_MPORT_data;
  wire [4:0] ram_tl_state_source_MPORT_data;
  wire [2:0] ram_tl_state_source_MPORT_addr;
  wire  ram_tl_state_source_MPORT_mask;
  wire  ram_tl_state_source_MPORT_en;
  reg [2:0] enq_ptr_value;
  reg [2:0] deq_ptr_value;
  reg  maybe_full;
  wire  ptr_match = enq_ptr_value == deq_ptr_value;
  wire  empty = ptr_match & ~maybe_full;
  wire  full = ptr_match & maybe_full;
  wire  do_enq = io_enq_ready & io_enq_valid;
  wire  do_deq = io_deq_ready & io_deq_valid;
  wire [2:0] _value_T_1 = enq_ptr_value + 3'h1;
  wire [2:0] _value_T_3 = deq_ptr_value + 3'h1;
  assign ram_tl_state_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_tl_state_size_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_tl_state_size_io_deq_bits_MPORT_data = ram_tl_state_size[ram_tl_state_size_io_deq_bits_MPORT_addr];
  assign ram_tl_state_size_MPORT_data = io_enq_bits_tl_state_size;
  assign ram_tl_state_size_MPORT_addr = enq_ptr_value;
  assign ram_tl_state_size_MPORT_mask = 1'h1;
  assign ram_tl_state_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tl_state_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_tl_state_source_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_tl_state_source_io_deq_bits_MPORT_data = ram_tl_state_source[ram_tl_state_source_io_deq_bits_MPORT_addr];
  assign ram_tl_state_source_MPORT_data = io_enq_bits_tl_state_source;
  assign ram_tl_state_source_MPORT_addr = enq_ptr_value;
  assign ram_tl_state_source_MPORT_mask = 1'h1;
  assign ram_tl_state_source_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_tl_state_size = ram_tl_state_size_io_deq_bits_MPORT_data;
  assign io_deq_bits_tl_state_source = ram_tl_state_source_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_tl_state_size_MPORT_en & ram_tl_state_size_MPORT_mask) begin
      ram_tl_state_size[ram_tl_state_size_MPORT_addr] <= ram_tl_state_size_MPORT_data;
    end
    if (ram_tl_state_source_MPORT_en & ram_tl_state_source_MPORT_mask) begin
      ram_tl_state_source[ram_tl_state_source_MPORT_addr] <= ram_tl_state_source_MPORT_data;
    end
    if (reset) begin
      enq_ptr_value <= 3'h0;
    end else if (do_enq) begin
      enq_ptr_value <= _value_T_1;
    end
    if (reset) begin
      deq_ptr_value <= 3'h0;
    end else if (do_deq) begin
      deq_ptr_value <= _value_T_3;
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
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_tl_state_size[initvar] = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_tl_state_source[initvar] = _RAND_1[4:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enq_ptr_value = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  deq_ptr_value = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule