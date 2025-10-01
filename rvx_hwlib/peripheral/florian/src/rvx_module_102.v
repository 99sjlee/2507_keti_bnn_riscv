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
`include "rvx_include_01.vh"





module RVX_MODULE_102
(
	rvx_port_03,
	rvx_port_11,

	rvx_port_21,
	rvx_port_07,
	rvx_port_00,
	rvx_port_05,
	rvx_port_27,
	rvx_port_06,
	rvx_port_13,
	rvx_port_15,

	rvx_port_28,
	rvx_port_20,
	rvx_port_24,
	rvx_port_04,
	rvx_port_01,
	rvx_port_19,
	rvx_port_08,
	rvx_port_10,
	rvx_port_17,
	rvx_port_16,
	rvx_port_09,
	rvx_port_18,
	rvx_port_12,
	rvx_port_22,
	rvx_port_23,
	rvx_port_14,
	rvx_port_26,
	rvx_port_25,
	rvx_port_02,
	rvx_port_29,
	rvx_port_30
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_03, rvx_port_11;
input wire rvx_port_21;
input wire rvx_port_07;
input wire [RVX_GPARA_0-1:0] rvx_port_00;
input wire rvx_port_05;
input wire [RVX_GPARA_2-1:0] rvx_port_27;
output wire [RVX_GPARA_2-1:0] rvx_port_06;
output reg rvx_port_13;
output reg rvx_port_15;

input wire rvx_port_28;

input wire rvx_port_20;
output wire rvx_port_10;
output wire rvx_port_17;
output wire [RVX_GPARA_2-1:0] rvx_port_16;
output wire rvx_port_24;
output wire rvx_port_04;
output wire [RVX_GPARA_2-1:0] rvx_port_01;
input wire rvx_port_19;
output wire [32-1:0] rvx_port_08;
input wire rvx_port_09;

input wire rvx_port_18;
output wire rvx_port_12;
output wire rvx_port_22;
output wire [RVX_GPARA_2-1:0] rvx_port_23;
output wire rvx_port_14;
output wire rvx_port_26;
output wire [RVX_GPARA_2-1:0] rvx_port_25;
input wire rvx_port_02;
input wire [32-1:0] rvx_port_29;
input wire rvx_port_30;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_05;
reg [RVX_GPARA_2-1:0] rvx_signal_33;
wire rvx_signal_21;
wire rvx_signal_17;
wire rvx_signal_25;

wire [`RVX_GDEF_297-1:0] paddr_offset = rvx_port_00;
wire [`RVX_GDEF_297-1:0] rvx_signal_16;
wire [RVX_GPARA_0-1:0] rvx_signal_27;
wire [`RVX_GDEF_251-1:0] rvx_signal_45;
wire [`RVX_GDEF_251-1:0] addr_unused = 0;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_26;
reg rvx_signal_43;
wire [32-1:0] rvx_signal_34;
wire rvx_signal_40;
wire rvx_signal_28;
wire rvx_signal_24;
wire rvx_signal_31;
wire rvx_signal_01;
wire [32-1:0] rvx_signal_23;
wire [RVX_GPARA_2-1:0] rvx_signal_19;
wire rvx_signal_07;
wire rvx_signal_04;
wire rvx_signal_00;
wire [32-1:0] rvx_signal_12;
wire [RVX_GPARA_2-1:0] rvx_signal_20;
reg rvx_signal_46;
wire [32-1:0] rvx_signal_36;
reg rvx_signal_09;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_14;
wire rvx_signal_13;
wire rvx_signal_02;
wire rvx_signal_38;
wire rvx_signal_10;
wire [32-1:0] rvx_signal_42;
wire [RVX_GPARA_2-1:0] rvx_signal_22;
wire rvx_signal_18;
wire rvx_signal_03;
wire rvx_signal_41;
wire [32-1:0] rvx_signal_11;
wire [RVX_GPARA_2-1:0] rvx_signal_15;
reg rvx_signal_44;
wire [2-1:0] rvx_signal_39;
reg rvx_signal_30;
wire [2-1:0] rvx_signal_35;
wire rvx_signal_32;

assign rvx_signal_05 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_27);
assign rvx_port_06 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_33);
assign {rvx_signal_27,rvx_signal_45} = paddr_offset;
assign rvx_signal_16 = {rvx_signal_27,addr_unused};
assign rvx_signal_25 = (rvx_signal_45==0);
assign rvx_signal_21 = rvx_port_21 & rvx_port_07 & rvx_signal_25 & (~rvx_port_05);
assign rvx_signal_17 = rvx_port_21 & rvx_port_07 & rvx_signal_25 & rvx_port_05;

assign rvx_signal_34 = $unsigned(rvx_port_27);
assign rvx_signal_06 = $unsigned(rvx_port_27);
assign rvx_signal_35 = $unsigned(rvx_port_27);

always@(*)
begin
	rvx_port_15 = 0;
	rvx_signal_33 = 0;
	rvx_port_13 = 1;

	rvx_signal_37 = 0;
	rvx_signal_43 = 0;

	rvx_signal_46 = 0;
	rvx_signal_09 = 0;

	rvx_signal_44 = 0;
	rvx_signal_30 = 0;

	if(rvx_port_21==1'b 1)
	begin
		case(rvx_signal_16)
			`RVX_GDEF_091:
			begin
				rvx_signal_37 = rvx_signal_21;
				rvx_signal_43 = rvx_signal_17;
				rvx_signal_33 = $unsigned(rvx_signal_26);
				rvx_port_13 = rvx_signal_40;
			end
			`RVX_GDEF_054:
			begin
				rvx_signal_46 = rvx_signal_21;
				rvx_signal_09 = rvx_signal_17;
				rvx_signal_33 = $unsigned(rvx_signal_36);
				rvx_port_13 = rvx_signal_14;
			end
			`RVX_GDEF_105:
			begin
				rvx_signal_44 = rvx_signal_21;
				rvx_signal_30 = rvx_signal_17;
				rvx_signal_33 = $unsigned(rvx_signal_39);
				rvx_port_13 = rvx_signal_32;
			end
			default:
				rvx_port_15 = 1;
		endcase
	end
end

ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(4),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.clk(rvx_port_03),
	.rstnn(rvx_port_11),
	.enable(1'b 1),
	.clear(rvx_signal_28),
	.wready(rvx_signal_24),
	.wfull(rvx_signal_31),
	.wrequest(rvx_signal_01),
	.wdata(rvx_signal_23),
	.wnum(rvx_signal_19),
	.rready(rvx_signal_07),
	.rempty(rvx_signal_04),
	.rrequest(rvx_signal_00),
	.rdata(rvx_signal_12),
	.rnum(rvx_signal_20)
);
assign rvx_signal_28 = rvx_port_20;
assign rvx_port_10 = rvx_signal_24;
assign rvx_port_17 = rvx_signal_31;
assign rvx_port_16 = rvx_signal_19;
assign rvx_port_24 = rvx_signal_07;
assign rvx_port_04 = rvx_signal_04;
assign rvx_port_01 = rvx_signal_20;
assign rvx_signal_01 = rvx_signal_43;
assign rvx_signal_23 = rvx_signal_34;
assign rvx_signal_26 = rvx_signal_19;
assign rvx_signal_00 = rvx_port_19;
assign rvx_port_08 = rvx_signal_12;
ERVP_FIFO
#(
	.BW_DATA(32),
	.DEPTH(2),
	.BW_NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_1
(
	.clk(rvx_port_03),
	.rstnn(rvx_port_11),
	.enable(1'b 1),
	.clear(rvx_signal_13),
	.wready(rvx_signal_02),
	.wfull(rvx_signal_38),
	.wrequest(rvx_signal_10),
	.wdata(rvx_signal_42),
	.wnum(rvx_signal_22),
	.rready(rvx_signal_18),
	.rempty(rvx_signal_03),
	.rrequest(rvx_signal_41),
	.rdata(rvx_signal_11),
	.rnum(rvx_signal_15)
);
assign rvx_signal_13 = rvx_port_18;
assign rvx_port_14 = rvx_signal_02;
assign rvx_port_26 = rvx_signal_38;
assign rvx_port_25 = rvx_signal_22;
assign rvx_port_12 = rvx_signal_18;
assign rvx_port_22 = rvx_signal_03;
assign rvx_port_23 = rvx_signal_15;
assign rvx_signal_10 = rvx_port_02;
assign rvx_signal_42 = rvx_port_29;
assign rvx_signal_41 = rvx_signal_46;
assign rvx_signal_36 = rvx_signal_11;
assign rvx_signal_39 = rvx_signal_15;
assign rvx_signal_40 = rvx_port_09;
assign rvx_signal_14 = rvx_port_30;
assign rvx_signal_32 = 1;

endmodule
