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
`include "ervp_axi_define.vh"



module ERVP_ADDR_ALIGNER
(
  original_valid,
  original_addr,
  aligned_addr,
  aligned_addr_offset,
  subword_index,
  subword_index_onehot
);



parameter BW_ADDR = 32;
parameter BW_ORIGINAL_WORD = 32;
parameter BW_WIDE_WORD = 32;

localparam  RVX_LPARA_3 = BW_WIDE_WORD/BW_ORIGINAL_WORD;

parameter BW_INDEX = RVX_LPARA_3;

localparam  RVX_LPARA_2 = `GET_AXI_SIZE(BW_ORIGINAL_WORD);
localparam  RVX_LPARA_1 = `GET_AXI_SIZE(BW_WIDE_WORD);

input wire original_valid;
input wire [BW_ADDR-1:0] original_addr;
output wire [BW_ADDR-1:0] aligned_addr;
output wire [RVX_LPARA_1-1:0] aligned_addr_offset;
output wire [BW_INDEX-1:0] subword_index;
output wire [RVX_LPARA_3-1:0] subword_index_onehot;

localparam  RVX_LPARA_0 = BW_ADDR + RVX_LPARA_1;

wire [RVX_LPARA_2-1:0] rvx_signal_2;
wire [RVX_LPARA_0-1:0] rvx_signal_3;
wire [RVX_LPARA_0-1:0] rvx_signal_4;

wire rvx_signal_1;

wire [RVX_LPARA_3-1:0] rvx_signal_0;

assign {rvx_signal_3[RVX_LPARA_0-1:RVX_LPARA_2],rvx_signal_2} = original_addr;
assign rvx_signal_3[RVX_LPARA_2-1:0] = 0;

assign {rvx_signal_4[RVX_LPARA_0-1:RVX_LPARA_1],aligned_addr_offset} = rvx_signal_3;
assign rvx_signal_4[RVX_LPARA_1-1:0] = 0;
assign aligned_addr = rvx_signal_4;

assign rvx_signal_1 = original_valid & (rvx_signal_2!=0);

assign rvx_signal_0 = rvx_signal_3[RVX_LPARA_0-1:RVX_LPARA_2];
assign subword_index = rvx_signal_0;

ERVP_INDEX2ONEHOT
#(
  .NUM_DATA(RVX_LPARA_3)
)
i_rvx_instance_0
(
  .index(rvx_signal_0),
  .onehot(subword_index_onehot)
);

endmodule
