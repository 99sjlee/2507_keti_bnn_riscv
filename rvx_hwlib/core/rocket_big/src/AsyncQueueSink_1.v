`default_nettype wire
module AsyncQueueSink_1(
  input         clock,
  input         reset,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [2:0]  io_deq_bits_param,
  output [1:0]  io_deq_bits_size,
  output        io_deq_bits_source,
  output [8:0]  io_deq_bits_address,
  output [3:0]  io_deq_bits_mask,
  output [31:0] io_deq_bits_data,
  output        io_deq_bits_corrupt,
  input  [2:0]  io_async_mem_0_opcode,
  input  [8:0]  io_async_mem_0_address,
  input  [31:0] io_async_mem_0_data,
  output        io_async_ridx,
  input         io_async_widx,
  output        io_async_safe_ridx_valid,
  input         io_async_safe_widx_valid,
  input         io_async_safe_source_reset_n,
  output        io_async_safe_sink_reset_n
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  widx_widx_gray_clock;
  wire  widx_widx_gray_reset;
  wire  widx_widx_gray_io_d;
  wire  widx_widx_gray_io_q;
  wire  io_deq_bits_deq_bits_reg_clock;
  wire [54:0] io_deq_bits_deq_bits_reg_io_d;
  wire [54:0] io_deq_bits_deq_bits_reg_io_q;
  wire  io_deq_bits_deq_bits_reg_io_en;
  wire  sink_valid_0_io_in;
  wire  sink_valid_0_io_out;
  wire  sink_valid_0_clock;
  wire  sink_valid_0_reset;
  wire  sink_valid_1_io_in;
  wire  sink_valid_1_io_out;
  wire  sink_valid_1_clock;
  wire  sink_valid_1_reset;
  wire  source_extend_io_in;
  wire  source_extend_io_out;
  wire  source_extend_clock;
  wire  source_extend_reset;
  wire  source_valid_io_in;
  wire  source_valid_io_out;
  wire  source_valid_clock;
  wire  source_valid_reset;
  wire  _ridx_T_1 = io_deq_ready & io_deq_valid;
  wire  source_ready = source_valid_io_out;
  wire  _ridx_T_2 = ~source_ready;
  reg  ridx_ridx_bin;
  wire  ridx_incremented = _ridx_T_2 ? 1'h0 : ridx_ridx_bin + _ridx_T_1;
  wire  widx = widx_widx_gray_io_q;
  wire [45:0] io_deq_bits_deq_bits_reg_io_d_lo = {io_async_mem_0_address,4'hf,io_async_mem_0_data,1'h0};
  wire [8:0] io_deq_bits_deq_bits_reg_io_d_hi = {io_async_mem_0_opcode,3'h0,3'h4};
  wire [54:0] _io_deq_bits_WIRE_1 = io_deq_bits_deq_bits_reg_io_q;
  reg  valid_reg;
  reg  ridx_gray;
  AsyncResetSynchronizerShiftReg_w1_d3_i0 widx_widx_gray (
    .clock(widx_widx_gray_clock),
    .reset(widx_widx_gray_reset),
    .io_d(widx_widx_gray_io_d),
    .io_q(widx_widx_gray_io_q)
  );
  ClockCrossingReg_w55 io_deq_bits_deq_bits_reg (
    .clock(io_deq_bits_deq_bits_reg_clock),
    .io_d(io_deq_bits_deq_bits_reg_io_d),
    .io_q(io_deq_bits_deq_bits_reg_io_q),
    .io_en(io_deq_bits_deq_bits_reg_io_en)
  );
  AsyncValidSync sink_valid_0 (
    .io_in(sink_valid_0_io_in),
    .io_out(sink_valid_0_io_out),
    .clock(sink_valid_0_clock),
    .reset(sink_valid_0_reset)
  );
  AsyncValidSync sink_valid_1 (
    .io_in(sink_valid_1_io_in),
    .io_out(sink_valid_1_io_out),
    .clock(sink_valid_1_clock),
    .reset(sink_valid_1_reset)
  );
  AsyncValidSync source_extend (
    .io_in(source_extend_io_in),
    .io_out(source_extend_io_out),
    .clock(source_extend_clock),
    .reset(source_extend_reset)
  );
  AsyncValidSync source_valid (
    .io_in(source_valid_io_in),
    .io_out(source_valid_io_out),
    .clock(source_valid_clock),
    .reset(source_valid_reset)
  );
  assign io_deq_valid = valid_reg & source_ready;
  assign io_deq_bits_opcode = _io_deq_bits_WIRE_1[54:52];
  assign io_deq_bits_param = _io_deq_bits_WIRE_1[51:49];
  assign io_deq_bits_size = _io_deq_bits_WIRE_1[48:47];
  assign io_deq_bits_source = _io_deq_bits_WIRE_1[46];
  assign io_deq_bits_address = _io_deq_bits_WIRE_1[45:37];
  assign io_deq_bits_mask = _io_deq_bits_WIRE_1[36:33];
  assign io_deq_bits_data = _io_deq_bits_WIRE_1[32:1];
  assign io_deq_bits_corrupt = _io_deq_bits_WIRE_1[0];
  assign io_async_ridx = ridx_gray;
  assign io_async_safe_ridx_valid = sink_valid_1_io_out;
  assign io_async_safe_sink_reset_n = ~reset;
  assign widx_widx_gray_clock = clock;
  assign widx_widx_gray_reset = reset;
  assign widx_widx_gray_io_d = io_async_widx;
  assign io_deq_bits_deq_bits_reg_clock = clock;
  assign io_deq_bits_deq_bits_reg_io_d = {io_deq_bits_deq_bits_reg_io_d_hi,io_deq_bits_deq_bits_reg_io_d_lo};
  assign io_deq_bits_deq_bits_reg_io_en = source_ready & ridx_incremented != widx;
  assign sink_valid_0_io_in = 1'h1;
  assign sink_valid_0_clock = clock;
  assign sink_valid_0_reset = reset | ~io_async_safe_source_reset_n;
  assign sink_valid_1_io_in = sink_valid_0_io_out;
  assign sink_valid_1_clock = clock;
  assign sink_valid_1_reset = reset | ~io_async_safe_source_reset_n;
  assign source_extend_io_in = io_async_safe_widx_valid;
  assign source_extend_clock = clock;
  assign source_extend_reset = reset | ~io_async_safe_source_reset_n;
  assign source_valid_io_in = source_extend_io_out;
  assign source_valid_clock = clock;
  assign source_valid_reset = reset;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ridx_ridx_bin <= 1'h0;
    end else if (_ridx_T_2) begin
      ridx_ridx_bin <= 1'h0;
    end else begin
      ridx_ridx_bin <= ridx_ridx_bin + _ridx_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      valid_reg <= 1'h0;
    end else begin
      valid_reg <= source_ready & ridx_incremented != widx;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ridx_gray <= 1'h0;
    end else if (_ridx_T_2) begin
      ridx_gray <= 1'h0;
    end else begin
      ridx_gray <= ridx_ridx_bin + _ridx_T_1;
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ridx_ridx_bin = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ridx_gray = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    ridx_ridx_bin = 1'h0;
  end
  if (reset) begin
    valid_reg = 1'h0;
  end
  if (reset) begin
    ridx_gray = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule