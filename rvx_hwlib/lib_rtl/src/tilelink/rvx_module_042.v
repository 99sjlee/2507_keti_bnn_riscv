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





module RVX_MODULE_042 (
	rvx_port_19,
	rvx_port_04,

	rvx_port_24,
	rvx_port_29,
	rvx_port_30,
	rvx_port_32,
	rvx_port_37,
	rvx_port_10,
	rvx_port_01,
	rvx_port_40,
	rvx_port_27,
	rvx_port_33,

	rvx_port_25,
	rvx_port_41,
	rvx_port_47,
	rvx_port_20,
	rvx_port_15,
	rvx_port_12,
	rvx_port_18,
	rvx_port_26,
	rvx_port_34,
	rvx_port_23,

	rvx_port_43,
	rvx_port_28,
	rvx_port_46,
	rvx_port_31,
	rvx_port_03,
	rvx_port_44,

	rvx_port_22,
	rvx_port_07,
	rvx_port_16,
	rvx_port_05,
	rvx_port_14,
	rvx_port_17,
	rvx_port_13,

	rvx_port_45,
	rvx_port_38,
	rvx_port_21,
	rvx_port_06,
	rvx_port_35,
	rvx_port_02,

	rvx_port_08,
	rvx_port_42,
	rvx_port_39,
	rvx_port_00,
	rvx_port_11,
	rvx_port_09,
	rvx_port_36
);





parameter RVX_GPARA_3 = 1; 
parameter RVX_GPARA_2 = 1; 
parameter RVX_GPARA_5 = 1; 
parameter RVX_GPARA_4 = 1; 
parameter RVX_GPARA_1 = 1; 

localparam  RVX_LPARA_3 = (RVX_GPARA_3/8); 
localparam  RVX_LPARA_2 = `RVX_GDEF_106(RVX_GPARA_5,RVX_GPARA_4);

parameter RVX_GPARA_0 = 4;

localparam  RVX_LPARA_1 = RVX_GPARA_2;
localparam  RVX_LPARA_0 = RVX_GPARA_3;

input wire rvx_port_19, rvx_port_04;

output wire rvx_port_24;
input wire rvx_port_29;
input wire [`RVX_GDEF_324-1:0] rvx_port_30;
input wire [`RVX_GDEF_202-1:0] rvx_port_32;
input wire [RVX_GPARA_4-1:0] rvx_port_37;
input wire [RVX_GPARA_5-1:0] rvx_port_10;
input wire [RVX_GPARA_2-1:0] rvx_port_01;
input wire [RVX_LPARA_3-1:0] rvx_port_40;
input wire [RVX_GPARA_3-1:0] rvx_port_27;
input wire rvx_port_33;

output wire rvx_port_25;
input wire rvx_port_41;
input wire [`RVX_GDEF_324-1:0] rvx_port_47;
input wire [`RVX_GDEF_202-1:0] rvx_port_20;
input wire [RVX_GPARA_4-1:0] rvx_port_15;
input wire [RVX_GPARA_5-1:0] rvx_port_12;
input wire [RVX_GPARA_2-1:0] rvx_port_18;
input wire [RVX_LPARA_3-1:0] rvx_port_26;
input wire [RVX_GPARA_3-1:0] rvx_port_34;
input wire rvx_port_23;

input wire rvx_port_43;
output wire rvx_port_28;
output wire [RVX_LPARA_2-1:0] rvx_port_46;
input wire rvx_port_31;
output wire rvx_port_03;
output wire [RVX_LPARA_2-1:0] rvx_port_44;

output wire [RVX_GPARA_0-1:0] rvx_port_22;
output wire [RVX_LPARA_1-1:0] rvx_port_07;
output wire [`BW_AXI_ALEN-1:0] rvx_port_16;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_05;
output wire [`BW_AXI_ABURST-1:0] rvx_port_14;
output wire rvx_port_17;
input wire rvx_port_13;

output wire [RVX_GPARA_0-1:0] rvx_port_45;
output wire [RVX_LPARA_0-1:0] rvx_port_38;
output wire [`BW_AXI_WSTRB(RVX_LPARA_0)-1:0] rvx_port_21;
output wire rvx_port_06;
output wire rvx_port_35;
input wire rvx_port_02;

output wire [RVX_GPARA_0-1:0] rvx_port_08;
output wire [RVX_LPARA_1-1:0] rvx_port_42;
output wire [`BW_AXI_ALEN-1:0] rvx_port_39;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_00;
output wire [`BW_AXI_ABURST-1:0] rvx_port_11;
output wire rvx_port_09;
input wire rvx_port_36;

