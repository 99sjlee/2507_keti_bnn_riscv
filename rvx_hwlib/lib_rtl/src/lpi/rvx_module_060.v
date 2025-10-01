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
`include "ervp_axi_define.vh"





module RVX_MODULE_060
(
	rvx_port_11,
	rvx_port_04,
  rvx_port_07,
  rvx_port_15,

  rvx_port_00,
  rvx_port_10,
  rvx_port_13,
  rvx_port_36,
  rvx_port_05,
  rvx_port_35,

  rvx_port_28,
  rvx_port_34,
  rvx_port_14,
  rvx_port_26,
  rvx_port_08,

  rvx_port_02,
	rvx_port_43,
	rvx_port_42,
	rvx_port_32,
	rvx_port_27,
	rvx_port_03,
	rvx_port_21,

	rvx_port_25,
	rvx_port_17,
	rvx_port_23,
	rvx_port_22,
	rvx_port_41, 

	rvx_port_37,
	rvx_port_33,
	rvx_port_20,
	rvx_port_06,

	rvx_port_19,
	rvx_port_39,
	rvx_port_01,
	rvx_port_40,
	rvx_port_38,
	rvx_port_12,
	rvx_port_16,

	rvx_port_24,
	rvx_port_31,
	rvx_port_09,
	rvx_port_18,
	rvx_port_29,
	rvx_port_30
);





parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_0 = 32;
parameter MEMORY_OPERATION_TYPE = 3;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_3 = 4;

`include "burden_para.vb"

localparam  RVX_LPARA_0 = RVX_GPARA_0;

`include "lpit_function.vb"
`include "lpimo_function.vb"

localparam  BW_LPIMO_ADDR = RVX_GPARA_2;
localparam  BW_LPIMO_DATA = RVX_GPARA_0;
localparam  BW_LPI_BURDEN = HAS_BURDEN? BW_BURDEN : 0;

`include "lpimo_lpara.vb"

input wire rvx_port_11;
input wire rvx_port_04;
input wire rvx_port_07;
input wire rvx_port_15;

output wire [2-1:0] rvx_port_00;
input wire rvx_port_10;
input wire rvx_port_13;
input wire rvx_port_36;
input wire rvx_port_05;
input wire [BW_LPI_QDATA-1:0] rvx_port_35;

input wire [2-1:0] rvx_port_28;
output wire rvx_port_34;
output wire rvx_port_14;
output wire rvx_port_26;
output wire [BW_LPI_YDATA-1:0] rvx_port_08;

output wire [RVX_GPARA_1-1:0] rvx_port_02;
output wire [RVX_GPARA_2-1:0] rvx_port_43;
output wire [`BW_AXI_ALEN-1:0] rvx_port_42;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_32;
output wire [`BW_AXI_ABURST-1:0] rvx_port_27;
output wire rvx_port_03;
input wire rvx_port_21;

output wire [RVX_LPARA_0-1:0] rvx_port_25;
output wire [`BW_AXI_WSTRB(RVX_LPARA_0)-1:0] rvx_port_17;
output wire rvx_port_23;
output wire rvx_port_22;
input wire rvx_port_41;

input wire [RVX_GPARA_1-1:0] rvx_port_37;
input wire [`BW_AXI_BRESP-1:0] rvx_port_33;
input wire rvx_port_20;
output wire rvx_port_06;

output wire [RVX_GPARA_1-1:0] rvx_port_19;
output wire [RVX_GPARA_2-1:0] rvx_port_39;
output wire [`BW_AXI_ALEN-1:0] rvx_port_01;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_40;
output wire [`BW_AXI_ABURST-1:0] rvx_port_38;
output wire rvx_port_12;
input wire rvx_port_16;

input wire [RVX_GPARA_1-1:0] rvx_port_24;
input wire [RVX_LPARA_0-1:0] rvx_port_31;
input wire [`BW_AXI_RRESP-1:0] rvx_port_09;
input wire rvx_port_18;
input wire rvx_port_29;
output wire rvx_port_30;

