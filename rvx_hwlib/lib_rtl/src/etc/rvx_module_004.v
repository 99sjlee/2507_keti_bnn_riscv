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




module RVX_MODULE_004
(
	rvx_port_1,
	rvx_port_0
);




parameter RVX_GPARA_1 = 16;
parameter RVX_GPARA_0 = 8;

input wire [RVX_GPARA_1-1:0] rvx_port_1;
output wire [RVX_GPARA_0-1:0] rvx_port_0;

localparam  RVX_LPARA_0 = RVX_GPARA_1 + RVX_GPARA_0;

wire [RVX_LPARA_0-1:0] rvx_signal_0;

assign rvx_signal_0[RVX_LPARA_0-1-:RVX_GPARA_1] = rvx_port_1;
assign rvx_signal_0[RVX_GPARA_0-1:0] = 0;

assign rvx_port_0 = rvx_signal_0[RVX_LPARA_0-1-:RVX_GPARA_0];

endmodule
