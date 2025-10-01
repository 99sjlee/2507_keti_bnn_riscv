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


module ERVP_COUNTER
(
	clk,
  rstnn,
	enable,
	init,
  count,
	value,
	is_first_count,
	is_last_count
);


parameter BW_COUNTER = 1;
parameter RESET_NUMBER = 0;
parameter INIT_NUMBER = RESET_NUMBER;
parameter LAST_NUMBER = (2**BW_COUNTER) -1;
parameter COUNT_AMOUNT = 1;
parameter CIRCULAR = 0;

input wire clk;
input wire rstnn;
input wire enable;
input wire init;
input wire count;
output reg [BW_COUNTER-1:0] value;

output wire is_first_count;
output wire is_last_count;

wire [BW_COUNTER-1:0] init_number = INIT_NUMBER;
wire [BW_COUNTER-1:0] last_number = LAST_NUMBER;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		value <= RESET_NUMBER;
	else if(enable)
	begin
		if(init==1)
			value <= INIT_NUMBER;
		else if(count==1)
		begin
			if(is_last_count)
			begin
				if(CIRCULAR==1)
					value <= INIT_NUMBER;
			end
			else
				value <= value + $signed(COUNT_AMOUNT);
		end
	end
end

assign is_first_count = (value==init_number);
assign is_last_count = (value==last_number);

endmodule
