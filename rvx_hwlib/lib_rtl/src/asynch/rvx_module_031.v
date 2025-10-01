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





module RVX_MODULE_031
(
	rvx_port_0,
	rvx_port_1,
	rvx_port_3,
	rvx_port_2,
	rvx_port_6,
	rvx_port_5,
	rvx_port_7,
	rvx_port_4
);





parameter RVX_GPARA_3 = 4;
parameter RVX_GPARA_1 = 8;

parameter RVX_GPARA_2 = RVX_GPARA_3 + 1;
parameter RVX_GPARA_0 = RVX_GPARA_1 + 1;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_08 = `MAX(RVX_GPARA_3,1);
localparam  RVX_LPARA_04 = `MAX(RVX_GPARA_1,1);
localparam  RVX_LPARA_05 = `MIN(`MAX(RVX_GPARA_2-1,1),RVX_LPARA_08);
localparam  RVX_LPARA_07 = `MIN(`MAX(RVX_GPARA_2-1,1),RVX_LPARA_04);

localparam  RVX_LPARA_03 = RVX_LPARA_05 + 1;
localparam  RVX_LPARA_02 = RVX_LPARA_07 + 1;

localparam  RVX_LPARA_06 = `DIVIDERU(RVX_LPARA_08,RVX_LPARA_05);
localparam  RVX_LPARA_01 = `DIVIDERU(RVX_LPARA_04,RVX_LPARA_07);

localparam  RVX_LPARA_09 = `MAX(RVX_LPARA_06,RVX_LPARA_01);
localparam  RVX_LPARA_00 = LOG2RU(RVX_LPARA_09);

input wire rvx_port_0, rvx_port_1;
input wire rvx_port_3;
input wire [RVX_LPARA_08-1:0] rvx_port_2;
output wire rvx_port_6;
output wire [RVX_LPARA_04-1:0] rvx_port_5;

output wire [RVX_GPARA_2-1:0] rvx_port_7;
input wire [RVX_GPARA_0-1:0] rvx_port_4;

wire [RVX_LPARA_03-1:0] rvx_signal_20;
reg [RVX_LPARA_02-1:0] rvx_signal_04;

wire rvx_signal_05;
reg rvx_signal_06;

wire [RVX_LPARA_00-1:0] rvx_signal_12;
wire rvx_signal_01;
wire rvx_signal_00;

wire [RVX_LPARA_08-1:0] rvx_signal_09;
wire [RVX_LPARA_07-1:0] rvx_signal_17;

`define RVX_LDEF_5 3
`define RVX_LDEF_0 0
`define RVX_LDEF_4 1
`define RVX_LDEF_1 2
`define RVX_LDEF_2 3
`define RVX_LDEF_3 4

reg [`RVX_LDEF_5-1:0] rvx_signal_03;
wire rvx_signal_18;

wire rvx_signal_13;
wire rvx_signal_07;
wire rvx_signal_02;
wire rvx_signal_10;

wire [RVX_LPARA_08-1:0] rvx_signal_16;
wire [RVX_LPARA_05-1:0] rvx_signal_15;
wire [RVX_LPARA_05-1:0] rvx_signal_19;

wire [RVX_LPARA_04-1:0] rvx_signal_14;
wire [RVX_LPARA_07-1:0] rvx_signal_08;
wire [RVX_LPARA_07-1:0] rvx_signal_11;

assign rvx_port_7 = rvx_signal_20[RVX_LPARA_03-1 -:RVX_GPARA_2];
always@(*)
begin
	rvx_signal_04 = 0;
	rvx_signal_04[RVX_LPARA_02-1 -:RVX_GPARA_0] = rvx_port_4;
end

