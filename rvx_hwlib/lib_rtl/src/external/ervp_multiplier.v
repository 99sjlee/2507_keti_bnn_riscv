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


module ERVP_MULTIPLIER
(
  multiplicand,
  multiplier,
  product
);


parameter BW_MULTIPLICAND = 32;
parameter BW_MULTIPLIER = 32;
parameter USE_LIBRARY = 1;

localparam  RVX_LPARA_0 = BW_MULTIPLICAND+BW_MULTIPLIER;

input wire [BW_MULTIPLICAND-1:0] multiplicand;
input wire [BW_MULTIPLIER-1:0] multiplier;
output reg [RVX_LPARA_0-1:0] product;

genvar i;
integer j;

localparam  RVX_LPARA_1 = BW_MULTIPLIER;

wire [RVX_LPARA_0-1:0] rvx_signal_1;
wire [RVX_LPARA_0-1:0] rvx_signal_2;
wire [RVX_LPARA_0-1:0] rvx_signal_0 [RVX_LPARA_1-1:0];

assign rvx_signal_1 = $signed(multiplicand);
assign rvx_signal_2 = (~rvx_signal_1) + 1;

for(i=0; i<RVX_LPARA_1-1; i=i+1)
begin : i_gen_partial_product
  assign rvx_signal_0[i] = multiplier[i]? (rvx_signal_1<<i) : 0;
end

assign rvx_signal_0[RVX_LPARA_1-1] = multiplier[RVX_LPARA_1-1]? (rvx_signal_2<<(RVX_LPARA_1-1)) : 0;

always@(*)
begin
  product = 0;
  if(USE_LIBRARY==1)
    product = $signed(multiplicand) * $signed(multiplier);
  else
    for(j=0; j<RVX_LPARA_1; j=j+1)
      product = product + rvx_signal_0[j];
end

endmodule
