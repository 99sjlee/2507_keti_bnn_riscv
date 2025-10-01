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


module ERVP_UPDOWN_COUNTER_WITH_ONEHOT_ENCODING
(
	clk,
  rstnn,
	enable,
	init,
  up,
  down,
	value,
  is_first_count,
	is_last_count
);


parameter COUNT_LENGTH = 1;
parameter RESET_INDEX = 0;
parameter INIT_INDEX = RESET_INDEX;
parameter CIRCULAR = 0;

input wire clk;
input wire rstnn;
input wire enable;
input wire init;
input wire up, down;
output wire [COUNT_LENGTH-1:0] value;
output wire is_first_count;
output wire is_last_count;

reg [COUNT_LENGTH-1:0] rvx_signal_0;

integer i;
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		for (i=0; i<COUNT_LENGTH; i=i+1)
			if(i==RESET_INDEX)
				rvx_signal_0[i] <= 1;
			else
				rvx_signal_0[i] <= 0;
	end
	else if(enable)
	begin
		if(init)
		begin
			for (i=0; i<COUNT_LENGTH; i=i+1)
				if(i==INIT_INDEX)
					rvx_signal_0[i] <= 1;
				else
					rvx_signal_0[i] <= 0;
		end
		else if((up==1)&&(down==0))
		begin
			if(CIRCULAR)
			begin
				rvx_signal_0[0] <= rvx_signal_0[COUNT_LENGTH-1];
				for(i=1; i<COUNT_LENGTH; i=i+1)
					rvx_signal_0[i] <= rvx_signal_0[i-1];
			end
			else if(rvx_signal_0[COUNT_LENGTH-1]==0)
			begin
				rvx_signal_0[0] <= 0;
				for(i=1; i<COUNT_LENGTH; i=i+1)
					rvx_signal_0[i] <= rvx_signal_0[i-1];
			end
		begin
			rvx_signal_0[0] <= 0;
			for(i=1; i<COUNT_LENGTH; i=i+1)
				rvx_signal_0[i] <= rvx_signal_0[i-1];
		end
		end
		else if((up==0)&&(down==1))
		begin
			if(CIRCULAR)
			begin
				for(i=0; i<COUNT_LENGTH-1; i=i+1)
					rvx_signal_0[i] <= rvx_signal_0[i+1];
				rvx_signal_0[COUNT_LENGTH-1] <= rvx_signal_0[0];
			end
			else if(rvx_signal_0[0]==1)
				;
			else
			begin
				for(i=0; i<COUNT_LENGTH-1; i=i+1)
					rvx_signal_0[i] <= rvx_signal_0[i+1];
				rvx_signal_0[COUNT_LENGTH-1] <= 0;
			end
		end
	end
end

assign value = rvx_signal_0;
assign is_first_count = (CIRCULAR==1)? rvx_signal_0[RESET_INDEX] : rvx_signal_0[0];
assign is_last_count = (CIRCULAR==1)? ((RESET_INDEX==0)? rvx_signal_0[COUNT_LENGTH-1] : rvx_signal_0[RESET_INDEX-1]) : rvx_signal_0[COUNT_LENGTH-1];

endmodule
