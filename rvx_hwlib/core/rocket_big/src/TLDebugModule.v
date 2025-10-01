`default_nettype wire
module TLDebugModule(
  output        auto_dmInner_dmInner_tl_in_a_ready,
  input         auto_dmInner_dmInner_tl_in_a_valid,
  input  [2:0]  auto_dmInner_dmInner_tl_in_a_bits_opcode,
  input  [2:0]  auto_dmInner_dmInner_tl_in_a_bits_param,
  input  [1:0]  auto_dmInner_dmInner_tl_in_a_bits_size,
  input  [9:0]  auto_dmInner_dmInner_tl_in_a_bits_source,
  input  [11:0] auto_dmInner_dmInner_tl_in_a_bits_address,
  input  [3:0]  auto_dmInner_dmInner_tl_in_a_bits_mask,
  input  [31:0] auto_dmInner_dmInner_tl_in_a_bits_data,
  input         auto_dmInner_dmInner_tl_in_a_bits_corrupt,
  input         auto_dmInner_dmInner_tl_in_d_ready,
  output        auto_dmInner_dmInner_tl_in_d_valid,
  output [2:0]  auto_dmInner_dmInner_tl_in_d_bits_opcode,
  output [1:0]  auto_dmInner_dmInner_tl_in_d_bits_size,
  output [9:0]  auto_dmInner_dmInner_tl_in_d_bits_source,
  output [31:0] auto_dmInner_dmInner_tl_in_d_bits_data,
  output        auto_dmOuter_intsource_out_sync_0,
  input         io_debug_clock,
  input         io_debug_reset,
  output        io_ctrl_ndreset,
  output        io_ctrl_dmactive,
  input         io_ctrl_dmactiveAck,
  output        io_dmi_dmi_req_ready,
  input         io_dmi_dmi_req_valid,
  input  [6:0]  io_dmi_dmi_req_bits_addr,
  input  [31:0] io_dmi_dmi_req_bits_data,
  input  [1:0]  io_dmi_dmi_req_bits_op,
  input         io_dmi_dmi_resp_ready,
  output        io_dmi_dmi_resp_valid,
  output [31:0] io_dmi_dmi_resp_bits_data,
  output [1:0]  io_dmi_dmi_resp_bits_resp,
  input         io_dmi_dmiClock,
  input         io_dmi_dmiReset,
  input         io_hartIsInReset_0
);
  wire [2:0] dmOuter_auto_asource_out_a_mem_0_opcode;
  wire [8:0] dmOuter_auto_asource_out_a_mem_0_address;
  wire [31:0] dmOuter_auto_asource_out_a_mem_0_data;
  wire  dmOuter_auto_asource_out_a_ridx;
  wire  dmOuter_auto_asource_out_a_widx;
  wire  dmOuter_auto_asource_out_a_safe_ridx_valid;
  wire  dmOuter_auto_asource_out_a_safe_widx_valid;
  wire  dmOuter_auto_asource_out_a_safe_source_reset_n;
  wire  dmOuter_auto_asource_out_a_safe_sink_reset_n;
  wire [2:0] dmOuter_auto_asource_out_d_mem_0_opcode;
  wire [1:0] dmOuter_auto_asource_out_d_mem_0_size;
  wire  dmOuter_auto_asource_out_d_mem_0_source;
  wire [31:0] dmOuter_auto_asource_out_d_mem_0_data;
  wire  dmOuter_auto_asource_out_d_ridx;
  wire  dmOuter_auto_asource_out_d_widx;
  wire  dmOuter_auto_asource_out_d_safe_ridx_valid;
  wire  dmOuter_auto_asource_out_d_safe_widx_valid;
  wire  dmOuter_auto_asource_out_d_safe_source_reset_n;
  wire  dmOuter_auto_asource_out_d_safe_sink_reset_n;
  wire  dmOuter_auto_intsource_out_sync_0;
  wire  dmOuter_io_dmi_clock;
  wire  dmOuter_io_dmi_reset;
  wire  dmOuter_io_dmi_req_ready;
  wire  dmOuter_io_dmi_req_valid;
  wire [6:0] dmOuter_io_dmi_req_bits_addr;
  wire [31:0] dmOuter_io_dmi_req_bits_data;
  wire [1:0] dmOuter_io_dmi_req_bits_op;
  wire  dmOuter_io_dmi_resp_ready;
  wire  dmOuter_io_dmi_resp_valid;
  wire [31:0] dmOuter_io_dmi_resp_bits_data;
  wire [1:0] dmOuter_io_dmi_resp_bits_resp;
  wire  dmOuter_io_ctrl_ndreset;
  wire  dmOuter_io_ctrl_dmactive;
  wire  dmOuter_io_ctrl_dmactiveAck;
  wire  dmOuter_io_innerCtrl_mem_0_resumereq;
  wire  dmOuter_io_innerCtrl_mem_0_ackhavereset;
  wire  dmOuter_io_innerCtrl_mem_0_hrmask_0;
  wire  dmOuter_io_innerCtrl_ridx;
  wire  dmOuter_io_innerCtrl_widx;
  wire  dmOuter_io_innerCtrl_safe_ridx_valid;
  wire  dmOuter_io_innerCtrl_safe_widx_valid;
  wire  dmOuter_io_innerCtrl_safe_source_reset_n;
  wire  dmOuter_io_innerCtrl_safe_sink_reset_n;
  wire  dmOuter_io_hgDebugInt_0;
  wire [2:0] dmInner_auto_dmiXing_in_a_mem_0_opcode;
  wire [8:0] dmInner_auto_dmiXing_in_a_mem_0_address;
  wire [31:0] dmInner_auto_dmiXing_in_a_mem_0_data;
  wire  dmInner_auto_dmiXing_in_a_ridx;
  wire  dmInner_auto_dmiXing_in_a_widx;
  wire  dmInner_auto_dmiXing_in_a_safe_ridx_valid;
  wire  dmInner_auto_dmiXing_in_a_safe_widx_valid;
  wire  dmInner_auto_dmiXing_in_a_safe_source_reset_n;
  wire  dmInner_auto_dmiXing_in_a_safe_sink_reset_n;
  wire [2:0] dmInner_auto_dmiXing_in_d_mem_0_opcode;
  wire [1:0] dmInner_auto_dmiXing_in_d_mem_0_size;
  wire  dmInner_auto_dmiXing_in_d_mem_0_source;
  wire [31:0] dmInner_auto_dmiXing_in_d_mem_0_data;
  wire  dmInner_auto_dmiXing_in_d_ridx;
  wire  dmInner_auto_dmiXing_in_d_widx;
  wire  dmInner_auto_dmiXing_in_d_safe_ridx_valid;
  wire  dmInner_auto_dmiXing_in_d_safe_widx_valid;
  wire  dmInner_auto_dmiXing_in_d_safe_source_reset_n;
  wire  dmInner_auto_dmiXing_in_d_safe_sink_reset_n;
  wire  dmInner_auto_dmInner_tl_in_a_ready;
  wire  dmInner_auto_dmInner_tl_in_a_valid;
  wire [2:0] dmInner_auto_dmInner_tl_in_a_bits_opcode;
  wire [2:0] dmInner_auto_dmInner_tl_in_a_bits_param;
  wire [1:0] dmInner_auto_dmInner_tl_in_a_bits_size;
  wire [9:0] dmInner_auto_dmInner_tl_in_a_bits_source;
  wire [11:0] dmInner_auto_dmInner_tl_in_a_bits_address;
  wire [3:0] dmInner_auto_dmInner_tl_in_a_bits_mask;
  wire [31:0] dmInner_auto_dmInner_tl_in_a_bits_data;
  wire  dmInner_auto_dmInner_tl_in_a_bits_corrupt;
  wire  dmInner_auto_dmInner_tl_in_d_ready;
  wire  dmInner_auto_dmInner_tl_in_d_valid;
  wire [2:0] dmInner_auto_dmInner_tl_in_d_bits_opcode;
  wire [1:0] dmInner_auto_dmInner_tl_in_d_bits_size;
  wire [9:0] dmInner_auto_dmInner_tl_in_d_bits_source;
  wire [31:0] dmInner_auto_dmInner_tl_in_d_bits_data;
  wire  dmInner_io_debug_clock;
  wire  dmInner_io_debug_reset;
  wire  dmInner_io_dmactive;
  wire  dmInner_io_innerCtrl_mem_0_resumereq;
  wire  dmInner_io_innerCtrl_mem_0_ackhavereset;
  wire  dmInner_io_innerCtrl_mem_0_hrmask_0;
  wire  dmInner_io_innerCtrl_ridx;
  wire  dmInner_io_innerCtrl_widx;
  wire  dmInner_io_innerCtrl_safe_ridx_valid;
  wire  dmInner_io_innerCtrl_safe_widx_valid;
  wire  dmInner_io_innerCtrl_safe_source_reset_n;
  wire  dmInner_io_innerCtrl_safe_sink_reset_n;
  wire  dmInner_io_hgDebugInt_0;
  wire  dmInner_io_hartIsInReset_0;
  TLDebugModuleOuterAsync dmOuter (
    .auto_asource_out_a_mem_0_opcode(dmOuter_auto_asource_out_a_mem_0_opcode),
    .auto_asource_out_a_mem_0_address(dmOuter_auto_asource_out_a_mem_0_address),
    .auto_asource_out_a_mem_0_data(dmOuter_auto_asource_out_a_mem_0_data),
    .auto_asource_out_a_ridx(dmOuter_auto_asource_out_a_ridx),
    .auto_asource_out_a_widx(dmOuter_auto_asource_out_a_widx),
    .auto_asource_out_a_safe_ridx_valid(dmOuter_auto_asource_out_a_safe_ridx_valid),
    .auto_asource_out_a_safe_widx_valid(dmOuter_auto_asource_out_a_safe_widx_valid),
    .auto_asource_out_a_safe_source_reset_n(dmOuter_auto_asource_out_a_safe_source_reset_n),
    .auto_asource_out_a_safe_sink_reset_n(dmOuter_auto_asource_out_a_safe_sink_reset_n),
    .auto_asource_out_d_mem_0_opcode(dmOuter_auto_asource_out_d_mem_0_opcode),
    .auto_asource_out_d_mem_0_size(dmOuter_auto_asource_out_d_mem_0_size),
    .auto_asource_out_d_mem_0_source(dmOuter_auto_asource_out_d_mem_0_source),
    .auto_asource_out_d_mem_0_data(dmOuter_auto_asource_out_d_mem_0_data),
    .auto_asource_out_d_ridx(dmOuter_auto_asource_out_d_ridx),
    .auto_asource_out_d_widx(dmOuter_auto_asource_out_d_widx),
    .auto_asource_out_d_safe_ridx_valid(dmOuter_auto_asource_out_d_safe_ridx_valid),
    .auto_asource_out_d_safe_widx_valid(dmOuter_auto_asource_out_d_safe_widx_valid),
    .auto_asource_out_d_safe_source_reset_n(dmOuter_auto_asource_out_d_safe_source_reset_n),
    .auto_asource_out_d_safe_sink_reset_n(dmOuter_auto_asource_out_d_safe_sink_reset_n),
    .auto_intsource_out_sync_0(dmOuter_auto_intsource_out_sync_0),
    .io_dmi_clock(dmOuter_io_dmi_clock),
    .io_dmi_reset(dmOuter_io_dmi_reset),
    .io_dmi_req_ready(dmOuter_io_dmi_req_ready),
    .io_dmi_req_valid(dmOuter_io_dmi_req_valid),
    .io_dmi_req_bits_addr(dmOuter_io_dmi_req_bits_addr),
    .io_dmi_req_bits_data(dmOuter_io_dmi_req_bits_data),
    .io_dmi_req_bits_op(dmOuter_io_dmi_req_bits_op),
    .io_dmi_resp_ready(dmOuter_io_dmi_resp_ready),
    .io_dmi_resp_valid(dmOuter_io_dmi_resp_valid),
    .io_dmi_resp_bits_data(dmOuter_io_dmi_resp_bits_data),
    .io_dmi_resp_bits_resp(dmOuter_io_dmi_resp_bits_resp),
    .io_ctrl_ndreset(dmOuter_io_ctrl_ndreset),
    .io_ctrl_dmactive(dmOuter_io_ctrl_dmactive),
    .io_ctrl_dmactiveAck(dmOuter_io_ctrl_dmactiveAck),
    .io_innerCtrl_mem_0_resumereq(dmOuter_io_innerCtrl_mem_0_resumereq),
    .io_innerCtrl_mem_0_ackhavereset(dmOuter_io_innerCtrl_mem_0_ackhavereset),
    .io_innerCtrl_mem_0_hrmask_0(dmOuter_io_innerCtrl_mem_0_hrmask_0),
    .io_innerCtrl_ridx(dmOuter_io_innerCtrl_ridx),
    .io_innerCtrl_widx(dmOuter_io_innerCtrl_widx),
    .io_innerCtrl_safe_ridx_valid(dmOuter_io_innerCtrl_safe_ridx_valid),
    .io_innerCtrl_safe_widx_valid(dmOuter_io_innerCtrl_safe_widx_valid),
    .io_innerCtrl_safe_source_reset_n(dmOuter_io_innerCtrl_safe_source_reset_n),
    .io_innerCtrl_safe_sink_reset_n(dmOuter_io_innerCtrl_safe_sink_reset_n),
    .io_hgDebugInt_0(dmOuter_io_hgDebugInt_0)
  );
  TLDebugModuleInnerAsync dmInner (
    .auto_dmiXing_in_a_mem_0_opcode(dmInner_auto_dmiXing_in_a_mem_0_opcode),
    .auto_dmiXing_in_a_mem_0_address(dmInner_auto_dmiXing_in_a_mem_0_address),
    .auto_dmiXing_in_a_mem_0_data(dmInner_auto_dmiXing_in_a_mem_0_data),
    .auto_dmiXing_in_a_ridx(dmInner_auto_dmiXing_in_a_ridx),
    .auto_dmiXing_in_a_widx(dmInner_auto_dmiXing_in_a_widx),
    .auto_dmiXing_in_a_safe_ridx_valid(dmInner_auto_dmiXing_in_a_safe_ridx_valid),
    .auto_dmiXing_in_a_safe_widx_valid(dmInner_auto_dmiXing_in_a_safe_widx_valid),
    .auto_dmiXing_in_a_safe_source_reset_n(dmInner_auto_dmiXing_in_a_safe_source_reset_n),
    .auto_dmiXing_in_a_safe_sink_reset_n(dmInner_auto_dmiXing_in_a_safe_sink_reset_n),
    .auto_dmiXing_in_d_mem_0_opcode(dmInner_auto_dmiXing_in_d_mem_0_opcode),
    .auto_dmiXing_in_d_mem_0_size(dmInner_auto_dmiXing_in_d_mem_0_size),
    .auto_dmiXing_in_d_mem_0_source(dmInner_auto_dmiXing_in_d_mem_0_source),
    .auto_dmiXing_in_d_mem_0_data(dmInner_auto_dmiXing_in_d_mem_0_data),
    .auto_dmiXing_in_d_ridx(dmInner_auto_dmiXing_in_d_ridx),
    .auto_dmiXing_in_d_widx(dmInner_auto_dmiXing_in_d_widx),
    .auto_dmiXing_in_d_safe_ridx_valid(dmInner_auto_dmiXing_in_d_safe_ridx_valid),
    .auto_dmiXing_in_d_safe_widx_valid(dmInner_auto_dmiXing_in_d_safe_widx_valid),
    .auto_dmiXing_in_d_safe_source_reset_n(dmInner_auto_dmiXing_in_d_safe_source_reset_n),
    .auto_dmiXing_in_d_safe_sink_reset_n(dmInner_auto_dmiXing_in_d_safe_sink_reset_n),
    .auto_dmInner_tl_in_a_ready(dmInner_auto_dmInner_tl_in_a_ready),
    .auto_dmInner_tl_in_a_valid(dmInner_auto_dmInner_tl_in_a_valid),
    .auto_dmInner_tl_in_a_bits_opcode(dmInner_auto_dmInner_tl_in_a_bits_opcode),
    .auto_dmInner_tl_in_a_bits_param(dmInner_auto_dmInner_tl_in_a_bits_param),
    .auto_dmInner_tl_in_a_bits_size(dmInner_auto_dmInner_tl_in_a_bits_size),
    .auto_dmInner_tl_in_a_bits_source(dmInner_auto_dmInner_tl_in_a_bits_source),
    .auto_dmInner_tl_in_a_bits_address(dmInner_auto_dmInner_tl_in_a_bits_address),
    .auto_dmInner_tl_in_a_bits_mask(dmInner_auto_dmInner_tl_in_a_bits_mask),
    .auto_dmInner_tl_in_a_bits_data(dmInner_auto_dmInner_tl_in_a_bits_data),
    .auto_dmInner_tl_in_a_bits_corrupt(dmInner_auto_dmInner_tl_in_a_bits_corrupt),
    .auto_dmInner_tl_in_d_ready(dmInner_auto_dmInner_tl_in_d_ready),
    .auto_dmInner_tl_in_d_valid(dmInner_auto_dmInner_tl_in_d_valid),
    .auto_dmInner_tl_in_d_bits_opcode(dmInner_auto_dmInner_tl_in_d_bits_opcode),
    .auto_dmInner_tl_in_d_bits_size(dmInner_auto_dmInner_tl_in_d_bits_size),
    .auto_dmInner_tl_in_d_bits_source(dmInner_auto_dmInner_tl_in_d_bits_source),
    .auto_dmInner_tl_in_d_bits_data(dmInner_auto_dmInner_tl_in_d_bits_data),
    .io_debug_clock(dmInner_io_debug_clock),
    .io_debug_reset(dmInner_io_debug_reset),
    .io_dmactive(dmInner_io_dmactive),
    .io_innerCtrl_mem_0_resumereq(dmInner_io_innerCtrl_mem_0_resumereq),
    .io_innerCtrl_mem_0_ackhavereset(dmInner_io_innerCtrl_mem_0_ackhavereset),
    .io_innerCtrl_mem_0_hrmask_0(dmInner_io_innerCtrl_mem_0_hrmask_0),
    .io_innerCtrl_ridx(dmInner_io_innerCtrl_ridx),
    .io_innerCtrl_widx(dmInner_io_innerCtrl_widx),
    .io_innerCtrl_safe_ridx_valid(dmInner_io_innerCtrl_safe_ridx_valid),
    .io_innerCtrl_safe_widx_valid(dmInner_io_innerCtrl_safe_widx_valid),
    .io_innerCtrl_safe_source_reset_n(dmInner_io_innerCtrl_safe_source_reset_n),
    .io_innerCtrl_safe_sink_reset_n(dmInner_io_innerCtrl_safe_sink_reset_n),
    .io_hgDebugInt_0(dmInner_io_hgDebugInt_0),
    .io_hartIsInReset_0(dmInner_io_hartIsInReset_0)
  );
  assign auto_dmInner_dmInner_tl_in_a_ready = dmInner_auto_dmInner_tl_in_a_ready;
  assign auto_dmInner_dmInner_tl_in_d_valid = dmInner_auto_dmInner_tl_in_d_valid;
  assign auto_dmInner_dmInner_tl_in_d_bits_opcode = dmInner_auto_dmInner_tl_in_d_bits_opcode;
  assign auto_dmInner_dmInner_tl_in_d_bits_size = dmInner_auto_dmInner_tl_in_d_bits_size;
  assign auto_dmInner_dmInner_tl_in_d_bits_source = dmInner_auto_dmInner_tl_in_d_bits_source;
  assign auto_dmInner_dmInner_tl_in_d_bits_data = dmInner_auto_dmInner_tl_in_d_bits_data;
  assign auto_dmOuter_intsource_out_sync_0 = dmOuter_auto_intsource_out_sync_0;
  assign io_ctrl_ndreset = dmOuter_io_ctrl_ndreset;
  assign io_ctrl_dmactive = dmOuter_io_ctrl_dmactive;
  assign io_dmi_dmi_req_ready = dmOuter_io_dmi_req_ready;
  assign io_dmi_dmi_resp_valid = dmOuter_io_dmi_resp_valid;
  assign io_dmi_dmi_resp_bits_data = dmOuter_io_dmi_resp_bits_data;
  assign io_dmi_dmi_resp_bits_resp = dmOuter_io_dmi_resp_bits_resp;
  assign dmOuter_auto_asource_out_a_ridx = dmInner_auto_dmiXing_in_a_ridx;
  assign dmOuter_auto_asource_out_a_safe_ridx_valid = dmInner_auto_dmiXing_in_a_safe_ridx_valid;
  assign dmOuter_auto_asource_out_a_safe_sink_reset_n = dmInner_auto_dmiXing_in_a_safe_sink_reset_n;
  assign dmOuter_auto_asource_out_d_mem_0_opcode = dmInner_auto_dmiXing_in_d_mem_0_opcode;
  assign dmOuter_auto_asource_out_d_mem_0_size = dmInner_auto_dmiXing_in_d_mem_0_size;
  assign dmOuter_auto_asource_out_d_mem_0_source = dmInner_auto_dmiXing_in_d_mem_0_source;
  assign dmOuter_auto_asource_out_d_mem_0_data = dmInner_auto_dmiXing_in_d_mem_0_data;
  assign dmOuter_auto_asource_out_d_widx = dmInner_auto_dmiXing_in_d_widx;
  assign dmOuter_auto_asource_out_d_safe_widx_valid = dmInner_auto_dmiXing_in_d_safe_widx_valid;
  assign dmOuter_auto_asource_out_d_safe_source_reset_n = dmInner_auto_dmiXing_in_d_safe_source_reset_n;
  assign dmOuter_io_dmi_clock = io_dmi_dmiClock;
  assign dmOuter_io_dmi_reset = io_dmi_dmiReset;
  assign dmOuter_io_dmi_req_valid = io_dmi_dmi_req_valid;
  assign dmOuter_io_dmi_req_bits_addr = io_dmi_dmi_req_bits_addr;
  assign dmOuter_io_dmi_req_bits_data = io_dmi_dmi_req_bits_data;
  assign dmOuter_io_dmi_req_bits_op = io_dmi_dmi_req_bits_op;
  assign dmOuter_io_dmi_resp_ready = io_dmi_dmi_resp_ready;
  assign dmOuter_io_ctrl_dmactiveAck = io_ctrl_dmactiveAck;
  assign dmOuter_io_innerCtrl_ridx = dmInner_io_innerCtrl_ridx;
  assign dmOuter_io_innerCtrl_safe_ridx_valid = dmInner_io_innerCtrl_safe_ridx_valid;
  assign dmOuter_io_innerCtrl_safe_sink_reset_n = dmInner_io_innerCtrl_safe_sink_reset_n;
  assign dmOuter_io_hgDebugInt_0 = dmInner_io_hgDebugInt_0;
  assign dmInner_auto_dmiXing_in_a_mem_0_opcode = dmOuter_auto_asource_out_a_mem_0_opcode;
  assign dmInner_auto_dmiXing_in_a_mem_0_address = dmOuter_auto_asource_out_a_mem_0_address;
  assign dmInner_auto_dmiXing_in_a_mem_0_data = dmOuter_auto_asource_out_a_mem_0_data;
  assign dmInner_auto_dmiXing_in_a_widx = dmOuter_auto_asource_out_a_widx;
  assign dmInner_auto_dmiXing_in_a_safe_widx_valid = dmOuter_auto_asource_out_a_safe_widx_valid;
  assign dmInner_auto_dmiXing_in_a_safe_source_reset_n = dmOuter_auto_asource_out_a_safe_source_reset_n;
  assign dmInner_auto_dmiXing_in_d_ridx = dmOuter_auto_asource_out_d_ridx;
  assign dmInner_auto_dmiXing_in_d_safe_ridx_valid = dmOuter_auto_asource_out_d_safe_ridx_valid;
  assign dmInner_auto_dmiXing_in_d_safe_sink_reset_n = dmOuter_auto_asource_out_d_safe_sink_reset_n;
  assign dmInner_auto_dmInner_tl_in_a_valid = auto_dmInner_dmInner_tl_in_a_valid;
  assign dmInner_auto_dmInner_tl_in_a_bits_opcode = auto_dmInner_dmInner_tl_in_a_bits_opcode;
  assign dmInner_auto_dmInner_tl_in_a_bits_param = auto_dmInner_dmInner_tl_in_a_bits_param;
  assign dmInner_auto_dmInner_tl_in_a_bits_size = auto_dmInner_dmInner_tl_in_a_bits_size;
  assign dmInner_auto_dmInner_tl_in_a_bits_source = auto_dmInner_dmInner_tl_in_a_bits_source;
  assign dmInner_auto_dmInner_tl_in_a_bits_address = auto_dmInner_dmInner_tl_in_a_bits_address;
  assign dmInner_auto_dmInner_tl_in_a_bits_mask = auto_dmInner_dmInner_tl_in_a_bits_mask;
  assign dmInner_auto_dmInner_tl_in_a_bits_data = auto_dmInner_dmInner_tl_in_a_bits_data;
  assign dmInner_auto_dmInner_tl_in_a_bits_corrupt = auto_dmInner_dmInner_tl_in_a_bits_corrupt;
  assign dmInner_auto_dmInner_tl_in_d_ready = auto_dmInner_dmInner_tl_in_d_ready;
  assign dmInner_io_debug_clock = io_debug_clock;
  assign dmInner_io_debug_reset = io_debug_reset;
  assign dmInner_io_dmactive = dmOuter_io_ctrl_dmactive;
  assign dmInner_io_innerCtrl_mem_0_resumereq = dmOuter_io_innerCtrl_mem_0_resumereq;
  assign dmInner_io_innerCtrl_mem_0_ackhavereset = dmOuter_io_innerCtrl_mem_0_ackhavereset;
  assign dmInner_io_innerCtrl_mem_0_hrmask_0 = dmOuter_io_innerCtrl_mem_0_hrmask_0;
  assign dmInner_io_innerCtrl_widx = dmOuter_io_innerCtrl_widx;
  assign dmInner_io_innerCtrl_safe_widx_valid = dmOuter_io_innerCtrl_safe_widx_valid;
  assign dmInner_io_innerCtrl_safe_source_reset_n = dmOuter_io_innerCtrl_safe_source_reset_n;
  assign dmInner_io_hartIsInReset_0 = io_hartIsInReset_0;
endmodule