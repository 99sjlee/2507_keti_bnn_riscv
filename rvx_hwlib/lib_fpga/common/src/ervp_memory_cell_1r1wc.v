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



module ERVP_MEMORY_CELL_1R1WC
(
	clk,
	rstnn,

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
parameter USE_SUBWORD_ENABLE = 0;
parameter BW_SUBWORD = 8;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_0 = `DIVIDERU(WIDTH,BW_SUBWORD);
localparam  RVX_LPARA_1 = LOG2RU(DEPTH);

parameter BW_SELECT = (USE_SUBWORD_ENABLE==1)? RVX_LPARA_0: 1;

input wire clk, rstnn;

input wire [BW_INDEX-1:0] windex;
input wire wenable;
input wire [BW_SELECT-1:0] wpermit;
input wire [WIDTH-1:0] wdata;

input wire [BW_INDEX-1:0] rindex;
output wire [WIDTH-1:0] rdata_asynch;
input wire renable;
output wire [WIDTH-1:0] rdata_synch;

genvar i;
integer j;

wire [RVX_LPARA_1-1:0] rvx_signal_7, rvx_signal_4, rvx_signal_2;
wire [WIDTH-1:0] rvx_signal_3;
reg [WIDTH-1:0] rvx_signal_1;

reg [WIDTH-1:0] rvx_signal_5;
reg [WIDTH-1:0] rvx_signal_8;

wire [WIDTH-1:0] rvx_signal_0;
wire [WIDTH-1:0] rvx_signal_6;

assign rvx_signal_7 = 0;
assign rvx_signal_4 = $unsigned(windex);
assign rvx_signal_2 = $unsigned(rindex);

always@(*)
begin
	rvx_signal_1 = 0;
	if(wenable)
	begin
		if(USE_SUBWORD_ENABLE)
		begin
			for(j=0; j<WIDTH; j=j+1)
				rvx_signal_1[j] = wpermit[j/BW_SUBWORD];
		end
		else
			rvx_signal_1 = `ALL_ONE;
	end
end

always@(posedge clk)
begin
	if(renable)
	begin
		if(wenable && (rvx_signal_2==rvx_signal_4))
			rvx_signal_8 <= wdata;
	end
end

generate
	for(i=0; i<WIDTH; i=i+1)
	begin : i_check_conflict
		always@(posedge clk)
		begin
			if(renable)
			begin
				if(rvx_signal_1[i] && (rvx_signal_2==rvx_signal_4))
					rvx_signal_5[i] <= 1;
				else
					rvx_signal_5[i] <= 0;
			end
		end
	end
endgenerate

generate
	for(i=0; i<WIDTH; i=i+1)
	begin : i_select_rdata
		assign rdata_synch[i] = rvx_signal_5[i]? rvx_signal_8[i] : rvx_signal_3[i];
	end
endgenerate

assign rvx_signal_0 = 0;
assign rvx_signal_6 = ~rvx_signal_0;

ERVP_MEMORY_CELL_1R1W
#(
	.DEPTH(DEPTH),
	.WIDTH(WIDTH),
	.BW_INDEX(RVX_LPARA_1),
	.USE_SINGLE_INDEX(0),
	.USE_SUBWORD_ENABLE(USE_SUBWORD_ENABLE),
	.BW_SUBWORD(BW_SUBWORD),
	.BW_SELECT(BW_SELECT)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),

	.index(rvx_signal_7),
	
	.windex(rvx_signal_4),
	.wenable(wenable),
	.wpermit(wpermit),
	.wdata(wdata),

	.rindex(rvx_signal_2),
	.rdata_asynch(rdata_asynch),
	.renable(renable),
	.rdata_synch(rvx_signal_3)
);

endmodule
