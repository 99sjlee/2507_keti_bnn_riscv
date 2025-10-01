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




module RVX_MODULE_034
(
	rvx_port_5,
	rvx_port_4,
	rvx_port_1,
	rvx_port_3,
	rvx_port_0,
	rvx_port_2,
	rvx_port_6
);




parameter RVX_GPARA_1 = 4;
parameter RVX_GPARA_0 = RVX_GPARA_1+1;

input wire rvx_port_5, rvx_port_4;
input wire rvx_port_1;
input wire [RVX_GPARA_1-1:0] rvx_port_3;
output wire rvx_port_0;

output wire [RVX_GPARA_0-1:0] rvx_port_2;
input wire rvx_port_6;

RVX_MODULE_031
#(
	.RVX_GPARA_3(RVX_GPARA_1),
	.RVX_GPARA_2(RVX_GPARA_0),
	.RVX_GPARA_1(0)
)
i_rvx_instance_0
(
	.rvx_port_0(rvx_port_5),
	.rvx_port_1(rvx_port_4),
	.rvx_port_3(rvx_port_1),
	.rvx_port_2(rvx_port_3),
	.rvx_port_6(rvx_port_0),
	.rvx_port_5(),
	.rvx_port_7(rvx_port_2),
	.rvx_port_4(rvx_port_6)
);

endmodule

