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
`include "rvx_include_03.vh"




module RVX_MODULE_079
(
	rvx_port_15,
	rvx_port_09,

	rvx_port_14,
	rvx_port_03,
	rvx_port_19,
	rvx_port_20,
	rvx_port_05,
	rvx_port_13,
	rvx_port_02,
	rvx_port_07,

	rvx_port_18,
	rvx_port_01,
	rvx_port_16,
	rvx_port_10,
	rvx_port_12,
	rvx_port_11,
	rvx_port_06,
	rvx_port_04,
	rvx_port_00,
	rvx_port_08,
	rvx_port_17
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_15, rvx_port_09;
input wire rvx_port_14;
input wire rvx_port_03;
input wire [RVX_GPARA_1-1:0] rvx_port_19;
input wire rvx_port_20;
input wire [RVX_GPARA_2-1:0] rvx_port_05;
output wire [RVX_GPARA_2-1:0] rvx_port_13;
output reg rvx_port_02;
output reg rvx_port_07;

input wire rvx_port_18;

output wire rvx_port_01;
input wire [32-1:0] rvx_port_16;
output wire rvx_port_10;
output wire [32-1:0] rvx_port_12;

output wire [32-1:0] rvx_port_11;

output wire [32-1:0] rvx_port_06;

output wire rvx_port_04;
input wire [32-1:0] rvx_port_00;

output wire rvx_port_08;
input wire [32-1:0] rvx_port_17;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_23;
reg [RVX_GPARA_2-1:0] rvx_signal_07;
wire rvx_signal_15;
wire rvx_signal_18;
wire rvx_signal_33;

wire [`RVX_GDEF_294-1:0] paddr_offset = rvx_port_19;
wire [`RVX_GDEF_294-1:0] rvx_signal_10;
wire [RVX_GPARA_1-1:0] rvx_signal_24;
wire [`RVX_GDEF_025-1:0] rvx_signal_36;
wire [`RVX_GDEF_025-1:0] addr_unused = 0;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_02;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_01;
wire rvx_signal_13;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_34;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_32;
wire rvx_signal_28;
reg [32-1:0] rvx_signal_20;
reg rvx_signal_35;
wire [32-1:0] rvx_signal_26;
reg rvx_signal_00;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_22;
reg [32-1:0] rvx_signal_17;
reg rvx_signal_25;
wire [32-1:0] rvx_signal_31;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_09;
wire rvx_signal_21;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_30;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_08;
wire rvx_signal_27;

assign rvx_signal_23 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_0,rvx_port_05);
assign rvx_port_13 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_0,rvx_signal_07);
assign {rvx_signal_24,rvx_signal_36} = paddr_offset;
assign rvx_signal_10 = {rvx_signal_24,addr_unused};
assign rvx_signal_33 = (rvx_signal_36==0);
assign rvx_signal_15 = rvx_port_14 & rvx_port_03 & rvx_signal_33 & (~rvx_port_20);
assign rvx_signal_18 = rvx_port_14 & rvx_port_03 & rvx_signal_33 & rvx_port_20;

assign rvx_signal_01 = $unsigned(rvx_port_05);
assign rvx_signal_32 = $unsigned(rvx_port_05);
assign rvx_signal_06 = $unsigned(rvx_port_05);
assign rvx_signal_09 = $unsigned(rvx_port_05);
assign rvx_signal_08 = $unsigned(rvx_port_05);

always@(*)
begin
	rvx_port_07 = 0;
	rvx_signal_07 = 0;
	rvx_port_02 = 1;

	rvx_signal_11 = 0;
	rvx_signal_16 = 0;

	rvx_signal_19 = 0;
	rvx_signal_03 = 0;

	rvx_signal_35 = 0;
	rvx_signal_00 = 0;

	rvx_signal_25 = 0;
	rvx_signal_04 = 0;

	rvx_signal_05 = 0;
	rvx_signal_29 = 0;

	if(rvx_port_14==1'b 1)
	begin
		case(rvx_signal_10)
			`RVX_GDEF_168:
			begin
				rvx_signal_11 = rvx_signal_15;
				rvx_signal_16 = rvx_signal_18;
				rvx_signal_07 = $unsigned(rvx_signal_02);
				rvx_port_02 = rvx_signal_13;
			end
			`RVX_GDEF_134:
			begin
				rvx_signal_19 = rvx_signal_15;
				rvx_signal_03 = rvx_signal_18;
				rvx_signal_07 = $unsigned(rvx_signal_34);
				rvx_port_02 = rvx_signal_28;
			end
			`RVX_GDEF_289:
			begin
				rvx_signal_35 = rvx_signal_15;
				rvx_signal_00 = rvx_signal_18;
				rvx_signal_07 = $unsigned(rvx_signal_26);
				rvx_port_02 = rvx_signal_22;
			end
			`RVX_GDEF_373:
			begin
				rvx_signal_25 = rvx_signal_15;
				rvx_signal_04 = rvx_signal_18;
				rvx_signal_07 = $unsigned(rvx_signal_31);
				rvx_port_02 = rvx_signal_21;
			end
			`RVX_GDEF_183:
			begin
				rvx_signal_05 = rvx_signal_15;
				rvx_signal_29 = rvx_signal_18;
				rvx_signal_07 = $unsigned(rvx_signal_30);
				rvx_port_02 = rvx_signal_27;
			end
			default:
				rvx_port_07 = 1;
		endcase
	end
end

always@(posedge rvx_port_15, negedge rvx_port_09)
begin
	if(rvx_port_09==0)
		rvx_signal_20 <= `RVX_GDEF_108;
	else if (rvx_signal_03==1'b 1)
		rvx_signal_20 <= rvx_signal_32;
end
assign rvx_signal_34 = rvx_signal_20;
always@(posedge rvx_port_15, negedge rvx_port_09)
begin
	if(rvx_port_09==0)
		rvx_signal_17 <= `RVX_GDEF_043;
	else if (rvx_signal_00==1'b 1)
		rvx_signal_17 <= rvx_signal_06;
end
assign rvx_signal_26 = rvx_signal_17;
assign rvx_port_01 = rvx_signal_11;
assign rvx_signal_02 = rvx_port_16;
assign rvx_port_10 = rvx_signal_16;
assign rvx_port_12 = rvx_signal_01;
assign rvx_signal_13 = 1;
assign rvx_port_11 = rvx_signal_20;
assign rvx_signal_28 = 1;
assign rvx_port_06 = rvx_signal_17;
assign rvx_signal_22 = 1;
assign rvx_port_04 = rvx_signal_25;
assign rvx_signal_31 = rvx_port_00;
assign rvx_signal_21 = 1;
assign rvx_port_08 = rvx_signal_05;
assign rvx_signal_30 = rvx_port_17;
assign rvx_signal_27 = 1;

endmodule
