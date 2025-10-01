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

module ERVP_UPDOWN_COUNTER
(
	clk,
  rstnn,
	enable,
	init,
	up,
	down,
	count_amount,
	value,
	is_upper_limit,
	is_lower_limit
);

parameter BW_COUNTER = 1;
parameter BW_COUNT_AMOUNT = BW_COUNTER;
parameter RESET_NUMBER = 0;
parameter INIT_NUMBER = RESET_NUMBER;
parameter UNSIGNED = 1;
parameter UPPER_LIMIT_NUMBER = (UNSIGNED==1)? ((2**BW_COUNTER)-1) : ((2**(BW_COUNTER-1))-1);
parameter LOWER_LIMIT_NUMBER = (UNSIGNED==1)? 0 : ((2**(BW_COUNTER-1)));

input wire clk;
input wire rstnn;
input wire enable;
input wire init;
input wire up;
input wire down;
input wire [BW_COUNT_AMOUNT-1:0] count_amount;
output reg [BW_COUNTER-1:0] value;

output wire is_upper_limit;
output wire is_lower_limit;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		value <= RESET_NUMBER;
	else if(enable)
	begin
		if(init==1)
			value <= INIT_NUMBER;
		else if(up && (~down))
		begin
			if(~is_upper_limit)
				value <= value + $signed(count_amount);
		end
		else if(down && (~up))
		begin
			if(~is_lower_limit)
				value <= value - $signed(count_amount);
		end
	end
end

assign is_upper_limit = (value==UPPER_LIMIT_NUMBER);
assign is_lower_limit = (value==LOWER_LIMIT_NUMBER);

endmodule
