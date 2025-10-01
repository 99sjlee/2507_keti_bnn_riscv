`default_nettype wire
module TLDebugModuleOuterAsync(
  output [2:0]  auto_asource_out_a_mem_0_opcode,
  output [8:0]  auto_asource_out_a_mem_0_address,
  output [31:0] auto_asource_out_a_mem_0_data,
  input         auto_asource_out_a_ridx,
  output        auto_asource_out_a_widx,
  input         auto_asource_out_a_safe_ridx_valid,
  output        auto_asource_out_a_safe_widx_valid,
  output        auto_asource_out_a_safe_source_reset_n,
  input         auto_asource_out_a_safe_sink_reset_n,
  input  [2:0]  auto_asource_out_d_mem_0_opcode,
  input  [1:0]  auto_asource_out_d_mem_0_size,
  input         auto_asource_out_d_mem_0_source,
  input  [31:0] auto_asource_out_d_mem_0_data,
  output        auto_asource_out_d_ridx,
  input         auto_asource_out_d_widx,
  output        auto_asource_out_d_safe_ridx_valid,
  input         auto_asource_out_d_safe_widx_valid,
  input         auto_asource_out_d_safe_source_reset_n,
  output        auto_asource_out_d_safe_sink_reset_n,
  output        auto_intsource_out_sync_0,
  input         io_dmi_clock,
  input         io_dmi_reset,
  output        io_dmi_req_ready,
  input         io_dmi_req_valid,
  input  [6:0]  io_dmi_req_bits_addr,
  input  [31:0] io_dmi_req_bits_data,
  input  [1:0]  io_dmi_req_bits_op,
  input         io_dmi_resp_ready,
  output        io_dmi_resp_valid,
  output [31:0] io_dmi_resp_bits_data,
  output [1:0]  io_dmi_resp_bits_resp,
  output        io_ctrl_ndreset,
  output        io_ctrl_dmactive,
  input         io_ctrl_dmactiveAck,
  output        io_innerCtrl_mem_0_resumereq,
  output        io_innerCtrl_mem_0_ackhavereset,
  output        io_innerCtrl_mem_0_hrmask_0,
  input         io_innerCtrl_ridx,
  output        io_innerCtrl_widx,
  input         io_innerCtrl_safe_ridx_valid,
  output        io_innerCtrl_safe_widx_valid,
  output        io_innerCtrl_safe_source_reset_n,
  input         io_innerCtrl_safe_sink_reset_n,
  input         io_hgDebugInt_0
);
  wire  dmiXbar_clock;
  wire  dmiXbar_reset;
  wire  dmiXbar_auto_in_a_ready;
  wire  dmiXbar_auto_in_a_valid;
  wire [2:0] dmiXbar_auto_in_a_bits_opcode;
  wire [8:0] dmiXbar_auto_in_a_bits_address;
  wire [31:0] dmiXbar_auto_in_a_bits_data;
  wire  dmiXbar_auto_in_d_ready;
  wire  dmiXbar_auto_in_d_valid;
  wire  dmiXbar_auto_in_d_bits_denied;
  wire [31:0] dmiXbar_auto_in_d_bits_data;
  wire  dmiXbar_auto_in_d_bits_corrupt;
  wire  dmiXbar_auto_out_1_a_ready;
  wire  dmiXbar_auto_out_1_a_valid;
  wire [2:0] dmiXbar_auto_out_1_a_bits_opcode;
  wire [6:0] dmiXbar_auto_out_1_a_bits_address;
  wire [31:0] dmiXbar_auto_out_1_a_bits_data;
  wire  dmiXbar_auto_out_1_d_ready;
  wire  dmiXbar_auto_out_1_d_valid;
  wire [2:0] dmiXbar_auto_out_1_d_bits_opcode;
  wire [31:0] dmiXbar_auto_out_1_d_bits_data;
  wire  dmiXbar_auto_out_0_a_ready;
  wire  dmiXbar_auto_out_0_a_valid;
  wire [2:0] dmiXbar_auto_out_0_a_bits_opcode;
  wire [8:0] dmiXbar_auto_out_0_a_bits_address;
  wire [31:0] dmiXbar_auto_out_0_a_bits_data;
  wire  dmiXbar_auto_out_0_d_ready;
  wire  dmiXbar_auto_out_0_d_valid;
  wire [2:0] dmiXbar_auto_out_0_d_bits_opcode;
  wire [1:0] dmiXbar_auto_out_0_d_bits_param;
  wire [1:0] dmiXbar_auto_out_0_d_bits_size;
  wire  dmiXbar_auto_out_0_d_bits_sink;
  wire  dmiXbar_auto_out_0_d_bits_denied;
  wire [31:0] dmiXbar_auto_out_0_d_bits_data;
  wire  dmiXbar_auto_out_0_d_bits_corrupt;
  wire  dmi2tl_auto_out_a_ready;
  wire  dmi2tl_auto_out_a_valid;
  wire [2:0] dmi2tl_auto_out_a_bits_opcode;
  wire [8:0] dmi2tl_auto_out_a_bits_address;
  wire [31:0] dmi2tl_auto_out_a_bits_data;
  wire  dmi2tl_auto_out_d_ready;
  wire  dmi2tl_auto_out_d_valid;
  wire  dmi2tl_auto_out_d_bits_denied;
  wire [31:0] dmi2tl_auto_out_d_bits_data;
  wire  dmi2tl_auto_out_d_bits_corrupt;
  wire  dmi2tl_io_dmi_req_ready;
  wire  dmi2tl_io_dmi_req_valid;
  wire [6:0] dmi2tl_io_dmi_req_bits_addr;
  wire [31:0] dmi2tl_io_dmi_req_bits_data;
  wire [1:0] dmi2tl_io_dmi_req_bits_op;
  wire  dmi2tl_io_dmi_resp_ready;
  wire  dmi2tl_io_dmi_resp_valid;
  wire [31:0] dmi2tl_io_dmi_resp_bits_data;
  wire [1:0] dmi2tl_io_dmi_resp_bits_resp;
  wire  dmOuter_clock;
  wire  dmOuter_reset;
  wire  dmOuter_auto_dmi_in_a_ready;
  wire  dmOuter_auto_dmi_in_a_valid;
  wire [2:0] dmOuter_auto_dmi_in_a_bits_opcode;
  wire [6:0] dmOuter_auto_dmi_in_a_bits_address;
  wire [31:0] dmOuter_auto_dmi_in_a_bits_data;
  wire  dmOuter_auto_dmi_in_d_ready;
  wire  dmOuter_auto_dmi_in_d_valid;
  wire [2:0] dmOuter_auto_dmi_in_d_bits_opcode;
  wire [31:0] dmOuter_auto_dmi_in_d_bits_data;
  wire  dmOuter_auto_int_out_0;
  wire  dmOuter_io_ctrl_ndreset;
  wire  dmOuter_io_ctrl_dmactive;
  wire  dmOuter_io_ctrl_dmactiveAck;
  wire  dmOuter_io_innerCtrl_ready;
  wire  dmOuter_io_innerCtrl_valid;
  wire  dmOuter_io_innerCtrl_bits_resumereq;
  wire [9:0] dmOuter_io_innerCtrl_bits_hartsel;
  wire  dmOuter_io_innerCtrl_bits_ackhavereset;
  wire  dmOuter_io_innerCtrl_bits_hrmask_0;
  wire  dmOuter_io_hgDebugInt_0;
  wire  intsource_auto_in_0;
  wire  intsource_auto_out_sync_0;
  wire  dmiBypass_clock;
  wire  dmiBypass_reset;
  wire  dmiBypass_auto_node_out_out_a_ready;
  wire  dmiBypass_auto_node_out_out_a_valid;
  wire [2:0] dmiBypass_auto_node_out_out_a_bits_opcode;
  wire [8:0] dmiBypass_auto_node_out_out_a_bits_address;
  wire [31:0] dmiBypass_auto_node_out_out_a_bits_data;
  wire  dmiBypass_auto_node_out_out_d_ready;
  wire  dmiBypass_auto_node_out_out_d_valid;
  wire [2:0] dmiBypass_auto_node_out_out_d_bits_opcode;
  wire [1:0] dmiBypass_auto_node_out_out_d_bits_param;
  wire [1:0] dmiBypass_auto_node_out_out_d_bits_size;
  wire  dmiBypass_auto_node_out_out_d_bits_source;
  wire  dmiBypass_auto_node_out_out_d_bits_sink;
  wire  dmiBypass_auto_node_out_out_d_bits_denied;
  wire [31:0] dmiBypass_auto_node_out_out_d_bits_data;
  wire  dmiBypass_auto_node_out_out_d_bits_corrupt;
  wire  dmiBypass_auto_node_in_in_a_ready;
  wire  dmiBypass_auto_node_in_in_a_valid;
  wire [2:0] dmiBypass_auto_node_in_in_a_bits_opcode;
  wire [8:0] dmiBypass_auto_node_in_in_a_bits_address;
  wire [31:0] dmiBypass_auto_node_in_in_a_bits_data;
  wire  dmiBypass_auto_node_in_in_d_ready;
  wire  dmiBypass_auto_node_in_in_d_valid;
  wire [2:0] dmiBypass_auto_node_in_in_d_bits_opcode;
  wire [1:0] dmiBypass_auto_node_in_in_d_bits_param;
  wire [1:0] dmiBypass_auto_node_in_in_d_bits_size;
  wire  dmiBypass_auto_node_in_in_d_bits_sink;
  wire  dmiBypass_auto_node_in_in_d_bits_denied;
  wire [31:0] dmiBypass_auto_node_in_in_d_bits_data;
  wire  dmiBypass_auto_node_in_in_d_bits_corrupt;
  wire  dmiBypass_io_bypass;
  wire  asource_clock;
  wire  asource_reset;
  wire  asource_auto_in_a_ready;
  wire  asource_auto_in_a_valid;
  wire [2:0] asource_auto_in_a_bits_opcode;
  wire [8:0] asource_auto_in_a_bits_address;
  wire [31:0] asource_auto_in_a_bits_data;
  wire  asource_auto_in_d_ready;
  wire  asource_auto_in_d_valid;
  wire [2:0] asource_auto_in_d_bits_opcode;
  wire [1:0] asource_auto_in_d_bits_param;
  wire [1:0] asource_auto_in_d_bits_size;
  wire  asource_auto_in_d_bits_source;
  wire  asource_auto_in_d_bits_sink;
  wire  asource_auto_in_d_bits_denied;
  wire [31:0] asource_auto_in_d_bits_data;
  wire  asource_auto_in_d_bits_corrupt;
  wire [2:0] asource_auto_out_a_mem_0_opcode;
  wire [8:0] asource_auto_out_a_mem_0_address;
  wire [31:0] asource_auto_out_a_mem_0_data;
  wire  asource_auto_out_a_ridx;
  wire  asource_auto_out_a_widx;
  wire  asource_auto_out_a_safe_ridx_valid;
  wire  asource_auto_out_a_safe_widx_valid;
  wire  asource_auto_out_a_safe_source_reset_n;
  wire  asource_auto_out_a_safe_sink_reset_n;
  wire [2:0] asource_auto_out_d_mem_0_opcode;
  wire [1:0] asource_auto_out_d_mem_0_size;
  wire  asource_auto_out_d_mem_0_source;
  wire [31:0] asource_auto_out_d_mem_0_data;
  wire  asource_auto_out_d_ridx;
  wire  asource_auto_out_d_widx;
  wire  asource_auto_out_d_safe_ridx_valid;
  wire  asource_auto_out_d_safe_widx_valid;
  wire  asource_auto_out_d_safe_source_reset_n;
  wire  asource_auto_out_d_safe_sink_reset_n;
  wire  dmactiveAck_dmactiveAckSync_clock;
  wire  dmactiveAck_dmactiveAckSync_reset;
  wire  dmactiveAck_dmactiveAckSync_io_d;
  wire  dmactiveAck_dmactiveAckSync_io_q;
  wire  io_innerCtrl_source_clock;
  wire  io_innerCtrl_source_reset;
  wire  io_innerCtrl_source_io_enq_ready;
  wire  io_innerCtrl_source_io_enq_valid;
  wire  io_innerCtrl_source_io_enq_bits_resumereq;
  wire  io_innerCtrl_source_io_enq_bits_ackhavereset;
  wire  io_innerCtrl_source_io_enq_bits_hrmask_0;
  wire  io_innerCtrl_source_io_async_mem_0_resumereq;
  wire  io_innerCtrl_source_io_async_mem_0_ackhavereset;
  wire  io_innerCtrl_source_io_async_mem_0_hrmask_0;
  wire  io_innerCtrl_source_io_async_ridx;
  wire  io_innerCtrl_source_io_async_widx;
  wire  io_innerCtrl_source_io_async_safe_ridx_valid;
  wire  io_innerCtrl_source_io_async_safe_widx_valid;
  wire  io_innerCtrl_source_io_async_safe_source_reset_n;
  wire  io_innerCtrl_source_io_async_safe_sink_reset_n;
  wire  dmactiveAck = dmactiveAck_dmactiveAckSync_io_q;
  TLXbar_9 dmiXbar (
    .clock(dmiXbar_clock),
    .reset(dmiXbar_reset),
    .auto_in_a_ready(dmiXbar_auto_in_a_ready),
    .auto_in_a_valid(dmiXbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(dmiXbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_address(dmiXbar_auto_in_a_bits_address),
    .auto_in_a_bits_data(dmiXbar_auto_in_a_bits_data),
    .auto_in_d_ready(dmiXbar_auto_in_d_ready),
    .auto_in_d_valid(dmiXbar_auto_in_d_valid),
    .auto_in_d_bits_denied(dmiXbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(dmiXbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(dmiXbar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready(dmiXbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(dmiXbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(dmiXbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_address(dmiXbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_data(dmiXbar_auto_out_1_a_bits_data),
    .auto_out_1_d_ready(dmiXbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(dmiXbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(dmiXbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_data(dmiXbar_auto_out_1_d_bits_data),
    .auto_out_0_a_ready(dmiXbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(dmiXbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(dmiXbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_address(dmiXbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_data(dmiXbar_auto_out_0_a_bits_data),
    .auto_out_0_d_ready(dmiXbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(dmiXbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(dmiXbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(dmiXbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(dmiXbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_sink(dmiXbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(dmiXbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(dmiXbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(dmiXbar_auto_out_0_d_bits_corrupt)
  );
  DMIToTL dmi2tl (
    .auto_out_a_ready(dmi2tl_auto_out_a_ready),
    .auto_out_a_valid(dmi2tl_auto_out_a_valid),
    .auto_out_a_bits_opcode(dmi2tl_auto_out_a_bits_opcode),
    .auto_out_a_bits_address(dmi2tl_auto_out_a_bits_address),
    .auto_out_a_bits_data(dmi2tl_auto_out_a_bits_data),
    .auto_out_d_ready(dmi2tl_auto_out_d_ready),
    .auto_out_d_valid(dmi2tl_auto_out_d_valid),
    .auto_out_d_bits_denied(dmi2tl_auto_out_d_bits_denied),
    .auto_out_d_bits_data(dmi2tl_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(dmi2tl_auto_out_d_bits_corrupt),
    .io_dmi_req_ready(dmi2tl_io_dmi_req_ready),
    .io_dmi_req_valid(dmi2tl_io_dmi_req_valid),
    .io_dmi_req_bits_addr(dmi2tl_io_dmi_req_bits_addr),
    .io_dmi_req_bits_data(dmi2tl_io_dmi_req_bits_data),
    .io_dmi_req_bits_op(dmi2tl_io_dmi_req_bits_op),
    .io_dmi_resp_ready(dmi2tl_io_dmi_resp_ready),
    .io_dmi_resp_valid(dmi2tl_io_dmi_resp_valid),
    .io_dmi_resp_bits_data(dmi2tl_io_dmi_resp_bits_data),
    .io_dmi_resp_bits_resp(dmi2tl_io_dmi_resp_bits_resp)
  );
  TLDebugModuleOuter dmOuter (
    .clock(dmOuter_clock),
    .reset(dmOuter_reset),
    .auto_dmi_in_a_ready(dmOuter_auto_dmi_in_a_ready),
    .auto_dmi_in_a_valid(dmOuter_auto_dmi_in_a_valid),
    .auto_dmi_in_a_bits_opcode(dmOuter_auto_dmi_in_a_bits_opcode),
    .auto_dmi_in_a_bits_address(dmOuter_auto_dmi_in_a_bits_address),
    .auto_dmi_in_a_bits_data(dmOuter_auto_dmi_in_a_bits_data),
    .auto_dmi_in_d_ready(dmOuter_auto_dmi_in_d_ready),
    .auto_dmi_in_d_valid(dmOuter_auto_dmi_in_d_valid),
    .auto_dmi_in_d_bits_opcode(dmOuter_auto_dmi_in_d_bits_opcode),
    .auto_dmi_in_d_bits_data(dmOuter_auto_dmi_in_d_bits_data),
    .auto_int_out_0(dmOuter_auto_int_out_0),
    .io_ctrl_ndreset(dmOuter_io_ctrl_ndreset),
    .io_ctrl_dmactive(dmOuter_io_ctrl_dmactive),
    .io_ctrl_dmactiveAck(dmOuter_io_ctrl_dmactiveAck),
    .io_innerCtrl_ready(dmOuter_io_innerCtrl_ready),
    .io_innerCtrl_valid(dmOuter_io_innerCtrl_valid),
    .io_innerCtrl_bits_resumereq(dmOuter_io_innerCtrl_bits_resumereq),
    .io_innerCtrl_bits_hartsel(dmOuter_io_innerCtrl_bits_hartsel),
    .io_innerCtrl_bits_ackhavereset(dmOuter_io_innerCtrl_bits_ackhavereset),
    .io_innerCtrl_bits_hrmask_0(dmOuter_io_innerCtrl_bits_hrmask_0),
    .io_hgDebugInt_0(dmOuter_io_hgDebugInt_0)
  );
  IntSyncCrossingSource_4 intsource (
    .auto_in_0(intsource_auto_in_0),
    .auto_out_sync_0(intsource_auto_out_sync_0)
  );
  TLBusBypass dmiBypass (
    .clock(dmiBypass_clock),
    .reset(dmiBypass_reset),
    .auto_node_out_out_a_ready(dmiBypass_auto_node_out_out_a_ready),
    .auto_node_out_out_a_valid(dmiBypass_auto_node_out_out_a_valid),
    .auto_node_out_out_a_bits_opcode(dmiBypass_auto_node_out_out_a_bits_opcode),
    .auto_node_out_out_a_bits_address(dmiBypass_auto_node_out_out_a_bits_address),
    .auto_node_out_out_a_bits_data(dmiBypass_auto_node_out_out_a_bits_data),
    .auto_node_out_out_d_ready(dmiBypass_auto_node_out_out_d_ready),
    .auto_node_out_out_d_valid(dmiBypass_auto_node_out_out_d_valid),
    .auto_node_out_out_d_bits_opcode(dmiBypass_auto_node_out_out_d_bits_opcode),
    .auto_node_out_out_d_bits_param(dmiBypass_auto_node_out_out_d_bits_param),
    .auto_node_out_out_d_bits_size(dmiBypass_auto_node_out_out_d_bits_size),
    .auto_node_out_out_d_bits_source(dmiBypass_auto_node_out_out_d_bits_source),
    .auto_node_out_out_d_bits_sink(dmiBypass_auto_node_out_out_d_bits_sink),
    .auto_node_out_out_d_bits_denied(dmiBypass_auto_node_out_out_d_bits_denied),
    .auto_node_out_out_d_bits_data(dmiBypass_auto_node_out_out_d_bits_data),
    .auto_node_out_out_d_bits_corrupt(dmiBypass_auto_node_out_out_d_bits_corrupt),
    .auto_node_in_in_a_ready(dmiBypass_auto_node_in_in_a_ready),
    .auto_node_in_in_a_valid(dmiBypass_auto_node_in_in_a_valid),
    .auto_node_in_in_a_bits_opcode(dmiBypass_auto_node_in_in_a_bits_opcode),
    .auto_node_in_in_a_bits_address(dmiBypass_auto_node_in_in_a_bits_address),
    .auto_node_in_in_a_bits_data(dmiBypass_auto_node_in_in_a_bits_data),
    .auto_node_in_in_d_ready(dmiBypass_auto_node_in_in_d_ready),
    .auto_node_in_in_d_valid(dmiBypass_auto_node_in_in_d_valid),
    .auto_node_in_in_d_bits_opcode(dmiBypass_auto_node_in_in_d_bits_opcode),
    .auto_node_in_in_d_bits_param(dmiBypass_auto_node_in_in_d_bits_param),
    .auto_node_in_in_d_bits_size(dmiBypass_auto_node_in_in_d_bits_size),
    .auto_node_in_in_d_bits_sink(dmiBypass_auto_node_in_in_d_bits_sink),
    .auto_node_in_in_d_bits_denied(dmiBypass_auto_node_in_in_d_bits_denied),
    .auto_node_in_in_d_bits_data(dmiBypass_auto_node_in_in_d_bits_data),
    .auto_node_in_in_d_bits_corrupt(dmiBypass_auto_node_in_in_d_bits_corrupt),
    .io_bypass(dmiBypass_io_bypass)
  );
  TLAsyncCrossingSource asource (
    .clock(asource_clock),
    .reset(asource_reset),
    .auto_in_a_ready(asource_auto_in_a_ready),
    .auto_in_a_valid(asource_auto_in_a_valid),
    .auto_in_a_bits_opcode(asource_auto_in_a_bits_opcode),
    .auto_in_a_bits_address(asource_auto_in_a_bits_address),
    .auto_in_a_bits_data(asource_auto_in_a_bits_data),
    .auto_in_d_ready(asource_auto_in_d_ready),
    .auto_in_d_valid(asource_auto_in_d_valid),
    .auto_in_d_bits_opcode(asource_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(asource_auto_in_d_bits_param),
    .auto_in_d_bits_size(asource_auto_in_d_bits_size),
    .auto_in_d_bits_source(asource_auto_in_d_bits_source),
    .auto_in_d_bits_sink(asource_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(asource_auto_in_d_bits_denied),
    .auto_in_d_bits_data(asource_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(asource_auto_in_d_bits_corrupt),
    .auto_out_a_mem_0_opcode(asource_auto_out_a_mem_0_opcode),
    .auto_out_a_mem_0_address(asource_auto_out_a_mem_0_address),
    .auto_out_a_mem_0_data(asource_auto_out_a_mem_0_data),
    .auto_out_a_ridx(asource_auto_out_a_ridx),
    .auto_out_a_widx(asource_auto_out_a_widx),
    .auto_out_a_safe_ridx_valid(asource_auto_out_a_safe_ridx_valid),
    .auto_out_a_safe_widx_valid(asource_auto_out_a_safe_widx_valid),
    .auto_out_a_safe_source_reset_n(asource_auto_out_a_safe_source_reset_n),
    .auto_out_a_safe_sink_reset_n(asource_auto_out_a_safe_sink_reset_n),
    .auto_out_d_mem_0_opcode(asource_auto_out_d_mem_0_opcode),
    .auto_out_d_mem_0_size(asource_auto_out_d_mem_0_size),
    .auto_out_d_mem_0_source(asource_auto_out_d_mem_0_source),
    .auto_out_d_mem_0_data(asource_auto_out_d_mem_0_data),
    .auto_out_d_ridx(asource_auto_out_d_ridx),
    .auto_out_d_widx(asource_auto_out_d_widx),
    .auto_out_d_safe_ridx_valid(asource_auto_out_d_safe_ridx_valid),
    .auto_out_d_safe_widx_valid(asource_auto_out_d_safe_widx_valid),
    .auto_out_d_safe_source_reset_n(asource_auto_out_d_safe_source_reset_n),
    .auto_out_d_safe_sink_reset_n(asource_auto_out_d_safe_sink_reset_n)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 dmactiveAck_dmactiveAckSync (
    .clock(dmactiveAck_dmactiveAckSync_clock),
    .reset(dmactiveAck_dmactiveAckSync_reset),
    .io_d(dmactiveAck_dmactiveAckSync_io_d),
    .io_q(dmactiveAck_dmactiveAckSync_io_q)
  );
  AsyncQueueSource_1 io_innerCtrl_source (
    .clock(io_innerCtrl_source_clock),
    .reset(io_innerCtrl_source_reset),
    .io_enq_ready(io_innerCtrl_source_io_enq_ready),
    .io_enq_valid(io_innerCtrl_source_io_enq_valid),
    .io_enq_bits_resumereq(io_innerCtrl_source_io_enq_bits_resumereq),
    .io_enq_bits_ackhavereset(io_innerCtrl_source_io_enq_bits_ackhavereset),
    .io_enq_bits_hrmask_0(io_innerCtrl_source_io_enq_bits_hrmask_0),
    .io_async_mem_0_resumereq(io_innerCtrl_source_io_async_mem_0_resumereq),
    .io_async_mem_0_ackhavereset(io_innerCtrl_source_io_async_mem_0_ackhavereset),
    .io_async_mem_0_hrmask_0(io_innerCtrl_source_io_async_mem_0_hrmask_0),
    .io_async_ridx(io_innerCtrl_source_io_async_ridx),
    .io_async_widx(io_innerCtrl_source_io_async_widx),
    .io_async_safe_ridx_valid(io_innerCtrl_source_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(io_innerCtrl_source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(io_innerCtrl_source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(io_innerCtrl_source_io_async_safe_sink_reset_n)
  );
  assign auto_asource_out_a_mem_0_opcode = asource_auto_out_a_mem_0_opcode;
  assign auto_asource_out_a_mem_0_address = asource_auto_out_a_mem_0_address;
  assign auto_asource_out_a_mem_0_data = asource_auto_out_a_mem_0_data;
  assign auto_asource_out_a_widx = asource_auto_out_a_widx;
  assign auto_asource_out_a_safe_widx_valid = asource_auto_out_a_safe_widx_valid;
  assign auto_asource_out_a_safe_source_reset_n = asource_auto_out_a_safe_source_reset_n;
  assign auto_asource_out_d_ridx = asource_auto_out_d_ridx;
  assign auto_asource_out_d_safe_ridx_valid = asource_auto_out_d_safe_ridx_valid;
  assign auto_asource_out_d_safe_sink_reset_n = asource_auto_out_d_safe_sink_reset_n;
  assign auto_intsource_out_sync_0 = intsource_auto_out_sync_0;
  assign io_dmi_req_ready = dmi2tl_io_dmi_req_ready;
  assign io_dmi_resp_valid = dmi2tl_io_dmi_resp_valid;
  assign io_dmi_resp_bits_data = dmi2tl_io_dmi_resp_bits_data;
  assign io_dmi_resp_bits_resp = dmi2tl_io_dmi_resp_bits_resp;
  assign io_ctrl_ndreset = dmOuter_io_ctrl_ndreset;
  assign io_ctrl_dmactive = dmOuter_io_ctrl_dmactive;
  assign io_innerCtrl_mem_0_resumereq = io_innerCtrl_source_io_async_mem_0_resumereq;
  assign io_innerCtrl_mem_0_ackhavereset = io_innerCtrl_source_io_async_mem_0_ackhavereset;
  assign io_innerCtrl_mem_0_hrmask_0 = io_innerCtrl_source_io_async_mem_0_hrmask_0;
  assign io_innerCtrl_widx = io_innerCtrl_source_io_async_widx;
  assign io_innerCtrl_safe_widx_valid = io_innerCtrl_source_io_async_safe_widx_valid;
  assign io_innerCtrl_safe_source_reset_n = io_innerCtrl_source_io_async_safe_source_reset_n;
  assign dmiXbar_clock = io_dmi_clock;
  assign dmiXbar_reset = io_dmi_reset;
  assign dmiXbar_auto_in_a_valid = dmi2tl_auto_out_a_valid;
  assign dmiXbar_auto_in_a_bits_opcode = dmi2tl_auto_out_a_bits_opcode;
  assign dmiXbar_auto_in_a_bits_address = dmi2tl_auto_out_a_bits_address;
  assign dmiXbar_auto_in_a_bits_data = dmi2tl_auto_out_a_bits_data;
  assign dmiXbar_auto_in_d_ready = dmi2tl_auto_out_d_ready;
  assign dmiXbar_auto_out_1_a_ready = dmOuter_auto_dmi_in_a_ready;
  assign dmiXbar_auto_out_1_d_valid = dmOuter_auto_dmi_in_d_valid;
  assign dmiXbar_auto_out_1_d_bits_opcode = dmOuter_auto_dmi_in_d_bits_opcode;
  assign dmiXbar_auto_out_1_d_bits_data = dmOuter_auto_dmi_in_d_bits_data;
  assign dmiXbar_auto_out_0_a_ready = dmiBypass_auto_node_in_in_a_ready;
  assign dmiXbar_auto_out_0_d_valid = dmiBypass_auto_node_in_in_d_valid;
  assign dmiXbar_auto_out_0_d_bits_opcode = dmiBypass_auto_node_in_in_d_bits_opcode;
  assign dmiXbar_auto_out_0_d_bits_param = dmiBypass_auto_node_in_in_d_bits_param;
  assign dmiXbar_auto_out_0_d_bits_size = dmiBypass_auto_node_in_in_d_bits_size;
  assign dmiXbar_auto_out_0_d_bits_sink = dmiBypass_auto_node_in_in_d_bits_sink;
  assign dmiXbar_auto_out_0_d_bits_denied = dmiBypass_auto_node_in_in_d_bits_denied;
  assign dmiXbar_auto_out_0_d_bits_data = dmiBypass_auto_node_in_in_d_bits_data;
  assign dmiXbar_auto_out_0_d_bits_corrupt = dmiBypass_auto_node_in_in_d_bits_corrupt;
  assign dmi2tl_auto_out_a_ready = dmiXbar_auto_in_a_ready;
  assign dmi2tl_auto_out_d_valid = dmiXbar_auto_in_d_valid;
  assign dmi2tl_auto_out_d_bits_denied = dmiXbar_auto_in_d_bits_denied;
  assign dmi2tl_auto_out_d_bits_data = dmiXbar_auto_in_d_bits_data;
  assign dmi2tl_auto_out_d_bits_corrupt = dmiXbar_auto_in_d_bits_corrupt;
  assign dmi2tl_io_dmi_req_valid = io_dmi_req_valid;
  assign dmi2tl_io_dmi_req_bits_addr = io_dmi_req_bits_addr;
  assign dmi2tl_io_dmi_req_bits_data = io_dmi_req_bits_data;
  assign dmi2tl_io_dmi_req_bits_op = io_dmi_req_bits_op;
  assign dmi2tl_io_dmi_resp_ready = io_dmi_resp_ready;
  assign dmOuter_clock = io_dmi_clock;
  assign dmOuter_reset = io_dmi_reset;
  assign dmOuter_auto_dmi_in_a_valid = dmiXbar_auto_out_1_a_valid;
  assign dmOuter_auto_dmi_in_a_bits_opcode = dmiXbar_auto_out_1_a_bits_opcode;
  assign dmOuter_auto_dmi_in_a_bits_address = dmiXbar_auto_out_1_a_bits_address;
  assign dmOuter_auto_dmi_in_a_bits_data = dmiXbar_auto_out_1_a_bits_data;
  assign dmOuter_auto_dmi_in_d_ready = dmiXbar_auto_out_1_d_ready;
  assign dmOuter_io_ctrl_dmactiveAck = dmactiveAck_dmactiveAckSync_io_q;
  assign dmOuter_io_innerCtrl_ready = io_innerCtrl_source_io_enq_ready;
  assign dmOuter_io_hgDebugInt_0 = io_hgDebugInt_0;
  assign intsource_auto_in_0 = dmOuter_auto_int_out_0;
  assign dmiBypass_clock = io_dmi_clock;
  assign dmiBypass_reset = io_dmi_reset;
  assign dmiBypass_auto_node_out_out_a_ready = asource_auto_in_a_ready;
  assign dmiBypass_auto_node_out_out_d_valid = asource_auto_in_d_valid;
  assign dmiBypass_auto_node_out_out_d_bits_opcode = asource_auto_in_d_bits_opcode;
  assign dmiBypass_auto_node_out_out_d_bits_param = asource_auto_in_d_bits_param;
  assign dmiBypass_auto_node_out_out_d_bits_size = asource_auto_in_d_bits_size;
  assign dmiBypass_auto_node_out_out_d_bits_source = asource_auto_in_d_bits_source;
  assign dmiBypass_auto_node_out_out_d_bits_sink = asource_auto_in_d_bits_sink;
  assign dmiBypass_auto_node_out_out_d_bits_denied = asource_auto_in_d_bits_denied;
  assign dmiBypass_auto_node_out_out_d_bits_data = asource_auto_in_d_bits_data;
  assign dmiBypass_auto_node_out_out_d_bits_corrupt = asource_auto_in_d_bits_corrupt;
  assign dmiBypass_auto_node_in_in_a_valid = dmiXbar_auto_out_0_a_valid;
  assign dmiBypass_auto_node_in_in_a_bits_opcode = dmiXbar_auto_out_0_a_bits_opcode;
  assign dmiBypass_auto_node_in_in_a_bits_address = dmiXbar_auto_out_0_a_bits_address;
  assign dmiBypass_auto_node_in_in_a_bits_data = dmiXbar_auto_out_0_a_bits_data;
  assign dmiBypass_auto_node_in_in_d_ready = dmiXbar_auto_out_0_d_ready;
  assign dmiBypass_io_bypass = ~io_ctrl_dmactive | ~dmactiveAck;
  assign asource_clock = io_dmi_clock;
  assign asource_reset = io_dmi_reset;
  assign asource_auto_in_a_valid = dmiBypass_auto_node_out_out_a_valid;
  assign asource_auto_in_a_bits_opcode = dmiBypass_auto_node_out_out_a_bits_opcode;
  assign asource_auto_in_a_bits_address = dmiBypass_auto_node_out_out_a_bits_address;
  assign asource_auto_in_a_bits_data = dmiBypass_auto_node_out_out_a_bits_data;
  assign asource_auto_in_d_ready = dmiBypass_auto_node_out_out_d_ready;
  assign asource_auto_out_a_ridx = auto_asource_out_a_ridx;
  assign asource_auto_out_a_safe_ridx_valid = auto_asource_out_a_safe_ridx_valid;
  assign asource_auto_out_a_safe_sink_reset_n = auto_asource_out_a_safe_sink_reset_n;
  assign asource_auto_out_d_mem_0_opcode = auto_asource_out_d_mem_0_opcode;
  assign asource_auto_out_d_mem_0_size = auto_asource_out_d_mem_0_size;
  assign asource_auto_out_d_mem_0_source = auto_asource_out_d_mem_0_source;
  assign asource_auto_out_d_mem_0_data = auto_asource_out_d_mem_0_data;
  assign asource_auto_out_d_widx = auto_asource_out_d_widx;
  assign asource_auto_out_d_safe_widx_valid = auto_asource_out_d_safe_widx_valid;
  assign asource_auto_out_d_safe_source_reset_n = auto_asource_out_d_safe_source_reset_n;
  assign dmactiveAck_dmactiveAckSync_clock = io_dmi_clock;
  assign dmactiveAck_dmactiveAckSync_reset = io_dmi_reset;
  assign dmactiveAck_dmactiveAckSync_io_d = io_ctrl_dmactiveAck;
  assign io_innerCtrl_source_clock = io_dmi_clock;
  assign io_innerCtrl_source_reset = io_dmi_reset;
  assign io_innerCtrl_source_io_enq_valid = dmOuter_io_innerCtrl_valid;
  assign io_innerCtrl_source_io_enq_bits_resumereq = dmOuter_io_innerCtrl_bits_resumereq;
  assign io_innerCtrl_source_io_enq_bits_ackhavereset = dmOuter_io_innerCtrl_bits_ackhavereset;
  assign io_innerCtrl_source_io_enq_bits_hrmask_0 = dmOuter_io_innerCtrl_bits_hrmask_0;
  assign io_innerCtrl_source_io_async_ridx = io_innerCtrl_ridx;
  assign io_innerCtrl_source_io_async_safe_ridx_valid = io_innerCtrl_safe_ridx_valid;
  assign io_innerCtrl_source_io_async_safe_sink_reset_n = io_innerCtrl_safe_sink_reset_n;
endmodule