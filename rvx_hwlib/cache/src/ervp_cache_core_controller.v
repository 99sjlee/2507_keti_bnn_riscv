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

module ERVP_CACHE_CORE_CONTROLLER
(
  clk,
  rstnn,
  clear,
  enable,
  busy,
  
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

  slqdready,
  slqvalid,
  slqhint,
  slqlast,
  slqafy,
  slqdata,

  slydready,
  slyvalid,
  slyhint,
  slylast,
  slydata
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

parameter BW_AXI_TID = 1;

input wire clk;
input wire rstnn;
input wire clear;
input wire enable;
output wire busy;

localparam INTERNAL_WIDTH = BW_ACCESS;
localparam EXTERNAL_WIDTH = BW_INTERFACE;

`include "cache_lpara.vb"

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
localparam BW_LPI_BURDEN = BW_AXI2LPIXM_BURDEN(BW_AXI_TID);

`include "lpixm_lpara.vb"

input wire [2-1:0] slqdready;
output wire slqvalid;
output wire slqhint;
output wire slqlast;
output wire slqafy;
output wire [BW_LPI_QDATA-1:0] slqdata;

output wire [2-1:0] slydready;
input wire slyvalid;
input wire slyhint;
input wire slylast;
input wire [BW_LPI_YDATA-1:0] slydata;

/////////////
/* signals */
/////////////

wire from_cache_control_ready;
wire to_cache_control_valid;
wire [`BW_CACHE_CONTROL_CMD-1:0] to_cache_control_command;
wire [BW_ADDR-1:0] to_cache_control_base;
wire [BW_ADDR-1:0] to_cache_control_last;

wire precache_idle;
wire cache_core_idle;

wire [BW_ADDR-1:0] cacheint_oimm_address;
wire [(INTERNAL_WIDTH/8)-1:0] cacheint_oimm_byteenable;
wire cacheint_oimm_requestvalid;
wire cacheint_oimm_readnotwrite;
wire [INTERNAL_WIDTH-1:0] cacheint_oimm_writedata;
wire [INTERNAL_WIDTH-1:0] cacheint_oimm_readdata;
wire cacheint_oimm_readdatavalid;
wire cacheint_oimm_waitrequest;

wire [BW_ADDR-1:0] c_oimm_address;
wire [LOG2_BURSTLENGTH:0] c_oimm_burstlength;
wire [LOG2_BURSTLENGTH-1:0] c_oimm_burstlength_minus1;
wire [(EXTERNAL_WIDTH/8)-1:0] c_oimm_byteenable;
wire c_oimm_requestvalid;
wire c_oimm_readnotwrite;
wire [EXTERNAL_WIDTH-1:0] c_oimm_writedata;
wire c_oimm_writelast;
wire [EXTERNAL_WIDTH-1:0] c_oimm_readdata;
wire c_oimm_readdatavalid;
wire c_oimm_waitrequest;

wire [LOG2RU_MIN1(CACHEWORDS_PER_LINE)-1:0] spill_raddr;
wire [EXTERNAL_WIDTH-1:0] spill_rdata;
wire [LOG2RU_MIN1(CACHEWORDS_PER_LINE)-1:0] spill_waddr;
wire spill_wenable;
wire [EXTERNAL_WIDTH-1:0] spill_wdata;

localparam I_BUFFER_BW_DATA = BW_ADDR + LOG2_BURSTLENGTH + (EXTERNAL_WIDTH/8) + 1 + INTERNAL_WIDTH + 1;
localparam I_BUFFER_DEPTH = (CACHE_POLICY==`CACHE_POLICY_WRITE_BACK)? NUM_LINES : ((CACHE_POLICY==`CACHE_POLICY_WRITE_THROUGH)? 16 : 4);
//localparam I_BUFFER_DEPTH = (CACHE_POLICY==`CACHE_POLICY_WRITE_BACK)? 16 : ((CACHE_POLICY==`CACHE_POLICY_WRITE_THROUGH)? 16 : 4);

wire i_buffer_wready;
wire i_buffer_wrequest;
wire i_buffer_wfull;
wire [I_BUFFER_BW_DATA-1:0] i_buffer_wdata;
wire i_buffer_rready;
wire i_buffer_rrequest;
wire i_buffer_rempty;
wire [I_BUFFER_BW_DATA-1:0] i_buffer_rdata;

wire i_buffer_register_idle;
wire [BW_ADDR-1:0] buffered_oimm_address;
//wire [LOG2_BURSTLENGTH:0] buffered_oimm_burstlength;
wire [LOG2_BURSTLENGTH-1:0] buffered_oimm_burstlength_minus1;
wire [(EXTERNAL_WIDTH/8)-1:0] buffered_oimm_byteenable;
wire buffered_oimm_requestvalid;
wire buffered_oimm_readnotwrite;
wire [EXTERNAL_WIDTH-1:0] buffered_oimm_writedata;
wire buffered_oimm_writelast;
wire [EXTERNAL_WIDTH-1:0] buffered_oimm_readdata;
wire buffered_oimm_readdatavalid;
wire buffered_oimm_waitrequest;

localparam BW_AXI_ADDR = BW_ADDR;
localparam BW_AXI_DATA = BW_INTERFACE;

wire [`LEAST1(BW_AXI_TID)-1:0] xid;
wire xwrite;
wire [`BW_AXI_ALEN-1:0] xlen;
wire [`BW_AXI_ASIZE-1:0] xsize;
wire [`BW_AXI_ABURST-1:0] xburst;
wire [`NUM_BYTE(BW_AXI_DATA)-1:0] xwstrb;
wire [BW_AXI_DATA-1:0] xwdata;
wire [BW_AXI_ADDR-1:0] xaddr;

wire xwreply;
wire [`BW_AXI_RESP-1:0] xresp;
wire [BW_AXI_DATA-1:0] xrdata;

////////////
/* logics */
////////////

cache_core_controller
#(
  .CACHE_SIZE(CACHE_SIZE),
  .LINE_SIZE(CACHE_LINE_SIZE),
  .ADDRESS_WIDTH(BW_ADDR),
  .INTERNAL_WIDTH(INTERNAL_WIDTH),
  .EXTERNAL_WIDTH(EXTERNAL_WIDTH),
  .LOG2_BURSTLENGTH(LOG2_BURSTLENGTH),
  .POLICY(CACHE_POLICY),
  .REGION_OPTIMIZATIONS(1),
  .WRITE_FIRST_SUPPORTED(0),
  .DIRTY_BITS(DIRTY_BITS)
)
i_controller
(
  .clk(clk),
  .reset(~rstnn),

  .from_cache_control_ready(from_cache_control_ready),
  .to_cache_control_valid(to_cache_control_valid),
  .to_cache_control_command(to_cache_control_command[1:0]),
  .to_cache_control_base(to_cache_control_base),
  .to_cache_control_last(to_cache_control_last),

  .precache_idle(precache_idle),
  .cache_idle(cache_core_idle),

  .cacheint_oimm_address(cacheint_oimm_address),
  .cacheint_oimm_byteenable(cacheint_oimm_byteenable),
  .cacheint_oimm_requestvalid(cacheint_oimm_requestvalid),
  .cacheint_oimm_readnotwrite(cacheint_oimm_readnotwrite),
  .cacheint_oimm_writedata(cacheint_oimm_writedata),
  .cacheint_oimm_readdata(cacheint_oimm_readdata),
  .cacheint_oimm_readdatavalid(cacheint_oimm_readdatavalid),
  .cacheint_oimm_waitrequest(cacheint_oimm_waitrequest),

  .c_oimm_address(c_oimm_address),
  .c_oimm_burstlength(c_oimm_burstlength),
  .c_oimm_burstlength_minus1(c_oimm_burstlength_minus1),
  .c_oimm_byteenable(c_oimm_byteenable),
  .c_oimm_requestvalid(c_oimm_requestvalid),
  .c_oimm_readnotwrite(c_oimm_readnotwrite),
  .c_oimm_writedata(c_oimm_writedata),
  .c_oimm_writelast(c_oimm_writelast),
  .c_oimm_readdata(c_oimm_readdata),
  .c_oimm_readdatavalid(c_oimm_readdatavalid),
  .c_oimm_waitrequest(c_oimm_waitrequest),

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

  .spill_raddr(spill_raddr),
  .spill_rdata(spill_rdata),
  .spill_waddr(spill_waddr),
  .spill_wenable(spill_wenable),
  .spill_wdata(spill_wdata)
);

assign precache_idle = 1;
assign busy = (~cache_core_idle) | (~control_ready) | (~i_buffer_register_idle);

assign control_ready = from_cache_control_ready;
assign to_cache_control_valid = control_valid;
assign to_cache_control_command = control_command;
assign to_cache_control_base = control_region_start;
assign to_cache_control_last = control_region_last;

assign access_cqready = ~cacheint_oimm_waitrequest;
assign cacheint_oimm_requestvalid = access_cqvalid;
assign cacheint_oimm_address = access_cqaddr;
assign cacheint_oimm_readnotwrite = ~access_cqwrite;
assign cacheint_oimm_byteenable = access_cqwstrb;
assign cacheint_oimm_writedata = access_cqwdata;
assign access_cyvalid = cacheint_oimm_readdatavalid;
assign access_cyrdata = cacheint_oimm_readdata;

ERVP_REGISTER_FILE_1R1WC
#(
  .DEPTH(CACHEWORDS_PER_LINE),
  .WIDTH(EXTERNAL_WIDTH),
  .BW_INDEX(LOG2RU(CACHEWORDS_PER_LINE))
)
i_regfile_for_spill
(
  .clk(clk),
  .rstnn(rstnn),

  .windex(spill_waddr),
  .wenable(spill_wenable),
  .wpermit(1'b 1),
  .wdata(spill_wdata),

  .rindex(spill_raddr),
  .rdata_asynch(),
  .renable(1'b 1),
  .rdata_synch(spill_rdata)
);

// buffer
ERVP_SMALL_FIFO
#(
  .BW_DATA(I_BUFFER_BW_DATA),
  .DEPTH(I_BUFFER_DEPTH)
)
i_buffer
(
	.clk(clk),
  .rstnn(rstnn),
	.enable(enable),
  .clear(clear),
	.wready(i_buffer_wready),
	.wfull(i_buffer_wfull),
	.wrequest(i_buffer_wrequest),
	.wdata(i_buffer_wdata),
	.rready(i_buffer_rready),
	.rempty(i_buffer_rempty),
	.rrequest(i_buffer_rrequest),
	.rdata(i_buffer_rdata)
);

assign c_oimm_waitrequest = ~i_buffer_wready;
assign i_buffer_wrequest = c_oimm_requestvalid;
assign i_buffer_wdata = {c_oimm_address,c_oimm_burstlength_minus1,c_oimm_byteenable,c_oimm_readnotwrite,c_oimm_writedata,c_oimm_writelast};

assign buffered_oimm_requestvalid = i_buffer_rready;
assign i_buffer_rrequest = ~buffered_oimm_waitrequest;
assign {buffered_oimm_address,buffered_oimm_burstlength_minus1,buffered_oimm_byteenable,buffered_oimm_readnotwrite,buffered_oimm_writedata,buffered_oimm_writelast} = i_buffer_rdata;

assign c_oimm_readdatavalid = buffered_oimm_readdatavalid;
assign c_oimm_readdata = buffered_oimm_readdata;
assign i_buffer_register_idle = ~i_buffer_rready;

// LPI conversion

assign xid = 0;
assign xwrite = ~buffered_oimm_readnotwrite;
assign xlen = (CACHE_POLICY==`CACHE_POLICY_WRITE_THROUGH)? buffered_oimm_burstlength_minus1 : c_oimm_burstlength_minus1;
assign xsize = `GET_AXI_SIZE(BW_AXI_DATA);
assign xburst = `AXI_BURST_INCR;
assign xwstrb = (CACHE_POLICY==`CACHE_POLICY_READ_ONLY)? 0 : ((CACHE_POLICY==`CACHE_POLICY_WRITE_BACK)? -1 : buffered_oimm_byteenable);
assign xwdata = (CACHE_POLICY==`CACHE_POLICY_READ_ONLY)? 0 : buffered_oimm_writedata;
assign xaddr = buffered_oimm_address;
assign {xwreply, xresp, xrdata} = slydata;

assign slqvalid = buffered_oimm_requestvalid;
assign slqhint = 0;
assign slqlast = xwrite? buffered_oimm_writelast : 1;
assign slqafy = xwrite? buffered_oimm_writelast : 1;
assign slqdata = {xid,xwrite,xlen,xsize,xburst,xwstrb,xwdata,xaddr};
assign buffered_oimm_waitrequest = ~(slqdready[0]);

assign buffered_oimm_readdatavalid = slyvalid & (~xwreply);
assign buffered_oimm_readdata = xrdata;
assign slydready = 2'b 11;

endmodule
