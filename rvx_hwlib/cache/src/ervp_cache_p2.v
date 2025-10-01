// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE 
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS 
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE 
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL 
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE, 
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE 
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2023-12-12
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "ervp_cache_memorymap_offset.vh"

module ERVP_CACHE_P2
(
  clk,
  rstnn,
  clear,
  enable,
  busy,

  caching_enable,
  cacheable_region_start_list,
  cacheable_region_last_list,
  
  control_ready,
  control_valid,
  control_command,
  control_region_start,
  control_region_last,

  access_cqready,
  access_cqvalid,
  access_cqaddr,
  access_cqwrite,
  access_cqwstrb,
  access_cqwdata,
  access_cyvalid,
  access_cyrdata,

  cache_tag_renable,
  cache_tag_raddr,
  cache_tag_rdata,
  cache_tag_wenable,
  cache_tag_waddr,
  cache_tag_wdata,
  
  cache_data_renable,
  cache_data_raddr,
  cache_data_rdata,
  cache_data_wenable,
  cache_data_waddr,
  cache_data_wstrb,
  cache_data_wdata,

  cca_slqdready,
  cca_slqvalid,
  cca_slqhint,
  cca_slqlast,
  cca_slqafy,
  cca_slqdata,

  cca_slydready,
  cca_slyvalid,
  cca_slyhint,
  cca_slylast,
  cca_slydata,

  uca_slqdready,
  uca_slqvalid,
  uca_slqhint,
  uca_slqlast,
  uca_slqafy,
  uca_slqdata,

  uca_slydready,
  uca_slyvalid,
  uca_slyhint,
  uca_slylast,
  uca_slydata
);

////////////////////////////
/* parameter input output */
////////////////////////////

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter BW_ADDR = 32;
parameter BW_ACCESS = 32;
parameter BW_INTERFACE = 32;

parameter CACHE_SIZE            = 4096; // in bytes
parameter CACHE_LINE_SIZE       = 16; // in bytes
parameter CACHE_POLICY = `CACHE_POLICY_WRITE_BACK;

parameter HAS_CACHE = 0;
parameter HAS_REGION = 0;
parameter NUM_REGION = 4;

localparam NUM_LOCAL_INTERFACE = 2;

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;
output wire busy;

localparam INTERNAL_WIDTH = BW_ACCESS;
localparam EXTERNAL_WIDTH = BW_INTERFACE;

`include "cache_lpara.vb"

input wire caching_enable;
input wire [BW_ADDR*NUM_REGION-1:0] cacheable_region_start_list;
input wire [BW_ADDR*NUM_REGION-1:0] cacheable_region_last_list;

