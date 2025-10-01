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


module ERVP_SYNCHRONIZER
(
	clk,
	rstnn,
	enable,
	asynch_value,
	synch_value
);


parameter BW_DATA = 1;
parameter RESET_VALUE = 0;

input wire clk, rstnn;
input wire enable;
input wire [BW_DATA-1:0] asynch_value;
output reg [BW_DATA-1:0] synch_value;

reg [BW_DATA-1:0] rvx_signal_0;

always @(posedge clk or negedge rstnn)
	if (!rstnn)
	begin
		synch_value <= RESET_VALUE;
		rvx_signal_0 <= RESET_VALUE;
	end
	else if(enable)
		{synch_value,rvx_signal_0} <= {rvx_signal_0,asynch_value};

endmodule

