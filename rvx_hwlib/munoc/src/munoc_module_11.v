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




module MUNOC_MODULE_11
(
	munoc_port_06,
	munoc_port_00,

	munoc_port_09,
	munoc_port_01,
	munoc_port_04,

	munoc_port_05,
	munoc_port_03,

	munoc_port_08,
	munoc_port_02,
	munoc_port_07
);




parameter MUNOC_GPARA_1 = 1;
parameter MUNOC_GPARA_0 = 1;

input wire munoc_port_06, munoc_port_00;

output wire munoc_port_09;
input wire munoc_port_01;
input wire [MUNOC_GPARA_1-1:0] munoc_port_04;

input wire munoc_port_05, munoc_port_03;

output wire munoc_port_08;
input wire munoc_port_02;
output wire [MUNOC_GPARA_1-1:0] munoc_port_07;

ERVP_ASYNCH_FIFO
#(
	.BW_DATA(MUNOC_GPARA_1),
	.DEPTH(MUNOC_GPARA_0)
)
i_munoc_instance_0
(
	.wclk(munoc_port_06),
	.wrstnn(munoc_port_00),
	.wready(munoc_port_09),
	.wrequest(munoc_port_01),
	.wfull(),
	.wdata(munoc_port_04),
	.rclk(munoc_port_05),
	.rrstnn(munoc_port_03),
	.rready(munoc_port_08),
	.rrequest(munoc_port_02),
	.rempty(),
	.rdata(munoc_port_07)
);

endmodule
