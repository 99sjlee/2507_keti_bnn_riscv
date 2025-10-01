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



module ERVP_SWITCH_TO_COUNTER
(
	clk,
	rstnn,
	tick_1us,
	switch_input,
	value
);



parameter ACTIVE_HIGH = 0;
parameter PERIOD_MS = 500;
parameter TICK_HZ = 1000000;
parameter BW_VALUE = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_1 = TICK_HZ/(1000/PERIOD_MS);
localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_UNSIGNED(RVX_LPARA_1);

input wire clk, rstnn;
input wire tick_1us;
input wire switch_input;
output wire [BW_VALUE-1:0] value;

wire rvx_signal_2;
reg rvx_signal_1;
wire rvx_signal_0;

assign rvx_signal_0 = (ACTIVE_HIGH==0)? (~switch_input) : switch_input;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_1 <= 0;
	else
	begin
		if(rvx_signal_1==0)
		begin
			if(rvx_signal_0)
				rvx_signal_1 <= 1;
		end
		else
		begin
			if(tick_1us && rvx_signal_2)
				rvx_signal_1 <= 0;
		end
	end
end

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_0),
	.LAST_NUMBER(RVX_LPARA_1-1),
	.CIRCULAR(1)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(rvx_signal_1),
	.init(1'b 0),
	.count(tick_1us),
	.value(),
	.is_first_count(),
	.is_last_count(rvx_signal_2)
);

ERVP_COUNTER
#(
	.BW_COUNTER(BW_VALUE),
	.CIRCULAR(1)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(~rvx_signal_1),
	.init(1'b 0),
	.count(rvx_signal_0),
	.value(value),
	.is_first_count(),
	.is_last_count()
);

endmodule
