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





module RVX_MODULE_056
(
	rvx_port_3,
	rvx_port_2,
	rvx_port_4,
	rvx_port_5,
	rvx_port_1,
	rvx_port_0
);





parameter RVX_GPARA_0 = 32;

input wire rvx_port_3, rvx_port_2;
input wire rvx_port_4;
input wire rvx_port_5;
input wire [RVX_GPARA_0-1:0] rvx_port_1;
output wire rvx_port_0;

wire rvx_signal_2;
wire [RVX_GPARA_0-1:0] rvx_signal_1;
wire rvx_signal_0;
wire rvx_signal_3;

ERVP_COUNTER
#(
	.BW_COUNTER(RVX_GPARA_0),
  .RESET_NUMBER(1),
	.CIRCULAR(0)
)
i_rvx_instance_0
(
	.clk(rvx_port_3),
	.rstnn(rvx_port_2),
	.enable(rvx_port_4 & rvx_port_5),
	.init(rvx_signal_2),
	.count(1'b 1),
	.value(rvx_signal_1),
	.is_first_count(rvx_signal_0),
	.is_last_count()
);

assign rvx_signal_2 = rvx_signal_3;
assign rvx_signal_3 = (rvx_signal_1==rvx_port_1);
assign rvx_port_0 = rvx_port_4 & rvx_port_5 & rvx_signal_0;

endmodule
