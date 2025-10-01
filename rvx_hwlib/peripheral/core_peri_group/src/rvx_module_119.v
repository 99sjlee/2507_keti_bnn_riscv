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
`include "rvx_include_04.vh"




module RVX_MODULE_119
(
	rvx_port_11,
	rvx_port_04,

	rvx_port_07,
	rvx_port_06,
	rvx_port_16,
	rvx_port_02,
	rvx_port_00,
	rvx_port_17,
	rvx_port_12,
	rvx_port_13,

	rvx_port_15,
	rvx_port_03,
	rvx_port_09,
	rvx_port_05,
	rvx_port_10,
	rvx_port_14,
	rvx_port_01,
	rvx_port_08
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_11, rvx_port_04;
input wire rvx_port_07;
input wire rvx_port_06;
input wire [RVX_GPARA_0-1:0] rvx_port_16;
input wire rvx_port_02;
input wire [RVX_GPARA_2-1:0] rvx_port_00;
output wire [RVX_GPARA_2-1:0] rvx_port_17;
output reg rvx_port_12;
output reg rvx_port_13;

input wire rvx_port_15;

output wire rvx_port_03;
input wire [8-1:0] rvx_port_09;

output wire rvx_port_05;
output wire [8-1:0] rvx_port_10;

output wire rvx_port_14;
input wire [1-1:0] rvx_port_01;
input wire rvx_port_08;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_07;
reg [RVX_GPARA_2-1:0] rvx_signal_01;
wire rvx_signal_04;
wire rvx_signal_21;
wire rvx_signal_17;

wire [`RVX_GDEF_175-1:0] paddr_offset = rvx_port_16;
wire [`RVX_GDEF_175-1:0] rvx_signal_19;
wire [RVX_GPARA_0-1:0] rvx_signal_23;
wire [`RVX_GDEF_067-1:0] rvx_signal_03;
wire [`RVX_GDEF_067-1:0] addr_unused = 0;
reg rvx_signal_22;
wire [8-1:0] rvx_signal_05;
reg rvx_signal_13;
wire [8-1:0] rvx_signal_24;
wire rvx_signal_02;
reg rvx_signal_09;
wire [8-1:0] rvx_signal_18;
reg rvx_signal_11;
wire [8-1:0] rvx_signal_12;
wire rvx_signal_16;
reg rvx_signal_08;
wire [1-1:0] rvx_signal_14;
reg rvx_signal_00;
wire [1-1:0] rvx_signal_20;
wire rvx_signal_06;

assign rvx_signal_07 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_00);
assign rvx_port_17 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_01);
assign {rvx_signal_23,rvx_signal_03} = paddr_offset;
assign rvx_signal_19 = {rvx_signal_23,addr_unused};
assign rvx_signal_17 = (rvx_signal_03==0);
assign rvx_signal_04 = rvx_port_07 & rvx_port_06 & rvx_signal_17 & (~rvx_port_02);
assign rvx_signal_21 = rvx_port_07 & rvx_port_06 & rvx_signal_17 & rvx_port_02;

assign rvx_signal_24 = $unsigned(rvx_port_00);
assign rvx_signal_12 = $unsigned(rvx_port_00);
assign rvx_signal_20 = $unsigned(rvx_port_00);

always@(*)
begin
	rvx_port_13 = 0;
	rvx_signal_01 = 0;
	rvx_port_12 = 1;

	rvx_signal_22 = 0;
	rvx_signal_13 = 0;

	rvx_signal_09 = 0;
	rvx_signal_11 = 0;

	rvx_signal_08 = 0;
	rvx_signal_00 = 0;

	if(rvx_port_07==1'b 1)
	begin
		case(rvx_signal_19)
			`RVX_GDEF_334:
			begin
				rvx_signal_22 = rvx_signal_04;
				rvx_signal_13 = rvx_signal_21;
				rvx_signal_01 = $unsigned(rvx_signal_05);
				rvx_port_12 = rvx_signal_02;
			end
			`RVX_GDEF_013:
			begin
				rvx_signal_09 = rvx_signal_04;
				rvx_signal_11 = rvx_signal_21;
				rvx_signal_01 = $unsigned(rvx_signal_18);
				rvx_port_12 = rvx_signal_16;
			end
			`RVX_GDEF_418:
			begin
				rvx_signal_08 = rvx_signal_04;
				rvx_signal_00 = rvx_signal_21;
				rvx_signal_01 = $unsigned(rvx_signal_14);
				rvx_port_12 = rvx_signal_06;
			end
			default:
				rvx_port_13 = 1;
		endcase
	end
end

assign rvx_port_03 = rvx_signal_22;
assign rvx_signal_05 = rvx_port_09;
assign rvx_signal_02 = 1;
assign rvx_signal_18 = 0;
assign rvx_port_05 = rvx_signal_11;
assign rvx_port_10 = rvx_signal_12;
assign rvx_signal_16 = 1;
assign rvx_port_14 = rvx_signal_08;
assign rvx_signal_14 = rvx_port_01;
assign rvx_signal_06 = rvx_port_08;

endmodule
