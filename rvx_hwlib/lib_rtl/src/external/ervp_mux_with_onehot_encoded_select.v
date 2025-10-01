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


module ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
(
	data_input_list,
	select,
	data_output
);


parameter BW_DATA = 1;
parameter NUM_DATA = 1;
parameter ACTIVE_HIGH = 1;

input wire [BW_DATA*NUM_DATA-1:0] data_input_list;
input wire [NUM_DATA-1:0] select;
output wire [BW_DATA-1:0] data_output;

genvar i,j;
integer k;

wire [BW_DATA-1:0] rvx_signal_1 [NUM_DATA-1:0];

generate
	for(i=0; i<NUM_DATA; i=i+1)
	begin : i_nullifying_data
		assign rvx_signal_1[i] = (select[i]==ACTIVE_HIGH)? data_input_list[BW_DATA*(i+1)-1 -:BW_DATA] : 0;
	end
endgenerate

reg [BW_DATA-1:0] rvx_signal_0;
always@(*)
begin
	rvx_signal_0 = 0;
	for(k=0; k<NUM_DATA; k=k+1)
		if(k==0)
			rvx_signal_0 = rvx_signal_1[0];
		else
			rvx_signal_0 = rvx_signal_0|rvx_signal_1[k];
end

assign data_output = rvx_signal_0;

endmodule
