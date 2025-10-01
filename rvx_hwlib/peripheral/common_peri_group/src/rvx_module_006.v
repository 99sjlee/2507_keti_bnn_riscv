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
`include "rvx_include_10.vh"




module RVX_MODULE_006
(
	rvx_port_12,
	rvx_port_15,

	rvx_port_04,
	rvx_port_09,
	rvx_port_02,
	rvx_port_05,
	rvx_port_11,
	rvx_port_07,
	rvx_port_14,
	rvx_port_16,

	rvx_port_08,
	rvx_port_13,
	rvx_port_03,
	rvx_port_00,
	rvx_port_01,
	rvx_port_10,
	rvx_port_06
);




parameter RVX_GPARA_3 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_12, rvx_port_15;
input wire rvx_port_04;
input wire rvx_port_09;
input wire [RVX_GPARA_3-1:0] rvx_port_02;
input wire rvx_port_05;
input wire [RVX_GPARA_0-1:0] rvx_port_11;
output wire [RVX_GPARA_0-1:0] rvx_port_07;
output reg rvx_port_14;
output reg rvx_port_16;

parameter RVX_GPARA_4 = 0;
parameter RVX_GPARA_2 = 0;

input wire rvx_port_08;

output wire rvx_port_13;
input wire [8-1:0] rvx_port_03;
output wire rvx_port_00;
output wire [8-1:0] rvx_port_01;

output wire [11-1:0] rvx_port_10;

output wire [11-1:0] rvx_port_06;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_16;
reg [RVX_GPARA_0-1:0] rvx_signal_20;
wire rvx_signal_17;
wire rvx_signal_19;
wire rvx_signal_13;

wire [`RVX_GDEF_186-1:0] paddr_offset = rvx_port_02;
wire [`RVX_GDEF_186-1:0] rvx_signal_09;
wire [RVX_GPARA_3-1:0] rvx_signal_11;
wire [`RVX_GDEF_203-1:0] rvx_signal_24;
wire [`RVX_GDEF_203-1:0] addr_unused = 0;
reg rvx_signal_25;
wire [8-1:0] rvx_signal_05;
reg rvx_signal_01;
wire [8-1:0] rvx_signal_08;
wire rvx_signal_03;
reg rvx_signal_23;
wire [11-1:0] rvx_signal_07;
reg rvx_signal_18;
wire [11-1:0] rvx_signal_21;
wire rvx_signal_04;
reg [11-1:0] rvx_signal_15;
reg rvx_signal_12;
wire [11-1:0] rvx_signal_00;
reg rvx_signal_10;
wire [11-1:0] rvx_signal_02;
wire rvx_signal_26;
reg [11-1:0] rvx_signal_22;

assign rvx_signal_16 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_0,RVX_GPARA_1,rvx_port_11);
assign rvx_port_07 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_0,RVX_GPARA_1,rvx_signal_20);
assign {rvx_signal_11,rvx_signal_24} = paddr_offset;
assign rvx_signal_09 = {rvx_signal_11,addr_unused};
assign rvx_signal_13 = (rvx_signal_24==0);
assign rvx_signal_17 = rvx_port_04 & rvx_port_09 & rvx_signal_13 & (~rvx_port_05);
assign rvx_signal_19 = rvx_port_04 & rvx_port_09 & rvx_signal_13 & rvx_port_05;

assign rvx_signal_08 = $unsigned(rvx_port_11);
assign rvx_signal_21 = $unsigned(rvx_port_11);
assign rvx_signal_02 = $unsigned(rvx_port_11);

always@(*)
begin
	rvx_port_16 = 0;
	rvx_signal_20 = 0;
	rvx_port_14 = 1;

	rvx_signal_25 = 0;
	rvx_signal_01 = 0;

	rvx_signal_23 = 0;
	rvx_signal_18 = 0;

	rvx_signal_12 = 0;
	rvx_signal_10 = 0;

	if(rvx_port_04==1'b 1)
	begin
		case(rvx_signal_09)
			`RVX_GDEF_064:
			begin
				rvx_signal_25 = rvx_signal_17;
				rvx_signal_01 = rvx_signal_19;
				rvx_signal_20 = $unsigned(rvx_signal_05);
				rvx_port_14 = rvx_signal_03;
			end
			`RVX_GDEF_256:
			begin
				rvx_signal_23 = rvx_signal_17;
				rvx_signal_18 = rvx_signal_19;
				rvx_signal_20 = $unsigned(rvx_signal_07);
				rvx_port_14 = rvx_signal_04;
			end
			`RVX_GDEF_113:
			begin
				rvx_signal_12 = rvx_signal_17;
				rvx_signal_10 = rvx_signal_19;
				rvx_signal_20 = $unsigned(rvx_signal_00);
				rvx_port_14 = rvx_signal_26;
			end
			default:
				rvx_port_16 = 1;
		endcase
	end
end

always@(posedge rvx_port_12, negedge rvx_port_15)
begin
	if(rvx_port_15==0)
		rvx_signal_15 <= RVX_GPARA_4;
	else if (rvx_signal_18==1'b 1)
		rvx_signal_15 <= rvx_signal_21;
end
assign rvx_signal_07 = rvx_signal_15;
always@(posedge rvx_port_12, negedge rvx_port_15)
begin
	if(rvx_port_15==0)
		rvx_signal_22 <= RVX_GPARA_2;
	else if (rvx_signal_10==1'b 1)
		rvx_signal_22 <= rvx_signal_02;
end
assign rvx_signal_00 = rvx_signal_22;
assign rvx_port_13 = rvx_signal_25;
assign rvx_signal_05 = rvx_port_03;
assign rvx_port_00 = rvx_signal_01;
assign rvx_port_01 = rvx_signal_08;
assign rvx_signal_03 = 1;
assign rvx_port_10 = rvx_signal_15;
assign rvx_signal_04 = 1;
assign rvx_port_06 = rvx_signal_22;
assign rvx_signal_26 = 1;

endmodule