`include "lpixm_function.vb"

localparam  RVX_LPARA_4 = HAS_BURDEN? BW_BURDEN : 0;
localparam  RVX_LPARA_5 = BW_LPIXM_QPARCEL(RVX_GPARA_2,RVX_GPARA_0);
localparam  RVX_LPARA_3 = BW_LPIXM_YPARCEL(RVX_GPARA_0);
localparam  RVX_LPARA_1 = BW_LPI_DATA(RVX_LPARA_4,RVX_LPARA_5);
localparam  RVX_LPARA_2 = BW_LPI_DATA(RVX_LPARA_4,RVX_LPARA_3);

wire [2-1:0] rvx_signal_07;
wire rvx_signal_09;
wire rvx_signal_08;
wire rvx_signal_04;
wire rvx_signal_00;
wire [RVX_LPARA_1-1:0] rvx_signal_10;

wire [2-1:0] rvx_signal_02;
wire rvx_signal_03;
wire rvx_signal_06;
wire rvx_signal_05;
wire [RVX_LPARA_2-1:0] rvx_signal_01;

RVX_MODULE_052
#(
  .RVX_GPARA_0(RVX_GPARA_2),
  .RVX_GPARA_1(RVX_GPARA_0),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .HAS_BURDEN(HAS_BURDEN),
  .BW_BURDEN(BW_BURDEN)
)
i_rvx_instance_0
(
	.rvx_port_20(rvx_port_11),
	.rvx_port_19(rvx_port_04),
  .rvx_port_12(rvx_port_07),
  .rvx_port_07(rvx_port_15),

  .rvx_port_09(rvx_port_00),
  .rvx_port_05(rvx_port_10),
  .rvx_port_06(rvx_port_13),
  .rvx_port_14(rvx_port_36),
  .rvx_port_01(rvx_port_05),
  .rvx_port_08(rvx_port_35),

  .rvx_port_11(rvx_port_28),
  .rvx_port_10(rvx_port_34),
  .rvx_port_25(rvx_port_14),
  .rvx_port_18(rvx_port_26),
  .rvx_port_13(rvx_port_08),

  .rvx_port_17(rvx_signal_07),
  .rvx_port_22(rvx_signal_09),
  .rvx_port_04(rvx_signal_08),
  .rvx_port_24(rvx_signal_04),
  .rvx_port_03(rvx_signal_00),
  .rvx_port_02(rvx_signal_10),

  .rvx_port_23(rvx_signal_02),
  .rvx_port_16(rvx_signal_03),
  .rvx_port_21(rvx_signal_06),
  .rvx_port_15(rvx_signal_05),
  .rvx_port_00(rvx_signal_01)
);

RVX_MODULE_050
#(
  .RVX_GPARA_1(RVX_GPARA_2),
  .RVX_GPARA_2(RVX_GPARA_0),
  .RVX_GPARA_0(RVX_GPARA_1),
  .MEMORY_OPERATION_TYPE(MEMORY_OPERATION_TYPE),
  .RVX_GPARA_3(RVX_GPARA_3),
  .HAS_BURDEN(HAS_BURDEN),
  .BW_BURDEN(BW_BURDEN)
)
i_rvx_instance_1
(
	.rvx_port_26(rvx_port_11),
	.rvx_port_27(rvx_port_04),
  .rvx_port_08(rvx_port_07),
  .rvx_port_38(rvx_port_15),

  .rvx_port_42(rvx_signal_07),
  .rvx_port_41(rvx_signal_09),
  .rvx_port_30(rvx_signal_08),
  .rvx_port_34(rvx_signal_04),
  .rvx_port_25(rvx_signal_00),
  .rvx_port_11(rvx_signal_10),

  .rvx_port_17(rvx_signal_02),
  .rvx_port_22(rvx_signal_03),
  .rvx_port_10(rvx_signal_06),
  .rvx_port_24(rvx_signal_05),
  .rvx_port_05(rvx_signal_01),

  .rvx_port_35(rvx_port_02),
	.rvx_port_21(rvx_port_43),
	.rvx_port_23(rvx_port_42),
	.rvx_port_07(rvx_port_32),
	.rvx_port_12(rvx_port_27),
	.rvx_port_02(rvx_port_03),
	.rvx_port_39(rvx_port_21),

	.rvx_port_16(),
	.rvx_port_33(rvx_port_25),
	.rvx_port_15(rvx_port_17),
	.rvx_port_13(rvx_port_23),
	.rvx_port_06(rvx_port_22),
	.rvx_port_43(rvx_port_41), 

	.rvx_port_19(rvx_port_37),
	.rvx_port_32(rvx_port_33),
	.rvx_port_09(rvx_port_20),
	.rvx_port_04(rvx_port_06),

	.rvx_port_29(rvx_port_19),
	.rvx_port_28(rvx_port_39),
	.rvx_port_37(rvx_port_01),
	.rvx_port_40(rvx_port_40),
	.rvx_port_31(rvx_port_38),
	.rvx_port_44(rvx_port_12),
	.rvx_port_00(rvx_port_16),

	.rvx_port_03(rvx_port_24),
	.rvx_port_36(rvx_port_31),
	.rvx_port_01(rvx_port_09),
	.rvx_port_14(rvx_port_18),
	.rvx_port_20(rvx_port_29),
	.rvx_port_18(rvx_port_30)
);

endmodule