output wire control_ready;
input wire control_valid;
input wire [`BW_CACHE_CONTROL_CMD-1:0] control_command;
input wire [BW_ADDR-1:0] control_region_start;
input wire [BW_ADDR-1:0] control_region_last;

output wire access_cqready;
input wire access_cqvalid;
input wire [BW_ADDR-1:0] access_cqaddr;
input wire access_cqwrite;
input wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] access_cqwstrb;
input wire [BW_ACCESS-1:0] access_cqwdata;
output wire access_cyvalid;
output wire [BW_ACCESS-1:0] access_cyrdata;

output wire cache_tag_renable;
output wire [LOG2RU_MIN1(NUM_LINES)-1:0] cache_tag_raddr;
input wire [BW_TAG_CELL-1:0] cache_tag_rdata;
output wire cache_tag_wenable;
output wire [LOG2RU_MIN1(NUM_LINES)-1:0] cache_tag_waddr;
output wire [BW_TAG_CELL-1:0] cache_tag_wdata;

output wire cache_data_renable;
output wire [CACHEWORD_BITS-1:0] cache_data_raddr;
input wire [BW_INTERFACE-1:0] cache_data_rdata;
output wire cache_data_wenable;
output wire [CACHEWORD_BITS-1:0] cache_data_waddr;
output wire [(BW_INTERFACE/8)-1:0] cache_data_wstrb;
output wire [BW_INTERFACE-1:0] cache_data_wdata;

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam BW_LPIXM_ADDR = BW_ADDR;
localparam BW_LPIXM_DATA = BW_INTERFACE;
localparam BW_LPI_BURDEN = 0;

`include "lpixm_lpara.vb"

input wire [2-1:0] cca_slqdready;
output wire cca_slqvalid;
output wire cca_slqhint;
output wire cca_slqlast;
output wire cca_slqafy;
output wire [BW_LPI_QDATA-1:0] cca_slqdata;

output wire [2-1:0] cca_slydready;
input wire cca_slyvalid;
input wire cca_slyhint;
input wire cca_slylast;
input wire [BW_LPI_YDATA-1:0] cca_slydata;

input wire [2-1:0] uca_slqdready;
output wire uca_slqvalid;
output wire uca_slqhint;
output wire uca_slqlast;
output wire uca_slqafy;
output wire [BW_LPI_QDATA-1:0] uca_slqdata;

output wire [2-1:0] uca_slydready;
input wire uca_slyvalid;
input wire uca_slyhint;
input wire uca_slylast;
input wire [BW_LPI_YDATA-1:0] uca_slydata;

/////////////
/* signals */
/////////////

localparam HAS_FRONTEND_BUFFER = 0;
localparam NUM_FRONTEND_REQUEST_BUFFER = (HAS_FRONTEND_BUFFER>=1)? 2 : 0;
localparam HAS_FRONTEND_REPLY_BUFFER = 0;

localparam HAS_UCA_BUFFER = 0;
localparam NUM_UCA_REQUEST_BUFFER = (HAS_UCA_BUFFER>=1)? 2 : 0;
localparam HAS_UCA_REPLY_BUFFER = 0;

wire i_access_buffer_busy;
wire i_access_spliter_busy;
wire i_uca_buffer_busy;
wire i_core_controller_busy;

wire access_buffer_cqready;
wire access_buffer_cqvalid;
wire [BW_ADDR-1:0] access_buffer_cqaddr;
wire access_buffer_cqwrite;
wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] access_buffer_cqwstrb;
wire [BW_ACCESS-1:0] access_buffer_cqwdata;
wire access_buffer_cyvalid;
wire [BW_ACCESS-1:0] access_buffer_cyrdata;

wire cca_cqready;
wire cca_cqvalid;
wire [BW_ADDR-1:0] cca_cqaddr;
wire cca_cqwrite;
wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] cca_cqwstrb;
wire [BW_ACCESS-1:0] cca_cqwdata;
wire cca_cyvalid;
wire [BW_ACCESS-1:0] cca_cyrdata;

wire uca_cqready;
wire uca_cqvalid;
wire [BW_ADDR-1:0] uca_cqaddr;
wire uca_cqwrite;
wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] uca_cqwstrb;
wire [BW_ACCESS-1:0] uca_cqwdata;
wire uca_cyvalid;
wire [BW_ACCESS-1:0] uca_cyrdata;

wire uca_buffer_cqready;
wire uca_buffer_cqvalid;
wire [BW_ADDR-1:0] uca_buffer_cqaddr;
wire uca_buffer_cqwrite;
wire [`BW_AXI_WSTRB(BW_ACCESS)-1:0] uca_buffer_cqwstrb;
wire [BW_ACCESS-1:0] uca_buffer_cqwdata;
wire uca_buffer_cyvalid;
wire [BW_ACCESS-1:0] uca_buffer_cyrdata;

localparam BW_AXI_ADDR = BW_ADDR;
localparam BW_AXI_DATA = BW_INTERFACE;

wire [`LEAST1(0)-1:0] uca_xid;
wire uca_xwrite;
wire [`BW_AXI_ALEN-1:0] uca_xlen;
wire [`BW_AXI_ASIZE-1:0] uca_xsize;
wire [`BW_AXI_ABURST-1:0] uca_xburst;
wire [`NUM_BYTE(BW_AXI_DATA)-1:0] uca_xwstrb;
wire [BW_AXI_DATA-1:0] uca_xwdata;
wire [BW_AXI_ADDR-1:0] uca_xaddr;

