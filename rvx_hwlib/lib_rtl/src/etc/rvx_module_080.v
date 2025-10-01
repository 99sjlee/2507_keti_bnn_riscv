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



module RVX_MODULE_080
(
	rvx_port_1,
	rvx_port_0
);



parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = -1;

input wire [RVX_GPARA_2-1:0] rvx_port_1;
output reg [RVX_GPARA_0-1:0] rvx_port_0;

`ifdef RVX_GPARA_1 (-1)
	`include "abgrvtnoc_lut_addr2target_node_sample.vh"
`endif

endmodule
