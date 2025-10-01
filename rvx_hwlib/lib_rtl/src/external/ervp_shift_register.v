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


module ERVP_SHIFT_REGISTER
(
	clk,
  rstnn,
  enable,
	set_value,
	right_insertion,
	left_insertion,
	init,
	set,
	left_shift,
	right_shift,
	is_upper_limit,
	is_lower_limit,
	value
);


parameter BW_REGISTER = 1;
parameter RESET_NUMBER = 0;
parameter INIT_NUMBER = RESET_NUMBER;
parameter SHIFT_AMOUNT = 1;

input wire clk;
input wire rstnn;
input wire enable;

input wire [BW_REGISTER-1:0] set_value;
input wire [SHIFT_AMOUNT-1:0] right_insertion;
input wire [SHIFT_AMOUNT-1:0] left_insertion;
input wire init;
input wire set;
input wire left_shift;
input wire right_shift;
input wire is_upper_limit, is_lower_limit;
output reg [BW_REGISTER-1:0] value;

wire [BW_REGISTER+SHIFT_AMOUNT-1:0] rvx_signal_1;
wire [BW_REGISTER+SHIFT_AMOUNT-1:0] rvx_signal_0;

assign rvx_signal_1 = {value,right_insertion};
assign rvx_signal_0 = {left_insertion,value};

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		value <= RESET_NUMBER;
	else if(init==1)
		value <= INIT_NUMBER;
  else if(enable)
  begin
    if(set==1)
      value <= set_value;
    else if(left_shift && (~right_shift))
    begin
      if(~is_upper_limit)
        value <= rvx_signal_1;
    end
    else if(right_shift && (~left_shift))
    begin
      if(~is_lower_limit)
      begin
        value <= rvx_signal_0[BW_REGISTER+SHIFT_AMOUNT-1 -:BW_REGISTER];
      end
    end
  end
end

endmodule
