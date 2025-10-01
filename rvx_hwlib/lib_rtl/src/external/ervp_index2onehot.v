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


module ERVP_INDEX2ONEHOT
(
  index,
  onehot
);


parameter NUM_DATA = 1;
parameter BW_INDEX = NUM_DATA;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

input wire [BW_INDEX-1:0] index;
output wire [NUM_DATA-1:0] onehot;

genvar i;
localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(NUM_DATA);

wire [RVX_LPARA_0-1:0] rvx_signal_0;

assign rvx_signal_0 = index;

for(i=0; i<NUM_DATA; i=i+1)
begin : i_gen_onehot
  assign onehot[i] = (NUM_DATA<=1)? 1 : ($unsigned(rvx_signal_0)==i);
end

endmodule
