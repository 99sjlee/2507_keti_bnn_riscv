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



module ERVP_TRANSFER_WIDENNER
(
  original_valid,
  original_addr,
  original_wdata,
  original_wbyteen,
  original_rdata,

  wide_addr,
  wide_addr_offset,
  wide_wdata,
  wide_wbyteen,
  wide_rdata
);



parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_WIDE_DATA = 32;

localparam  RVX_LPARA_3 = BW_WIDE_DATA/BW_DATA;

localparam  RVX_LPARA_0 = `GET_AXI_SIZE(BW_DATA);
localparam  RVX_LPARA_4 = `NUM_BYTE(BW_DATA);

localparam  RVX_LPARA_2 = `GET_AXI_SIZE(BW_WIDE_DATA);
localparam  RVX_LPARA_1 = `NUM_BYTE(BW_WIDE_DATA);

input wire original_valid;
input wire [BW_ADDR-1:0] original_addr;
input wire [BW_DATA-1:0] original_wdata;
input wire [RVX_LPARA_4-1:0] original_wbyteen;
output wire [BW_DATA-1:0] original_rdata;

output wire [BW_ADDR-1:0] wide_addr;
output wire [RVX_LPARA_2-1:0] wide_addr_offset;
output wire [BW_WIDE_DATA-1:0] wide_wdata;
output wire [RVX_LPARA_1-1:0] wide_wbyteen;
input wire [BW_WIDE_DATA-1:0] wide_rdata;

genvar i;

wire [RVX_LPARA_3-1:0] rvx_signal_1;
wire [RVX_LPARA_3-1:0] rvx_signal_0;

ERVP_ADDR_ALIGNER
#(
  .BW_ADDR(BW_ADDR),
  .BW_ORIGINAL_WORD(BW_DATA),
  .BW_WIDE_WORD(BW_WIDE_DATA)
)
i_rvx_instance_1
(
  .original_valid(original_valid),
  .original_addr(original_addr),
  .aligned_addr(wide_addr),
  .aligned_addr_offset(wide_addr_offset),
  .subword_index(rvx_signal_1),
  .subword_index_onehot(rvx_signal_0)
);

for(i=0; i<RVX_LPARA_3; i=i+1)
begin : i_widen
  assign wide_wdata[BW_DATA*(i+1)-1-:BW_DATA] = original_wdata;
  assign wide_wbyteen[RVX_LPARA_4*(i+1)-1-:RVX_LPARA_4] = rvx_signal_0[i]? original_wbyteen : 0;
end

ERVP_MUX
#(
  .BW_DATA(BW_DATA),
  .NUM_DATA(RVX_LPARA_3),
  .BW_SELECT(RVX_LPARA_3)
)
i_rvx_instance_0
(
	.data_input_list(wide_rdata),
	.select(rvx_signal_1),
	.data_output(original_rdata)
);

endmodule
