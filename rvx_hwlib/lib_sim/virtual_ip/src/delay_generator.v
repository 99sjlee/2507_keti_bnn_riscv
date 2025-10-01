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
`include "ervp_axi_define.vh"



module DELAY_GENERATOR
(
	clk,
	rstnn,
	delay_is_over
);



parameter DELAY_COUNT = 100;

input wire clk, rstnn;
output wire delay_is_over;

wire rvx_signal_0;
wire [32-1:0] rvx_signal_1;

ERVP_COUNTER
#(
	.BW_COUNTER(32)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(rvx_signal_0),
	.value(rvx_signal_1),
	.is_first_count(),
	.is_last_count()
);

assign rvx_signal_0 = ~delay_is_over;
assign delay_is_over = (rvx_signal_1==DELAY_COUNT);

endmodule
