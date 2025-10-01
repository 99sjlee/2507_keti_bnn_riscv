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



module MUNOC_MODULE_10
(
	munoc_port_11,

	munoc_port_16,
	munoc_port_08,
	munoc_port_06,
	munoc_port_05,
	munoc_port_00,
	munoc_port_09,
	munoc_port_02,
	munoc_port_12,

	munoc_port_15,
	munoc_port_01,
	munoc_port_13,
	munoc_port_04,
	munoc_port_10,
	munoc_port_14,
	munoc_port_03,
	munoc_port_07
);



parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_11;

input wire [MUNOC_GPARA_0-1:0] munoc_port_16;
input wire munoc_port_08;
input wire munoc_port_06;
input wire munoc_port_05;
input wire [MUNOC_GPARA_1-1:0] munoc_port_00;
output wire [MUNOC_GPARA_1-1:0] munoc_port_09;
output wire munoc_port_02;
output wire munoc_port_12;

output wire [MUNOC_GPARA_0-1:0] munoc_port_15;
output wire munoc_port_01;
output wire munoc_port_13;
output wire munoc_port_04;
output wire [MUNOC_GPARA_1-1:0] munoc_port_10;
input wire [MUNOC_GPARA_1-1:0] munoc_port_14;
input wire munoc_port_03;
input wire munoc_port_07;

assign munoc_port_15 = munoc_port_16;
assign munoc_port_01 = munoc_port_08;
assign munoc_port_13 = (~munoc_port_11) & munoc_port_06;
assign munoc_port_04 = (~munoc_port_11) & munoc_port_05;
assign munoc_port_10 = munoc_port_00;
assign munoc_port_09 = munoc_port_14;
assign munoc_port_02 = (~munoc_port_11) & munoc_port_03;
assign munoc_port_12 = munoc_port_07;

endmodule
