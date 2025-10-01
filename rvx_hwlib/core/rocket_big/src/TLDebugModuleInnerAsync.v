`default_nettype wire
module TLDebugModuleInnerAsync(
  input  [2:0]  auto_dmiXing_in_a_mem_0_opcode,
  input  [8:0]  auto_dmiXing_in_a_mem_0_address,
  input  [31:0] auto_dmiXing_in_a_mem_0_data,
  output        auto_dmiXing_in_a_ridx,
  input         auto_dmiXing_in_a_widx,
  output        auto_dmiXing_in_a_safe_ridx_valid,
  input         auto_dmiXing_in_a_safe_widx_valid,
  input         auto_dmiXing_in_a_safe_source_reset_n,
  output        auto_dmiXing_in_a_safe_sink_reset_n,
  output [2:0]  auto_dmiXing_in_d_mem_0_opcode,
  output [1:0]  auto_dmiXing_in_d_mem_0_size,
  output        auto_dmiXing_in_d_mem_0_source,
  output [31:0] auto_dmiXing_in_d_mem_0_data,
  input         auto_dmiXing_in_d_ridx,
  output        auto_dmiXing_in_d_widx,
  input         auto_dmiXing_in_d_safe_ridx_valid,
  output        auto_dmiXing_in_d_safe_widx_valid,
  output        auto_dmiXing_in_d_safe_source_reset_n,
  input         auto_dmiXing_in_d_safe_sink_reset_n,
  output        auto_dmInner_tl_in_a_ready,
  input         auto_dmInner_tl_in_a_valid,
  input  [2:0]  auto_dmInner_tl_in_a_bits_opcode,
  input  [2:0]  auto_dmInner_tl_in_a_bits_param,
  input  [1:0]  auto_dmInner_tl_in_a_bits_size,
  input  [9:0]  auto_dmInner_tl_in_a_bits_source,
  input  [11:0] auto_dmInner_tl_in_a_bits_address,
  input  [3:0]  auto_dmInner_tl_in_a_bits_mask,
  input  [31:0] auto_dmInner_tl_in_a_bits_data,
  input         auto_dmInner_tl_in_a_bits_corrupt,
  input         auto_dmInner_tl_in_d_ready,
  output        auto_dmInner_tl_in_d_valid,
  output [2:0]  auto_dmInner_tl_in_d_bits_opcode,
  output [1:0]  auto_dmInner_tl_in_d_bits_size,
  output [9:0]  auto_dmInner_tl_in_d_bits_source,
  output [31:0] auto_dmInner_tl_in_d_bits_data,
  input         io_debug_clock,
  input         io_debug_reset,
  input         io_dmactive,
  input         io_innerCtrl_mem_0_resumereq,
  input         io_innerCtrl_mem_0_ackhavereset,
  input         io_innerCtrl_mem_0_hrmask_0,
  output        io_innerCtrl_ridx,
  input         io_innerCtrl_widx,
  output        io_innerCtrl_safe_ridx_valid,
  input         io_innerCtrl_safe_widx_valid,
  input         io_innerCtrl_safe_source_reset_n,
  output        io_innerCtrl_safe_sink_reset_n,
  output        io_hgDebugInt_0,
  input         io_hartIsInReset_0
);
  wire  dmInner_clock;
  wire  dmInner_reset;
  wire  dmInner_auto_tl_in_a_ready;
  wire  dmInner_auto_tl_in_a_valid;
  wire [2:0] dmInner_auto_tl_in_a_bits_opcode;
  wire [2:0] dmInner_auto_tl_in_a_bits_param;
  wire [1:0] dmInner_auto_tl_in_a_bits_size;
  wire [9:0] dmInner_auto_tl_in_a_bits_source;
  wire [11:0] dmInner_auto_tl_in_a_bits_address;
  wire [3:0] dmInner_auto_tl_in_a_bits_mask;
  wire [31:0] dmInner_auto_tl_in_a_bits_data;
  wire  dmInner_auto_tl_in_a_bits_corrupt;
  wire  dmInner_auto_tl_in_d_ready;
  wire  dmInner_auto_tl_in_d_valid;
  wire [2:0] dmInner_auto_tl_in_d_bits_opcode;
  wire [1:0] dmInner_auto_tl_in_d_bits_size;
  wire [9:0] dmInner_auto_tl_in_d_bits_source;
  wire [31:0] dmInner_auto_tl_in_d_bits_data;
  wire  dmInner_auto_dmi_in_a_ready;
  wire  dmInner_auto_dmi_in_a_valid;
  wire [2:0] dmInner_auto_dmi_in_a_bits_opcode;
  wire [2:0] dmInner_auto_dmi_in_a_bits_param;
  wire [1:0] dmInner_auto_dmi_in_a_bits_size;
  wire  dmInner_auto_dmi_in_a_bits_source;
  wire [8:0] dmInner_auto_dmi_in_a_bits_address;
  wire [3:0] dmInner_auto_dmi_in_a_bits_mask;
  wire [31:0] dmInner_auto_dmi_in_a_bits_data;
  wire  dmInner_auto_dmi_in_a_bits_corrupt;
  wire  dmInner_auto_dmi_in_d_ready;
  wire  dmInner_auto_dmi_in_d_valid;
  wire [2:0] dmInner_auto_dmi_in_d_bits_opcode;
  wire [1:0] dmInner_auto_dmi_in_d_bits_size;
  wire  dmInner_auto_dmi_in_d_bits_source;
  wire [31:0] dmInner_auto_dmi_in_d_bits_data;
  wire  dmInner_io_dmactive;
  wire  dmInner_io_innerCtrl_ready;
  wire  dmInner_io_innerCtrl_valid;
  wire  dmInner_io_innerCtrl_bits_resumereq;
  wire [9:0] dmInner_io_innerCtrl_bits_hartsel;
  wire  dmInner_io_innerCtrl_bits_ackhavereset;
  wire  dmInner_io_innerCtrl_bits_hrmask_0;
  wire  dmInner_io_hgDebugInt_0;
  wire  dmInner_io_hartIsInReset_0;
  wire  dmiXing_clock;
  wire  dmiXing_reset;
  wire [2:0] dmiXing_auto_in_a_mem_0_opcode;
  wire [8:0] dmiXing_auto_in_a_mem_0_address;
  wire [31:0] dmiXing_auto_in_a_mem_0_data;
  wire  dmiXing_auto_in_a_ridx;
  wire  dmiXing_auto_in_a_widx;
  wire  dmiXing_auto_in_a_safe_ridx_valid;
  wire  dmiXing_auto_in_a_safe_widx_valid;
  wire  dmiXing_auto_in_a_safe_source_reset_n;
  wire  dmiXing_auto_in_a_safe_sink_reset_n;
  wire [2:0] dmiXing_auto_in_d_mem_0_opcode;
  wire [1:0] dmiXing_auto_in_d_mem_0_size;
  wire  dmiXing_auto_in_d_mem_0_source;
  wire [31:0] dmiXing_auto_in_d_mem_0_data;
  wire  dmiXing_auto_in_d_ridx;
  wire  dmiXing_auto_in_d_widx;
  wire  dmiXing_auto_in_d_safe_ridx_valid;
  wire  dmiXing_auto_in_d_safe_widx_valid;
  wire  dmiXing_auto_in_d_safe_source_reset_n;
  wire  dmiXing_auto_in_d_safe_sink_reset_n;
  wire  dmiXing_auto_out_a_ready;
  wire  dmiXing_auto_out_a_valid;
  wire [2:0] dmiXing_auto_out_a_bits_opcode;
  wire [2:0] dmiXing_auto_out_a_bits_param;
  wire [1:0] dmiXing_auto_out_a_bits_size;
  wire  dmiXing_auto_out_a_bits_source;
  wire [8:0] dmiXing_auto_out_a_bits_address;
  wire [3:0] dmiXing_auto_out_a_bits_mask;
  wire [31:0] dmiXing_auto_out_a_bits_data;
  wire  dmiXing_auto_out_a_bits_corrupt;
  wire  dmiXing_auto_out_d_ready;
  wire  dmiXing_auto_out_d_valid;
  wire [2:0] dmiXing_auto_out_d_bits_opcode;
  wire [1:0] dmiXing_auto_out_d_bits_size;
  wire  dmiXing_auto_out_d_bits_source;
  wire [31:0] dmiXing_auto_out_d_bits_data;
  wire  dmactive_synced_dmactive_synced_dmactiveSync_clock;
  wire  dmactive_synced_dmactive_synced_dmactiveSync_reset;
  wire  dmactive_synced_dmactive_synced_dmactiveSync_io_d;
  wire  dmactive_synced_dmactive_synced_dmactiveSync_io_q;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_clock;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_reset;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq;
  wire [9:0] dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_resumereq;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_ackhavereset;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hrmask_0;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_ridx;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_widx;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_ridx_valid;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_widx_valid;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_source_reset_n;
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_sink_reset_n;
  TLDebugModuleInner dmInner (
    .clock(dmInner_clock),
    .reset(dmInner_reset),
    .auto_tl_in_a_ready(dmInner_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(dmInner_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(dmInner_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(dmInner_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(dmInner_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(dmInner_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(dmInner_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(dmInner_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(dmInner_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(dmInner_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(dmInner_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(dmInner_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(dmInner_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(dmInner_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(dmInner_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(dmInner_auto_tl_in_d_bits_data),
    .auto_dmi_in_a_ready(dmInner_auto_dmi_in_a_ready),
    .auto_dmi_in_a_valid(dmInner_auto_dmi_in_a_valid),
    .auto_dmi_in_a_bits_opcode(dmInner_auto_dmi_in_a_bits_opcode),
    .auto_dmi_in_a_bits_param(dmInner_auto_dmi_in_a_bits_param),
    .auto_dmi_in_a_bits_size(dmInner_auto_dmi_in_a_bits_size),
    .auto_dmi_in_a_bits_source(dmInner_auto_dmi_in_a_bits_source),
    .auto_dmi_in_a_bits_address(dmInner_auto_dmi_in_a_bits_address),
    .auto_dmi_in_a_bits_mask(dmInner_auto_dmi_in_a_bits_mask),
    .auto_dmi_in_a_bits_data(dmInner_auto_dmi_in_a_bits_data),
    .auto_dmi_in_a_bits_corrupt(dmInner_auto_dmi_in_a_bits_corrupt),
    .auto_dmi_in_d_ready(dmInner_auto_dmi_in_d_ready),
    .auto_dmi_in_d_valid(dmInner_auto_dmi_in_d_valid),
    .auto_dmi_in_d_bits_opcode(dmInner_auto_dmi_in_d_bits_opcode),
    .auto_dmi_in_d_bits_size(dmInner_auto_dmi_in_d_bits_size),
    .auto_dmi_in_d_bits_source(dmInner_auto_dmi_in_d_bits_source),
    .auto_dmi_in_d_bits_data(dmInner_auto_dmi_in_d_bits_data),
    .io_dmactive(dmInner_io_dmactive),
    .io_innerCtrl_ready(dmInner_io_innerCtrl_ready),
    .io_innerCtrl_valid(dmInner_io_innerCtrl_valid),
    .io_innerCtrl_bits_resumereq(dmInner_io_innerCtrl_bits_resumereq),
    .io_innerCtrl_bits_hartsel(dmInner_io_innerCtrl_bits_hartsel),
    .io_innerCtrl_bits_ackhavereset(dmInner_io_innerCtrl_bits_ackhavereset),
    .io_innerCtrl_bits_hrmask_0(dmInner_io_innerCtrl_bits_hrmask_0),
    .io_hgDebugInt_0(dmInner_io_hgDebugInt_0),
    .io_hartIsInReset_0(dmInner_io_hartIsInReset_0)
  );
  TLAsyncCrossingSink dmiXing (
    .clock(dmiXing_clock),
    .reset(dmiXing_reset),
    .auto_in_a_mem_0_opcode(dmiXing_auto_in_a_mem_0_opcode),
    .auto_in_a_mem_0_address(dmiXing_auto_in_a_mem_0_address),
    .auto_in_a_mem_0_data(dmiXing_auto_in_a_mem_0_data),
    .auto_in_a_ridx(dmiXing_auto_in_a_ridx),
    .auto_in_a_widx(dmiXing_auto_in_a_widx),
    .auto_in_a_safe_ridx_valid(dmiXing_auto_in_a_safe_ridx_valid),
    .auto_in_a_safe_widx_valid(dmiXing_auto_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n(dmiXing_auto_in_a_safe_source_reset_n),
    .auto_in_a_safe_sink_reset_n(dmiXing_auto_in_a_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode(dmiXing_auto_in_d_mem_0_opcode),
    .auto_in_d_mem_0_size(dmiXing_auto_in_d_mem_0_size),
    .auto_in_d_mem_0_source(dmiXing_auto_in_d_mem_0_source),
    .auto_in_d_mem_0_data(dmiXing_auto_in_d_mem_0_data),
    .auto_in_d_ridx(dmiXing_auto_in_d_ridx),
    .auto_in_d_widx(dmiXing_auto_in_d_widx),
    .auto_in_d_safe_ridx_valid(dmiXing_auto_in_d_safe_ridx_valid),
    .auto_in_d_safe_widx_valid(dmiXing_auto_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n(dmiXing_auto_in_d_safe_source_reset_n),
    .auto_in_d_safe_sink_reset_n(dmiXing_auto_in_d_safe_sink_reset_n),
    .auto_out_a_ready(dmiXing_auto_out_a_ready),
    .auto_out_a_valid(dmiXing_auto_out_a_valid),
    .auto_out_a_bits_opcode(dmiXing_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(dmiXing_auto_out_a_bits_param),
    .auto_out_a_bits_size(dmiXing_auto_out_a_bits_size),
    .auto_out_a_bits_source(dmiXing_auto_out_a_bits_source),
    .auto_out_a_bits_address(dmiXing_auto_out_a_bits_address),
    .auto_out_a_bits_mask(dmiXing_auto_out_a_bits_mask),
    .auto_out_a_bits_data(dmiXing_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(dmiXing_auto_out_a_bits_corrupt),
    .auto_out_d_ready(dmiXing_auto_out_d_ready),
    .auto_out_d_valid(dmiXing_auto_out_d_valid),
    .auto_out_d_bits_opcode(dmiXing_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(dmiXing_auto_out_d_bits_size),
    .auto_out_d_bits_source(dmiXing_auto_out_d_bits_source),
    .auto_out_d_bits_data(dmiXing_auto_out_d_bits_data)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 dmactive_synced_dmactive_synced_dmactiveSync (
    .clock(dmactive_synced_dmactive_synced_dmactiveSync_clock),
    .reset(dmactive_synced_dmactive_synced_dmactiveSync_reset),
    .io_d(dmactive_synced_dmactive_synced_dmactiveSync_io_d),
    .io_q(dmactive_synced_dmactive_synced_dmactiveSync_io_q)
  );
  AsyncQueueSink_2 dmactive_synced_dmInner_io_innerCtrl_sink (
    .clock(dmactive_synced_dmInner_io_innerCtrl_sink_clock),
    .reset(dmactive_synced_dmInner_io_innerCtrl_sink_reset),
    .io_deq_valid(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid),
    .io_deq_bits_resumereq(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq),
    .io_deq_bits_hartsel(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel),
    .io_deq_bits_ackhavereset(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset),
    .io_deq_bits_hrmask_0(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0),
    .io_async_mem_0_resumereq(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_resumereq),
    .io_async_mem_0_ackhavereset(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_ackhavereset),
    .io_async_mem_0_hrmask_0(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hrmask_0),
    .io_async_ridx(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_ridx),
    .io_async_widx(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_widx),
    .io_async_safe_ridx_valid(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_sink_reset_n)
  );
  assign auto_dmiXing_in_a_ridx = dmiXing_auto_in_a_ridx;
  assign auto_dmiXing_in_a_safe_ridx_valid = dmiXing_auto_in_a_safe_ridx_valid;
  assign auto_dmiXing_in_a_safe_sink_reset_n = dmiXing_auto_in_a_safe_sink_reset_n;
  assign auto_dmiXing_in_d_mem_0_opcode = dmiXing_auto_in_d_mem_0_opcode;
  assign auto_dmiXing_in_d_mem_0_size = dmiXing_auto_in_d_mem_0_size;
  assign auto_dmiXing_in_d_mem_0_source = dmiXing_auto_in_d_mem_0_source;
  assign auto_dmiXing_in_d_mem_0_data = dmiXing_auto_in_d_mem_0_data;
  assign auto_dmiXing_in_d_widx = dmiXing_auto_in_d_widx;
  assign auto_dmiXing_in_d_safe_widx_valid = dmiXing_auto_in_d_safe_widx_valid;
  assign auto_dmiXing_in_d_safe_source_reset_n = dmiXing_auto_in_d_safe_source_reset_n;
  assign auto_dmInner_tl_in_a_ready = dmInner_auto_tl_in_a_ready;
  assign auto_dmInner_tl_in_d_valid = dmInner_auto_tl_in_d_valid;
  assign auto_dmInner_tl_in_d_bits_opcode = dmInner_auto_tl_in_d_bits_opcode;
  assign auto_dmInner_tl_in_d_bits_size = dmInner_auto_tl_in_d_bits_size;
  assign auto_dmInner_tl_in_d_bits_source = dmInner_auto_tl_in_d_bits_source;
  assign auto_dmInner_tl_in_d_bits_data = dmInner_auto_tl_in_d_bits_data;
  assign io_innerCtrl_ridx = dmactive_synced_dmInner_io_innerCtrl_sink_io_async_ridx;
  assign io_innerCtrl_safe_ridx_valid = dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_ridx_valid;
  assign io_innerCtrl_safe_sink_reset_n = dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_sink_reset_n;
  assign io_hgDebugInt_0 = dmInner_io_hgDebugInt_0;
  assign dmInner_clock = io_debug_clock;
  assign dmInner_reset = io_debug_reset;
  assign dmInner_auto_tl_in_a_valid = auto_dmInner_tl_in_a_valid;
  assign dmInner_auto_tl_in_a_bits_opcode = auto_dmInner_tl_in_a_bits_opcode;
  assign dmInner_auto_tl_in_a_bits_param = auto_dmInner_tl_in_a_bits_param;
  assign dmInner_auto_tl_in_a_bits_size = auto_dmInner_tl_in_a_bits_size;
  assign dmInner_auto_tl_in_a_bits_source = auto_dmInner_tl_in_a_bits_source;
  assign dmInner_auto_tl_in_a_bits_address = auto_dmInner_tl_in_a_bits_address;
  assign dmInner_auto_tl_in_a_bits_mask = auto_dmInner_tl_in_a_bits_mask;
  assign dmInner_auto_tl_in_a_bits_data = auto_dmInner_tl_in_a_bits_data;
  assign dmInner_auto_tl_in_a_bits_corrupt = auto_dmInner_tl_in_a_bits_corrupt;
  assign dmInner_auto_tl_in_d_ready = auto_dmInner_tl_in_d_ready;
  assign dmInner_auto_dmi_in_a_valid = dmiXing_auto_out_a_valid;
  assign dmInner_auto_dmi_in_a_bits_opcode = dmiXing_auto_out_a_bits_opcode;
  assign dmInner_auto_dmi_in_a_bits_param = dmiXing_auto_out_a_bits_param;
  assign dmInner_auto_dmi_in_a_bits_size = dmiXing_auto_out_a_bits_size;
  assign dmInner_auto_dmi_in_a_bits_source = dmiXing_auto_out_a_bits_source;
  assign dmInner_auto_dmi_in_a_bits_address = dmiXing_auto_out_a_bits_address;
  assign dmInner_auto_dmi_in_a_bits_mask = dmiXing_auto_out_a_bits_mask;
  assign dmInner_auto_dmi_in_a_bits_data = dmiXing_auto_out_a_bits_data;
  assign dmInner_auto_dmi_in_a_bits_corrupt = dmiXing_auto_out_a_bits_corrupt;
  assign dmInner_auto_dmi_in_d_ready = dmiXing_auto_out_d_ready;
  assign dmInner_io_dmactive = dmactive_synced_dmactive_synced_dmactiveSync_io_q;
  assign dmInner_io_innerCtrl_valid = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid;
  assign dmInner_io_innerCtrl_bits_resumereq = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq;
  assign dmInner_io_innerCtrl_bits_hartsel = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel;
  assign dmInner_io_innerCtrl_bits_ackhavereset = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset;
  assign dmInner_io_innerCtrl_bits_hrmask_0 = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0;
  assign dmInner_io_hartIsInReset_0 = io_hartIsInReset_0;
  assign dmiXing_clock = io_debug_clock;
  assign dmiXing_reset = io_debug_reset;
  assign dmiXing_auto_in_a_mem_0_opcode = auto_dmiXing_in_a_mem_0_opcode;
  assign dmiXing_auto_in_a_mem_0_address = auto_dmiXing_in_a_mem_0_address;
  assign dmiXing_auto_in_a_mem_0_data = auto_dmiXing_in_a_mem_0_data;
  assign dmiXing_auto_in_a_widx = auto_dmiXing_in_a_widx;
  assign dmiXing_auto_in_a_safe_widx_valid = auto_dmiXing_in_a_safe_widx_valid;
  assign dmiXing_auto_in_a_safe_source_reset_n = auto_dmiXing_in_a_safe_source_reset_n;
  assign dmiXing_auto_in_d_ridx = auto_dmiXing_in_d_ridx;
  assign dmiXing_auto_in_d_safe_ridx_valid = auto_dmiXing_in_d_safe_ridx_valid;
  assign dmiXing_auto_in_d_safe_sink_reset_n = auto_dmiXing_in_d_safe_sink_reset_n;
  assign dmiXing_auto_out_a_ready = dmInner_auto_dmi_in_a_ready;
  assign dmiXing_auto_out_d_valid = dmInner_auto_dmi_in_d_valid;
  assign dmiXing_auto_out_d_bits_opcode = dmInner_auto_dmi_in_d_bits_opcode;
  assign dmiXing_auto_out_d_bits_size = dmInner_auto_dmi_in_d_bits_size;
  assign dmiXing_auto_out_d_bits_source = dmInner_auto_dmi_in_d_bits_source;
  assign dmiXing_auto_out_d_bits_data = dmInner_auto_dmi_in_d_bits_data;
  assign dmactive_synced_dmactive_synced_dmactiveSync_clock = io_debug_clock;
  assign dmactive_synced_dmactive_synced_dmactiveSync_reset = io_debug_reset;
  assign dmactive_synced_dmactive_synced_dmactiveSync_io_d = io_dmactive;
  assign dmactive_synced_dmInner_io_innerCtrl_sink_clock = io_debug_clock;
  assign dmactive_synced_dmInner_io_innerCtrl_sink_reset = io_debug_reset;
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_resumereq = io_innerCtrl_mem_0_resumereq;
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_ackhavereset = io_innerCtrl_mem_0_ackhavereset;
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hrmask_0 = io_innerCtrl_mem_0_hrmask_0;
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_widx = io_innerCtrl_widx;
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_widx_valid = io_innerCtrl_safe_widx_valid;
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_source_reset_n = io_innerCtrl_safe_source_reset_n;
endmodule