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



module ERVP_ASYNCH_SINGLE_CYCLE
(
	wclk,
	wrstnn,
	wcontrol,

	rclk,
	rrstnn,
	rcontrol
);



input wire wclk;
input wire wrstnn;
input wire wcontrol;

input wire rclk;
input wire rrstnn;
output wire rcontrol;

wire rvx_signal_0;
wire rvx_signal_1;
wire rvx_signal_3;
wire rvx_signal_2;

ERVP_ASYNCH_REGISTER
#(
	.BW_DATA(1)
)
i_rvx_instance_0
(
	.wclk(wclk),
	.wrstnn(wrstnn),
	.wready(rvx_signal_0),
	.wrequest(rvx_signal_1),
	.wdata(1'b 0),
	.rclk(rclk),
	.rrstnn(rrstnn),
	.rready(rvx_signal_2),
	.rrequest(rvx_signal_3),
	.rdata()
);

assign rvx_signal_1 = wcontrol;

assign rvx_signal_3 = rvx_signal_2;
assign rcontrol = rvx_signal_2;

endmodule
