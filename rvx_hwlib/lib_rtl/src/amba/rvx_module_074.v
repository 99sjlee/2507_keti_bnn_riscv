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





module RVX_MODULE_074
(
	rvx_port_12,
	rvx_port_15,
	rvx_port_03,
	rvx_port_07,
	rvx_port_18,
	rvx_port_00,
	rvx_port_19,
	rvx_port_09,
	rvx_port_02,
	rvx_port_13,

	rvx_port_16,
	rvx_port_14,
	rvx_port_04,
	rvx_port_06,
	rvx_port_05,
	rvx_port_17,
	rvx_port_11,
	rvx_port_01,
	rvx_port_08,
	rvx_port_10
);





parameter RVX_GPARA_2 = 8;
parameter RVX_GPARA_1 = 32;

parameter RVX_GPARA_3 = RVX_GPARA_2+1+RVX_GPARA_1;
parameter RVX_GPARA_0 = RVX_GPARA_1+1;

input wire rvx_port_12;
input wire rvx_port_15;
input wire rvx_port_03;
input wire rvx_port_07;
input wire [RVX_GPARA_2-1:0] rvx_port_18;
input wire rvx_port_00;
input wire [RVX_GPARA_1-1:0] rvx_port_19;
output wire [RVX_GPARA_1-1:0] rvx_port_09;
output wire rvx_port_02;
output wire rvx_port_13;

input wire rvx_port_16;
input wire rvx_port_14;
output wire rvx_port_04;
output wire rvx_port_06;
output wire [RVX_GPARA_2-1:0] rvx_port_05;
output wire rvx_port_17;
output wire [RVX_GPARA_1-1:0] rvx_port_11;
input wire [RVX_GPARA_1-1:0] rvx_port_01;
input wire rvx_port_08;
input wire rvx_port_10;

wire rvx_signal_03;
wire [RVX_GPARA_3-1:0] rvx_signal_04;
wire rvx_signal_01;
wire [RVX_GPARA_0-1:0] rvx_signal_07;

`define RVX_LDEF_2 0
`define RVX_LDEF_3 1
reg rvx_signal_00;

`define RVX_LDEF_0 0
`define RVX_LDEF_1 1
reg rvx_signal_05;

wire rvx_signal_02;
wire [RVX_GPARA_3-1:0] rvx_signal_09;
wire rvx_signal_06;
wire [RVX_GPARA_0-1:0] rvx_signal_08;

RVX_MODULE_047
#(
	.RVX_GPARA_1(RVX_GPARA_3),
	.RVX_GPARA_0(RVX_GPARA_0)
)
i_rvx_instance_0
(
	.rvx_port_11(rvx_port_12),
	.rvx_port_07(rvx_port_15),
	.rvx_port_03(rvx_signal_03),
	.rvx_port_08(rvx_signal_04),
	.rvx_port_09(rvx_signal_01),
	.rvx_port_06(rvx_signal_07),

	.rvx_port_05(rvx_port_16),
	.rvx_port_00(rvx_port_14),
	.rvx_port_02(rvx_signal_02),
	.rvx_port_01(rvx_signal_09),
	.rvx_port_10(rvx_signal_06),
	.rvx_port_04(rvx_signal_08)
);

always @(posedge rvx_port_12 or negedge rvx_port_15)
begin
	if (!rvx_port_15)
		rvx_signal_00 <= `RVX_LDEF_2;
	else if((rvx_signal_00==`RVX_LDEF_2)&&rvx_signal_03)
		rvx_signal_00 <= `RVX_LDEF_3;
	else if((rvx_signal_00==`RVX_LDEF_3)&&rvx_signal_01)
		rvx_signal_00 <= `RVX_LDEF_2;
end

assign rvx_signal_03 = rvx_port_03 & rvx_port_07;
assign rvx_signal_04 = {rvx_port_18,rvx_port_00,rvx_port_19};
assign rvx_port_02 = (rvx_signal_00==`RVX_LDEF_3) & rvx_signal_01;
assign {rvx_port_09,rvx_port_13} = rvx_signal_07;

always @(posedge rvx_port_16 or negedge rvx_port_14)
begin
	if (!rvx_port_14)
		rvx_signal_05 <= `RVX_LDEF_0;
	else if((rvx_signal_05==`RVX_LDEF_0)&&rvx_signal_02)
		rvx_signal_05 <= `RVX_LDEF_1;
	else if((rvx_signal_05==`RVX_LDEF_1)&&rvx_port_08)
		rvx_signal_05 <= `RVX_LDEF_0;
end

assign rvx_port_04 = rvx_signal_02;
assign rvx_port_06 = rvx_signal_05;
assign {rvx_port_05,rvx_port_17,rvx_port_11} = rvx_signal_09;
assign rvx_signal_06 = (rvx_signal_05==`RVX_LDEF_1) & rvx_port_08;
assign rvx_signal_08 = {rvx_port_01,rvx_port_10};

`undef RVX_LDEF_3
`undef RVX_LDEF_2
`undef RVX_LDEF_1
`undef RVX_LDEF_0
endmodule

