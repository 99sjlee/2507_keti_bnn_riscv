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





module RVX_MODULE_098
(
	rvx_port_2,
	rvx_port_3,
	rvx_port_0,
	rvx_port_1
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 0;
parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_3 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(RVX_GPARA_2);

input wire [RVX_GPARA_0-1:0] rvx_port_2;
output wire [RVX_GPARA_2*RVX_GPARA_0-1:0] rvx_port_3;
input wire [RVX_GPARA_2*RVX_GPARA_3-1:0] rvx_port_0;
output wire [RVX_GPARA_3-1:0] rvx_port_1;

genvar i;

wire [RVX_LPARA_0-1:0] select = (RVX_GPARA_1 < RVX_GPARA_2)? RVX_GPARA_1 : 0;

ERVP_DEMUX
#(
	.BW_DATA(RVX_GPARA_0),
	.NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_1
(
	.data_input(rvx_port_2),
	.select(select),
	.data_output_list(rvx_port_3)
);

ERVP_MUX
#(
	.BW_DATA(RVX_GPARA_3),
	.NUM_DATA(RVX_GPARA_2)
)
i_rvx_instance_0
(
	.data_input_list(rvx_port_0),
	.select(select),
	.data_output(rvx_port_1)
);

endmodule