RVX_MODULE_041
#(
	.RVX_GPARA_0(RVX_LPARA_05),
	.RVX_GPARA_1(RVX_LPARA_07)
)
i_rvx_instance_3
(
	.rvx_port_07(rvx_port_0),
	.rvx_port_08(rvx_port_1),
	.rvx_port_00(rvx_signal_06),
	.rvx_port_06(rvx_signal_09[RVX_LPARA_05-1:0]),
	.rvx_port_04(rvx_signal_05),
	.rvx_port_09(rvx_signal_17),
	.rvx_port_02(rvx_signal_20),
	.rvx_port_05(rvx_signal_04),
	.rvx_port_01(),
	.rvx_port_03()
);

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_00)
)
i_rvx_instance_0
(
	.clk(rvx_port_0),
	.rstnn(rvx_port_1),
	.enable(1'b 1),
	.init(rvx_signal_01),
	.count(rvx_signal_00),
	.value(rvx_signal_12),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_01 = rvx_signal_02 | rvx_signal_10;
assign rvx_signal_00 = rvx_signal_13 | rvx_signal_07;

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(RVX_LPARA_08),
	.SHIFT_AMOUNT(RVX_LPARA_05)
)
i_rvx_instance_1
(
	.clk(rvx_port_0),
	.rstnn(rvx_port_1),
  .enable(1'b 1),
	.set_value(rvx_signal_16),
	.right_insertion(rvx_signal_15),
	.left_insertion(rvx_signal_19),
	.init(1'b 0),
	.set(rvx_signal_18),
	.left_shift(1'b 0),
	.right_shift((rvx_signal_13&(!rvx_signal_02))),
	.is_upper_limit(1'b 0),
	.is_lower_limit(1'b 0),
	.value(rvx_signal_09)
);

assign rvx_signal_16 = rvx_port_2;
assign rvx_signal_15 = 0;
assign rvx_signal_19 = 0; 

ERVP_SHIFT_REGISTER
#(
	.BW_REGISTER(RVX_LPARA_04),
	.SHIFT_AMOUNT(RVX_LPARA_07)
)
i_rvx_instance_2
(
	.clk(rvx_port_0),
	.rstnn(rvx_port_1),
  .enable(1'b 1),
	.set_value(rvx_signal_14),
	.right_insertion(rvx_signal_08),
	.left_insertion(rvx_signal_11),
	.init(1'b 0),
	.set(1'b 0),
	.left_shift(1'b 0),
	.right_shift(rvx_signal_07),
	.is_upper_limit(1'b 0),
	.is_lower_limit(1'b 0),
	.value(rvx_port_5)
);

assign rvx_signal_14 = 0;
assign rvx_signal_08 = 0;
assign rvx_signal_11 = $unsigned(rvx_signal_17);

always@(posedge rvx_port_0, negedge rvx_port_1)
begin
	if(rvx_port_1==0)
		rvx_signal_03 <= `RVX_LDEF_0;
	else
		case(rvx_signal_03)
			`RVX_LDEF_0:
				if(rvx_signal_18)
					rvx_signal_03 <= `RVX_LDEF_4;
			`RVX_LDEF_4:
				rvx_signal_03 <= `RVX_LDEF_1;
			`RVX_LDEF_1:
				if(rvx_signal_02)
				begin
					if(RVX_GPARA_1==0)
						rvx_signal_03 <= `RVX_LDEF_0;
					else
						rvx_signal_03 <= `RVX_LDEF_2;
				end
				else if(rvx_signal_13)
					rvx_signal_03 <= `RVX_LDEF_4;
			`RVX_LDEF_2:
				rvx_signal_03 <= `RVX_LDEF_3;
			`RVX_LDEF_3:
				if(rvx_signal_10)
					rvx_signal_03 <= `RVX_LDEF_0;
				else if(rvx_signal_07)
					rvx_signal_03 <= `RVX_LDEF_2;
		endcase
end

assign rvx_port_6 = (rvx_signal_03==`RVX_LDEF_0);
assign rvx_signal_18 = rvx_port_3 & rvx_port_6;

always@(*)
begin
	rvx_signal_06 = 0;
	case(rvx_signal_03)
		`RVX_LDEF_4,
		`RVX_LDEF_2:
			rvx_signal_06 = 1;
	endcase
end

assign rvx_signal_13 = (rvx_signal_03==`RVX_LDEF_1) & rvx_signal_05;
assign rvx_signal_02 = (RVX_GPARA_3==0)? rvx_signal_13 : (rvx_signal_13 & (rvx_signal_12==(RVX_LPARA_06-1)));
assign rvx_signal_07 = (RVX_GPARA_1==0)? 0 : ((rvx_signal_03==`RVX_LDEF_3) & rvx_signal_05);
assign rvx_signal_10 = rvx_signal_07 & (rvx_signal_12==(RVX_LPARA_01-1));

`undef RVX_LDEF_3
`undef RVX_LDEF_0
`undef RVX_LDEF_4
`undef RVX_LDEF_5
`undef RVX_LDEF_1
`undef RVX_LDEF_2
endmodule

