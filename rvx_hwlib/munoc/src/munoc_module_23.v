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





module MUNOC_MODULE_23
(
	munoc_port_2,
	munoc_port_1,
	munoc_port_0,

	munoc_port_6,
	munoc_port_5,

	munoc_port_4,
	munoc_port_7,
	munoc_port_3
);





parameter MUNOC_GPARA_1 = 16;
parameter MUNOC_GPARA_0 = 500;
parameter MUNOC_GPARA_2 = 16;

input wire munoc_port_2, munoc_port_1;
input wire munoc_port_0;

input wire munoc_port_6;
input wire munoc_port_5;

output wire munoc_port_4;
output wire [MUNOC_GPARA_1-1:0] munoc_port_7;
output wire [MUNOC_GPARA_2-1:0] munoc_port_3;

wire munoc_signal_1, munoc_signal_0;

assign munoc_signal_1 = munoc_port_6 & munoc_port_5;
assign munoc_signal_0 = munoc_port_6 & (~munoc_port_5);

RVX_MODULE_018
#(
	.RVX_GPARA_1(MUNOC_GPARA_1),
	.RVX_GPARA_2(MUNOC_GPARA_0),
	.RVX_GPARA_0(MUNOC_GPARA_2)
)
i_munoc_instance_0
(
	.rvx_port_5(munoc_port_2),
	.rvx_port_0(munoc_port_1),
	.rvx_port_1(munoc_port_0),
	.rvx_port_4(munoc_signal_1),
	.rvx_port_6(munoc_signal_0),
	.rvx_port_7(munoc_port_4),
	.rvx_port_3(munoc_port_7),
	.rvx_port_2(munoc_port_3)
);

endmodule

