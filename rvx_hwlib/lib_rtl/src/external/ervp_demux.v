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


module ERVP_DEMUX
(
	data_input,
	select,
	data_output_list
);


`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter BW_DATA = 1;
parameter NUM_DATA = 1;
parameter LOWER_INDEX_TO_UPPER_DATA = 0;
localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(NUM_DATA);
parameter BW_SELECT = RVX_LPARA_0;

input wire [BW_DATA-1:0] data_input;
input wire [BW_SELECT-1:0] select;
output wire [BW_DATA*NUM_DATA-1:0] data_output_list;

genvar i;

wire [RVX_LPARA_0-1:0] rvx_signal_0;

assign rvx_signal_0 = (NUM_DATA==1)? 0 : select;

generate
for(i=0; i<NUM_DATA; i=i+1)
begin : i_assign
	assign data_output_list [BW_DATA*(i+1)-1 -:BW_DATA] = (rvx_signal_0==i)? data_input : 0;
end
endgenerate

endmodule
