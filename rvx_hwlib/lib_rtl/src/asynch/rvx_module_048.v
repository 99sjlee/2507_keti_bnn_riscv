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
`include "rvx_include_02.vh"





module RVX_MODULE_048
(
	rvx_port_03,
	rvx_port_01,
	rvx_port_02,
	rvx_port_06,
	rvx_port_07,
	rvx_port_00,
	rvx_port_09,
	rvx_port_10,
	rvx_port_05,
	rvx_port_08,
	rvx_port_04
);





parameter RVX_GPARA_4 = 4;
localparam  RVX_LPARA_0 = `RVX_GDEF_205 + RVX_GPARA_4;
parameter RVX_GPARA_1 = RVX_LPARA_0+1;

parameter RVX_GPARA_0 = 4;
parameter RVX_GPARA_3 = RVX_GPARA_4 - RVX_GPARA_0;
parameter RVX_GPARA_2 = RVX_GPARA_4;

input wire rvx_port_03, rvx_port_01;

input wire rvx_port_02;
input wire [RVX_GPARA_0-1:0] rvx_port_06;
input wire [RVX_GPARA_3-1:0] rvx_port_07;
output wire rvx_port_00;
output wire [RVX_GPARA_2-1:0] rvx_port_09;

output wire [RVX_GPARA_1-1:0] rvx_port_10;
input wire rvx_port_05;
input wire [RVX_GPARA_1-1:0] rvx_port_08;
output wire rvx_port_04;

wire rvx_signal_06;
wire [RVX_LPARA_0-1:0] rvx_signal_01;

wire rvx_signal_08;
wire [RVX_LPARA_0-1:0] rvx_signal_09;

wire [`RVX_GDEF_205-1:0] rvx_signal_07;
wire [RVX_GPARA_4-1:0] rvx_signal_05;

wire [`RVX_GDEF_205-1:0] rvx_signal_03;
wire [RVX_GPARA_4-1:0] rvx_signal_02;

`define RVX_LDEF_0 1
`define RVX_LDEF_2 0
`define RVX_LDEF_1 1

reg [`RVX_LDEF_0-1:0] rvx_signal_04;
wire rvx_signal_00;

RVX_MODULE_034
#(
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_0
(
	.rvx_port_5(rvx_port_03),
	.rvx_port_4(rvx_port_01),
	.rvx_port_1(rvx_signal_06),
	.rvx_port_3(rvx_signal_01),
	.rvx_port_0(),
	.rvx_port_2(rvx_port_10),
	.rvx_port_6(rvx_port_05)
);

RVX_MODULE_123
#(
	.RVX_GPARA_1(RVX_LPARA_0),
	.RVX_GPARA_0(RVX_GPARA_1)
)
i_rvx_instance_1
(
	.rvx_port_5(rvx_port_03),
	.rvx_port_6(rvx_port_01),
	.rvx_port_4(rvx_signal_08),
	.rvx_port_1(rvx_signal_09),
	.rvx_port_3(1'b 1),
	.rvx_port_0(rvx_port_08),
	.rvx_port_2(rvx_port_04)
);

assign rvx_signal_01 = {rvx_signal_07,rvx_signal_05};
assign rvx_signal_07 = $unsigned(`RVX_GDEF_041);
assign rvx_signal_05 = $unsigned({rvx_port_06,rvx_port_07});

always@(posedge rvx_port_03, negedge rvx_port_01)
begin
	if(rvx_port_01==0)
		rvx_signal_04 <= `RVX_LDEF_2;
	else
		case(rvx_signal_04)
			`RVX_LDEF_2:
				if(rvx_signal_00)
					rvx_signal_04 <= `RVX_LDEF_1;
			`RVX_LDEF_1:
				if(rvx_signal_08)
					rvx_signal_04 <= `RVX_LDEF_2;
		endcase
end

assign rvx_signal_00 = (rvx_signal_04==`RVX_LDEF_2) & rvx_port_02;
assign rvx_signal_06 = rvx_signal_00;

assign rvx_port_00 = (rvx_signal_04==`RVX_LDEF_2);
assign {rvx_signal_03,rvx_signal_02} = rvx_signal_09;
assign rvx_port_09 = rvx_signal_02;

`undef RVX_LDEF_1
`undef RVX_LDEF_0
`undef RVX_LDEF_2
endmodule
