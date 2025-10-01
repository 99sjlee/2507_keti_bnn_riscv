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

module ERVP_DUPLICATOR
(
	data_input,
	data_output
);

parameter BW_DATA = 1;
parameter NUM_DATA = 1;

input wire [BW_DATA-1:0] data_input;
output wire [BW_DATA*NUM_DATA-1:0] data_output;

genvar i;

generate
for(i=0; i<NUM_DATA; i=i+1)
begin : i_assign
	assign data_output [BW_DATA*(i+1)-1 -:BW_DATA] = data_input;
end
endgenerate

endmodule
