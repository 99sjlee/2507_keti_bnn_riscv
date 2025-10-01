`default_nettype wire
module TLPLIC(
  input         clock,
  input         reset,
  input         auto_int_in_0,
  input         auto_int_in_1,
  output        auto_int_out_1_0,
  output        auto_int_out_0_0,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [9:0]  auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [9:0]  auto_in_d_bits_source,
  output [31:0] auto_in_d_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [1:0] monitor_io_in_a_bits_size;
  wire [9:0] monitor_io_in_a_bits_source;
  wire [27:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_size;
  wire [9:0] monitor_io_in_d_bits_source;
  wire  gateways_gateway_clock;
  wire  gateways_gateway_reset;
  wire  gateways_gateway_io_interrupt;
  wire  gateways_gateway_io_plic_valid;
  wire  gateways_gateway_io_plic_ready;
  wire  gateways_gateway_io_plic_complete;
  wire  gateways_gateway_1_clock;
  wire  gateways_gateway_1_reset;
  wire  gateways_gateway_1_io_interrupt;
  wire  gateways_gateway_1_io_plic_valid;
  wire  gateways_gateway_1_io_plic_ready;
  wire  gateways_gateway_1_io_plic_complete;
  wire [1:0] fanin_io_prio_0;
  wire [1:0] fanin_io_prio_1;
  wire [1:0] fanin_io_ip;
  wire [1:0] fanin_io_dev;
  wire [1:0] fanin_io_max;
  wire [1:0] fanin_1_io_prio_0;
  wire [1:0] fanin_1_io_prio_1;
  wire [1:0] fanin_1_io_ip;
  wire [1:0] fanin_1_io_dev;
  wire [1:0] fanin_1_io_max;
  wire  out_back_clock;
  wire  out_back_reset;
  wire  out_back_io_enq_ready;
  wire  out_back_io_enq_valid;
  wire  out_back_io_enq_bits_read;
  wire [23:0] out_back_io_enq_bits_index;
  wire [31:0] out_back_io_enq_bits_data;
  wire [3:0] out_back_io_enq_bits_mask;
  wire [9:0] out_back_io_enq_bits_extra_tlrr_extra_source;
  wire [1:0] out_back_io_enq_bits_extra_tlrr_extra_size;
  wire  out_back_io_deq_ready;
  wire  out_back_io_deq_valid;
  wire  out_back_io_deq_bits_read;
  wire [23:0] out_back_io_deq_bits_index;
  wire [31:0] out_back_io_deq_bits_data;
  wire [3:0] out_back_io_deq_bits_mask;
  wire [9:0] out_back_io_deq_bits_extra_tlrr_extra_source;
  wire [1:0] out_back_io_deq_bits_extra_tlrr_extra_size;
  reg [1:0] priority_0;
  reg [1:0] priority_1;
  reg [1:0] threshold_0;
  reg [1:0] threshold_1;
  reg  pending_0;
  reg  pending_1;
  reg [1:0] enables_0_0;
  reg [1:0] enables_1_0;
  wire [2:0] enableVec0_0 = {enables_0_0,1'h0};
  wire [2:0] enableVec0_1 = {enables_1_0,1'h0};
  reg [1:0] maxDevs_0;
  reg [1:0] maxDevs_1;
  wire [1:0] pendingUInt = {pending_1,pending_0};
  reg [1:0] bundleOut_0_0_REG;
  reg [1:0] bundleOut_1_0_REG;
  wire [4:0] out_oindex = {out_back_io_deq_bits_index[19],out_back_io_deq_bits_index[11],out_back_io_deq_bits_index[10],
    out_back_io_deq_bits_index[5],out_back_io_deq_bits_index[0]};
  wire [31:0] _out_backSel_T = 32'h1 << out_oindex;
  wire  out_backSel_21 = _out_backSel_T[21];
  wire [23:0] out_bindex = out_back_io_deq_bits_index & 24'hf7f3de;
  wire  _out_T_17 = out_bindex == 24'h0;
  wire  out_roready_14 = out_back_io_deq_valid & auto_in_d_ready & out_back_io_deq_bits_read & out_backSel_21 &
    out_bindex == 24'h0;
  wire [7:0] _out_backMask_T_11 = out_back_io_deq_bits_mask[3] ? 8'hff : 8'h0;
  wire [7:0] _out_backMask_T_9 = out_back_io_deq_bits_mask[2] ? 8'hff : 8'h0;
  wire [7:0] _out_backMask_T_7 = out_back_io_deq_bits_mask[1] ? 8'hff : 8'h0;
  wire [7:0] _out_backMask_T_5 = out_back_io_deq_bits_mask[0] ? 8'hff : 8'h0;
  wire [31:0] out_backMask = {_out_backMask_T_11,_out_backMask_T_9,_out_backMask_T_7,_out_backMask_T_5};
  wire  out_romask_14 = |out_backMask;
  wire  out_f_roready_14 = out_roready_14 & out_romask_14;
  wire  out_backSel_17 = _out_backSel_T[17];
  wire  out_roready_3 = out_back_io_deq_valid & auto_in_d_ready & out_back_io_deq_bits_read & out_backSel_17 &
    out_bindex == 24'h0;
  wire  out_f_roready_3 = out_roready_3 & out_romask_14;
  wire [1:0] _T = {out_f_roready_14,out_f_roready_3};
  wire [1:0] _T_3 = _T - 2'h1;
  wire [1:0] _T_4 = _T & _T_3;
  wire  _T_7 = ~reset;
  wire [1:0] _claiming_T = out_f_roready_3 ? maxDevs_0 : 2'h0;
  wire [1:0] _claiming_T_1 = out_f_roready_14 ? maxDevs_1 : 2'h0;
  wire [1:0] claiming = _claiming_T | _claiming_T_1;
  wire [3:0] _claimedDevs_T = 4'h1 << claiming;
  wire  claimedDevs_1 = _claimedDevs_T[1];
  wire  claimedDevs_2 = _claimedDevs_T[2];
  wire  out_woready_14 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_21 &
    out_bindex == 24'h0;
  wire  out_womask_14 = &out_backMask;
  wire  out_f_woready_14 = out_woready_14 & out_womask_14;
  wire [31:0] _out_T_163 = out_back_io_deq_bits_data;
  wire [1:0] completerDev = _out_T_163[1:0];
  wire [2:0] _out_completer_1_T = enableVec0_1 >> completerDev;
  wire  completer_1 = out_f_woready_14 & _out_completer_1_T[0];
  wire  out_woready_3 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_17 &
    out_bindex == 24'h0;
  wire  out_f_woready_3 = out_woready_3 & out_womask_14;
  wire [2:0] _out_completer_0_T = enableVec0_0 >> completerDev;
  wire  completer_0 = out_f_woready_3 & _out_completer_0_T[0];
  wire [1:0] _T_11 = {completer_1,completer_0};
  wire [1:0] _T_14 = _T_11 - 2'h1;
  wire [1:0] _T_15 = _T_11 & _T_14;
  wire [3:0] _completedDevs_T_1 = 4'h1 << completerDev;
  wire [2:0] completedDevs = completer_0 | completer_1 ? _completedDevs_T_1[2:0] : 3'h0;
  wire  _out_T_9 = out_bindex == 24'h2;
  wire [2:0] out_prepend_1 = {pending_1,pending_0,1'h0};
  wire [31:0] _out_T_59 = {{30'd0}, maxDevs_0};
  wire  out_womask_4 = &out_backMask[1:0];
  wire  out_backSel_1 = _out_backSel_T[1];
  wire  out_woready_4 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_1 &
    out_bindex == 24'h0;
  wire  out_f_woready_4 = out_woready_4 & out_womask_4;
  wire  out_backSel_10 = _out_backSel_T[10];
  wire  out_woready_5 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_10 &
    out_bindex == 24'h0;
  wire  out_womask_6 = &out_backMask[2:1];
  wire  out_f_woready_6 = out_woready_5 & out_womask_6;
  wire  out_backSel_0 = _out_backSel_T[0];
  wire  out_woready_7 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_0 &
    out_bindex == 24'h2;
  wire  out_f_woready_7 = out_woready_7 & out_womask_4;
  wire  out_backSel_20 = _out_backSel_T[20];
  wire  out_woready_8 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_20 &
    out_bindex == 24'h0;
  wire  out_f_woready_8 = out_woready_8 & out_womask_4;
  wire [2:0] out_prepend_3 = {1'h0,threshold_1};
  wire [31:0] _out_T_121 = {{29'd0}, out_prepend_3};
  wire  out_backSel_16 = _out_backSel_T[16];
  wire  out_woready_10 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_16 &
    out_bindex == 24'h0;
  wire  out_f_woready_10 = out_woready_10 & out_womask_4;
  wire [2:0] out_prepend_4 = {1'h0,threshold_0};
  wire [31:0] _out_T_141 = {{29'd0}, out_prepend_4};
  wire  out_backSel_8 = _out_backSel_T[8];
  wire  out_woready_12 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_8 &
    out_bindex == 24'h0;
  wire  out_f_woready_13 = out_woready_12 & out_womask_6;
  wire [31:0] _out_T_177 = {{30'd0}, maxDevs_1};
  wire  _GEN_136 = 5'h15 == out_oindex ? _out_T_17 : 1'h1;
  wire  _GEN_137 = 5'h14 == out_oindex ? _out_T_17 : _GEN_136;
  wire  _GEN_138 = 5'h11 == out_oindex ? _out_T_17 : _GEN_137;
  wire  _GEN_139 = 5'h10 == out_oindex ? _out_T_17 : _GEN_138;
  wire  _GEN_140 = 5'ha == out_oindex ? _out_T_17 : _GEN_139;
  wire  _GEN_141 = 5'h8 == out_oindex ? _out_T_17 : _GEN_140;
  wire  _GEN_142 = 5'h4 == out_oindex ? _out_T_17 : _GEN_141;
  wire  _GEN_143 = 5'h1 == out_oindex ? _out_T_17 : _GEN_142;
  wire  out_out_bits_data_out = 5'h0 == out_oindex ? _out_T_9 : _GEN_143;
  wire [31:0] _GEN_145 = 5'h15 == out_oindex ? _out_T_177 : 32'h0;
  wire [31:0] _GEN_146 = 5'h14 == out_oindex ? _out_T_121 : _GEN_145;
  wire [31:0] _GEN_147 = 5'h11 == out_oindex ? _out_T_59 : _GEN_146;
  wire [31:0] _GEN_148 = 5'h10 == out_oindex ? _out_T_141 : _GEN_147;
  wire [31:0] _GEN_149 = 5'ha == out_oindex ? {{29'd0}, enableVec0_1} : _GEN_148;
  wire [31:0] _GEN_150 = 5'h8 == out_oindex ? {{29'd0}, enableVec0_0} : _GEN_149;
  wire [31:0] _GEN_151 = 5'h4 == out_oindex ? {{29'd0}, out_prepend_1} : _GEN_150;
  wire [31:0] _GEN_152 = 5'h1 == out_oindex ? {{30'd0}, priority_0} : _GEN_151;
  wire [31:0] out_out_bits_data_out_1 = 5'h0 == out_oindex ? {{30'd0}, priority_1} : _GEN_152;
  wire  out_bits_read = out_back_io_deq_bits_read;
  
  LevelGateway gateways_gateway (
    .clock(gateways_gateway_clock),
    .reset(gateways_gateway_reset),
    .io_interrupt(gateways_gateway_io_interrupt),
    .io_plic_valid(gateways_gateway_io_plic_valid),
    .io_plic_ready(gateways_gateway_io_plic_ready),
    .io_plic_complete(gateways_gateway_io_plic_complete)
  );
  LevelGateway gateways_gateway_1 (
    .clock(gateways_gateway_1_clock),
    .reset(gateways_gateway_1_reset),
    .io_interrupt(gateways_gateway_1_io_interrupt),
    .io_plic_valid(gateways_gateway_1_io_plic_valid),
    .io_plic_ready(gateways_gateway_1_io_plic_ready),
    .io_plic_complete(gateways_gateway_1_io_plic_complete)
  );
  PLICFanIn fanin (
    .io_prio_0(fanin_io_prio_0),
    .io_prio_1(fanin_io_prio_1),
    .io_ip(fanin_io_ip),
    .io_dev(fanin_io_dev),
    .io_max(fanin_io_max)
  );
  PLICFanIn fanin_1 (
    .io_prio_0(fanin_1_io_prio_0),
    .io_prio_1(fanin_1_io_prio_1),
    .io_ip(fanin_1_io_ip),
    .io_dev(fanin_1_io_dev),
    .io_max(fanin_1_io_max)
  );
  Queue_37 out_back (
    .clock(out_back_clock),
    .reset(out_back_reset),
    .io_enq_ready(out_back_io_enq_ready),
    .io_enq_valid(out_back_io_enq_valid),
    .io_enq_bits_read(out_back_io_enq_bits_read),
    .io_enq_bits_index(out_back_io_enq_bits_index),
    .io_enq_bits_data(out_back_io_enq_bits_data),
    .io_enq_bits_mask(out_back_io_enq_bits_mask),
    .io_enq_bits_extra_tlrr_extra_source(out_back_io_enq_bits_extra_tlrr_extra_source),
    .io_enq_bits_extra_tlrr_extra_size(out_back_io_enq_bits_extra_tlrr_extra_size),
    .io_deq_ready(out_back_io_deq_ready),
    .io_deq_valid(out_back_io_deq_valid),
    .io_deq_bits_read(out_back_io_deq_bits_read),
    .io_deq_bits_index(out_back_io_deq_bits_index),
    .io_deq_bits_data(out_back_io_deq_bits_data),
    .io_deq_bits_mask(out_back_io_deq_bits_mask),
    .io_deq_bits_extra_tlrr_extra_source(out_back_io_deq_bits_extra_tlrr_extra_source),
    .io_deq_bits_extra_tlrr_extra_size(out_back_io_deq_bits_extra_tlrr_extra_size)
  );
  assign auto_int_out_1_0 = bundleOut_1_0_REG > threshold_1;
  assign auto_int_out_0_0 = bundleOut_0_0_REG > threshold_0;
  assign auto_in_a_ready = out_back_io_enq_ready;
  assign auto_in_d_valid = out_back_io_deq_valid;
  assign auto_in_d_bits_opcode = {{2'd0}, out_bits_read};
  assign auto_in_d_bits_size = out_back_io_deq_bits_extra_tlrr_extra_size;
  assign auto_in_d_bits_source = out_back_io_deq_bits_extra_tlrr_extra_source;
  assign auto_in_d_bits_data = out_out_bits_data_out ? out_out_bits_data_out_1 : 32'h0;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = out_back_io_enq_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = out_back_io_deq_valid;
  assign monitor_io_in_d_bits_opcode = {{2'd0}, out_bits_read};
  assign monitor_io_in_d_bits_size = out_back_io_deq_bits_extra_tlrr_extra_size;
  assign monitor_io_in_d_bits_source = out_back_io_deq_bits_extra_tlrr_extra_source;
  assign gateways_gateway_clock = clock;
  assign gateways_gateway_reset = reset;
  assign gateways_gateway_io_interrupt = auto_int_in_0;
  assign gateways_gateway_io_plic_ready = ~pending_0;
  assign gateways_gateway_io_plic_complete = completedDevs[1];
  assign gateways_gateway_1_clock = clock;
  assign gateways_gateway_1_reset = reset;
  assign gateways_gateway_1_io_interrupt = auto_int_in_1;
  assign gateways_gateway_1_io_plic_ready = ~pending_1;
  assign gateways_gateway_1_io_plic_complete = completedDevs[2];
  assign fanin_io_prio_0 = priority_0;
  assign fanin_io_prio_1 = priority_1;
  assign fanin_io_ip = enables_0_0 & pendingUInt;
  assign fanin_1_io_prio_0 = priority_0;
  assign fanin_1_io_prio_1 = priority_1;
  assign fanin_1_io_ip = enables_1_0 & pendingUInt;
  assign out_back_clock = clock;
  assign out_back_reset = reset;
  assign out_back_io_enq_valid = auto_in_a_valid;
  assign out_back_io_enq_bits_read = auto_in_a_bits_opcode == 3'h4;
  assign out_back_io_enq_bits_index = auto_in_a_bits_address[25:2];
  assign out_back_io_enq_bits_data = auto_in_a_bits_data;
  assign out_back_io_enq_bits_mask = auto_in_a_bits_mask;
  assign out_back_io_enq_bits_extra_tlrr_extra_source = auto_in_a_bits_source;
  assign out_back_io_enq_bits_extra_tlrr_extra_size = auto_in_a_bits_size;
  assign out_back_io_deq_ready = auto_in_d_ready;
  always @(posedge clock) begin
    if (out_f_woready_4) begin
      priority_0 <= out_back_io_deq_bits_data[1:0];
    end
    if (out_f_woready_7) begin
      priority_1 <= out_back_io_deq_bits_data[1:0];
    end
    if (out_f_woready_10) begin
      threshold_0 <= out_back_io_deq_bits_data[1:0];
    end
    if (out_f_woready_8) begin
      threshold_1 <= out_back_io_deq_bits_data[1:0];
    end
    if (reset) begin
      pending_0 <= 1'h0;
    end else if (claimedDevs_1 | gateways_gateway_io_plic_valid) begin
      pending_0 <= ~claimedDevs_1;
    end
    if (reset) begin
      pending_1 <= 1'h0;
    end else if (claimedDevs_2 | gateways_gateway_1_io_plic_valid) begin
      pending_1 <= ~claimedDevs_2;
    end
    if (out_f_woready_13) begin
      enables_0_0 <= out_back_io_deq_bits_data[2:1];
    end
    if (out_f_woready_6) begin
      enables_1_0 <= out_back_io_deq_bits_data[2:1];
    end
    maxDevs_0 <= fanin_io_dev;
    maxDevs_1 <= fanin_1_io_dev;
    bundleOut_0_0_REG <= fanin_io_max;
    bundleOut_1_0_REG <= fanin_1_io_max;
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_4 == 2'h0) & ~reset) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_4 == 2'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Plic.scala:244 assert((claimer.asUInt & (claimer.asUInt - UInt(1))) === UInt(0)) // One-Hot\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_15 == 2'h0) & _T_7) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7 & ~(_T_15 == 2'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Plic.scala:261 assert((completer.asUInt & (completer.asUInt - UInt(1))) === UInt(0)) // One-Hot\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(completerDev == completerDev) & _T_7) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7 & ~(completerDev == completerDev)) begin
          $fwrite(32'h80000002,
            "Assertion failed: completerDev should be consistent for all harts\n    at Plic.scala:291 assert(completerDev === data.extract(log2Ceil(nDevices+1)-1, 0),\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(completerDev == completerDev) & _T_7) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7 & ~(completerDev == completerDev)) begin
          $fwrite(32'h80000002,
            "Assertion failed: completerDev should be consistent for all harts\n    at Plic.scala:291 assert(completerDev === data.extract(log2Ceil(nDevices+1)-1, 0),\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  priority_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  priority_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  threshold_0 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  threshold_1 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  pending_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  pending_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  enables_0_0 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  enables_1_0 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  maxDevs_0 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  maxDevs_1 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  bundleOut_0_0_REG = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  bundleOut_1_0_REG = _RAND_11[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule