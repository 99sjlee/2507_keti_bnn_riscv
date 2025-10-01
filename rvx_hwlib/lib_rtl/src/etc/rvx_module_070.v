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




module RVX_MODULE_070
(
	rvx_port_1,
	rvx_port_0
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_1 = 1;

input wire [RVX_GPARA_0-1:0] rvx_port_1;
output wire [RVX_GPARA_0-1:0] rvx_port_0;

genvar i;

wire [RVX_GPARA_0-1:0] rvx_signal_2;
wire [RVX_GPARA_0-1:0] rvx_signal_0;

wire [RVX_GPARA_0+1-1:0] rvx_signal_1;

generate
for(i=0; i<RVX_GPARA_0; i=i+1)
begin : i_reverse
  assign rvx_signal_2[i] = (RVX_GPARA_1==1)? rvx_port_1[i] : rvx_port_1[RVX_GPARA_0-1-i];
  assign rvx_port_0[i] = (RVX_GPARA_1==1)? rvx_signal_0[i] : rvx_signal_0[RVX_GPARA_0-1-i];
end
endgenerate

assign rvx_signal_1 = rvx_signal_2<<1;

generate
for(i=0; i<RVX_GPARA_0; i=i+1)
begin : i_nullify
  assign rvx_signal_0[i] = rvx_signal_1[i+1] & (rvx_signal_1[i:0]==0);
end
endgenerate

endmodule
