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

module ERVP_COUNTER_WITH_ONEHOT_ENCODING
(
	clk, rstnn,
	enable,
	init, count,
	value,
	is_first_count,
	is_last_count
);

parameter COUNT_LENGTH = 1;
parameter UP = 1;
parameter RESET_INDEX = (UP==1)? 0 : (COUNT_LENGTH-1);
parameter INIT_INDEX = RESET_INDEX;
parameter CIRCULAR = 0;

input wire clk, rstnn;
input wire enable;
input wire init;
input wire count;
output reg [COUNT_LENGTH-1:0] value;
output wire is_first_count;
output wire is_last_count;

integer i;

assign is_first_count = (UP==1)? value[0] : value[COUNT_LENGTH-1];
assign is_last_count = (UP==1)? value[COUNT_LENGTH-1] : value[0];

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		for(i=0; i<COUNT_LENGTH; i=i+1)
			if(i==RESET_INDEX)
				value[i] <= 1;
			else
				value[i] <= 0;
	end
	else if(enable)
	begin
		if(init)
		begin
			for(i=0; i<COUNT_LENGTH; i=i+1)
				if(i==INIT_INDEX)
					value[i] <= 1;
				else
					value[i] <= 0;
		end
		else if(count==1)
		begin
			if(UP==1)
			begin
				if(CIRCULAR)
				begin
					value[0] <= value[COUNT_LENGTH-1];
					for(i=1; i<COUNT_LENGTH; i=i+1)
						value[i] <= value[i-1];
				end
				else if(is_last_count)
					;
				else
				begin
					value[0] <= 0;
					for(i=1; i<COUNT_LENGTH; i=i+1)
						value[i] <= value[i-1];
				end
			end
			else	
		begin
			if(CIRCULAR)
			begin
				for(i=0; i<COUNT_LENGTH-1; i=i+1)
					value[i] <= value[i+1];
				value[COUNT_LENGTH-1] <= value[0];
			end
			else if(is_last_count)
				;
			else
			begin
				for(i=0; i<COUNT_LENGTH-1; i=i+1)
					value[i] <= value[i+1];
				value[COUNT_LENGTH-1] <= 0;
			end
		end
		end
	end
end

endmodule
