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
`include "rvx_include_19.vh"




module RVX_MODULE_087
(
	rvx_port_0,
	rvx_port_1
);




parameter RVX_GPARA_0 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_0 = 3;

input wire [RVX_GPARA_0*RVX_LPARA_0-1:0] rvx_port_0;
output wire [RVX_GPARA_0-1:0] rvx_port_1;

genvar i,j;
integer k;

wire [RVX_GPARA_0-1:0] rvx_signal_0 [RVX_LPARA_0-1:0];

generate
	for(i=0; i<RVX_LPARA_0; i=i+1)
	begin : i_split_data
		assign rvx_signal_0[i] = rvx_port_0[RVX_GPARA_0*(i+1)-1 -:RVX_GPARA_0];
	end
endgenerate

generate
	for(i=0; i<RVX_GPARA_0; i=i+1)
	begin : i_merge
		assign rvx_port_1[i] = `RVX_GDEF_381({rvx_signal_0[2][i],rvx_signal_0[1][i],rvx_signal_0[0][i]});
	end
endgenerate

endmodule
