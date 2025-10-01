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


module ERVP_MUX
(
	data_input_list,
	select,
	data_output
);


`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter BW_DATA = 1;
parameter NUM_DATA = 1;
parameter LOWER_INDEX_TO_UPPER_DATA = 0;
localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_INDEX(NUM_DATA);
parameter BW_SELECT = RVX_LPARA_1;

localparam  RVX_LPARA_0 = 2**RVX_LPARA_1;

input wire [BW_DATA*NUM_DATA-1:0] data_input_list;
input wire [BW_SELECT-1:0] select;
output wire [BW_DATA-1:0] data_output;

genvar i;

wire [BW_DATA*NUM_DATA-1:0] rvx_signal_2;
wire [BW_DATA*RVX_LPARA_0-1:0] rvx_signal_1;
wire [BW_DATA-1:0] rvx_signal_3 [RVX_LPARA_0-1:0];
wire [RVX_LPARA_1-1:0] rvx_signal_0;

for(i=0; i<NUM_DATA; i=i+1)
begin : i_reorder
  assign rvx_signal_2[BW_DATA*(i+1)-1 -:BW_DATA] = (LOWER_INDEX_TO_UPPER_DATA==0)? data_input_list[BW_DATA*(i+1)-1 -:BW_DATA] : data_input_list[BW_DATA*(NUM_DATA-i)-1 -:BW_DATA];
end

assign rvx_signal_1 = rvx_signal_2;
assign rvx_signal_0 = $unsigned(select);

for(i=0; i<RVX_LPARA_0; i=i+1)
begin : i_split_input
  assign rvx_signal_3[i] = rvx_signal_1[BW_DATA*(i+1)-1 -:BW_DATA];
end

assign data_output = (NUM_DATA<=1)? data_input_list : rvx_signal_3[$unsigned(rvx_signal_0)];

endmodule
