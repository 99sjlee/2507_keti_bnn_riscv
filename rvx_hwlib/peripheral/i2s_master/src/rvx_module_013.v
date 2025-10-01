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
`include "rvx_include_23.vh"





module RVX_MODULE_013
(
	rvx_port_30,
	rvx_port_06,

	rvx_port_01,
	rvx_port_11,
	rvx_port_20,
	rvx_port_27,
	rvx_port_24,
	rvx_port_21,
	rvx_port_08,
	rvx_port_28,

	rvx_port_22,
	rvx_port_05,
	rvx_port_18,
	rvx_port_19,
	rvx_port_29,
	rvx_port_07,
	rvx_port_26,
	rvx_port_09,
	rvx_port_02,
	rvx_port_10,
	rvx_port_12,
	rvx_port_14,
	rvx_port_03,
	rvx_port_13,
	rvx_port_31,
	rvx_port_16,
	rvx_port_04,
	rvx_port_23,
	rvx_port_17,
	rvx_port_15,
	rvx_port_25,
	rvx_port_00
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_30, rvx_port_06;
input wire rvx_port_01;
input wire rvx_port_11;
input wire [RVX_GPARA_0-1:0] rvx_port_20;
input wire rvx_port_27;
input wire [RVX_GPARA_1-1:0] rvx_port_24;
output wire [RVX_GPARA_1-1:0] rvx_port_21;
output reg rvx_port_08;
output reg rvx_port_28;

input wire rvx_port_22;

output wire rvx_port_05;
output wire [8-1:0] rvx_port_18;

output wire rvx_port_19;
input wire [5-1:0] rvx_port_29;

output wire [8-1:0] rvx_port_07;

output wire rvx_port_14;
output wire rvx_port_03;
output wire [RVX_GPARA_1-1:0] rvx_port_13;
output wire rvx_port_26;
output wire rvx_port_09;
output wire [RVX_GPARA_1-1:0] rvx_port_02;
input wire rvx_port_10;
output wire [32-1:0] rvx_port_12;

output wire rvx_port_31;
output wire rvx_port_16;
output wire [RVX_GPARA_1-1:0] rvx_port_04;
output wire rvx_port_23;
output wire rvx_port_17;
output wire [RVX_GPARA_1-1:0] rvx_port_15;
input wire rvx_port_25;
input wire [32-1:0] rvx_port_00;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_04;
reg [RVX_GPARA_1-1:0] rvx_signal_25;
wire rvx_signal_29;
wire rvx_signal_56;
wire rvx_signal_36;

wire [`RVX_GDEF_234-1:0] paddr_offset = rvx_port_20;
wire [`RVX_GDEF_234-1:0] rvx_signal_09;
wire [RVX_GPARA_0-1:0] rvx_signal_46;
wire [`RVX_GDEF_188-1:0] rvx_signal_43;
wire [`RVX_GDEF_188-1:0] addr_unused = 0;
reg rvx_signal_14;
wire [8-1:0] rvx_signal_07;
reg rvx_signal_06;
wire [8-1:0] rvx_signal_51;
wire rvx_signal_48;
reg rvx_signal_49;
wire [5-1:0] rvx_signal_28;
reg rvx_signal_45;
wire [5-1:0] rvx_signal_59;
wire rvx_signal_17;
reg rvx_signal_08;
wire [8-1:0] rvx_signal_41;
reg rvx_signal_53;
wire [8-1:0] rvx_signal_44;
wire rvx_signal_19;
reg [8-1:0] rvx_signal_52;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_37;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_12;
wire rvx_signal_22;
wire rvx_signal_34;
wire rvx_signal_57;
wire rvx_signal_54;
wire [32-1:0] rvx_signal_27;
wire [RVX_GPARA_1-1:0] rvx_signal_02;
wire rvx_signal_24;
wire rvx_signal_38;
wire rvx_signal_60;
wire [32-1:0] rvx_signal_13;
wire [RVX_GPARA_1-1:0] rvx_signal_03;
reg rvx_signal_39;
wire [32-1:0] rvx_signal_18;
reg rvx_signal_00;
wire [32-1:0] rvx_signal_50;
wire rvx_signal_35;
wire rvx_signal_05;
wire rvx_signal_33;
wire rvx_signal_21;
wire [32-1:0] rvx_signal_26;
wire [RVX_GPARA_1-1:0] rvx_signal_58;
wire rvx_signal_42;
wire rvx_signal_31;
wire rvx_signal_55;
wire [32-1:0] rvx_signal_10;
wire [RVX_GPARA_1-1:0] rvx_signal_30;
reg rvx_signal_11;
wire [7-1:0] rvx_signal_32;
reg rvx_signal_01;
wire [7-1:0] rvx_signal_47;
wire rvx_signal_15;

assign rvx_signal_04 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_2,rvx_port_24);
assign rvx_port_21 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_2,rvx_signal_25);
assign {rvx_signal_46,rvx_signal_43} = paddr_offset;
assign rvx_signal_09 = {rvx_signal_46,addr_unused};
assign rvx_signal_36 = (rvx_signal_43==0);
assign rvx_signal_29 = rvx_port_01 & rvx_port_11 & rvx_signal_36 & (~rvx_port_27);
assign rvx_signal_56 = rvx_port_01 & rvx_port_11 & rvx_signal_36 & rvx_port_27;

assign rvx_signal_51 = $unsigned(rvx_port_24);
assign rvx_signal_59 = $unsigned(rvx_port_24);
assign rvx_signal_44 = $unsigned(rvx_port_24);
assign rvx_signal_12 = $unsigned(rvx_port_24);
assign rvx_signal_50 = $unsigned(rvx_port_24);
assign rvx_signal_47 = $unsigned(rvx_port_24);

always@(*)
begin
	rvx_port_28 = 0;
	rvx_signal_25 = 0;
	rvx_port_08 = 1;

	rvx_signal_14 = 0;
	rvx_signal_06 = 0;

	rvx_signal_49 = 0;
	rvx_signal_45 = 0;

	rvx_signal_08 = 0;
	rvx_signal_53 = 0;

	rvx_signal_16 = 0;
	rvx_signal_20 = 0;

	rvx_signal_39 = 0;
	rvx_signal_00 = 0;

	rvx_signal_11 = 0;
	rvx_signal_01 = 0;

	if(rvx_port_01==1'b 1)
	begin
		case(rvx_signal_09)
			`RVX_GDEF_109:
			begin
				rvx_signal_14 = rvx_signal_29;
				rvx_signal_06 = rvx_signal_56;
				rvx_signal_25 = $unsigned(rvx_signal_07);
				rvx_port_08 = rvx_signal_48;
			end
			`RVX_GDEF_258:
			begin
				rvx_signal_49 = rvx_signal_29;
				rvx_signal_45 = rvx_signal_56;
				rvx_signal_25 = $unsigned(rvx_signal_28);
				rvx_port_08 = rvx_signal_17;
			end
			`RVX_GDEF_312:
			begin
				rvx_signal_08 = rvx_signal_29;
				rvx_signal_53 = rvx_signal_56;
				rvx_signal_25 = $unsigned(rvx_signal_41);
				rvx_port_08 = rvx_signal_19;
			end
			`RVX_GDEF_079:
			begin
				rvx_signal_16 = rvx_signal_29;
				rvx_signal_20 = rvx_signal_56;
				rvx_signal_25 = $unsigned(rvx_signal_37);
				rvx_port_08 = rvx_signal_22;
			end
			`RVX_GDEF_417:
			begin
				rvx_signal_39 = rvx_signal_29;
				rvx_signal_00 = rvx_signal_56;
				rvx_signal_25 = $unsigned(rvx_signal_18);
				rvx_port_08 = rvx_signal_35;
			end
			`RVX_GDEF_371:
			begin
				rvx_signal_11 = rvx_signal_29;
				rvx_signal_01 = rvx_signal_56;
				rvx_signal_25 = $unsigned(rvx_signal_32);
				rvx_port_08 = rvx_signal_15;
			end
			default:
				rvx_port_28 = 1;
		endcase
	end
end

always@(posedge rvx_port_30, negedge rvx_port_06)
begin
	if(rvx_port_06==0)
		rvx_signal_52 <= `RVX_GDEF_187;
	else if (rvx_signal_53==1'b 1)
		rvx_signal_52 <= rvx_signal_44;
end
assign rvx_signal_41 = rvx_signal_52;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.clk(rvx_port_30),
	.rstnn(rvx_port_06),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_34),
	.wfull(rvx_signal_57),
	.wrequest(rvx_signal_54),
	.wdata(rvx_signal_27),
	.wnum(rvx_signal_02),
	.rready(rvx_signal_24),
	.rempty(rvx_signal_38),
	.rrequest(rvx_signal_60),
	.rdata(rvx_signal_13),
	.rnum(rvx_signal_03)
);
assign rvx_port_14 = rvx_signal_34;
assign rvx_port_03 = rvx_signal_57;
assign rvx_port_13 = rvx_signal_02;
assign rvx_port_26 = rvx_signal_24;
assign rvx_port_09 = rvx_signal_38;
assign rvx_port_02 = rvx_signal_03;
assign rvx_signal_54 = rvx_signal_20;
assign rvx_signal_27 = rvx_signal_12;
assign rvx_signal_37 = rvx_signal_02;
assign rvx_signal_60 = rvx_port_10;
assign rvx_port_12 = rvx_signal_13;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(64),
	.BW_NUM_DATA(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.clk(rvx_port_30),
	.rstnn(rvx_port_06),
	.enable(1'b 1),
	.clear(1'b 0),
	.wready(rvx_signal_05),
	.wfull(rvx_signal_33),
	.wrequest(rvx_signal_21),
	.wdata(rvx_signal_26),
	.wnum(rvx_signal_58),
	.rready(rvx_signal_42),
	.rempty(rvx_signal_31),
	.rrequest(rvx_signal_55),
	.rdata(rvx_signal_10),
	.rnum(rvx_signal_30)
);
assign rvx_port_23 = rvx_signal_05;
assign rvx_port_17 = rvx_signal_33;
assign rvx_port_15 = rvx_signal_58;
assign rvx_port_31 = rvx_signal_42;
assign rvx_port_16 = rvx_signal_31;
assign rvx_port_04 = rvx_signal_30;
assign rvx_signal_21 = rvx_port_25;
assign rvx_signal_26 = rvx_port_00;
assign rvx_signal_55 = rvx_signal_39;
assign rvx_signal_18 = rvx_signal_10;
assign rvx_signal_32 = rvx_signal_30;
assign rvx_signal_07 = 0;
assign rvx_port_05 = rvx_signal_06;
assign rvx_port_18 = rvx_signal_51;
assign rvx_signal_48 = 1;
assign rvx_port_19 = rvx_signal_49;
assign rvx_signal_28 = rvx_port_29;
assign rvx_signal_17 = 1;
assign rvx_port_07 = rvx_signal_52;
assign rvx_signal_19 = 1;
assign rvx_signal_22 = 1;
assign rvx_signal_35 = 1;
assign rvx_signal_15 = 1;

endmodule
