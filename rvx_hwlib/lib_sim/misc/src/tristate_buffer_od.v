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

module TRISTATE_BUFFER_OD
(
	rod_list,
	roval_list,
	rival_list,
	inout_port_list
);

parameter BW_DATA = 1;
parameter NUM_DATA = 1;

localparam  RVX_LPARA_0 = BW_DATA*NUM_DATA;

input wire [RVX_LPARA_0-1:0] rod_list;
input wire [RVX_LPARA_0-1:0] roval_list;
output wire [RVX_LPARA_0-1:0] rival_list;
inout wire [RVX_LPARA_0-1:0] inout_port_list;

genvar i;

generate
	for(i=0; i<RVX_LPARA_0; i=i+1)
	begin : i_split_port
		assign rival_list[i] = inout_port_list[i];
		assign inout_port_list[i] = (rod_list[i]==1'b 0)? roval_list[i] : 1'b z;
	end
endgenerate

endmodule

