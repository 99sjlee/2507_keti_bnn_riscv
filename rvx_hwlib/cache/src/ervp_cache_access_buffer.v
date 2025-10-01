// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE 
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS 
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE 
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL 
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE, 
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE 
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2024-01-03
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"

module ERVP_CACHE_ACCESS_BUFFER
(
  clk,
  rstnn,
  clear,
  enable,
  busy,

  rcqready,
  rcqvalid,
  rcqaddr,
  rcqwrite,
  rcqwstrb,
  rcqwdata,
  rcyvalid,
  rcyrdata,

  scqready,
  scqvalid,
  scqaddr,
  scqwrite,
  scqwstrb,
  scqwdata,
  scyvalid,
  scyrdata
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter BW_ADDR = 32;
parameter BW_ACCESS = 32;
parameter NUM_REQUEST_BUFFER = 0;
parameter HAS_REPLY_BUFFER = 0;

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;
output wire busy;

output wire rcqready;
input wire rcqvalid;
input wire [BW_ADDR-1:0] rcqaddr;
input wire rcqwrite;
input wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] rcqwstrb;
input wire [BW_ACCESS-1:0] rcqwdata;
output wire rcyvalid;
output wire [BW_ACCESS-1:0] rcyrdata;

input wire scqready;
output wire scqvalid;
output wire [BW_ADDR-1:0] scqaddr;
output wire scqwrite;
output wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] scqwstrb;
output wire [BW_ACCESS-1:0] scqwdata;
input wire scyvalid;
input wire [BW_ACCESS-1:0] scyrdata;

/////////////
/* signals */
/////////////

localparam HAS_REQUEST_BUFFER = (NUM_REQUEST_BUFFER!=0);
localparam NUM_REQUEST_BUFFER__ = `MAX(NUM_REQUEST_BUFFER,2);
localparam BW_REQUEST_BUFFER = BW_ADDR + 1 + `BW_AXI_WSTRB(BW_ACCESS) + BW_ACCESS;

wire i_request_buffer_wready;
wire i_request_buffer_wrequest;
wire i_request_buffer_wfull;
wire [BW_REQUEST_BUFFER-1:0] i_request_buffer_wdata;
wire i_request_buffer_rready;
wire i_request_buffer_rrequest;
wire i_request_buffer_rempty;
wire [BW_REQUEST_BUFFER-1:0] i_request_buffer_rdata;

reg buffered_cyvalid;
reg [BW_ACCESS-1:0] buffered_cyrdata;

////////////
/* logics */
////////////

ERVP_SMALL_FIFO
#(
  .BW_DATA(BW_REQUEST_BUFFER),
  .DEPTH(NUM_REQUEST_BUFFER__)
)
i_request_buffer
(
	.clk(clk),
  .rstnn(rstnn),
	.enable((HAS_REQUEST_BUFFER==1) & enable),
  .clear(clear),
	.wready(i_request_buffer_wready),
	.wfull(i_request_buffer_wfull),
	.wrequest(i_request_buffer_wrequest),
	.wdata(i_request_buffer_wdata),
	.rready(i_request_buffer_rready),
	.rempty(i_request_buffer_rempty),
	.rrequest(i_request_buffer_rrequest),
	.rdata(i_request_buffer_rdata)
);

assign i_request_buffer_wrequest = rcqvalid;
assign i_request_buffer_wdata = {rcqaddr,rcqwrite,rcqwstrb,rcqwdata};
assign i_request_buffer_rrequest = scqready;

assign rcqready = (HAS_REQUEST_BUFFER==1)? i_request_buffer_wready : scqready;
assign scqvalid = (HAS_REQUEST_BUFFER==1)? i_request_buffer_rready : rcqvalid;
assign {scqaddr,scqwrite,scqwstrb,scqwdata} = (HAS_REQUEST_BUFFER==1)? i_request_buffer_rdata : {rcqaddr,rcqwrite,rcqwstrb,rcqwdata};

always@(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
  begin
    buffered_cyvalid <= 0;
    buffered_cyrdata <= 0;
  end
  else if(clear)
    buffered_cyvalid <= 0;
  else if(enable && (HAS_REPLY_BUFFER>=1))
  begin
    buffered_cyvalid <= scyvalid;
    if(scyvalid)
      buffered_cyrdata <= scyrdata;
  end
end

assign rcyvalid = (HAS_REPLY_BUFFER>=1)? buffered_cyvalid : scyvalid;
assign rcyrdata = (HAS_REPLY_BUFFER>=1)? buffered_cyrdata : scyrdata;

assign busy = i_request_buffer_rready | buffered_cyvalid;

endmodule
