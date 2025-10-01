// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2025-07-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_endian.vh"
`include "ervp_mmiox1_memorymap_offset.vh"



module ERVP_MMIOX1_INTERFACE
(
  clk_mmio,
  rstnn_mmio,

  clk_acc,
  rstnn_acc,

  mmio_rpsel,
  mmio_rpenable,
  mmio_rpaddr,
  mmio_rpwrite,
  mmio_rpwdata,
  mmio_rprdata,
  mmio_rpready,
  mmio_rpslverr,
  interrupt_list,
  
  smx_core_config,
  smx_core_status,
  smx_clear_request,
  smx_clear_finish,
  smx_log_fifo_wready,
  smx_log_fifo_wrequest,
  smx_log_fifo_wdata,
  smx_inst_fifo_rready,
  smx_inst_fifo_rdata,
  smx_inst_fifo_rrequest,
  smx_operation_finish,
  smx_input_fifo_rready,
  smx_input_fifo_rdata,
  smx_input_fifo_rrequest,
  smx_output_fifo_wready,
  smx_output_fifo_wrequest,
  smx_output_fifo_wdata
);



parameter BW_ADDR = 32;
parameter BW_APB_DATA = 32;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;

parameter BW_CONFIG = 32;
parameter BW_STATUS = 32;
parameter BW_LOG = 32;
parameter BW_INST = 64;
parameter BW_INPUT = 32;
parameter BW_OUTPUT = 32;

parameter CONFIG_DEFAULT_VALUE = 0;
parameter LOG_FIFO_DEPTH = 4;
parameter INST_FIFO_DEPTH = 4;
parameter INPUT_FIFO_DEPTH = 4;
parameter OUTPUT_FIFO_DEPTH = 4;

`include "rvx_include_07.vh"

localparam  RVX_LPARA_0 = GEN_MMIOX1_FIFO_PARA(LOG_FIFO_DEPTH, INST_FIFO_DEPTH, INPUT_FIFO_DEPTH, OUTPUT_FIFO_DEPTH);

input wire clk_mmio;
input wire rstnn_mmio;

input wire mmio_rpsel;
input wire mmio_rpenable;
input wire [BW_ADDR-1:0] mmio_rpaddr;
input wire mmio_rpwrite;
input wire [BW_APB_DATA-1:0] mmio_rpwdata;
output wire [BW_APB_DATA-1:0] mmio_rprdata;
output wire mmio_rpready;
output wire mmio_rpslverr;

output wire [32-1:0] interrupt_list;

input wire clk_acc;
input wire rstnn_acc;

output wire [BW_CONFIG-1:0] smx_core_config;
input wire [BW_STATUS-1:0] smx_core_status;
output wire smx_clear_request;
input wire smx_clear_finish;
output wire smx_log_fifo_wready;
input wire smx_log_fifo_wrequest;
input wire [BW_LOG-1:0] smx_log_fifo_wdata;
output wire smx_inst_fifo_rready;
output wire [BW_INST-1:0] smx_inst_fifo_rdata;
input wire smx_inst_fifo_rrequest;
input wire smx_operation_finish;
output wire smx_input_fifo_rready;
output wire [BW_INPUT-1:0] smx_input_fifo_rdata;
input wire smx_input_fifo_rrequest;
output wire smx_output_fifo_wready;
input wire smx_output_fifo_wrequest;
input wire [BW_OUTPUT-1:0] smx_output_fifo_wdata;

