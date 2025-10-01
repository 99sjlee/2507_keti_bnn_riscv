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
// 2024-05-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`include "munoc_include_04.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_include_06.vh"




module MUNOC_MODULE_12
(
	munoc_port_11,
	munoc_port_05,

	munoc_port_13,
	munoc_port_12,
	munoc_port_09,

	munoc_port_10,
	munoc_port_07,
	munoc_port_15,	
	munoc_port_00,
	munoc_port_18,
	munoc_port_17,

	munoc_port_16,
	munoc_port_03,
	munoc_port_08,
	munoc_port_01,

	munoc_port_04,
	munoc_port_02,
	munoc_port_14,
	munoc_port_06
);




parameter MUNOC_GPARA_0 = 8;
parameter MUNOC_GPARA_2 = 8;
parameter MUNOC_GPARA_1 = 8;

input wire munoc_port_11, munoc_port_05;

input wire [`BW_BNI_LINK(MUNOC_GPARA_0)-1:0] munoc_port_13;
output reg munoc_port_12;
input wire munoc_port_09;

input wire munoc_port_10;
output wire munoc_port_07;
output wire munoc_port_15;
input wire munoc_port_00;
output wire munoc_port_18;
output wire munoc_port_17;

input wire [`MUNOC_GDEF_47(MUNOC_GPARA_0)-1:0] munoc_port_16;
output wire [`MUNOC_GDEF_47(MUNOC_GPARA_0)-1:0] munoc_port_03;
input wire [`MUNOC_GDEF_06(MUNOC_GPARA_1,MUNOC_GPARA_0)-1:0] munoc_port_08;
output wire [`MUNOC_GDEF_06(MUNOC_GPARA_1,MUNOC_GPARA_0)-1:0] munoc_port_01;

output wire munoc_port_04;
output wire munoc_port_02;
input wire munoc_port_14;
input wire munoc_port_06;

integer j;

wire munoc_signal_3;
wire munoc_signal_5;
wire munoc_signal_2;
wire [MUNOC_GPARA_0-1:0] munoc_signal_0;

`define MUNOC_LDEF_1 1
`define MUNOC_LDEF_0 0
`define MUNOC_LDEF_2 1

reg [`MUNOC_LDEF_1-1:0] munoc_signal_1;
wire munoc_signal_7;
wire munoc_signal_4;
wire munoc_signal_6;

assign {munoc_signal_3,munoc_signal_5,munoc_signal_2,munoc_signal_0} = munoc_port_13;

always@(posedge munoc_port_11, negedge munoc_port_05)
begin
	if(munoc_port_05==0)
		munoc_signal_1 <= `MUNOC_LDEF_0;
	else if(munoc_signal_7)
		case(munoc_signal_1)
			`MUNOC_LDEF_0:
				if(munoc_signal_2&&(!munoc_signal_5))
					munoc_signal_1 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				if(munoc_signal_5)
					munoc_signal_1 <= `MUNOC_LDEF_0;
		endcase
end

always@(*)
begin
	munoc_port_12 = 0;
	if(munoc_port_09==1)
		munoc_port_12 = 1;
	else
		case(munoc_signal_1)
			`MUNOC_LDEF_0:
				if(munoc_port_10)
					munoc_port_12 = 1;
				`MUNOC_LDEF_2:
					if(munoc_port_00)
						munoc_port_12 = 1;
		endcase
end

assign munoc_signal_7 = munoc_port_12 & munoc_signal_3;

assign munoc_signal_4 = munoc_signal_7 & (munoc_signal_1==`MUNOC_LDEF_0);
assign munoc_port_07 = munoc_signal_4;
assign munoc_port_15 = munoc_signal_4 & munoc_signal_2;

assign munoc_signal_6 = munoc_signal_7 & (munoc_signal_1==`MUNOC_LDEF_2);
assign munoc_port_18 = munoc_signal_6;
assign munoc_port_17 = munoc_signal_6 & munoc_signal_2;

assign munoc_port_04 = munoc_port_16[0];
assign munoc_port_03 = (munoc_port_14)? `ALL_ONE : 0;
assign munoc_port_02 = munoc_port_08[0];
assign munoc_port_01 = (munoc_port_06)? `ALL_ONE : 0;

`undef MUNOC_LDEF_2
`undef MUNOC_LDEF_0
`undef MUNOC_LDEF_1
endmodule

