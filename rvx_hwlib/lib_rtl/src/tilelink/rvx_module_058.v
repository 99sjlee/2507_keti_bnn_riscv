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
`include "rvx_include_18.vh"
`include "ervp_axi_define.vh"




module RVX_MODULE_058 (
	rvx_port_26,
	rvx_port_24,

	rvx_port_09,
	rvx_port_20,
	rvx_port_16,
	rvx_port_03,
	rvx_port_12,
	rvx_port_18,
	rvx_port_22,
	rvx_port_25,

	rvx_port_07,
	rvx_port_21,
	rvx_port_23,
	rvx_port_14,
	rvx_port_02,
	rvx_port_15,
	rvx_port_28,
	rvx_port_27,
	rvx_port_06,
	rvx_port_08,

	rvx_port_17,
	rvx_port_13,
	rvx_port_19,
	rvx_port_01,
	rvx_port_04,
	rvx_port_11,
	rvx_port_00,
	rvx_port_10,
	rvx_port_05
);




parameter RVX_GPARA_4 = 1;
parameter RVX_GPARA_5 = 1;

parameter RVX_GPARA_6 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_7 = 1;
parameter RVX_GPARA_8 = 1;
localparam  RVX_LPARA_0 = `BW_AXI_WSTRB(RVX_GPARA_0);

parameter RVX_GPARA_2 = 0;
parameter RVX_GPARA_1 = 16;

input wire rvx_port_26, rvx_port_24;

input wire rvx_port_09;
input wire rvx_port_20;
input wire [RVX_GPARA_4-1:0] rvx_port_16;
input wire rvx_port_03;
input wire [RVX_GPARA_5-1:0] rvx_port_12;
output wire [RVX_GPARA_5-1:0] rvx_port_18;
output wire rvx_port_22;
output wire rvx_port_25;

input wire rvx_port_07;
output wire rvx_port_21;
output wire [`RVX_GDEF_324-1:0] rvx_port_23;
output wire [`RVX_GDEF_202-1:0] rvx_port_14;
output wire [RVX_GPARA_7-1:0] rvx_port_02;
output wire [RVX_GPARA_3-1:0] rvx_port_15;
output reg [RVX_GPARA_6-1:0] rvx_port_28;
output wire [RVX_LPARA_0-1:0] rvx_port_27;
output wire [RVX_GPARA_0-1:0] rvx_port_06;
output wire rvx_port_08;

output wire rvx_port_17;
input wire rvx_port_13;
input wire [`RVX_GDEF_324-1:0] rvx_port_19;
input wire [`RVX_GDEF_202-1:0] rvx_port_01;
input wire [RVX_GPARA_7-1:0] rvx_port_04;
input wire [RVX_GPARA_3-1:0] rvx_port_11;
input wire [RVX_GPARA_8-1:0] rvx_port_00;
input wire [RVX_GPARA_0-1:0] rvx_port_10;
input wire rvx_port_05;

genvar i;

`define RVX_LDEF_3 2
`define RVX_LDEF_1 0
`define RVX_LDEF_2 1
`define RVX_LDEF_0 2

reg [`RVX_LDEF_3-1:0] rvx_signal_0;
wire rvx_signal_1;
wire rvx_signal_3;
wire rvx_signal_4;

wire [`BW_AXI_WSTRB(RVX_GPARA_5)-1:0] rvx_signal_2;

always@(posedge rvx_port_26, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_0 <= `RVX_LDEF_1;
	else
		case(rvx_signal_0)
			`RVX_LDEF_1:
				if(rvx_signal_1)
					rvx_signal_0 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
				if(rvx_signal_3)
				begin
					if(rvx_signal_4)
						rvx_signal_0 <= `RVX_LDEF_1;
					else
						rvx_signal_0 <= `RVX_LDEF_0;
				end
			`RVX_LDEF_0:
				if(rvx_signal_4)
					rvx_signal_0 <= `RVX_LDEF_1;
		endcase
end

assign rvx_signal_1 = (rvx_signal_0==`RVX_LDEF_1) & rvx_port_09 & rvx_port_20;
assign rvx_signal_3 = rvx_port_21 & rvx_port_07;
assign rvx_signal_4 = rvx_port_13 & rvx_port_17;

assign rvx_port_21 = (rvx_signal_0==`RVX_LDEF_2);
assign rvx_port_23 = (rvx_port_03==1)? `RVX_GDEF_022 : `RVX_GDEF_066;
assign rvx_port_14 = 0;
assign rvx_port_02 = `GET_AXI_SIZE(RVX_GPARA_5);
assign rvx_port_15 = 0;
always@(*)
begin
	rvx_port_28 = RVX_GPARA_2;
	rvx_port_28[RVX_GPARA_1-1:0] = rvx_port_16[RVX_GPARA_1-1:0];
end

assign rvx_signal_2 = -1;
assign rvx_port_27 = $unsigned(rvx_signal_2);
assign rvx_port_06 = $unsigned(rvx_port_12);

assign rvx_port_17 = (rvx_signal_0==`RVX_LDEF_2) | (rvx_signal_0==`RVX_LDEF_0);
assign rvx_port_18 = $unsigned(rvx_port_10);
assign rvx_port_22 = rvx_signal_4;
assign rvx_port_25 = 0;

`undef RVX_LDEF_3
`undef RVX_LDEF_1
`undef RVX_LDEF_2
`undef RVX_LDEF_0
endmodule
