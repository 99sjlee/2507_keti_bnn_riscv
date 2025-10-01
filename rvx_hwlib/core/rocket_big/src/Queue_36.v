`default_nettype wire
module Queue_36(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [2:0] io_enq_bits_sink,
  output       io_deq_valid,
  output [2:0] io_deq_bits_sink
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram_sink [0:1];
  wire  ram_sink_io_deq_bits_MPORT_en;
  wire  ram_sink_io_deq_bits_MPORT_addr;
  wire [2:0] ram_sink_io_deq_bits_MPORT_data;
  wire [2:0] ram_sink_MPORT_data;
  wire  ram_sink_MPORT_addr;
  wire  ram_sink_MPORT_mask;
  wire  ram_sink_MPORT_en;
  reg  value;
  reg  value_1;
  reg  maybe_full;
  wire  ptr_match = value == value_1;
  wire  empty = ptr_match & ~maybe_full;
  wire  full = ptr_match & maybe_full;
  wire  do_enq = io_enq_ready & io_enq_valid;
  assign ram_sink_io_deq_bits_MPORT_en = 1'h1;
  assign ram_sink_io_deq_bits_MPORT_addr = value_1;
  assign ram_sink_io_deq_bits_MPORT_data = ram_sink[ram_sink_io_deq_bits_MPORT_addr];
  assign ram_sink_MPORT_data = io_enq_bits_sink;
  assign ram_sink_MPORT_addr = value;
  assign ram_sink_MPORT_mask = 1'h1;
  assign ram_sink_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_sink = ram_sink_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if (ram_sink_MPORT_en & ram_sink_MPORT_mask) begin
      ram_sink[ram_sink_MPORT_addr] <= ram_sink_MPORT_data;
    end
    if (reset) begin
      value <= 1'h0;
    end else if (do_enq) begin
      value <= value + 1'h1;
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else if (io_deq_valid) begin
      value_1 <= value_1 + 1'h1;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (do_enq != io_deq_valid) begin
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
    ram_sink[initvar] = _RAND_0[2:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule