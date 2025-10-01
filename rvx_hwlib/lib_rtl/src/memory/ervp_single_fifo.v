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


module ERVP_SINGLE_FIFO
(
	clk,
  rstnn,
	enable,
  clear,
	wready,
	wfull,
	wrequest,
	wdata,
	rready,
	rempty,
	rrequest,
	rdata
);


parameter BW_DATA = 1;
parameter READ_READY_SIZE = 1;
parameter WRITE_READY_SIZE = 1;

input wire clk;
input wire rstnn;
input wire enable;
input wire clear;

output wire [WRITE_READY_SIZE-1:0] wready;
input wire wrequest;
output wire wfull;
input wire [BW_DATA-1:0] wdata;

output wire [READ_READY_SIZE-1:0] rready;
input wire rrequest;
output wire rempty;
output wire [BW_DATA-1:0] rdata;

reg rvx_signal_3;

localparam  RVX_LPARA_0 = 0;
localparam  RVX_LPARA_1 = 1;

reg [BW_DATA-1:0] rvx_signal_0;
wire rvx_signal_2;
wire rvx_signal_1;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_3 <= RVX_LPARA_0;
  else if(clear)
    rvx_signal_3 <= RVX_LPARA_0;
  else if(enable)
  begin
    if(rvx_signal_2)
      rvx_signal_3 <= RVX_LPARA_1;
    else if(rvx_signal_1)
      rvx_signal_3 <= RVX_LPARA_0;
  end
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_0 <= 0;
  else if(enable && rvx_signal_2)
    rvx_signal_0 <= wdata;
end

assign rvx_signal_2 = wrequest & wready;
assign rvx_signal_1 = rrequest & rready;

assign wready = (rvx_signal_3==RVX_LPARA_0);
assign wfull = ~(wready[0]);
assign rready = (rvx_signal_3==RVX_LPARA_1);
assign rempty = ~(rready[0]);
assign rdata = rvx_signal_0;

endmodule
