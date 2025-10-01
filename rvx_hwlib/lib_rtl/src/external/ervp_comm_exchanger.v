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


module ERVP_COMM_EXCHANGER
(
  select,
  original_request_data_list,
  original_response_data_list,
  exchanged_request_data_list,
  exchanged_response_data_list
);


parameter BW_REQUEST_DATA = 1;
parameter BW_RESPONSE_DATA = 1;

localparam  RVX_LPARA_0 = 2;

input wire select;
input wire [RVX_LPARA_0*BW_REQUEST_DATA-1:0] original_request_data_list;
output wire [RVX_LPARA_0*BW_RESPONSE_DATA-1:0] original_response_data_list;
output wire [RVX_LPARA_0*BW_REQUEST_DATA-1:0] exchanged_request_data_list;
input wire [RVX_LPARA_0*BW_RESPONSE_DATA-1:0] exchanged_response_data_list;

wire [BW_REQUEST_DATA-1:0] rvx_signal_0 [0:RVX_LPARA_0-1];
wire [BW_RESPONSE_DATA-1:0] rvx_signal_1 [0:RVX_LPARA_0-1];

assign {rvx_signal_0[1],rvx_signal_0[0]} = original_request_data_list;
assign exchanged_request_data_list = select? {rvx_signal_0[1],rvx_signal_0[0]} : {rvx_signal_0[0],rvx_signal_0[1]};
assign {rvx_signal_1[1],rvx_signal_1[0]} = exchanged_response_data_list;
assign original_response_data_list = select? {rvx_signal_1[1],rvx_signal_1[0]} : {rvx_signal_1[0],rvx_signal_1[1]};

endmodule
