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




module RVX_MODULE_012 (
	rvx_port_11,
	rvx_port_25,

	rvx_port_05,
	rvx_port_01,
	rvx_port_06,
	rvx_port_22,
	rvx_port_08,
	rvx_port_30,
	rvx_port_34,
	rvx_port_09,

	rvx_port_04,
	rvx_port_32,
	rvx_port_47,
	rvx_port_28,
	rvx_port_39,
	rvx_port_48,
	rvx_port_46,
	rvx_port_03,
	rvx_port_31,

	rvx_port_43,
	rvx_port_44,
	rvx_port_10,
	rvx_port_35,
	rvx_port_33,
	rvx_port_07,
	rvx_port_27,
	rvx_port_49,
	rvx_port_19,

	rvx_port_45,
	rvx_port_42,
	rvx_port_00,
	rvx_port_29,
	rvx_port_21,
	rvx_port_40,
	rvx_port_23,
	rvx_port_12,
	rvx_port_14,

	rvx_port_36,
	rvx_port_26,
	rvx_port_41,
	rvx_port_17,
	rvx_port_18,
	rvx_port_37,
	rvx_port_16,
	rvx_port_38,
	rvx_port_02,
	rvx_port_15,

	rvx_port_13,
	rvx_port_20,
	rvx_port_24
);




parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_6 = 1;
parameter RVX_GPARA_8 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_7 = 1;
parameter RVX_GPARA_5 = 1;
parameter RVX_GPARA_0 = 1;

parameter RVX_GPARA_2 = 0;
parameter RVX_GPARA_4 = 16;

input wire rvx_port_11, rvx_port_25;

input wire rvx_port_05;
input wire rvx_port_01;
input wire [RVX_GPARA_3-1:0] rvx_port_06;
input wire rvx_port_22;
input wire [RVX_GPARA_6-1:0] rvx_port_08;
output wire [RVX_GPARA_6-1:0] rvx_port_30;
output wire rvx_port_34;
output wire rvx_port_09;

input wire rvx_port_04;
output wire rvx_port_32;
output wire [2:0] rvx_port_47;
output wire [2:0] rvx_port_28;
output wire [RVX_GPARA_5-1:0] rvx_port_39;
output wire [RVX_GPARA_7-1:0] rvx_port_48;
output reg [RVX_GPARA_8-1:0] rvx_port_46;
output wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_03;
output wire [RVX_GPARA_1-1:0] rvx_port_31;

output wire rvx_port_43;
input wire rvx_port_44;
input wire [2:0] rvx_port_10;
input wire [1:0] rvx_port_35;
input wire [RVX_GPARA_5-1:0] rvx_port_33;
input wire [RVX_GPARA_7-1:0] rvx_port_07;
input wire [RVX_GPARA_8-1:0] rvx_port_27;
input wire [`BW_AXI_WSTRB(RVX_GPARA_1)-1:0] rvx_port_49;
input wire [RVX_GPARA_1-1:0] rvx_port_19;

input wire rvx_port_45;
output wire rvx_port_42;
output wire [2:0] rvx_port_00;
output wire [2:0] rvx_port_29;
output wire [RVX_GPARA_5-1:0] rvx_port_21;
output wire [RVX_GPARA_7-1:0] rvx_port_40;
output wire [RVX_GPARA_8-1:0] rvx_port_23;
output wire [RVX_GPARA_1-1:0] rvx_port_12;
output wire rvx_port_14;

output wire rvx_port_36;
input wire rvx_port_26;
input wire [2:0] rvx_port_41;
input wire [1:0] rvx_port_17;
input wire [RVX_GPARA_5-1:0] rvx_port_18;
input wire [RVX_GPARA_7-1:0] rvx_port_37;
input wire rvx_port_16;
input wire [RVX_GPARA_0-1:0] rvx_port_38;
input wire [RVX_GPARA_1-1:0] rvx_port_02;
input wire rvx_port_15;

input wire rvx_port_13;
output wire rvx_port_20;
output wire rvx_port_24;

genvar i;

`define RVX_LDEF_2 2
`define RVX_LDEF_0 0
`define RVX_LDEF_1 1
`define RVX_LDEF_3 2

reg [`RVX_LDEF_2-1:0] rvx_signal_0;
wire rvx_signal_4;
wire rvx_signal_2;
wire rvx_signal_1;

wire [`BW_AXI_WSTRB(RVX_GPARA_6)-1:0] rvx_signal_3;

always@(posedge rvx_port_11, negedge rvx_port_25)
begin
	if(rvx_port_25==0)
		rvx_signal_0 <= `RVX_LDEF_0;
	else
		case(rvx_signal_0)
			`RVX_LDEF_0:
				if(rvx_signal_4)
					rvx_signal_0 <= `RVX_LDEF_1;
			`RVX_LDEF_1:
				if(rvx_signal_2)
				begin
					if(rvx_signal_1)
						rvx_signal_0 <= `RVX_LDEF_0;
					else
						rvx_signal_0 <= `RVX_LDEF_3;
				end
			`RVX_LDEF_3:
				if(rvx_signal_1)
					rvx_signal_0 <= `RVX_LDEF_0;
		endcase
end

assign rvx_signal_4 = (rvx_signal_0==`RVX_LDEF_0) & rvx_port_05 & rvx_port_01;
assign rvx_signal_2 = rvx_port_32 & rvx_port_04;
assign rvx_signal_1 = rvx_port_26 & rvx_port_36;

assign rvx_port_32 = (rvx_signal_0==`RVX_LDEF_1);
assign rvx_port_47 = (rvx_port_22==1)? `RVX_GDEF_022 : `RVX_GDEF_066;
assign rvx_port_28 = 0;
assign rvx_port_39 = `GET_AXI_SIZE(RVX_GPARA_6);
assign rvx_port_48 = 0;
always@(*)
begin
	rvx_port_46 = RVX_GPARA_2;
	rvx_port_46[RVX_GPARA_4-1:0] = rvx_port_06[RVX_GPARA_4-1:0];
end

assign rvx_signal_3 = -1;
assign rvx_port_03 = $unsigned(rvx_signal_3);
assign rvx_port_31 = $unsigned(rvx_port_08);

assign rvx_port_36 = (rvx_signal_0==`RVX_LDEF_1) | (rvx_signal_0==`RVX_LDEF_3);
assign rvx_port_30 = $unsigned(rvx_port_02);
assign rvx_port_34 = rvx_signal_1;
assign rvx_port_09 = rvx_port_15;

assign rvx_port_43 = 0;

assign rvx_port_42 = 0;
assign rvx_port_00 = 0;
assign rvx_port_29 = 0;
assign rvx_port_21 = 0;
assign rvx_port_40 = 0;
assign rvx_port_23 = 0;
assign rvx_port_12 = 0;
assign rvx_port_14 = 0;

assign rvx_port_20 = 0;
assign rvx_port_24 = 0;

`undef RVX_LDEF_2
`undef RVX_LDEF_0
`undef RVX_LDEF_1
`undef RVX_LDEF_3
endmodule
