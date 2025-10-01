// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE 
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS 
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE 
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL 
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE, 
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE 
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2023-12-13
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"

module ERVP_CACHE_ACCESS_SPLITER
(
  clk,
  rstnn,
  clear,
  enable,
  busy,

  caching_enable,
  cacheable_region_start_list,
  cacheable_region_last_list,

  access_rcqready,
  access_rcqvalid,
  access_rcqaddr,
  access_rcqwrite,
  access_rcqwstrb,
  access_rcqwdata,
  access_rcyvalid,
  access_rcyrdata,

  cca_scqready,
  cca_scqvalid,
  cca_scqaddr,
  cca_scqwrite,
  cca_scqwstrb,
  cca_scqwdata,
  cca_scyvalid,
  cca_scyrdata,

  uca_scqready,
  uca_scqvalid,
  uca_scqaddr,
  uca_scqwrite,
  uca_scqwstrb,
  uca_scqwdata,
  uca_scyvalid,
  uca_scyrdata
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter BW_ADDR = 32;
parameter BW_ACCESS = 32;
parameter HAS_CACHE = 0;
parameter HAS_REGION = 0;
parameter NUM_REGION = 4;
parameter NUM_TXN_BUFFER = 4;

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;
output wire busy;

input wire caching_enable;
input wire [BW_ADDR*NUM_REGION-1:0] cacheable_region_start_list;
input wire [BW_ADDR*NUM_REGION-1:0] cacheable_region_last_list;

output wire access_rcqready;
input wire access_rcqvalid;
input wire [BW_ADDR-1:0] access_rcqaddr;
input wire access_rcqwrite;
input wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] access_rcqwstrb;
input wire [BW_ACCESS-1:0] access_rcqwdata;
output wire access_rcyvalid;
output wire [BW_ACCESS-1:0] access_rcyrdata;

input wire cca_scqready;
output wire cca_scqvalid;
output wire [BW_ADDR-1:0] cca_scqaddr;
output wire cca_scqwrite;
output wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] cca_scqwstrb;
output wire [BW_ACCESS-1:0] cca_scqwdata;
input wire cca_scyvalid;
input wire [BW_ACCESS-1:0] cca_scyrdata;

input wire uca_scqready;
output wire uca_scqvalid;
output wire [BW_ADDR-1:0] uca_scqaddr;
output wire uca_scqwrite;
output wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] uca_scqwstrb;
output wire [BW_ACCESS-1:0] uca_scqwdata;
input wire uca_scyvalid;
input wire [BW_ACCESS-1:0] uca_scyrdata;

/////////////
/* signals */
/////////////

genvar i;

wire is_request_cacheable;
wire [BW_ADDR-1:0] cacheable_region_start [NUM_REGION-1:0];
wire [BW_ADDR-1:0] cacheable_region_last [NUM_REGION-1:0];
wire [NUM_REGION-1:0] region_match;

localparam BW_TXN_BUFFER = 1;

wire i_txn_buffer_wready;
wire i_txn_buffer_wrequest;
wire [BW_TXN_BUFFER-1:0] i_txn_buffer_wdata;
wire i_txn_buffer_rready;
wire i_txn_buffer_rrequest;
wire [BW_TXN_BUFFER-1:0] i_txn_buffer_rdata;

wire HAS_BOTH_SIDE;
wire is_request_allowed;
wire is_instant_reply;
reg is_reply_from_cache;

////////////
/* logics */
////////////

assign is_request_cacheable = HAS_CACHE & caching_enable & ((~HAS_REGION) | (region_match!=0));

generate
for(i=0; i<NUM_REGION; i=i+1)
begin : i_gen_region_select
  assign cacheable_region_start[i] = cacheable_region_start_list[BW_ADDR*(i+1)-1 -:BW_ADDR];
  assign cacheable_region_last[i] = cacheable_region_last_list[BW_ADDR*(i+1)-1 -:BW_ADDR];
  assign region_match[i] = (access_rcqaddr>=cacheable_region_start[i]) & (access_rcqaddr<=cacheable_region_last[i]);
end
endgenerate

ERVP_SMALL_FIFO
#(
	.BW_DATA(BW_TXN_BUFFER),
	.DEPTH(NUM_TXN_BUFFER)
)
i_txn_buffer
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(enable & HAS_BOTH_SIDE),
  .clear(clear),
	.wready(i_txn_buffer_wready),
	.wrequest(i_txn_buffer_wrequest),
	.wdata(i_txn_buffer_wdata),
	.wfull(),
	.rready(i_txn_buffer_rready),
	.rrequest(i_txn_buffer_rrequest),
	.rdata(i_txn_buffer_rdata),
	.rempty()
);

assign i_txn_buffer_wrequest = access_rcqvalid & access_rcqready & (~access_rcqwrite) & (~is_instant_reply);
assign i_txn_buffer_wdata = is_request_cacheable;
assign i_txn_buffer_rrequest = access_rcyvalid; //  & (~is_instant_reply) can be deleted

assign HAS_BOTH_SIDE = HAS_CACHE;
assign is_request_allowed = ((~access_rcqwrite) & HAS_BOTH_SIDE)? i_txn_buffer_wready : 1;
assign is_instant_reply = (~i_txn_buffer_rready) & (is_request_cacheable? cca_scyvalid : uca_scyvalid);
assign busy = HAS_BOTH_SIDE? i_txn_buffer_rready : 0;

always@(*)
begin
  is_reply_from_cache = 0;
  if(is_instant_reply)
    is_reply_from_cache = is_request_cacheable;
  else if(HAS_BOTH_SIDE)
    is_reply_from_cache = i_txn_buffer_rdata;
  else
    is_reply_from_cache = is_request_cacheable;
end

/* request */

assign cca_scqaddr = access_rcqaddr;
assign cca_scqwrite = access_rcqwrite;
assign cca_scqwstrb = access_rcqwstrb;
assign cca_scqwdata = access_rcqwdata;
assign uca_scqaddr = access_rcqaddr;
assign uca_scqwrite = access_rcqwrite;
assign uca_scqwstrb = access_rcqwstrb;
assign uca_scqwdata = access_rcqwdata;

assign access_rcqready = is_request_allowed & ((~access_rcqvalid) | (is_request_cacheable? cca_scqready : uca_scqready));
assign cca_scqvalid = is_request_allowed & is_request_cacheable & access_rcqvalid;
assign uca_scqvalid = is_request_allowed & (~is_request_cacheable) & access_rcqvalid;

/* reply */

assign access_rcyvalid = is_reply_from_cache? cca_scyvalid : uca_scyvalid;
assign access_rcyrdata = is_reply_from_cache? cca_scyrdata : uca_scyrdata;

endmodule
