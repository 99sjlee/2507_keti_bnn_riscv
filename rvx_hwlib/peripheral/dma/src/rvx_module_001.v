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
`include "rvx_include_06.vh"





module RVX_MODULE_001
(
	rvx_port_10,
	rvx_port_18,

	rvx_port_06,
	rvx_port_05,
	rvx_port_17,
	rvx_port_03,
	rvx_port_04,

	rvx_port_16,
	rvx_port_20,

	rvx_port_08,
	rvx_port_12,
	rvx_port_02,

	rvx_port_15,
	rvx_port_14,
	rvx_port_23,
	rvx_port_01,
	rvx_port_19,
	rvx_port_22,
	rvx_port_09,
	rvx_port_07,
	rvx_port_13,
	rvx_port_24,
	rvx_port_11,
	rvx_port_00,
	rvx_port_21
);





parameter RVX_GPARA_0 = 32;
parameter BW_AXI_DATA = 32;
parameter RVX_GPARA_1 = 4;

`include "rvx_include_14.vh"

input wire rvx_port_10, rvx_port_18;

input wire [RVX_GPARA_0-1:0] rvx_port_06;
input wire [BW_LINE_SIZE-1:0] rvx_port_05;
input wire [BW_NUM_LINES-1:0] rvx_port_17;
input wire [RVX_GPARA_0-1:0] rvx_port_03;
input wire rvx_port_04;
input wire rvx_port_16;
output wire rvx_port_20;

output wire rvx_port_08;
output wire [BW_DATA_BUFFER-1:0] rvx_port_12;
input wire rvx_port_02;

output wire [RVX_GPARA_1-1:0] rvx_port_15;
output wire [RVX_GPARA_0-1:0] rvx_port_14;
output wire [`BW_AXI_ALEN-1:0] rvx_port_23;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_01;
output wire [`BW_AXI_ABURST-1:0] rvx_port_19;
output wire rvx_port_22;
input wire rvx_port_09;

input wire [RVX_GPARA_1-1:0] rvx_port_07;
input wire [BW_AXI_DATA-1:0] rvx_port_13;
input wire [`BW_AXI_RRESP-1:0] rvx_port_24;
input wire rvx_port_11;
input wire rvx_port_00;
output wire rvx_port_21;

wire rvx_signal_3;
wire rvx_signal_1;
wire rvx_signal_2;

wire [RVX_GPARA_0-1:0] rvx_signal_0;
wire rvx_signal_4;

assign rvx_port_14 = rvx_signal_0;
assign rvx_port_15 = 0;
assign rvx_port_01 = AXI_SIZE;

assign rvx_port_21 = rvx_port_02;
assign rvx_port_08 = rvx_port_00;
assign rvx_port_12 = {rvx_port_13, rvx_port_11};

assign rvx_signal_3 = (rvx_port_09 && rvx_port_22);
assign rvx_signal_1 = rvx_port_00 && rvx_port_21;
assign rvx_signal_2 = (rvx_port_11 && rvx_signal_1);

assign rvx_port_19 = (rvx_signal_4)? `AXI_BURST_INCR: `AXI_BURST_FIXED;

RVX_MODULE_017
#(
	.RVX_GPARA_0(RVX_GPARA_0),
	.BW_AXI_DATA(BW_AXI_DATA),
	.MAX_AXI_LENGTH(MAX_AXI_LENGTH)
)
i_rvx_instance_0
(
	.rvx_port_00(rvx_port_10),
	.rvx_port_14(rvx_port_18),
	.rvx_port_05(rvx_port_06),
	.rvx_port_13(rvx_port_05),
	.rvx_port_04(rvx_port_17),
	.rvx_port_11(rvx_port_03),
	.rvx_port_12(rvx_port_04),
	.rvx_port_06(rvx_port_16),
	.rvx_port_07(rvx_port_20),
	.rvx_port_03(rvx_signal_0),
	.rvx_port_10(rvx_signal_4),
	.rvx_port_08(rvx_port_23),
	.rvx_port_02(),
	.rvx_port_01(rvx_port_22),
	.rvx_port_09(rvx_port_09)
);

endmodule
