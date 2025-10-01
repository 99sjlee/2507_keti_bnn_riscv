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



module ERVP_REGISTER_FILE_1R1WC
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
parameter BW_SUBWORD = WIDTH;

`include "ervp_log_util.vf"

localparam  RVX_LPARA_1 = `DIVIDERU(WIDTH,BW_SUBWORD);
localparam  RVX_LPARA_3 = LOG2RU(DEPTH);

parameter BW_SELECT = RVX_LPARA_1;

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

wire [RVX_LPARA_3-1:0] rvx_signal_2, rvx_signal_3, rvx_signal_4;
wire [WIDTH-1:0] rvx_signal_6;

localparam  RVX_LPARA_0 = 0;
localparam  RVX_LPARA_2 = 1;

reg [WIDTH-1:0] rvx_signal_5;
reg [RVX_LPARA_1-1:0] rvx_signal_0;
wire [WIDTH-1:0] rvx_signal_1;

assign rvx_signal_2 = 0;
assign rvx_signal_3 = $unsigned(windex);
assign rvx_signal_4 = $unsigned(rindex);

ERVP_REGISTER_FILE_1R1W
#(
	.DEPTH(DEPTH),
	.WIDTH(WIDTH),
	.BW_INDEX(RVX_LPARA_3),
	.BW_SELECT(BW_SELECT),
	.USE_SINGLE_INDEX(0)
)
i_rvx_instance_0
(
	.clk(clk),
	.rstnn(rstnn),

	.index(rvx_signal_2),
	
	.windex(rvx_signal_3),
	.wenable(wenable),
	.wpermit(wpermit),
	.wdata(wdata),

	.rindex(rvx_signal_4),
	.rdata_list_asynch(),
	.rdata_asynch(rdata_asynch),
	.renable(renable),
	.rdata_synch(rvx_signal_6)
);

always@(posedge clk)
begin
  if(rstnn==0)
    rvx_signal_5 <= 0;
	else if(renable && wenable && (rvx_signal_4==rvx_signal_3))
    rvx_signal_5 <= wdata;
end

always@(posedge clk)
begin
  if(rstnn==0)
    rvx_signal_0 <= 0;
  else if(renable)
  begin
    if(wenable && (rvx_signal_4==rvx_signal_3))
      rvx_signal_0 <= wpermit;
    else
      rvx_signal_0 <= 0;
  end
end

generate
for(i=0; i<WIDTH; i=i+1)
begin : i_select_rdata
  assign rvx_signal_1[i] = rvx_signal_0[i/BW_SUBWORD];
  assign rdata_synch[i] = rvx_signal_1[i]? rvx_signal_5[i] : rvx_signal_6[i];
end
endgenerate

endmodule
