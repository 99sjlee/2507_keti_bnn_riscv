`default_nettype wire
module TLAsyncCrossingSource(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [8:0]  auto_in_a_bits_address,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [1:0]  auto_in_d_bits_size,
  output        auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  output [2:0]  auto_out_a_mem_0_opcode,
  output [8:0]  auto_out_a_mem_0_address,
  output [31:0] auto_out_a_mem_0_data,
  input         auto_out_a_ridx,
  output        auto_out_a_widx,
  input         auto_out_a_safe_ridx_valid,
  output        auto_out_a_safe_widx_valid,
  output        auto_out_a_safe_source_reset_n,
  input         auto_out_a_safe_sink_reset_n,
  input  [2:0]  auto_out_d_mem_0_opcode,
  input  [1:0]  auto_out_d_mem_0_size,
  input         auto_out_d_mem_0_source,
  input  [31:0] auto_out_d_mem_0_data,
  output        auto_out_d_ridx,
  input         auto_out_d_widx,
  output        auto_out_d_safe_ridx_valid,
  input         auto_out_d_safe_widx_valid,
  input         auto_out_d_safe_source_reset_n,
  output        auto_out_d_safe_sink_reset_n
);
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [8:0] monitor_io_in_a_bits_address;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [1:0] monitor_io_in_d_bits_size;
  wire  monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  bundleOut_0_a_source_clock;
  wire  bundleOut_0_a_source_reset;
  wire  bundleOut_0_a_source_io_enq_ready;
  wire  bundleOut_0_a_source_io_enq_valid;
  wire [2:0] bundleOut_0_a_source_io_enq_bits_opcode;
  wire [8:0] bundleOut_0_a_source_io_enq_bits_address;
  wire [31:0] bundleOut_0_a_source_io_enq_bits_data;
  wire [2:0] bundleOut_0_a_source_io_async_mem_0_opcode;
  wire [8:0] bundleOut_0_a_source_io_async_mem_0_address;
  wire [31:0] bundleOut_0_a_source_io_async_mem_0_data;
  wire  bundleOut_0_a_source_io_async_ridx;
  wire  bundleOut_0_a_source_io_async_widx;
  wire  bundleOut_0_a_source_io_async_safe_ridx_valid;
  wire  bundleOut_0_a_source_io_async_safe_widx_valid;
  wire  bundleOut_0_a_source_io_async_safe_source_reset_n;
  wire  bundleOut_0_a_source_io_async_safe_sink_reset_n;
  wire  bundleIn_0_d_sink_clock;
  wire  bundleIn_0_d_sink_reset;
  wire  bundleIn_0_d_sink_io_deq_ready;
  wire  bundleIn_0_d_sink_io_deq_valid;
  wire [2:0] bundleIn_0_d_sink_io_deq_bits_opcode;
  wire [1:0] bundleIn_0_d_sink_io_deq_bits_param;
  wire [1:0] bundleIn_0_d_sink_io_deq_bits_size;
  wire  bundleIn_0_d_sink_io_deq_bits_source;
  wire  bundleIn_0_d_sink_io_deq_bits_sink;
  wire  bundleIn_0_d_sink_io_deq_bits_denied;
  wire [31:0] bundleIn_0_d_sink_io_deq_bits_data;
  wire  bundleIn_0_d_sink_io_deq_bits_corrupt;
  wire [2:0] bundleIn_0_d_sink_io_async_mem_0_opcode;
  wire [1:0] bundleIn_0_d_sink_io_async_mem_0_size;
  wire  bundleIn_0_d_sink_io_async_mem_0_source;
  wire [31:0] bundleIn_0_d_sink_io_async_mem_0_data;
  wire  bundleIn_0_d_sink_io_async_ridx;
  wire  bundleIn_0_d_sink_io_async_widx;
  wire  bundleIn_0_d_sink_io_async_safe_ridx_valid;
  wire  bundleIn_0_d_sink_io_async_safe_widx_valid;
  wire  bundleIn_0_d_sink_io_async_safe_source_reset_n;
  wire  bundleIn_0_d_sink_io_async_safe_sink_reset_n;
  
  AsyncQueueSource bundleOut_0_a_source (
    .clock(bundleOut_0_a_source_clock),
    .reset(bundleOut_0_a_source_reset),
    .io_enq_ready(bundleOut_0_a_source_io_enq_ready),
    .io_enq_valid(bundleOut_0_a_source_io_enq_valid),
    .io_enq_bits_opcode(bundleOut_0_a_source_io_enq_bits_opcode),
    .io_enq_bits_address(bundleOut_0_a_source_io_enq_bits_address),
    .io_enq_bits_data(bundleOut_0_a_source_io_enq_bits_data),
    .io_async_mem_0_opcode(bundleOut_0_a_source_io_async_mem_0_opcode),
    .io_async_mem_0_address(bundleOut_0_a_source_io_async_mem_0_address),
    .io_async_mem_0_data(bundleOut_0_a_source_io_async_mem_0_data),
    .io_async_ridx(bundleOut_0_a_source_io_async_ridx),
    .io_async_widx(bundleOut_0_a_source_io_async_widx),
    .io_async_safe_ridx_valid(bundleOut_0_a_source_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(bundleOut_0_a_source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(bundleOut_0_a_source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(bundleOut_0_a_source_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink bundleIn_0_d_sink (
    .clock(bundleIn_0_d_sink_clock),
    .reset(bundleIn_0_d_sink_reset),
    .io_deq_ready(bundleIn_0_d_sink_io_deq_ready),
    .io_deq_valid(bundleIn_0_d_sink_io_deq_valid),
    .io_deq_bits_opcode(bundleIn_0_d_sink_io_deq_bits_opcode),
    .io_deq_bits_param(bundleIn_0_d_sink_io_deq_bits_param),
    .io_deq_bits_size(bundleIn_0_d_sink_io_deq_bits_size),
    .io_deq_bits_source(bundleIn_0_d_sink_io_deq_bits_source),
    .io_deq_bits_sink(bundleIn_0_d_sink_io_deq_bits_sink),
    .io_deq_bits_denied(bundleIn_0_d_sink_io_deq_bits_denied),
    .io_deq_bits_data(bundleIn_0_d_sink_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleIn_0_d_sink_io_deq_bits_corrupt),
    .io_async_mem_0_opcode(bundleIn_0_d_sink_io_async_mem_0_opcode),
    .io_async_mem_0_size(bundleIn_0_d_sink_io_async_mem_0_size),
    .io_async_mem_0_source(bundleIn_0_d_sink_io_async_mem_0_source),
    .io_async_mem_0_data(bundleIn_0_d_sink_io_async_mem_0_data),
    .io_async_ridx(bundleIn_0_d_sink_io_async_ridx),
    .io_async_widx(bundleIn_0_d_sink_io_async_widx),
    .io_async_safe_ridx_valid(bundleIn_0_d_sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(bundleIn_0_d_sink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(bundleIn_0_d_sink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(bundleIn_0_d_sink_io_async_safe_sink_reset_n)
  );
  assign auto_in_a_ready = bundleOut_0_a_source_io_enq_ready;
  assign auto_in_d_valid = bundleIn_0_d_sink_io_deq_valid;
  assign auto_in_d_bits_opcode = bundleIn_0_d_sink_io_deq_bits_opcode;
  assign auto_in_d_bits_param = bundleIn_0_d_sink_io_deq_bits_param;
  assign auto_in_d_bits_size = bundleIn_0_d_sink_io_deq_bits_size;
  assign auto_in_d_bits_source = bundleIn_0_d_sink_io_deq_bits_source;
  assign auto_in_d_bits_sink = bundleIn_0_d_sink_io_deq_bits_sink;
  assign auto_in_d_bits_denied = bundleIn_0_d_sink_io_deq_bits_denied;
  assign auto_in_d_bits_data = bundleIn_0_d_sink_io_deq_bits_data;
  assign auto_in_d_bits_corrupt = bundleIn_0_d_sink_io_deq_bits_corrupt;
  assign auto_out_a_mem_0_opcode = bundleOut_0_a_source_io_async_mem_0_opcode;
  assign auto_out_a_mem_0_address = bundleOut_0_a_source_io_async_mem_0_address;
  assign auto_out_a_mem_0_data = bundleOut_0_a_source_io_async_mem_0_data;
  assign auto_out_a_widx = bundleOut_0_a_source_io_async_widx;
  assign auto_out_a_safe_widx_valid = bundleOut_0_a_source_io_async_safe_widx_valid;
  assign auto_out_a_safe_source_reset_n = bundleOut_0_a_source_io_async_safe_source_reset_n;
  assign auto_out_d_ridx = bundleIn_0_d_sink_io_async_ridx;
  assign auto_out_d_safe_ridx_valid = bundleIn_0_d_sink_io_async_safe_ridx_valid;
  assign auto_out_d_safe_sink_reset_n = bundleIn_0_d_sink_io_async_safe_sink_reset_n;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = bundleOut_0_a_source_io_enq_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = bundleIn_0_d_sink_io_deq_valid;
  assign monitor_io_in_d_bits_opcode = bundleIn_0_d_sink_io_deq_bits_opcode;
  assign monitor_io_in_d_bits_param = bundleIn_0_d_sink_io_deq_bits_param;
  assign monitor_io_in_d_bits_size = bundleIn_0_d_sink_io_deq_bits_size;
  assign monitor_io_in_d_bits_source = bundleIn_0_d_sink_io_deq_bits_source;
  assign monitor_io_in_d_bits_sink = bundleIn_0_d_sink_io_deq_bits_sink;
  assign monitor_io_in_d_bits_denied = bundleIn_0_d_sink_io_deq_bits_denied;
  assign monitor_io_in_d_bits_corrupt = bundleIn_0_d_sink_io_deq_bits_corrupt;
  assign bundleOut_0_a_source_clock = clock;
  assign bundleOut_0_a_source_reset = reset;
  assign bundleOut_0_a_source_io_enq_valid = auto_in_a_valid;
  assign bundleOut_0_a_source_io_enq_bits_opcode = auto_in_a_bits_opcode;
  assign bundleOut_0_a_source_io_enq_bits_address = auto_in_a_bits_address;
  assign bundleOut_0_a_source_io_enq_bits_data = auto_in_a_bits_data;
  assign bundleOut_0_a_source_io_async_ridx = auto_out_a_ridx;
  assign bundleOut_0_a_source_io_async_safe_ridx_valid = auto_out_a_safe_ridx_valid;
  assign bundleOut_0_a_source_io_async_safe_sink_reset_n = auto_out_a_safe_sink_reset_n;
  assign bundleIn_0_d_sink_clock = clock;
  assign bundleIn_0_d_sink_reset = reset;
  assign bundleIn_0_d_sink_io_deq_ready = auto_in_d_ready;
  assign bundleIn_0_d_sink_io_async_mem_0_opcode = auto_out_d_mem_0_opcode;
  assign bundleIn_0_d_sink_io_async_mem_0_size = auto_out_d_mem_0_size;
  assign bundleIn_0_d_sink_io_async_mem_0_source = auto_out_d_mem_0_source;
  assign bundleIn_0_d_sink_io_async_mem_0_data = auto_out_d_mem_0_data;
  assign bundleIn_0_d_sink_io_async_widx = auto_out_d_widx;
  assign bundleIn_0_d_sink_io_async_safe_widx_valid = auto_out_d_safe_widx_valid;
  assign bundleIn_0_d_sink_io_async_safe_source_reset_n = auto_out_d_safe_source_reset_n;
endmodule