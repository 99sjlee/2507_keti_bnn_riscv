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


module ERVP_VALID_ONCE_CAPTURER
(
	clk,
	rstnn,
  clear,
  enable,

	valid_once,
  valid_extended,
  invalidate
);


parameter REGISTERED_VALID = 1;

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;

input wire valid_once;
output wire valid_extended;
input wire invalidate;

reg rvx_signal_0;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_0 <= 0;
	else if(clear||invalidate)
		rvx_signal_0 <= 0;
	else if(valid_once)
    rvx_signal_0 <= 1;
end

assign valid_extended = (REGISTERED_VALID==1)? rvx_signal_0 : (rvx_signal_0 | valid_once);

endmodule