wire uca_xwreply;
wire [`BW_AXI_RESP-1:0] uca_xresp;
wire [BW_AXI_DATA-1:0] uca_xrdata;

////////////
/* logics */
////////////

// access buffer

ERVP_CACHE_ACCESS_BUFFER
#(
  .BW_ADDR(BW_ADDR),
  .BW_ACCESS(BW_ACCESS),
  .NUM_REQUEST_BUFFER(NUM_FRONTEND_REQUEST_BUFFER),
  .HAS_REPLY_BUFFER(HAS_FRONTEND_REPLY_BUFFER)
)
i_access_buffer
(
  .clk(clk),
  .rstnn(rstnn),
  .clear(clear),
  .enable(enable),
  .busy(i_access_buffer_busy),

  .rcqready(access_cqready),
  .rcqvalid(access_cqvalid),
  .rcqaddr(access_cqaddr),
  .rcqwrite(access_cqwrite),
  .rcqwstrb(access_cqwstrb),
  .rcqwdata(access_cqwdata),
  .rcyvalid(access_cyvalid),
  .rcyrdata(access_cyrdata),

  .scqready(access_buffer_cqready),
  .scqvalid(access_buffer_cqvalid),
  .scqaddr(access_buffer_cqaddr),
  .scqwrite(access_buffer_cqwrite),
  .scqwstrb(access_buffer_cqwstrb),
  .scqwdata(access_buffer_cqwdata),
  .scyvalid(access_buffer_cyvalid),
  .scyrdata(access_buffer_cyrdata)
);

ERVP_CACHE_ACCESS_SPLITER
#(
  .BW_ADDR(BW_ADDR),
  .BW_ACCESS(BW_ACCESS),
  .HAS_CACHE(HAS_CACHE),
  .HAS_REGION(HAS_REGION),
  .NUM_REGION(NUM_REGION)
)
i_access_spliter
(
  .clk(clk),
  .rstnn(rstnn),
  .clear(clear),
  .enable(enable),
  .busy(i_access_spliter_busy),

  .caching_enable(caching_enable),
  .cacheable_region_start_list(cacheable_region_start_list),
  .cacheable_region_last_list(cacheable_region_last_list),

  .access_rcqready(access_buffer_cqready),
  .access_rcqvalid(access_buffer_cqvalid),
  .access_rcqaddr(access_buffer_cqaddr),
  .access_rcqwrite(access_buffer_cqwrite),
  .access_rcqwstrb(access_buffer_cqwstrb),
  .access_rcqwdata(access_buffer_cqwdata),
  .access_rcyvalid(access_buffer_cyvalid),
  .access_rcyrdata(access_buffer_cyrdata),

  .cca_scqready(cca_cqready),
  .cca_scqvalid(cca_cqvalid),
  .cca_scqaddr(cca_cqaddr),
  .cca_scqwrite(cca_cqwrite),
  .cca_scqwstrb(cca_cqwstrb),
  .cca_scqwdata(cca_cqwdata),
  .cca_scyvalid(cca_cyvalid),
  .cca_scyrdata(cca_cyrdata),

  .uca_scqready(uca_cqready),
  .uca_scqvalid(uca_cqvalid),
  .uca_scqaddr(uca_cqaddr),
  .uca_scqwrite(uca_cqwrite),
  .uca_scqwstrb(uca_cqwstrb),
  .uca_scqwdata(uca_cqwdata),
  .uca_scyvalid(uca_cyvalid),
  .uca_scyrdata(uca_cyrdata)
);

ERVP_CACHE_CORE_CONTROLLER
#(
  .BW_ADDR(BW_ADDR),
  .BW_ACCESS(BW_ACCESS),
  .BW_INTERFACE(BW_INTERFACE),
  .CACHE_SIZE(CACHE_SIZE),
  .CACHE_LINE_SIZE(CACHE_LINE_SIZE),
  .CACHE_POLICY(CACHE_POLICY),
  .BW_AXI_TID(0)
)
i_core_controller
(
  .clk(clk),
  .rstnn(rstnn),
  .clear(clear),
  .enable((HAS_CACHE!=0)&enable),
  .busy(i_core_controller_busy),
  
  .control_ready(control_ready),
  .control_valid(control_valid),
  .control_command(control_command),
  .control_region_start(control_region_start),
  .control_region_last(control_region_last),

  .access_cqready(cca_cqready),
  .access_cqvalid(cca_cqvalid),
  .access_cqaddr(cca_cqaddr),
  .access_cqwrite(cca_cqwrite),
  .access_cqwstrb(cca_cqwstrb),
  .access_cqwdata(cca_cqwdata),
  .access_cyvalid(cca_cyvalid),
  .access_cyrdata(cca_cyrdata),

  .cache_tag_renable(cache_tag_renable),
  .cache_tag_raddr(cache_tag_raddr),
  .cache_tag_rdata(cache_tag_rdata),
  .cache_tag_wenable(cache_tag_wenable),
  .cache_tag_waddr(cache_tag_waddr),
  .cache_tag_wdata(cache_tag_wdata),

  .cache_data_renable(cache_data_renable),
  .cache_data_raddr(cache_data_raddr),
  .cache_data_rdata(cache_data_rdata),
  .cache_data_wenable(cache_data_wenable),
  .cache_data_waddr(cache_data_waddr),
  .cache_data_wstrb(cache_data_wstrb),
  .cache_data_wdata(cache_data_wdata),

  .slqdready(cca_slqdready),
  .slqvalid(cca_slqvalid),
  .slqhint(cca_slqhint),
  .slqlast(cca_slqlast),
  .slqafy(cca_slqafy),
  .slqdata(cca_slqdata),

  .slydready(cca_slydready),
  .slyvalid(cca_slyvalid),
  .slyhint(cca_slyhint),
  .slylast(cca_slylast),
  .slydata(cca_slydata)
);

// uca buffer

ERVP_CACHE_ACCESS_BUFFER
#(
  .BW_ADDR(BW_ADDR),
  .BW_ACCESS(BW_ACCESS),
  .NUM_REQUEST_BUFFER(NUM_UCA_REQUEST_BUFFER),
  .HAS_REPLY_BUFFER(HAS_UCA_REPLY_BUFFER)
)
i_uca_buffer
(
  .clk(clk),
  .rstnn(rstnn),
  .clear(clear),
  .enable(enable),
  .busy(i_uca_buffer_busy),

  .rcqready(uca_cqready),
  .rcqvalid(uca_cqvalid),
  .rcqaddr(uca_cqaddr),
  .rcqwrite(uca_cqwrite),
  .rcqwstrb(uca_cqwstrb),
  .rcqwdata(uca_cqwdata),
  .rcyvalid(uca_cyvalid),
  .rcyrdata(uca_cyrdata),

  .scqready(uca_buffer_cqready),
  .scqvalid(uca_buffer_cqvalid),
  .scqaddr(uca_buffer_cqaddr),
  .scqwrite(uca_buffer_cqwrite),
  .scqwstrb(uca_buffer_cqwstrb),
  .scqwdata(uca_buffer_cqwdata),
  .scyvalid(uca_buffer_cyvalid),
  .scyrdata(uca_buffer_cyrdata)
);

// uca -> lpixm

assign uca_xid = 0;
assign uca_xwrite = uca_buffer_cqwrite;
assign uca_xlen = `AXI_LENGTH_01;
assign uca_xsize = `GET_AXI_SIZE(BW_AXI_DATA);
assign uca_xburst = `AXI_BURST_FIXED;
assign uca_xwstrb = uca_buffer_cqwstrb;
assign uca_xwdata = uca_buffer_cqwdata;
assign uca_xaddr = uca_buffer_cqaddr;
assign {uca_xwreply, uca_xresp, uca_xrdata} = uca_slydata;

assign uca_buffer_cqready = uca_slqdready[0];
assign uca_slqvalid = uca_buffer_cqvalid;
assign uca_slqhint = 0;
assign uca_slqlast = 1;
assign uca_slqafy = uca_slqlast;
assign uca_slqdata = {uca_xid,uca_xwrite,uca_xlen,uca_xsize,uca_xburst,uca_xwstrb,uca_xwdata,uca_xaddr};

assign uca_slydready = 2'b 11;
assign uca_buffer_cyvalid = uca_slyvalid & (~uca_xwreply);
assign uca_buffer_cyrdata = uca_xrdata;

assign busy = i_access_buffer_busy | i_access_spliter_busy | i_uca_buffer_busy | i_core_controller_busy;

endmodule