wire rvx_signal_05;
wire rvx_signal_09;
wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_signal_24;
wire rvx_signal_18;
wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_signal_31;
wire rvx_signal_11;
wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_signal_23;
wire rvx_signal_28;
wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_signal_27;
wire rvx_signal_10;
wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_signal_21;
wire rvx_signal_16;
wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_signal_04;
wire rvx_signal_30;
wire rvx_signal_17;
wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_signal_01;
wire rvx_signal_15;
wire [`BW_MMIO_INST_STATUS-1:0] rvx_signal_19;
wire rvx_signal_00;
wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_signal_14;
wire rvx_signal_29;
wire rvx_signal_22;
wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_signal_02;
wire rvx_signal_20;
wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_signal_06;
wire rvx_signal_13;
wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_signal_07;
wire rvx_signal_26;
wire rvx_signal_12;
wire [`BW_MMIO_ITR_STATUS-1:0] rvx_signal_25;
wire rvx_signal_03;
wire [`BW_MMIO_ITR_STATUS-1:0] rvx_signal_08;

RVX_MODULE_117
#(
  .RVX_GPARA_0(BW_ADDR),
  .RVX_GPARA_2(BW_APB_DATA),
  .RVX_GPARA_1(ENDIAN_TYPE)
)
i_rvx_instance_0
(
  .rvx_port_25(clk_mmio),
  .rvx_port_10(rstnn_mmio),

  .rvx_port_17(mmio_rpsel),
  .rvx_port_07(mmio_rpenable),
  .rvx_port_27(mmio_rpaddr),
  .rvx_port_24(mmio_rpwrite),
  .rvx_port_35(mmio_rpwdata),
  .rvx_port_22(mmio_rprdata),
  .rvx_port_03(mmio_rpready),
  .rvx_port_34(mmio_rpslverr),

  .rvx_port_39(rvx_signal_05),
  .rvx_port_13(rvx_signal_09),
  .rvx_port_16(rvx_signal_24),
  .rvx_port_38(rvx_signal_18),
  .rvx_port_21(rvx_signal_31),
  .rvx_port_09(rvx_signal_11),
  .rvx_port_12(rvx_signal_23),
  .rvx_port_37(rvx_signal_28),
	.rvx_port_18(rvx_signal_27),
	.rvx_port_20(rvx_signal_10),
	.rvx_port_14(rvx_signal_21),
  .rvx_port_15(rvx_signal_16),
  .rvx_port_00(rvx_signal_04),
  .rvx_port_01(rvx_signal_30),
  .rvx_port_31(rvx_signal_17),
  .rvx_port_11(rvx_signal_01),
  .rvx_port_36(rvx_signal_15),
  .rvx_port_40(rvx_signal_19),
  .rvx_port_08(rvx_signal_00),
  .rvx_port_04(rvx_signal_14),
  .rvx_port_28(rvx_signal_29),
  .rvx_port_06(rvx_signal_22),
  .rvx_port_41(rvx_signal_02),
  .rvx_port_19(rvx_signal_20),
  .rvx_port_05(rvx_signal_06),
  .rvx_port_33(rvx_signal_13),
  .rvx_port_30(rvx_signal_07),
  .rvx_port_26(rvx_signal_26),
  .rvx_port_29(rvx_signal_12),
  .rvx_port_23(rvx_signal_25),
  .rvx_port_32(rvx_signal_03),
  .rvx_port_02(rvx_signal_08)
);

assign rvx_signal_05 = 0;

RVX_MODULE_106
#(
  .RVX_GPARA_2(BW_APB_DATA),
  .RVX_GPARA_3(BW_CONFIG),
  .RVX_GPARA_7(BW_STATUS),
  .RVX_GPARA_4(BW_LOG),
  .RVX_GPARA_1(BW_INST),
  .RVX_GPARA_6(BW_INPUT),
  .RVX_GPARA_5(BW_OUTPUT),
  .RVX_GPARA_0(CONFIG_DEFAULT_VALUE),
  .MMIOX1_FIFO_PARA(RVX_LPARA_0)
)
i_rvx_instance_1
(
  .rvx_port_25(clk_mmio),
  .rvx_port_15(rstnn_mmio),
  .rvx_port_22(clk_acc),
  .rvx_port_37(rstnn_acc),

  .rvx_port_28(rvx_signal_09),
  .rvx_port_30(rvx_signal_24),
  .rvx_port_34(rvx_signal_18),
  .rvx_port_31(rvx_signal_31),
  .rvx_port_46(rvx_signal_11),
  .rvx_port_52(rvx_signal_23),
  .rvx_port_42(rvx_signal_28),
	.rvx_port_36(rvx_signal_27),
	.rvx_port_17(rvx_signal_10),
	.rvx_port_03(rvx_signal_21),
  .rvx_port_18(rvx_signal_16),
  .rvx_port_19(rvx_signal_04),
  .rvx_port_01(rvx_signal_30),
  .rvx_port_12(rvx_signal_17),
  .rvx_port_40(rvx_signal_01),
  .rvx_port_00(rvx_signal_15),
  .rvx_port_29(rvx_signal_19),
  .rvx_port_05(rvx_signal_00),
  .rvx_port_10(rvx_signal_14),
  .rvx_port_11(rvx_signal_29),
  .rvx_port_50(rvx_signal_22),
  .rvx_port_16(rvx_signal_02),
  .rvx_port_39(rvx_signal_20),
  .rvx_port_49(rvx_signal_06),
  .rvx_port_44(rvx_signal_13),
  .rvx_port_41(rvx_signal_07),
  .rvx_port_43(rvx_signal_26),
  .rvx_port_06(rvx_signal_12),
  .rvx_port_20(rvx_signal_25),
  .rvx_port_14(rvx_signal_03),
  .rvx_port_23(rvx_signal_08),
  .rvx_port_24(interrupt_list),

  .rvx_port_07(smx_core_config),
  .rvx_port_33(smx_core_status),
  .rvx_port_35(smx_clear_request),
  .rvx_port_21(smx_clear_finish),
  .rvx_port_48(smx_log_fifo_wready),
  .rvx_port_09(smx_log_fifo_wrequest),
  .rvx_port_13(smx_log_fifo_wdata),
  .rvx_port_45(smx_inst_fifo_rready),
  .rvx_port_32(smx_inst_fifo_rdata),
  .rvx_port_08(smx_inst_fifo_rrequest),
  .rvx_port_47(smx_operation_finish),
  .rvx_port_38(smx_input_fifo_rready),
  .rvx_port_04(smx_input_fifo_rdata),
  .rvx_port_26(smx_input_fifo_rrequest),
  .rvx_port_02(smx_output_fifo_wready),
  .rvx_port_51(smx_output_fifo_wrequest),
  .rvx_port_27(smx_output_fifo_wdata)
);

endmodule
