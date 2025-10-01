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




module RVX_MODULE_126
(
	rvx_port_2,
	rvx_port_0,
	rvx_port_1
);




parameter RVX_GPARA_1 = 32;
parameter RVX_GPARA_0 = 32;

input wire [RVX_GPARA_1-1:0] rvx_port_2;
output reg [RVX_GPARA_0-1:0] rvx_port_0;
output reg rvx_port_1;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_0 [0:RVX_GPARA_1];

assign rvx_signal_0[0] = RVX_GPARA_1;

generate
for(i=0; i<RVX_GPARA_1; i=i+1)
begin : i_gen_stage
	assign rvx_signal_0[i+1] = rvx_port_2[i]? (RVX_GPARA_1-1-i) : rvx_signal_0[i];
end
endgenerate

always@(*)
begin
	rvx_port_1 = 0;
	rvx_port_0 = 0;
	if(rvx_port_2==0)
		rvx_port_1 = 1;
	else
		rvx_port_0 = rvx_signal_0[RVX_GPARA_1];
end

endmodule
