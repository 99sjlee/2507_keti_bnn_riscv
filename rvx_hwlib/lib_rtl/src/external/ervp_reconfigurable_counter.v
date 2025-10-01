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


module ERVP_RECONFIGURABLE_COUNTER
(
	clk,
  rstnn,
	enable,

  init,
	write,
	wvalue,
	count,
	count_amount,
	value,
	is_first_count,
	is_last_count
);


parameter BW_COUNTER = 1;
parameter BW_COUNT_AMOUNT = BW_COUNTER;
parameter RESET_NUMBER = 0;
parameter UNSIGNED = 1;
parameter FIRST_NUMBER = RESET_NUMBER;
parameter LAST_NUMBER = (UNSIGNED==1)? ((2**BW_COUNTER)-1) : ((2**(BW_COUNTER-1))-1);
parameter CIRCULAR = 0;

input wire clk;
input wire rstnn;
input wire enable;

input wire init;
input wire write;
input wire [BW_COUNTER-1:0] wvalue;
input wire count;
input wire [BW_COUNT_AMOUNT-1:0] count_amount;
output reg [BW_COUNTER-1:0] value;

output wire is_first_count;
output wire is_last_count;

wire [BW_COUNTER-1:0] rvx_signal_0;

assign rvx_signal_0 = $signed(count_amount);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		value <= RESET_NUMBER;
	else if(enable)
	begin
    if(init)
      value <= RESET_NUMBER;
		else if(write)
			value <= wvalue;
		else if(count==1)
    begin
      if((~is_last_count)||(CIRCULAR==1))
        value <= value + rvx_signal_0;
    end
	end
end

assign is_first_count = (value==FIRST_NUMBER);
assign is_last_count = (value==LAST_NUMBER);

endmodule
