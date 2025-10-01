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


module ERVP_REAL_CLOCK
(
	clk,
	rstnn,
	tick_1us,
	real_clock
);


localparam  RVX_LPARA_0 = 64;

input wire clk, rstnn;
input wire tick_1us;
output wire [RVX_LPARA_0-1:0] real_clock;

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_LPARA_0),
	.CIRCULAR(1)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
	.init(1'b 0),
	.count(tick_1us),
	.value(real_clock),
	.is_first_count(),
	.is_last_count()
);

endmodule
