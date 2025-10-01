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

module ERVP_CACHE_P1
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

  memory_slqdready,
  memory_slqvalid,
  memory_slqhint,
  memory_slqlast,
  memory_slqafy,
  memory_slqdata,

  memory_slydready,
  memory_slyvalid,
  memory_slyhint,
  memory_slylast,
  memory_slydata
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
localparam BW_LPI_QPARCEL = BW_LPIXM_QPARCEL(BW_LPIXM_ADDR,BW_LPIXM_DATA);
localparam BW_LPI_YPARCEL = BW_LPIXM_YPARCEL(BW_LPIXM_DATA);
localparam RCV_BW_LPI_BURDEN = 0;
localparam SND_BW_LPI_BURDEN = RCV_BW_LPI_BURDEN + NUM_LOCAL_INTERFACE;

`include "lpi_conv.vb"

input wire [2-1:0] memory_slqdready;
output wire memory_slqvalid;
output wire memory_slqhint;
output wire memory_slqlast;
output wire memory_slqafy;
output wire [SND_BW_LPI_QDATA-1:0] memory_slqdata;

output wire [2-1:0] memory_slydready;
input wire memory_slyvalid;
input wire memory_slyhint;
input wire memory_slylast;
input wire [SND_BW_LPI_YDATA-1:0] memory_slydata;

/////////////
/* signals */
/////////////

wire i_cache_p2_busy;
wire i_backend_serializer_busy;

wire [2-1:0] cca_slqdready;
wire cca_slqvalid;
wire cca_slqhint;
wire cca_slqlast;
wire cca_slqafy;
wire [RCV_BW_LPI_QDATA-1:0] cca_slqdata;

wire [2-1:0] cca_slydready;
wire cca_slyvalid;
wire cca_slyhint;
wire cca_slylast;
wire [RCV_BW_LPI_YDATA-1:0] cca_slydata;

wire [2-1:0] uca_slqdready;
wire uca_slqvalid;
wire uca_slqhint;
wire uca_slqlast;
wire uca_slqafy;
wire [RCV_BW_LPI_QDATA-1:0] uca_slqdata;

wire [2-1:0] uca_slydready;
wire uca_slyvalid;
wire uca_slyhint;
wire uca_slylast;
wire [RCV_BW_LPI_YDATA-1:0] uca_slydata;

localparam NUM_INTERFACE = NUM_LOCAL_INTERFACE;

wire [2*NUM_INTERFACE-1:0] lqdready_list;
wire [NUM_INTERFACE-1:0] lqvalid_list;
wire [NUM_INTERFACE-1:0] lqhint_list;
wire [NUM_INTERFACE-1:0] lqlast_list;
wire [NUM_INTERFACE-1:0] lqafy_list;
wire [RCV_BW_LPI_QDATA*NUM_INTERFACE-1:0] lqdata_list;

wire [2*NUM_INTERFACE-1:0] lydready_list;
wire [NUM_INTERFACE-1:0] lyvalid_list;
wire [NUM_INTERFACE-1:0] lyhint_list;
wire [NUM_INTERFACE-1:0] lylast_list;
wire [RCV_BW_LPI_YDATA*NUM_INTERFACE-1:0] lydata_list;

////////////
/* logics */
////////////

ERVP_CACHE_P2
#(
  .BW_ADDR(BW_ADDR),
  .BW_ACCESS(BW_ACCESS),
  .BW_INTERFACE(BW_INTERFACE),
  .CACHE_SIZE(CACHE_SIZE),
  .CACHE_LINE_SIZE(CACHE_LINE_SIZE),
  .CACHE_POLICY(CACHE_POLICY),
  .HAS_CACHE(HAS_CACHE),
  .HAS_REGION(HAS_REGION),
  .NUM_REGION(NUM_REGION)
)
i_cache_p2
(
  .clk(clk),
  .rstnn(rstnn),
  .clear(clear),
  .enable(enable),
  .busy(i_cache_p2_busy),

  .caching_enable(caching_enable),
  .cacheable_region_start_list(cacheable_region_start_list),
  .cacheable_region_last_list(cacheable_region_last_list),
  
  .control_ready(control_ready),
  .control_valid(control_valid),
  .control_command(control_command),
  .control_region_start(control_region_start),
  .control_region_last(control_region_last),

  .access_cqready(access_cqready),
  .access_cqvalid(access_cqvalid),
  .access_cqaddr(access_cqaddr),
  .access_cqwrite(access_cqwrite),
  .access_cqwstrb(access_cqwstrb),
  .access_cqwdata(access_cqwdata),
  .access_cyvalid(access_cyvalid),
  .access_cyrdata(access_cyrdata),

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

  .cca_slqdready(cca_slqdready),
  .cca_slqvalid(cca_slqvalid),
  .cca_slqhint(cca_slqhint),
  .cca_slqlast(cca_slqlast),
  .cca_slqafy(cca_slqafy),
  .cca_slqdata(cca_slqdata),

  .cca_slydready(cca_slydready),
  .cca_slyvalid(cca_slyvalid),
  .cca_slyhint(cca_slyhint),
  .cca_slylast(cca_slylast),
  .cca_slydata(cca_slydata),

  .uca_slqdready(uca_slqdready),
  .uca_slqvalid(uca_slqvalid),
  .uca_slqhint(uca_slqhint),
  .uca_slqlast(uca_slqlast),
  .uca_slqafy(uca_slqafy),
  .uca_slqdata(uca_slqdata),

  .uca_slydready(uca_slydready),
  .uca_slyvalid(uca_slyvalid),
  .uca_slyhint(uca_slyhint),
  .uca_slylast(uca_slylast),
  .uca_slydata(uca_slydata)
);

//

MUNOC_LPI_SERIALIZER
#(
  .BW_LPI_QPARCEL(BW_LPI_QPARCEL),
  .BW_LPI_YPARCEL(BW_LPI_YPARCEL),
  .RCV_BW_LPI_BURDEN(RCV_BW_LPI_BURDEN),
  .NUM_INTERFACE(NUM_INTERFACE)
)
i_backend_serializer
(
	.clk(clk),
	.rstnn(rstnn),
  .clear(clear),
  .enable(enable),
  .busy(i_backend_serializer_busy),
  
  .rlqdready_list(lqdready_list),
  .rlqvalid_list(lqvalid_list),
  .rlqhint_list(lqhint_list),
  .rlqlast_list(lqlast_list),  
  .rlqafy_list(lqafy_list),
  .rlqdata_list(lqdata_list),

  .rlydready_list(lydready_list),
  .rlyvalid_list(lyvalid_list),
  .rlyhint_list(lyhint_list),
  .rlylast_list(lylast_list),
  .rlydata_list(lydata_list),
  
  .slqdready(memory_slqdready),
  .slqvalid(memory_slqvalid),
  .slqhint(memory_slqhint),
  .slqafy(memory_slqafy),
  .slqlast(memory_slqlast),
  .slqdata(memory_slqdata),

  .slydready(memory_slydready),
  .slyvalid(memory_slyvalid),
  .slyhint(memory_slyhint),
  .slylast(memory_slylast),
  .slydata(memory_slydata)
);

assign {cca_slqdready,uca_slqdready} = lqdready_list;
assign lqvalid_list = {cca_slqvalid,uca_slqvalid};
assign lqhint_list = {cca_slqhint,uca_slqhint};
assign lqlast_list = {cca_slqlast,uca_slqlast};
assign lqafy_list = {cca_slqafy,uca_slqafy};
assign lqdata_list = {cca_slqdata,uca_slqdata};

assign lydready_list = {cca_slydready,uca_slydready};
assign {cca_slyvalid,uca_slyvalid} = lyvalid_list;
assign {cca_slyhint,uca_slyhint} = lyhint_list;
assign {cca_slylast,uca_slylast} = lylast_list;
assign {cca_slydata,uca_slydata} = lydata_list;

assign busy = i_cache_p2_busy | i_backend_serializer_busy;

endmodule
