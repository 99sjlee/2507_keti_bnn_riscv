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


module ERVP_MEMORY_CELL_1R1W
(
	clk,
	rstnn,

	index,
	
	windex,
	wenable,
	wpermit,
	wdata,

	rindex,
	rdata_asynch,
	renable,
	rdata_synch
);


parameter DEPTH = 2;
parameter WIDTH = 2;
parameter BW_INDEX = 1;
parameter USE_SINGLE_INDEX = 0;
parameter USE_SUBWORD_ENABLE = 0;
parameter BW_SUBWORD = 8;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_0 = `DIVIDERU(WIDTH,BW_SUBWORD);
localparam  RVX_LPARA_1 = LOG2RU(DEPTH);

parameter BW_SELECT = (USE_SUBWORD_ENABLE==1)? RVX_LPARA_0: 1;

input wire clk, rstnn;

input wire [BW_INDEX-1:0] index;

input wire [BW_INDEX-1:0] windex;
input wire wenable;
input wire [BW_SELECT-1:0] wpermit;
input wire [WIDTH-1:0] wdata;

input wire [BW_INDEX-1:0] rindex;
output wire [WIDTH-1:0] rdata_asynch;
input wire renable;
output reg [WIDTH-1:0] rdata_synch;

genvar i;
integer j;

reg [WIDTH-1:0] memory [0:DEPTH-1];
wire [RVX_LPARA_1-1:0] rvx_signal_1, rvx_signal_2;
reg [WIDTH-1:0] rvx_signal_0;	

assign rvx_signal_1 = (USE_SINGLE_INDEX==1)? $unsigned(index) : $unsigned(windex);
assign rvx_signal_2 = (USE_SINGLE_INDEX==1)? $unsigned(index) : $unsigned(rindex);

always@(*)
begin
	rvx_signal_0 = 0;
	if(wenable)
	begin
		if(USE_SUBWORD_ENABLE)
		begin
			for(j=0; j<WIDTH; j=j+1)
				rvx_signal_0[j] = wpermit[j/BW_SUBWORD];
		end
		else
			rvx_signal_0 = `ALL_ONE;
	end
end

initial
begin
	for(j=0; j<DEPTH; j=j+1)
		memory[j] = 0;
end

generate
	for(i=0; i<WIDTH; i=i+1)
	begin : i_write_bit
		always@(posedge clk)
		begin
			if(rvx_signal_0[i])
				memory[rvx_signal_1][i] <= wdata[i];
		end
	end
endgenerate

assign rdata_asynch = memory[rvx_signal_2];

always@(posedge clk)
begin
	if(renable)
		rdata_synch <= rdata_asynch;
end

endmodule
