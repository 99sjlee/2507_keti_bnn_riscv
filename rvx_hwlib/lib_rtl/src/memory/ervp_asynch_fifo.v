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



module ERVP_ASYNCH_FIFO
(
	wclk,
	wrstnn,
	wready,
	wrequest,
	wfull,
	wdata,
	rclk,
	rrstnn,
	rready,
	rrequest,
	rempty,
	rdata
);



parameter BW_DATA = 1;
parameter DEPTH = 1;
parameter WRITE_READY_SIZE = 1;
parameter NO_DATA = 0;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

localparam  RVX_LPARA_1 = REQUIRED_BITWIDTH_INDEX(DEPTH);
localparam  RVX_LPARA_0 = 1<<RVX_LPARA_1;

input wire wclk, wrstnn;
output wire [WRITE_READY_SIZE-1:0] wready;
input wire wrequest;
output reg wfull;
input wire [BW_DATA-1:0] wdata;

input wire rclk, rrstnn;
output wire rready;
output reg rempty;
input wire rrequest;
output wire [BW_DATA-1:0] rdata;

integer j;

reg [BW_DATA-1:0] rvx_signal_02 [0:RVX_LPARA_0-1];

wire [RVX_LPARA_1-1:0] rvx_signal_03, rvx_signal_11;
reg [RVX_LPARA_1:0] rvx_signal_05, rvx_signal_00;
reg [RVX_LPARA_1:0] rvx_signal_12, rvx_signal_17;

wire [RVX_LPARA_1:0] rvx_signal_13;
wire [RVX_LPARA_1:0] rvx_signal_09;

wire [RVX_LPARA_1:0] rvx_signal_06, rvx_signal_15;
wire [RVX_LPARA_1:0] rvx_signal_07, rvx_signal_08;
reg [RVX_LPARA_1:0] rvx_signal_04;

wire [RVX_LPARA_1:0] rvx_signal_10, rvx_signal_14;
reg [`MAX(WRITE_READY_SIZE,2)-1:0] rvx_signal_01;
reg rvx_signal_16;

assign rdata = (NO_DATA==1)? 0 : rvx_signal_02 [rvx_signal_11];

always @(posedge wclk, negedge wrstnn)
begin
	if(wrstnn==0)
		for (j=0; j<RVX_LPARA_0; j=j+1)
			rvx_signal_02[j] <= 0;
	else if (wrequest && !wfull)
		rvx_signal_02[rvx_signal_03] <= wdata;
end
	
ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_1+1)
)
i_rvx_instance_0
(
	.clk(wclk),
	.rstnn(wrstnn),
	.enable(1'b 1),
	.asynch_value(rvx_signal_12),
	.synch_value(rvx_signal_13)
);

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_1+1)
)
i_rvx_instance_1
(
	.clk(rclk),
	.rstnn(rrstnn),
	.enable(1'b 1),
	.asynch_value(rvx_signal_05),
	.synch_value(rvx_signal_09)
);

always @(posedge rclk or negedge rrstnn)
begin
	if (!rrstnn)
		{rvx_signal_17, rvx_signal_12} <= 0;
	else
		{rvx_signal_17, rvx_signal_12} <= {rvx_signal_15, rvx_signal_06};
end

assign rvx_signal_11 = rvx_signal_17[RVX_LPARA_1-1:0];
assign rvx_signal_15 = rvx_signal_17 + (rrequest & ~rempty);
assign rvx_signal_06 = `BINARY2GRAY(rvx_signal_15);

always @(posedge rclk or negedge rrstnn)
begin
	if (!rrstnn)
		rempty <= 1'b1;
	else
		rempty <= (rvx_signal_06 == rvx_signal_09);
end

assign rready = ~rempty;

always @(posedge wclk or negedge wrstnn)
begin
	if (!wrstnn)
		{rvx_signal_00, rvx_signal_05} <= 0;
	else
		{rvx_signal_00, rvx_signal_05} <= {rvx_signal_08, rvx_signal_07};
end

assign rvx_signal_03 = rvx_signal_00[RVX_LPARA_1-1:0];
assign rvx_signal_08 = rvx_signal_00 + (wrequest & ~wfull);
assign rvx_signal_07 = `BINARY2GRAY(rvx_signal_08);

always@(*)
begin
	rvx_signal_04 = rvx_signal_13;
	rvx_signal_04[RVX_LPARA_1:RVX_LPARA_1-1] = ~rvx_signal_13[RVX_LPARA_1:RVX_LPARA_1-1];
end

always @(posedge wclk or negedge wrstnn)
begin
	if (!wrstnn)
		wfull <= 1'b0;
	else
		wfull <= (rvx_signal_07==rvx_signal_04);
end

always@(*)
begin
	rvx_signal_01 = 0;
	rvx_signal_01[0] = ~wfull;
	rvx_signal_01[1] = (~wfull) & (~rvx_signal_16);
end

assign wready = $unsigned(rvx_signal_01);

assign rvx_signal_14 = rvx_signal_00 + 1'b 1 + (wrequest & ~wfull);
assign rvx_signal_10 = `BINARY2GRAY(rvx_signal_14);

always @(posedge wclk or negedge wrstnn)
begin
	if (!wrstnn)
		rvx_signal_16 <= (RVX_LPARA_0==1)? 1'b1 : 1'b0;
	else
		rvx_signal_16 <= (rvx_signal_10==rvx_signal_04);
end

endmodule

