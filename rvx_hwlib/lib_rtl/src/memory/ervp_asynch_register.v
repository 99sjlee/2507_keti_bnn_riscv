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



module ERVP_ASYNCH_REGISTER
(
	wclk,
	wrstnn,
	wready,
	wrequest,
	wdata,
	rclk,
	rrstnn,
	rready,
	rrequest,
	rdata
);



parameter BW_DATA = 8;

input wire wclk, wrstnn;
output wire wready;
input wire wrequest;
input wire [BW_DATA-1:0] wdata;

input wire rclk, rrstnn;
output wire rready;
input wire rrequest;
output reg [BW_DATA-1:0] rdata;

reg rvx_signal_0, rvx_signal_4;
wire rvx_signal_1, rvx_signal_5;
wire rvx_signal_3, rvx_signal_2;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_0
(
	.clk(wclk),
	.rstnn(rrstnn),	
	.enable(1'b 1),
	.asynch_value(rvx_signal_0),
	.synch_value(rvx_signal_5)
);

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_1
(
	.clk(rclk),
	.rstnn(rrstnn),
	.enable(1'b 1),
	.asynch_value(rvx_signal_4),
	.synch_value(rvx_signal_1)
);

always @(posedge rclk or negedge rrstnn)
	if (!rrstnn)
		rvx_signal_0 <= 0;
	else if(rvx_signal_3)
		rvx_signal_0 <= ~rvx_signal_0;

assign rready = (rvx_signal_0!=rvx_signal_1);
assign rvx_signal_3 = rready & rrequest;

always @(posedge wclk or negedge rrstnn)	
	if (!rrstnn)
		rvx_signal_4 <= 0;
	else if(rvx_signal_2)
		rvx_signal_4 <= ~rvx_signal_4;

assign wready = (rvx_signal_4==rvx_signal_5);
assign rvx_signal_2 = wready & wrequest;

always @(posedge wclk, negedge wrstnn)
begin
	if(wrstnn==0)
		rdata <= 0;
	else if (wrequest && wready)
		rdata <= wdata;
end

endmodule