wire [`RVX_GDEF_179-1:0] rvx_signal_08;
wire rvx_signal_01;
wire [`RVX_GDEF_324-1:0] rvx_signal_07;
wire [`RVX_GDEF_202-1:0] rvx_signal_23;
wire [RVX_GPARA_4-1:0] rvx_signal_00;
wire [RVX_GPARA_5-1:0] rvx_signal_19;
wire [RVX_GPARA_2-1:0] rvx_signal_09;
wire [RVX_LPARA_3-1:0] rvx_signal_29;
wire [RVX_GPARA_3-1:0] rvx_signal_03;
wire rvx_signal_15;
wire rvx_signal_20;
wire rvx_signal_05;
wire rvx_signal_26;

reg rvx_signal_25;
reg rvx_signal_17;
reg rvx_signal_27;

reg [`BW_AXI_ALEN-1:0] rvx_signal_18, rvx_signal_11;
reg [`BW_AXI_ASIZE-1:0] rvx_signal_12, rvx_signal_13;
reg [`BW_AXI_ABURST-1:0] rvx_signal_06, rvx_signal_04;
reg rvx_signal_14;

wire [RVX_GPARA_0-1:0] rvx_signal_22;

`define RVX_LDEF_0 3
`define RVX_LDEF_5 0
`define RVX_LDEF_3 1
`define RVX_LDEF_4 2
`define RVX_LDEF_2 3
`define RVX_LDEF_1 4

reg [`RVX_LDEF_0-1:0] rvx_signal_10;
wire rvx_signal_21;
wire rvx_signal_30, rvx_signal_24;
wire rvx_signal_31;
wire rvx_signal_16;
wire rvx_signal_28;
reg [`BW_AXI_ALEN-1:0] rvx_signal_02;

RVX_MODULE_100
#(
	.RVX_GPARA_2(RVX_GPARA_3),
	.RVX_GPARA_0(RVX_GPARA_2),
	.RVX_GPARA_1(RVX_GPARA_5),
	.RVX_GPARA_3(RVX_GPARA_4),
	.RVX_GPARA_4(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.rvx_port_12(rvx_port_19),
	.rvx_port_02(rvx_port_04),

	.rvx_port_18(rvx_port_24),
	.rvx_port_27(rvx_port_29),
	.rvx_port_32(rvx_port_30),
	.rvx_port_10(rvx_port_32),
	.rvx_port_04(rvx_port_37),
	.rvx_port_08(rvx_port_10),
	.rvx_port_15(rvx_port_01),
	.rvx_port_16(rvx_port_40),
	.rvx_port_07(rvx_port_27),
	.rvx_port_25(rvx_port_33),

	.rvx_port_06(rvx_port_25),
	.rvx_port_28(rvx_port_41),
	.rvx_port_14(rvx_port_47),
	.rvx_port_34(rvx_port_20),
	.rvx_port_21(rvx_port_15),
	.rvx_port_09(rvx_port_12),
	.rvx_port_30(rvx_port_18),
	.rvx_port_13(rvx_port_26),
	.rvx_port_03(rvx_port_34),
	.rvx_port_26(rvx_port_23),

	.rvx_port_23(rvx_signal_01),
	.rvx_port_29(rvx_signal_08),
	.rvx_port_17(rvx_signal_07),
	.rvx_port_01(rvx_signal_23),
	.rvx_port_19(rvx_signal_00),
	.rvx_port_05(rvx_signal_19),
	.rvx_port_24(rvx_signal_09),
	.rvx_port_22(rvx_signal_29),
	.rvx_port_33(rvx_signal_03),
	.rvx_port_31(rvx_signal_15),
	.rvx_port_00(rvx_signal_20),
	.rvx_port_11(rvx_signal_05),
	.rvx_port_20(rvx_signal_26)
);

always@(*)
begin
	rvx_signal_25 = 0;
	rvx_signal_17 = 0;
	rvx_signal_27 = 0;
	case(rvx_signal_08)
		`RVX_GDEF_060:
			case(rvx_signal_07)
				4,6: rvx_signal_25 = 1;
				0,1: rvx_signal_17 = 1;
				default: rvx_signal_27 = 1;
			endcase
		`RVX_GDEF_280:
			case(rvx_signal_07)
				1: rvx_signal_25 = 1;
				0,7: rvx_signal_17 = 1;
				default: rvx_signal_27 = 1;
			endcase
		default: rvx_signal_27 = 1;
	endcase
end

