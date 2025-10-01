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
`include "rvx_include_11.vh"




module RVX_MODULE_069
(
	rvx_port_15,
	rvx_port_04,

	rvx_port_18,
	rvx_port_14,
	rvx_port_00,
	rvx_port_01,
	rvx_port_13,
	rvx_port_16,
	rvx_port_09,
	rvx_port_12,

	rvx_port_02,
	rvx_port_08,
	rvx_port_03,
	rvx_port_07,
	rvx_port_11,
	rvx_port_17,
	rvx_port_10,
	rvx_port_05,
	rvx_port_06
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_15, rvx_port_04;
input wire rvx_port_18;
input wire rvx_port_14;
input wire [RVX_GPARA_0-1:0] rvx_port_00;
input wire rvx_port_01;
input wire [RVX_GPARA_1-1:0] rvx_port_13;
output wire [RVX_GPARA_1-1:0] rvx_port_16;
output reg rvx_port_09;
output reg rvx_port_12;

input wire rvx_port_02;

output wire rvx_port_08;
input wire [5-1:0] rvx_port_03;
output wire rvx_port_07;
output wire [5-1:0] rvx_port_11;

output wire [32-1:0] rvx_port_17;

output wire rvx_port_10;

output wire [32-1:0] rvx_port_05;

output wire [32-1:0] rvx_port_06;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_11;
reg [RVX_GPARA_1-1:0] rvx_signal_03;
wire rvx_signal_37;
wire rvx_signal_13;
wire rvx_signal_01;

wire [`RVX_GDEF_123-1:0] paddr_offset = rvx_port_00;
wire [`RVX_GDEF_123-1:0] rvx_signal_34;
wire [RVX_GPARA_0-1:0] rvx_signal_04;
wire [`RVX_GDEF_298-1:0] rvx_signal_00;
wire [`RVX_GDEF_298-1:0] addr_unused = 0;
reg rvx_signal_31;
wire [5-1:0] rvx_signal_27;
reg rvx_signal_09;
wire [5-1:0] rvx_signal_33;
wire rvx_signal_06;
reg rvx_signal_22;
wire [32-1:0] rvx_signal_18;
reg rvx_signal_25;
wire [32-1:0] rvx_signal_20;
wire rvx_signal_23;
reg [32-1:0] rvx_signal_36;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_15;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_26;
wire rvx_signal_10;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_05;
reg rvx_signal_32;
wire [32-1:0] rvx_signal_21;
wire rvx_signal_19;
reg [32-1:0] rvx_signal_02;
reg rvx_signal_28;
wire [32-1:0] rvx_signal_24;
reg rvx_signal_08;
wire [32-1:0] rvx_signal_12;
wire rvx_signal_07;
reg [32-1:0] rvx_signal_29;

assign rvx_signal_11 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_13);
assign rvx_port_16 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_03);
assign {rvx_signal_04,rvx_signal_00} = paddr_offset;
assign rvx_signal_34 = {rvx_signal_04,addr_unused};
assign rvx_signal_01 = (rvx_signal_00==0);
assign rvx_signal_37 = rvx_port_18 & rvx_port_14 & rvx_signal_01 & (~rvx_port_01);
assign rvx_signal_13 = rvx_port_18 & rvx_port_14 & rvx_signal_01 & rvx_port_01;

assign rvx_signal_33 = $unsigned(rvx_port_13);
assign rvx_signal_20 = $unsigned(rvx_port_13);
assign rvx_signal_26 = $unsigned(rvx_port_13);
assign rvx_signal_21 = $unsigned(rvx_port_13);
assign rvx_signal_12 = $unsigned(rvx_port_13);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_03 = 0;
	rvx_port_09 = 1;

	rvx_signal_31 = 0;
	rvx_signal_09 = 0;

	rvx_signal_22 = 0;
	rvx_signal_25 = 0;

	rvx_signal_16 = 0;
	rvx_signal_17 = 0;

	rvx_signal_30 = 0;
	rvx_signal_32 = 0;

	rvx_signal_28 = 0;
	rvx_signal_08 = 0;

	if(rvx_port_18==1'b 1)
	begin
		case(rvx_signal_34)
			`RVX_GDEF_117:
			begin
				rvx_signal_31 = rvx_signal_37;
				rvx_signal_09 = rvx_signal_13;
				rvx_signal_03 = $unsigned(rvx_signal_27);
				rvx_port_09 = rvx_signal_06;
			end
			`RVX_GDEF_033:
			begin
				rvx_signal_22 = rvx_signal_37;
				rvx_signal_25 = rvx_signal_13;
				rvx_signal_03 = $unsigned(rvx_signal_18);
				rvx_port_09 = rvx_signal_23;
			end
			`RVX_GDEF_049:
			begin
				rvx_signal_16 = rvx_signal_37;
				rvx_signal_17 = rvx_signal_13;
				rvx_signal_03 = $unsigned(rvx_signal_15);
				rvx_port_09 = rvx_signal_10;
			end
			`RVX_GDEF_146:
			begin
				rvx_signal_30 = rvx_signal_37;
				rvx_signal_32 = rvx_signal_13;
				rvx_signal_03 = $unsigned(rvx_signal_05);
				rvx_port_09 = rvx_signal_19;
			end
			`RVX_GDEF_374:
			begin
				rvx_signal_28 = rvx_signal_37;
				rvx_signal_08 = rvx_signal_13;
				rvx_signal_03 = $unsigned(rvx_signal_24);
				rvx_port_09 = rvx_signal_07;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

always@(posedge rvx_port_15, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_36 <= `RVX_GDEF_078;
	else if (rvx_signal_25==1'b 1)
		rvx_signal_36 <= rvx_signal_20;
end
assign rvx_signal_18 = rvx_signal_36;
always@(posedge rvx_port_15, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_02 <= `RVX_GDEF_342;
	else if (rvx_signal_32==1'b 1)
		rvx_signal_02 <= rvx_signal_21;
end
assign rvx_signal_05 = rvx_signal_02;
always@(posedge rvx_port_15, negedge rvx_port_04)
begin
	if(rvx_port_04==0)
		rvx_signal_29 <= `RVX_GDEF_401;
	else if (rvx_signal_08==1'b 1)
		rvx_signal_29 <= rvx_signal_12;
end
assign rvx_signal_24 = rvx_signal_29;
assign rvx_port_08 = rvx_signal_31;
assign rvx_signal_27 = rvx_port_03;
assign rvx_port_07 = rvx_signal_09;
assign rvx_port_11 = rvx_signal_33;
assign rvx_signal_06 = 1;
assign rvx_port_17 = rvx_signal_36;
assign rvx_signal_23 = 1;
assign rvx_port_10 = rvx_signal_17;
assign rvx_signal_15 = 0;
assign rvx_signal_10 = 1;
assign rvx_port_05 = rvx_signal_02;
assign rvx_signal_19 = 1;
assign rvx_port_06 = rvx_signal_29;
assign rvx_signal_07 = 1;

endmodule
