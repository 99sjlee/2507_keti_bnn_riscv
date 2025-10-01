`default_nettype wire
module TLAsyncCrossingSink(
  input         clock,
  input         reset,
  input  [2:0]  auto_in_a_mem_0_opcode,
  input  [8:0]  auto_in_a_mem_0_address,
  input  [31:0] auto_in_a_mem_0_data,
  output        auto_in_a_ridx,
  input         auto_in_a_widx,
  output        auto_in_a_safe_ridx_valid,
  input         auto_in_a_safe_widx_valid,
  input         auto_in_a_safe_source_reset_n,
  output        auto_in_a_safe_sink_reset_n,
  output [2:0]  auto_in_d_mem_0_opcode,
  output [1:0]  auto_in_d_mem_0_size,
  output        auto_in_d_mem_0_source,
  output [31:0] auto_in_d_mem_0_data,
  input         auto_in_d_ridx,
  output        auto_in_d_widx,
  input         auto_in_d_safe_ridx_valid,
  output        auto_in_d_safe_widx_valid,
  output        auto_in_d_safe_source_reset_n,
  input         auto_in_d_safe_sink_reset_n,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [1:0]  auto_out_a_bits_size,
  output        auto_out_a_bits_source,
  output [8:0]  auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_size,
  input         auto_out_d_bits_source,
  input  [31:0] auto_out_d_bits_data
);
  wire  bundleOut_0_a_sink_clock;
  wire  bundleOut_0_a_sink_reset;
  wire  bundleOut_0_a_sink_io_deq_ready;
  wire  bundleOut_0_a_sink_io_deq_valid;
  wire [2:0] bundleOut_0_a_sink_io_deq_bits_opcode;
  wire [2:0] bundleOut_0_a_sink_io_deq_bits_param;
  wire [1:0] bundleOut_0_a_sink_io_deq_bits_size;
  wire  bundleOut_0_a_sink_io_deq_bits_source;
  wire [8:0] bundleOut_0_a_sink_io_deq_bits_address;
  wire [3:0] bundleOut_0_a_sink_io_deq_bits_mask;
  wire [31:0] bundleOut_0_a_sink_io_deq_bits_data;
  wire  bundleOut_0_a_sink_io_deq_bits_corrupt;
  wire [2:0] bundleOut_0_a_sink_io_async_mem_0_opcode;
  wire [8:0] bundleOut_0_a_sink_io_async_mem_0_address;
  wire [31:0] bundleOut_0_a_sink_io_async_mem_0_data;
  wire  bundleOut_0_a_sink_io_async_ridx;
  wire  bundleOut_0_a_sink_io_async_widx;
  wire  bundleOut_0_a_sink_io_async_safe_ridx_valid;
  wire  bundleOut_0_a_sink_io_async_safe_widx_valid;
  wire  bundleOut_0_a_sink_io_async_safe_source_reset_n;
  wire  bundleOut_0_a_sink_io_async_safe_sink_reset_n;
  wire  bundleIn_0_d_source_clock;
  wire  bundleIn_0_d_source_reset;
  wire  bundleIn_0_d_source_io_enq_ready;
  wire  bundleIn_0_d_source_io_enq_valid;
  wire [2:0] bundleIn_0_d_source_io_enq_bits_opcode;
  wire [1:0] bundleIn_0_d_source_io_enq_bits_size;
  wire  bundleIn_0_d_source_io_enq_bits_source;
  wire [31:0] bundleIn_0_d_source_io_enq_bits_data;
  wire [2:0] bundleIn_0_d_source_io_async_mem_0_opcode;
  wire [1:0] bundleIn_0_d_source_io_async_mem_0_size;
  wire  bundleIn_0_d_source_io_async_mem_0_source;
  wire [31:0] bundleIn_0_d_source_io_async_mem_0_data;
  wire  bundleIn_0_d_source_io_async_ridx;
  wire  bundleIn_0_d_source_io_async_widx;
  wire  bundleIn_0_d_source_io_async_safe_ridx_valid;
  wire  bundleIn_0_d_source_io_async_safe_widx_valid;
  wire  bundleIn_0_d_source_io_async_safe_source_reset_n;
  wire  bundleIn_0_d_source_io_async_safe_sink_reset_n;
  AsyncQueueSink_1 bundleOut_0_a_sink (
    .clock(bundleOut_0_a_sink_clock),
    .reset(bundleOut_0_a_sink_reset),
    .io_deq_ready(bundleOut_0_a_sink_io_deq_ready),
    .io_deq_valid(bundleOut_0_a_sink_io_deq_valid),
    .io_deq_bits_opcode(bundleOut_0_a_sink_io_deq_bits_opcode),
    .io_deq_bits_param(bundleOut_0_a_sink_io_deq_bits_param),
    .io_deq_bits_size(bundleOut_0_a_sink_io_deq_bits_size),
    .io_deq_bits_source(bundleOut_0_a_sink_io_deq_bits_source),
    .io_deq_bits_address(bundleOut_0_a_sink_io_deq_bits_address),
    .io_deq_bits_mask(bundleOut_0_a_sink_io_deq_bits_mask),
    .io_deq_bits_data(bundleOut_0_a_sink_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleOut_0_a_sink_io_deq_bits_corrupt),
    .io_async_mem_0_opcode(bundleOut_0_a_sink_io_async_mem_0_opcode),
    .io_async_mem_0_address(bundleOut_0_a_sink_io_async_mem_0_address),
    .io_async_mem_0_data(bundleOut_0_a_sink_io_async_mem_0_data),
    .io_async_ridx(bundleOut_0_a_sink_io_async_ridx),
    .io_async_widx(bundleOut_0_a_sink_io_async_widx),
    .io_async_safe_ridx_valid(bundleOut_0_a_sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(bundleOut_0_a_sink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(bundleOut_0_a_sink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(bundleOut_0_a_sink_io_async_safe_sink_reset_n)
  );
  AsyncQueueSource_2 bundleIn_0_d_source (
    .clock(bundleIn_0_d_source_clock),
    .reset(bundleIn_0_d_source_reset),
    .io_enq_ready(bundleIn_0_d_source_io_enq_ready),
    .io_enq_valid(bundleIn_0_d_source_io_enq_valid),
    .io_enq_bits_opcode(bundleIn_0_d_source_io_enq_bits_opcode),
    .io_enq_bits_size(bundleIn_0_d_source_io_enq_bits_size),
    .io_enq_bits_source(bundleIn_0_d_source_io_enq_bits_source),
    .io_enq_bits_data(bundleIn_0_d_source_io_enq_bits_data),
    .io_async_mem_0_opcode(bundleIn_0_d_source_io_async_mem_0_opcode),
    .io_async_mem_0_size(bundleIn_0_d_source_io_async_mem_0_size),
    .io_async_mem_0_source(bundleIn_0_d_source_io_async_mem_0_source),
    .io_async_mem_0_data(bundleIn_0_d_source_io_async_mem_0_data),
    .io_async_ridx(bundleIn_0_d_source_io_async_ridx),
    .io_async_widx(bundleIn_0_d_source_io_async_widx),
    .io_async_safe_ridx_valid(bundleIn_0_d_source_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(bundleIn_0_d_source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(bundleIn_0_d_source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(bundleIn_0_d_source_io_async_safe_sink_reset_n)
  );
  assign auto_in_a_ridx = bundleOut_0_a_sink_io_async_ridx;
  assign auto_in_a_safe_ridx_valid = bundleOut_0_a_sink_io_async_safe_ridx_valid;
  assign auto_in_a_safe_sink_reset_n = bundleOut_0_a_sink_io_async_safe_sink_reset_n;
  assign auto_in_d_mem_0_opcode = bundleIn_0_d_source_io_async_mem_0_opcode;
  assign auto_in_d_mem_0_size = bundleIn_0_d_source_io_async_mem_0_size;
  assign auto_in_d_mem_0_source = bundleIn_0_d_source_io_async_mem_0_source;
  assign auto_in_d_mem_0_data = bundleIn_0_d_source_io_async_mem_0_data;
  assign auto_in_d_widx = bundleIn_0_d_source_io_async_widx;
  assign auto_in_d_safe_widx_valid = bundleIn_0_d_source_io_async_safe_widx_valid;
  assign auto_in_d_safe_source_reset_n = bundleIn_0_d_source_io_async_safe_source_reset_n;
  assign auto_out_a_valid = bundleOut_0_a_sink_io_deq_valid;
  assign auto_out_a_bits_opcode = bundleOut_0_a_sink_io_deq_bits_opcode;
  assign auto_out_a_bits_param = bundleOut_0_a_sink_io_deq_bits_param;
  assign auto_out_a_bits_size = bundleOut_0_a_sink_io_deq_bits_size;
  assign auto_out_a_bits_source = bundleOut_0_a_sink_io_deq_bits_source;
  assign auto_out_a_bits_address = bundleOut_0_a_sink_io_deq_bits_address;
  assign auto_out_a_bits_mask = bundleOut_0_a_sink_io_deq_bits_mask;
  assign auto_out_a_bits_data = bundleOut_0_a_sink_io_deq_bits_data;
  assign auto_out_a_bits_corrupt = bundleOut_0_a_sink_io_deq_bits_corrupt;
  assign auto_out_d_ready = bundleIn_0_d_source_io_enq_ready;
  assign bundleOut_0_a_sink_clock = clock;
  assign bundleOut_0_a_sink_reset = reset;
  assign bundleOut_0_a_sink_io_deq_ready = auto_out_a_ready;
  assign bundleOut_0_a_sink_io_async_mem_0_opcode = auto_in_a_mem_0_opcode;
  assign bundleOut_0_a_sink_io_async_mem_0_address = auto_in_a_mem_0_address;
  assign bundleOut_0_a_sink_io_async_mem_0_data = auto_in_a_mem_0_data;
  assign bundleOut_0_a_sink_io_async_widx = auto_in_a_widx;
  assign bundleOut_0_a_sink_io_async_safe_widx_valid = auto_in_a_safe_widx_valid;
  assign bundleOut_0_a_sink_io_async_safe_source_reset_n = auto_in_a_safe_source_reset_n;
  assign bundleIn_0_d_source_clock = clock;
  assign bundleIn_0_d_source_reset = reset;
  assign bundleIn_0_d_source_io_enq_valid = auto_out_d_valid;
  assign bundleIn_0_d_source_io_enq_bits_opcode = auto_out_d_bits_opcode;
  assign bundleIn_0_d_source_io_enq_bits_size = auto_out_d_bits_size;
  assign bundleIn_0_d_source_io_enq_bits_source = auto_out_d_bits_source;
  assign bundleIn_0_d_source_io_enq_bits_data = auto_out_d_bits_data;
  assign bundleIn_0_d_source_io_async_ridx = auto_in_d_ridx;
  assign bundleIn_0_d_source_io_async_safe_ridx_valid = auto_in_d_safe_ridx_valid;
  assign bundleIn_0_d_source_io_async_safe_sink_reset_n = auto_in_d_safe_sink_reset_n;
endmodule