always@(posedge rvx_port_19, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_10 <= `RVX_LDEF_5;
	else if(rvx_signal_21)
		rvx_signal_10 <= `RVX_LDEF_1;
	else
		case(rvx_signal_10)
			`RVX_LDEF_5:
				if(rvx_signal_30)
					rvx_signal_10 <= `RVX_LDEF_3;
				else if(rvx_signal_24)
					rvx_signal_10 <= `RVX_LDEF_4;
			`RVX_LDEF_3:
				if(rvx_signal_31)
					rvx_signal_10 <= `RVX_LDEF_5;
			`RVX_LDEF_4:
				if(rvx_signal_16)
					rvx_signal_10 <= `RVX_LDEF_2;
			`RVX_LDEF_2:
				if(rvx_signal_28 & rvx_port_06)
					rvx_signal_10 <= `RVX_LDEF_5;
		endcase
end

assign rvx_signal_21 = rvx_signal_01 & (rvx_signal_27|rvx_signal_14);
assign rvx_signal_30 = (rvx_signal_10==`RVX_LDEF_5) & rvx_port_43 & rvx_signal_01 & rvx_signal_25;
assign rvx_signal_24 = (rvx_signal_10==`RVX_LDEF_5) & rvx_port_31 & rvx_signal_01 & rvx_signal_17;

assign rvx_signal_31 = rvx_port_09 & rvx_port_36;
assign rvx_signal_16 = rvx_port_17 & rvx_port_13;
assign rvx_signal_28 = rvx_port_35 & rvx_port_02;

always@(*)
begin
	rvx_signal_18 = 0;
	rvx_signal_12 = 0;
	rvx_signal_06 = 0;
	rvx_signal_14 = 0;
	case(rvx_signal_00)
		0,1,2:
		begin
			rvx_signal_06 = `AXI_BURST_FIXED;
			rvx_signal_12 = rvx_signal_00;
		end
		3,4,5,6:
		begin
			rvx_signal_06 = `AXI_BURST_INCR;
			rvx_signal_12 = `AXI_SIZE_004BYTE;
		end
		default:
			rvx_signal_14 = 1;
	endcase
	case(rvx_signal_00)
		0,1,2: rvx_signal_18 = `AXI_LENGTH_01;
		3: rvx_signal_18 = `AXI_LENGTH_02;
		4: rvx_signal_18 = `AXI_LENGTH_04;
		5: rvx_signal_18 = `AXI_LENGTH_08;
		6: rvx_signal_18 = `AXI_LENGTH_16;
	endcase
end

always@(posedge rvx_port_19, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
	begin
		rvx_signal_11 <= 0;
		rvx_signal_13 <= 0;
		rvx_signal_04 <= 0;
	end
	else if(rvx_signal_30 | rvx_signal_24)
	begin
		rvx_signal_11 <= rvx_signal_18;
		rvx_signal_13 <= rvx_signal_12;
		rvx_signal_04 <= rvx_signal_06;
	end
end

always@(posedge rvx_port_19, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_02 <= 0;
	else if(rvx_signal_24)
		rvx_signal_02 <= rvx_signal_18;
	else if(rvx_signal_10==`RVX_LDEF_2)
	begin
		if(rvx_signal_28)
			rvx_signal_02 <= $unsigned(rvx_signal_02) - 1;
	end
end

assign rvx_signal_22 = 0;

assign rvx_port_08 = $unsigned(rvx_signal_22);
assign rvx_port_42 = rvx_signal_09;
assign rvx_port_39 = rvx_signal_11;
assign rvx_port_00 = rvx_signal_13;
assign rvx_port_11 = rvx_signal_04;
assign rvx_port_09 = (rvx_signal_10==`RVX_LDEF_3) & rvx_signal_01;

assign rvx_port_22 = $unsigned(rvx_signal_22);
assign rvx_port_07 = rvx_signal_09;
assign rvx_port_16 = rvx_signal_11;
assign rvx_port_05 = rvx_signal_13;
assign rvx_port_14 = rvx_signal_04;
assign rvx_port_17 = (rvx_signal_10==`RVX_LDEF_4) & rvx_signal_01;

assign rvx_port_45 = $unsigned(rvx_signal_22);
assign rvx_port_38 = rvx_signal_03;
assign rvx_port_21 = rvx_signal_29;
assign rvx_port_06 = (rvx_signal_02==0);
assign rvx_port_35 = (rvx_signal_10==`RVX_LDEF_2) & rvx_signal_01;

assign rvx_signal_20 = rvx_signal_30 | rvx_signal_24;
assign rvx_signal_05 = ((rvx_signal_10==`RVX_LDEF_3) & rvx_port_36) | ((rvx_signal_10==`RVX_LDEF_2) & rvx_port_02);
assign rvx_signal_26 = (rvx_signal_10==`RVX_LDEF_3) | ((rvx_signal_10==`RVX_LDEF_2) & rvx_port_06);

assign rvx_port_28 = rvx_signal_31;
assign rvx_port_46 = {rvx_signal_08,rvx_signal_07,rvx_signal_19,rvx_signal_00};

assign rvx_port_03 = rvx_signal_28 & rvx_port_06;
assign rvx_port_44 = {rvx_signal_08,rvx_signal_07,rvx_signal_19,rvx_signal_00};

`undef RVX_LDEF_2
`undef RVX_LDEF_1
`undef RVX_LDEF_0
`undef RVX_LDEF_5
`undef RVX_LDEF_4
`undef RVX_LDEF_3
endmodule
