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





module RVX_MODULE_041
(
	rvx_port_07,
	rvx_port_08,	
	rvx_port_00,
	rvx_port_06,
	rvx_port_04,
	rvx_port_09,
	rvx_port_02,
	rvx_port_05,
	rvx_port_01,
	rvx_port_03
);





parameter RVX_GPARA_0 = 4;
parameter RVX_GPARA_1 = 8;

localparam  RVX_LPARA_0 = RVX_GPARA_0+1;
localparam  RVX_LPARA_1 = RVX_GPARA_1+1;

input wire rvx_port_07, rvx_port_08;
input wire rvx_port_00;
input wire [RVX_GPARA_0-1:0] rvx_port_06;
output wire rvx_port_04;
output wire [RVX_GPARA_1-1:0] rvx_port_09;

output wire [RVX_LPARA_0-1:0] rvx_port_02;
input wire [RVX_LPARA_1-1:0] rvx_port_05;

output reg rvx_port_01;
output wire rvx_port_03;

`define RVX_LDEF_1 0
`define RVX_LDEF_0 1
reg rvx_signal_1;
wire rvx_signal_0;
reg [RVX_GPARA_0-1:0] rvx_signal_2;

always@(posedge rvx_port_07, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_1 <= `RVX_LDEF_1;
	else
		case(rvx_signal_1)
			`RVX_LDEF_1:
				if(rvx_signal_0)
					rvx_signal_1 <= `RVX_LDEF_0;
			`RVX_LDEF_0:
				if(rvx_port_04)
					rvx_signal_1 <= `RVX_LDEF_1;
		endcase
end

assign rvx_signal_0 = (rvx_signal_1==`RVX_LDEF_1) & rvx_port_00;
assign rvx_port_04 = (rvx_port_01==rvx_port_03);

always@(posedge rvx_port_07, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_port_01 <= 0;
	else if(rvx_signal_0)
		rvx_port_01 <= ~rvx_port_01;
end

always@(posedge rvx_port_07, negedge rvx_port_08)
begin
	if(rvx_port_08==0)
		rvx_signal_2 <= 0;
	else if(rvx_signal_0)
		rvx_signal_2 <= rvx_port_06;
end

assign rvx_port_02 = {rvx_port_01, rvx_signal_2};

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_1)
)
i_rvx_instance_0
(
	.clk(rvx_port_07),
	.rstnn(rvx_port_08),
	.enable(1'b 1),
	.asynch_value(rvx_port_05),
	.synch_value({rvx_port_03,rvx_port_09})
);

`undef RVX_LDEF_1
`undef RVX_LDEF_0

endmodule

