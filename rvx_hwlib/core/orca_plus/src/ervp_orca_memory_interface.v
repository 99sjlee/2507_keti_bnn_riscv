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

module ERVP_ORCA_MEMORY_INTERFACE
(
  clk,
  reset,

  umr_base_addrs,
  umr_last_addrs,

  from_icache_control_ready,
  to_icache_control_valid,
  to_icache_control_command,
  from_dcache_control_ready,
  to_dcache_control_valid,
  to_dcache_control_command,
  to_cache_control_base,
  to_cache_control_last,

  memory_interface_idle,

  ifetch_oimm_address,
  ifetch_oimm_requestvalid,
  ifetch_oimm_readdata,
  ifetch_oimm_waitrequest,
  ifetch_oimm_readdatavalid,

  lsu_oimm_address,
  lsu_oimm_byteenable,
  lsu_oimm_requestvalid,
  lsu_oimm_readnotwrite,
  lsu_oimm_writedata,
  lsu_oimm_readdata,
  lsu_oimm_readdatavalid,
  lsu_oimm_waitrequest,

  IUC_ARID,
  IUC_ARADDR,
  IUC_ARLEN,
  IUC_ARSIZE,
  IUC_ARBURST,
  IUC_ARLOCK,
  IUC_ARCACHE,
  IUC_ARPROT,
  IUC_ARVALID,
  IUC_ARREADY,

  IUC_RID,
  IUC_RDATA,
  IUC_RRESP,
  IUC_RLAST,
  IUC_RVALID,
  IUC_RREADY,

  IUC_AWID,
  IUC_AWADDR,
  IUC_AWLEN,
  IUC_AWSIZE,
  IUC_AWBURST,
  IUC_AWLOCK,
  IUC_AWCACHE,
  IUC_AWPROT,
  IUC_AWVALID,
  IUC_AWREADY,

  IUC_WID,
  IUC_WDATA,
  IUC_WSTRB,
  IUC_WLAST,
  IUC_WVALID,
  IUC_WREADY,

  IUC_BID,
  IUC_BRESP,
  IUC_BVALID,
  IUC_BREADY,

  DUC_ARID,
  DUC_ARADDR,
  DUC_ARLEN,
  DUC_ARSIZE,
  DUC_ARBURST,
  DUC_ARLOCK,
  DUC_ARCACHE,
  DUC_ARPROT,
  DUC_ARVALID,
  DUC_ARREADY,

  DUC_RID,
  DUC_RDATA,
  DUC_RRESP,
  DUC_RLAST,
  DUC_RVALID,
  DUC_RREADY,

  DUC_AWID,
  DUC_AWADDR,
  DUC_AWLEN,
  DUC_AWSIZE,
  DUC_AWBURST,
  DUC_AWLOCK,
  DUC_AWCACHE,
  DUC_AWPROT,
  DUC_AWVALID,
  DUC_AWREADY,

  DUC_WID,
  DUC_WDATA,
  DUC_WSTRB,
  DUC_WLAST,
  DUC_WVALID,
  DUC_WREADY,

  DUC_BID,
  DUC_BRESP,
  DUC_BVALID,
  DUC_BREADY,

  IC_ARID,
  IC_ARADDR,
  IC_ARLEN,
  IC_ARSIZE,
  IC_ARBURST,
  IC_ARLOCK,
  IC_ARCACHE,
  IC_ARPROT,
  IC_ARVALID,
  IC_ARREADY,

  IC_RID,
  IC_RDATA,
  IC_RRESP,
  IC_RLAST,
  IC_RVALID,
  IC_RREADY,

  IC_AWID,
  IC_AWADDR,
  IC_AWLEN,
  IC_AWSIZE,
  IC_AWBURST,
  IC_AWLOCK,
  IC_AWCACHE,
  IC_AWPROT,
  IC_AWVALID,
  IC_AWREADY,

  IC_WID,
  IC_WDATA,
  IC_WSTRB,
  IC_WLAST,
  IC_WVALID,
  IC_WREADY,

  IC_BID,
  IC_BRESP,
  IC_BVALID,
  IC_BREADY,

  DC_ARID,
  DC_ARADDR,
  DC_ARLEN,
  DC_ARSIZE,
  DC_ARBURST,
  DC_ARLOCK,
  DC_ARCACHE,
  DC_ARPROT,
  DC_ARVALID,
  DC_ARREADY,

  DC_RID,
  DC_RDATA,
  DC_RRESP,
  DC_RLAST,
  DC_RVALID,
  DC_RREADY,

  DC_AWID,
  DC_AWADDR,
  DC_AWLEN,
  DC_AWSIZE,
  DC_AWBURST,
  DC_AWLOCK,
  DC_AWCACHE,
  DC_AWPROT,
  DC_AWVALID,
  DC_AWREADY,

  DC_WID,
  DC_WDATA,
  DC_WSTRB,
  DC_WLAST,
  DC_WVALID,
  DC_WREADY,

  DC_BID,
  DC_BRESP,
  DC_BVALID,
  DC_BREADY,

  icache_tag_renable,
  icache_tag_raddr,
  icache_tag_rdata,
  icache_tag_wenable,
  icache_tag_waddr,
  icache_tag_wdata,

  icache_data_renable,
  icache_data_raddr,
  icache_data_rdata,
  icache_data_wenable,
  icache_data_waddr,
  icache_data_wstrb,
  icache_data_wdata,

  dcache_tag_renable,
  dcache_tag_raddr,
  dcache_tag_rdata,
  dcache_tag_wenable,
  dcache_tag_waddr,
  dcache_tag_wdata,

  dcache_data_renable,
  dcache_data_raddr,
  dcache_data_rdata,
  dcache_data_wenable,
  dcache_data_waddr,
  dcache_data_wstrb,
  dcache_data_wdata
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter REGISTER_SIZE = 32;
parameter LOG2_BURSTLENGTH = 8;
parameter AXI_ID_WIDTH = 4;
parameter UC_MEMORY_REGIONS = 4;
parameter HAS_ICACHE = 0;
parameter HAS_DCACHE = 0;
parameter ICACHE_SIZE = 4096;
parameter ICACHE_LINE_SIZE = 16;
parameter ICACHE_EXTERNAL_WIDTH = 32;
parameter DCACHE_SIZE = 4096;
parameter DCACHE_LINE_SIZE = 16;
parameter DCACHE_EXTERNAL_WIDTH = 32;
parameter DCACHE_WRITEBACK = 1;
parameter DCACHE_DIRTY_BITS = DCACHE_WRITEBACK;

localparam DCACHE_POLICY = DCACHE_WRITEBACK? `CACHE_POLICY_WRITE_BACK : `CACHE_POLICY_WRITE_THROUGH;

input wire clk;
input wire reset;

input wire [REGISTER_SIZE*`LEAST1(UC_MEMORY_REGIONS)-1: 0] umr_base_addrs;
input wire [REGISTER_SIZE*`LEAST1(UC_MEMORY_REGIONS)-1: 0] umr_last_addrs;

output wire from_icache_control_ready;
input wire to_icache_control_valid;
input wire [2-1:0] to_icache_control_command;
output wire from_dcache_control_ready;
input wire to_dcache_control_valid;
input wire [2-1:0] to_dcache_control_command;
input wire [REGISTER_SIZE-1:0] to_cache_control_base;
input wire [REGISTER_SIZE-1:0] to_cache_control_last;

output wire memory_interface_idle;

input wire [REGISTER_SIZE-1:0] ifetch_oimm_address;
input wire ifetch_oimm_requestvalid;
output wire [REGISTER_SIZE-1:0] ifetch_oimm_readdata;
output wire ifetch_oimm_waitrequest;
output wire ifetch_oimm_readdatavalid;

input wire [REGISTER_SIZE-1:0] lsu_oimm_address;
input wire [`NUM_BYTE(REGISTER_SIZE)-1:0] lsu_oimm_byteenable;
input wire lsu_oimm_requestvalid;
input wire lsu_oimm_readnotwrite;
input wire [REGISTER_SIZE-1:0] lsu_oimm_writedata;
output wire [REGISTER_SIZE-1:0] lsu_oimm_readdata;
output wire lsu_oimm_readdatavalid;
output wire lsu_oimm_waitrequest;

output wire [AXI_ID_WIDTH-1:0] IUC_ARID;
output wire [REGISTER_SIZE-1:0] IUC_ARADDR;
output wire [LOG2_BURSTLENGTH-1:0] IUC_ARLEN;
output wire [2:0] IUC_ARSIZE;
output wire [1:0] IUC_ARBURST;
output wire [1:0] IUC_ARLOCK;
output wire [3:0] IUC_ARCACHE;
output wire [2:0] IUC_ARPROT;
output wire IUC_ARVALID;
input wire IUC_ARREADY;

input wire [AXI_ID_WIDTH-1:0] IUC_RID;
input wire [REGISTER_SIZE-1:0] IUC_RDATA;
input wire [1:0] IUC_RRESP;
input wire IUC_RLAST;
input wire IUC_RVALID;
output wire IUC_RREADY;

output wire [AXI_ID_WIDTH-1:0] IUC_AWID;
output wire [REGISTER_SIZE-1:0] IUC_AWADDR;
output wire [LOG2_BURSTLENGTH-1:0] IUC_AWLEN;
output wire [2:0] IUC_AWSIZE;
output wire [1:0] IUC_AWBURST;
output wire [1:0] IUC_AWLOCK;
output wire [3:0] IUC_AWCACHE;
output wire [2:0] IUC_AWPROT;
output wire IUC_AWVALID;
input wire IUC_AWREADY;

output wire [AXI_ID_WIDTH-1:0] IUC_WID;
output wire [REGISTER_SIZE-1:0] IUC_WDATA;
output wire [(REGISTER_SIZE/8)-1:0] IUC_WSTRB;
output wire IUC_WLAST;
output wire IUC_WVALID;
input wire IUC_WREADY;

input wire [AXI_ID_WIDTH-1:0] IUC_BID;
input wire [1:0] IUC_BRESP;
input wire IUC_BVALID;
output wire IUC_BREADY;

output wire [AXI_ID_WIDTH-1:0] DUC_ARID;
output wire [REGISTER_SIZE-1:0] DUC_ARADDR;
output wire [LOG2_BURSTLENGTH-1:0] DUC_ARLEN;
output wire [2:0] DUC_ARSIZE;
output wire [1:0] DUC_ARBURST;
output wire [1:0] DUC_ARLOCK;
output wire [3:0] DUC_ARCACHE;
output wire [2:0] DUC_ARPROT;
output wire DUC_ARVALID;
input wire DUC_ARREADY;

input wire [AXI_ID_WIDTH-1:0] DUC_RID;
input wire [REGISTER_SIZE-1:0] DUC_RDATA;
input wire [1:0] DUC_RRESP;
input wire DUC_RLAST;
input wire DUC_RVALID;
output wire DUC_RREADY;

output wire [AXI_ID_WIDTH-1:0] DUC_AWID;
output wire [REGISTER_SIZE-1:0] DUC_AWADDR;
output wire [LOG2_BURSTLENGTH-1:0] DUC_AWLEN;
output wire [2:0] DUC_AWSIZE;
output wire [1:0] DUC_AWBURST;
output wire [1:0] DUC_AWLOCK;
output wire [3:0] DUC_AWCACHE;
output wire [2:0] DUC_AWPROT;
output wire DUC_AWVALID;
input wire DUC_AWREADY;

output wire [AXI_ID_WIDTH-1:0] DUC_WID;
output wire [REGISTER_SIZE-1:0] DUC_WDATA;
output wire [(REGISTER_SIZE/8)-1:0] DUC_WSTRB;
output wire DUC_WLAST;
output wire DUC_WVALID;
input wire DUC_WREADY;

input wire [AXI_ID_WIDTH-1:0] DUC_BID;
input wire [1:0] DUC_BRESP;
input wire DUC_BVALID;
output wire DUC_BREADY;

output wire [AXI_ID_WIDTH-1:0] IC_ARID;
output wire [REGISTER_SIZE-1:0] IC_ARADDR;
output wire [LOG2_BURSTLENGTH-1:0] IC_ARLEN;
output wire [2:0] IC_ARSIZE;
output wire [1:0] IC_ARBURST;
output wire [1:0] IC_ARLOCK;
output wire [3:0] IC_ARCACHE;
output wire [2:0] IC_ARPROT;
output wire IC_ARVALID;
input wire IC_ARREADY;

input wire [AXI_ID_WIDTH-1:0] IC_RID;
input wire [REGISTER_SIZE-1:0] IC_RDATA;
input wire [1:0] IC_RRESP;
input wire IC_RLAST;
input wire IC_RVALID;
output wire IC_RREADY;

output wire [AXI_ID_WIDTH-1:0] IC_AWID;
output wire [REGISTER_SIZE-1:0] IC_AWADDR;
output wire [LOG2_BURSTLENGTH-1:0] IC_AWLEN;
output wire [2:0] IC_AWSIZE;
output wire [1:0] IC_AWBURST;
output wire [1:0] IC_AWLOCK;
output wire [3:0] IC_AWCACHE;
output wire [2:0] IC_AWPROT;
output wire IC_AWVALID;
input wire IC_AWREADY;

output wire [AXI_ID_WIDTH-1:0] IC_WID;
output wire [REGISTER_SIZE-1:0] IC_WDATA;
output wire [(REGISTER_SIZE/8)-1:0] IC_WSTRB;
output wire IC_WLAST;
output wire IC_WVALID;
input wire IC_WREADY;

input wire [AXI_ID_WIDTH-1:0] IC_BID;
input wire [1:0] IC_BRESP;
input wire IC_BVALID;
output wire IC_BREADY;

output wire [AXI_ID_WIDTH-1:0] DC_ARID;
output wire [REGISTER_SIZE-1:0] DC_ARADDR;
output wire [LOG2_BURSTLENGTH-1:0] DC_ARLEN;
output wire [2:0] DC_ARSIZE;
output wire [1:0] DC_ARBURST;
output wire [1:0] DC_ARLOCK;
output wire [3:0] DC_ARCACHE;
output wire [2:0] DC_ARPROT;
output wire DC_ARVALID;
input wire DC_ARREADY;

input wire [AXI_ID_WIDTH-1:0] DC_RID;
input wire [REGISTER_SIZE-1:0] DC_RDATA;
input wire [1:0] DC_RRESP;
input wire DC_RLAST;
input wire DC_RVALID;
output wire DC_RREADY;

output wire [AXI_ID_WIDTH-1:0] DC_AWID;
output wire [REGISTER_SIZE-1:0] DC_AWADDR;
output wire [LOG2_BURSTLENGTH-1:0] DC_AWLEN;
output wire [2:0] DC_AWSIZE;
output wire [1:0] DC_AWBURST;
output wire [1:0] DC_AWLOCK;
output wire [3:0] DC_AWCACHE;
output wire [2:0] DC_AWPROT;
output wire DC_AWVALID;
input wire DC_AWREADY;

output wire [AXI_ID_WIDTH-1:0] DC_WID;
output wire [REGISTER_SIZE-1:0] DC_WDATA;
output wire [(REGISTER_SIZE/8)-1:0] DC_WSTRB;
output wire DC_WLAST;
output wire DC_WVALID;
input wire DC_WREADY;

input wire [AXI_ID_WIDTH-1:0] DC_BID;
input wire [1:0] DC_BRESP;
input wire DC_BVALID;
output wire DC_BREADY;

`include "ervp_log_util.vf"

output wire icache_tag_renable;
output wire [LOG2RU_MIN1(ICACHE_SIZE/ICACHE_LINE_SIZE)-1:0] icache_tag_raddr;
input wire [REGISTER_SIZE-LOG2RU(ICACHE_SIZE):0] icache_tag_rdata;
output wire icache_tag_wenable;
output wire [LOG2RU_MIN1(ICACHE_SIZE/ICACHE_LINE_SIZE)-1:0] icache_tag_waddr;
output wire [REGISTER_SIZE-LOG2RU(ICACHE_SIZE):0] icache_tag_wdata;

output wire icache_data_renable;
output wire [LOG2RU_MIN1(ICACHE_SIZE/ICACHE_LINE_SIZE)+LOG2RU(ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))-1:0] icache_data_raddr;
input wire [ICACHE_EXTERNAL_WIDTH-1:0] icache_data_rdata;
output wire icache_data_wenable;
output wire [LOG2RU_MIN1(ICACHE_SIZE/ICACHE_LINE_SIZE)+LOG2RU(ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))-1:0] icache_data_waddr;
output wire [(ICACHE_EXTERNAL_WIDTH/8)-1:0] icache_data_wstrb;
output wire [ICACHE_EXTERNAL_WIDTH-1:0] icache_data_wdata;

output wire dcache_tag_renable;
output wire [LOG2RU_MIN1(DCACHE_SIZE/DCACHE_LINE_SIZE)-1:0] dcache_tag_raddr;
input wire [REGISTER_SIZE-LOG2RU(DCACHE_SIZE)+DCACHE_DIRTY_BITS:0] dcache_tag_rdata;
output wire dcache_tag_wenable;
output wire [LOG2RU_MIN1(DCACHE_SIZE/DCACHE_LINE_SIZE)-1:0] dcache_tag_waddr;
output wire [REGISTER_SIZE-LOG2RU(DCACHE_SIZE)+DCACHE_DIRTY_BITS:0] dcache_tag_wdata;

output wire dcache_data_renable;
output wire [LOG2RU_MIN1(DCACHE_SIZE/DCACHE_LINE_SIZE)+LOG2RU(DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))-1:0] dcache_data_raddr;
input wire [DCACHE_EXTERNAL_WIDTH-1:0] dcache_data_rdata;
output wire dcache_data_wenable;
output wire [LOG2RU_MIN1(DCACHE_SIZE/DCACHE_LINE_SIZE)+LOG2RU(DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))-1:0] dcache_data_waddr;
output wire [(DCACHE_EXTERNAL_WIDTH/8)-1:0] dcache_data_wstrb;
output wire [DCACHE_EXTERNAL_WIDTH-1:0] dcache_data_wdata;

/////////////
/* signals */
/////////////

`include "lpit_function.vb"
`include "lpixm_function.vb"

localparam ICACHE_BW_ADDR = REGISTER_SIZE;
localparam ICACHE_BW_ACCESS = REGISTER_SIZE;
localparam ICACHE_NUM_REGION = 1;

wire i_icache_busy;
wire i_icache_caching_enable;
wire [ICACHE_BW_ADDR*ICACHE_NUM_REGION-1:0] i_icache_cacheable_region_start_list;
wire [ICACHE_BW_ADDR*ICACHE_NUM_REGION-1:0] i_icache_cacheable_region_last_list;

wire i_icache_control_ready;
wire i_icache_control_valid;
wire [`BW_CACHE_CONTROL_CMD-1:0] i_icache_control_command;
wire [ICACHE_BW_ADDR-1:0] i_icache_control_region_start;
wire [ICACHE_BW_ADDR-1:0] i_icache_control_region_last;

wire i_icache_access_cqready;
wire i_icache_access_cqvalid;
wire [ICACHE_BW_ADDR-1:0] i_icache_access_cqaddr;
wire i_icache_access_cqwrite;
wire [`BW_AXI_WSTRB(ICACHE_BW_ACCESS)-1:0] i_icache_access_cqwstrb;
wire [ICACHE_BW_ACCESS-1:0] i_icache_access_cqwdata;
wire i_icache_access_cyvalid;
wire [ICACHE_BW_ACCESS-1:0] i_icache_access_cyrdata;

localparam ICACHE_BW_LPI_QPARCEL = BW_LPIXM_QPARCEL(ICACHE_BW_ADDR,ICACHE_EXTERNAL_WIDTH);
localparam ICACHE_BW_LPI_YPARCEL = BW_LPIXM_YPARCEL(ICACHE_EXTERNAL_WIDTH);
localparam ICACHE_BW_LPI_BURDEN = 2;
localparam ICACHE_BW_LPI_QDATA = BW_LPI_DATA(ICACHE_BW_LPI_BURDEN,ICACHE_BW_LPI_QPARCEL);
localparam ICACHE_BW_LPI_YDATA = BW_LPI_DATA(ICACHE_BW_LPI_BURDEN,ICACHE_BW_LPI_YPARCEL);

wire [2-1:0] i_icache_memory_lqdready;
wire i_icache_memory_lqvalid;
wire i_icache_memory_lqhint;
wire i_icache_memory_lqlast;
wire i_icache_memory_lqafy;
wire [ICACHE_BW_LPI_QDATA-1:0] i_icache_memory_lqdata;

wire [2-1:0] i_icache_memory_lydready;
wire i_icache_memory_lyvalid;
wire i_icache_memory_lyhint;
wire i_icache_memory_lylast;
wire [ICACHE_BW_LPI_YDATA-1:0] i_icache_memory_lydata;

localparam DCACHE_BW_ADDR = REGISTER_SIZE;
localparam DCACHE_BW_ACCESS = REGISTER_SIZE;
localparam DCACHE_NUM_REGION = 4;

wire i_dcache_busy;
wire i_dcache_caching_enable;
wire [DCACHE_BW_ADDR*DCACHE_NUM_REGION-1:0] i_dcache_cacheable_region_start_list;
wire [DCACHE_BW_ADDR*DCACHE_NUM_REGION-1:0] i_dcache_cacheable_region_last_list;

wire i_dcache_control_ready;
wire i_dcache_control_valid;
wire [`BW_CACHE_CONTROL_CMD-1:0] i_dcache_control_command;
wire [DCACHE_BW_ADDR-1:0] i_dcache_control_region_start;
wire [DCACHE_BW_ADDR-1:0] i_dcache_control_region_last;

wire i_dcache_access_cqready;
wire i_dcache_access_cqvalid;
wire [DCACHE_BW_ADDR-1:0] i_dcache_access_cqaddr;
wire i_dcache_access_cqwrite;
wire [`BW_AXI_WSTRB(DCACHE_BW_ACCESS)-1:0] i_dcache_access_cqwstrb;
wire [DCACHE_BW_ACCESS-1:0] i_dcache_access_cqwdata;
wire i_dcache_access_cyvalid;
wire [DCACHE_BW_ACCESS-1:0] i_dcache_access_cyrdata;

localparam DCACHE_BW_LPI_QPARCEL = BW_LPIXM_QPARCEL(DCACHE_BW_ADDR,DCACHE_EXTERNAL_WIDTH);
localparam DCACHE_BW_LPI_YPARCEL = BW_LPIXM_YPARCEL(DCACHE_EXTERNAL_WIDTH);
localparam DCACHE_BW_LPI_BURDEN = 0;
localparam DCACHE_BW_LPI_QDATA = BW_LPI_DATA(DCACHE_BW_LPI_BURDEN,DCACHE_BW_LPI_QPARCEL);
localparam DCACHE_BW_LPI_YDATA = BW_LPI_DATA(DCACHE_BW_LPI_BURDEN,DCACHE_BW_LPI_YPARCEL);

wire [2-1:0] i_dcache_cca_slqdready;
wire i_dcache_cca_slqvalid;
wire i_dcache_cca_slqhint;
wire i_dcache_cca_slqlast;
wire i_dcache_cca_slqafy;
wire [DCACHE_BW_LPI_QDATA-1:0] i_dcache_cca_slqdata;

wire [2-1:0] i_dcache_cca_slydready;
wire i_dcache_cca_slyvalid;
wire i_dcache_cca_slyhint;
wire i_dcache_cca_slylast;
wire [DCACHE_BW_LPI_YDATA-1:0] i_dcache_cca_slydata;

wire [2-1:0] i_dcache_uca_slqdready;
wire i_dcache_uca_slqvalid;
wire i_dcache_uca_slqhint;
wire i_dcache_uca_slqlast;
wire i_dcache_uca_slqafy;
wire [DCACHE_BW_LPI_QDATA-1:0] i_dcache_uca_slqdata;

wire [2-1:0] i_dcache_uca_slydready;
wire i_dcache_uca_slyvalid;
wire i_dcache_uca_slyhint;
wire i_dcache_uca_slylast;
wire [DCACHE_BW_LPI_YDATA-1:0] i_dcache_uca_slydata;

////////////
/* logics */
////////////

assign IC_ARID = 0;
assign IC_ARADDR = 0;
assign IC_ARLEN = 0;
assign IC_ARSIZE = 0;
assign IC_ARBURST = 0;
assign IC_ARLOCK = 0;
assign IC_ARCACHE = 0;
assign IC_ARPROT = 0;
assign IC_ARVALID = 0;
assign IC_RREADY = 0;
assign IC_AWID = 0;
assign IC_AWADDR = 0;
assign IC_AWLEN = 0;
assign IC_AWSIZE = 0;
assign IC_AWBURST = 0;
assign IC_AWLOCK = 0;
assign IC_AWCACHE = 0;
assign IC_AWPROT = 0;
assign IC_AWVALID = 0;
assign IC_WID = 0;
assign IC_WDATA = 0;
assign IC_WSTRB = 0;
assign IC_WLAST = 0;
assign IC_WVALID = 0;
assign IC_BREADY = 0;

/* icache */

ERVP_CACHE_P1
#(
  .BW_ADDR(ICACHE_BW_ADDR),
  .BW_ACCESS(ICACHE_BW_ACCESS),
  .BW_INTERFACE(ICACHE_EXTERNAL_WIDTH),

  .CACHE_SIZE(ICACHE_SIZE),
  .CACHE_LINE_SIZE(ICACHE_LINE_SIZE),
  .CACHE_POLICY(`CACHE_POLICY_READ_ONLY),
  .HAS_CACHE(HAS_ICACHE),
  .HAS_REGION(0),
  .NUM_REGION(ICACHE_NUM_REGION)
)
i_icache
(
  .clk(clk),
  .rstnn(~reset),
  .clear(1'b 0),
  .enable(1'b 1),
  .busy(i_icache_busy),

  .caching_enable(i_icache_caching_enable),
  .cacheable_region_start_list(i_icache_cacheable_region_start_list),
  .cacheable_region_last_list(i_icache_cacheable_region_last_list),
  
  .control_ready(i_icache_control_ready),
  .control_valid(i_icache_control_valid),
  .control_command(i_icache_control_command),
  .control_region_start(i_icache_control_region_start),
  .control_region_last(i_icache_control_region_last),

  .access_cqready(i_icache_access_cqready),
  .access_cqvalid(i_icache_access_cqvalid),
  .access_cqaddr(i_icache_access_cqaddr),
  .access_cqwrite(i_icache_access_cqwrite),
  .access_cqwstrb(i_icache_access_cqwstrb),
  .access_cqwdata(i_icache_access_cqwdata),
  .access_cyvalid(i_icache_access_cyvalid),
  .access_cyrdata(i_icache_access_cyrdata),

  .cache_tag_renable(icache_tag_renable),
  .cache_tag_raddr(icache_tag_raddr),
  .cache_tag_rdata(icache_tag_rdata),
  .cache_tag_wenable(icache_tag_wenable),
  .cache_tag_waddr(icache_tag_waddr),
  .cache_tag_wdata(icache_tag_wdata),

  .cache_data_renable(icache_data_renable),
  .cache_data_raddr(icache_data_raddr),
  .cache_data_rdata(icache_data_rdata),
  .cache_data_wenable(icache_data_wenable),
  .cache_data_waddr(icache_data_waddr),
  .cache_data_wstrb(icache_data_wstrb),
  .cache_data_wdata(icache_data_wdata),

  .memory_slqdready(i_icache_memory_lqdready),
  .memory_slqvalid(i_icache_memory_lqvalid),
  .memory_slqhint(i_icache_memory_lqhint),
  .memory_slqlast(i_icache_memory_lqlast),
  .memory_slqafy(i_icache_memory_lqafy),
  .memory_slqdata(i_icache_memory_lqdata),

  .memory_slydready(i_icache_memory_lydready),
  .memory_slyvalid(i_icache_memory_lyvalid),
  .memory_slyhint(i_icache_memory_lyhint),
  .memory_slylast(i_icache_memory_lylast),
  .memory_slydata(i_icache_memory_lydata)
);

assign i_icache_caching_enable = 1;  // HAS_CACHE==0
assign i_icache_cacheable_region_start_list = 0;
assign i_icache_cacheable_region_last_list = 0; // HAS_REGION==0

assign from_icache_control_ready = i_icache_control_ready;
assign i_icache_control_valid = to_icache_control_valid;
assign i_icache_control_command = to_icache_control_command;
assign i_icache_control_region_start = to_cache_control_base;
assign i_icache_control_region_last = to_cache_control_last;

assign ifetch_oimm_waitrequest = ~i_icache_access_cqready;
assign i_icache_access_cqvalid = ifetch_oimm_requestvalid;
assign i_icache_access_cqaddr = ifetch_oimm_address;
assign i_icache_access_cqwrite = 0;
assign i_icache_access_cqwstrb = 0;
assign i_icache_access_cqwdata = 0;
assign ifetch_oimm_readdatavalid = i_icache_access_cyvalid;
assign ifetch_oimm_readdata = i_icache_access_cyrdata;

RVX_MODULE_035
#(
  .RVX_GPARA_3(ICACHE_BW_ADDR),
  .RVX_GPARA_1(ICACHE_EXTERNAL_WIDTH),
  .RVX_GPARA_2(AXI_ID_WIDTH),
  .MEMORY_OPERATION_TYPE(3),
  .HAS_BURDEN(1),
  .BW_BURDEN(ICACHE_BW_LPI_BURDEN)
)
i_icache2axi
(
	.rvx_port_36(clk),
	.rvx_port_02(~reset),
  .rvx_port_18(1'b 0),
  .rvx_port_21(1'b 1),

  .rvx_port_27(i_icache_memory_lqdready),
  .rvx_port_04(i_icache_memory_lqvalid),
  .rvx_port_43(i_icache_memory_lqhint),
  .rvx_port_30(i_icache_memory_lqlast),
  .rvx_port_25(i_icache_memory_lqafy),
  .rvx_port_28(i_icache_memory_lqdata),

  .rvx_port_31(i_icache_memory_lydready),
  .rvx_port_16(i_icache_memory_lyvalid),
  .rvx_port_00(i_icache_memory_lyhint),
  .rvx_port_10(i_icache_memory_lylast),
  .rvx_port_32(i_icache_memory_lydata),

  .rvx_port_29(IUC_AWID),
	.rvx_port_12(IUC_AWADDR),
	.rvx_port_41(IUC_AWLEN),
	.rvx_port_37(IUC_AWSIZE),
	.rvx_port_24(IUC_AWBURST),
	.rvx_port_42(IUC_AWVALID),
	.rvx_port_26(IUC_AWREADY),

	.rvx_port_44(IUC_WID),
	.rvx_port_05(IUC_WDATA),
	.rvx_port_20(IUC_WSTRB),
	.rvx_port_35(IUC_WLAST),
	.rvx_port_23(IUC_WVALID),
	.rvx_port_08(IUC_WREADY), 

	.rvx_port_09(IUC_BID),
	.rvx_port_22(IUC_BRESP),
	.rvx_port_17(IUC_BVALID),
	.rvx_port_39(IUC_BREADY),

	.rvx_port_19(IUC_ARID),
	.rvx_port_01(IUC_ARADDR),
	.rvx_port_13(IUC_ARLEN),
	.rvx_port_34(IUC_ARSIZE),
	.rvx_port_15(IUC_ARBURST),
	.rvx_port_40(IUC_ARVALID),
	.rvx_port_14(IUC_ARREADY),

	.rvx_port_38(IUC_RID),
	.rvx_port_07(IUC_RDATA),
	.rvx_port_33(IUC_RRESP),
	.rvx_port_03(IUC_RLAST),
	.rvx_port_06(IUC_RVALID),
	.rvx_port_11(IUC_RREADY)
);

/* dcache */

ERVP_CACHE_P2
#(
  .BW_ADDR(DCACHE_BW_ADDR),
  .BW_ACCESS(DCACHE_BW_ACCESS),
  .BW_INTERFACE(DCACHE_EXTERNAL_WIDTH),

  .CACHE_SIZE(DCACHE_SIZE),
  .CACHE_LINE_SIZE(DCACHE_LINE_SIZE),
  .CACHE_POLICY(DCACHE_POLICY),
  .HAS_CACHE(HAS_DCACHE),
  .HAS_REGION(1),
  .NUM_REGION(DCACHE_NUM_REGION)
)
i_dcache
(
  .clk(clk),
  .rstnn(~reset),
  .clear(1'b 0),
  .enable(1'b 1),
  .busy(i_dcache_busy),

  .caching_enable(i_dcache_caching_enable),
  .cacheable_region_start_list(i_dcache_cacheable_region_start_list),
  .cacheable_region_last_list(i_dcache_cacheable_region_last_list),
  
  .control_ready(i_dcache_control_ready),
  .control_valid(i_dcache_control_valid),
  .control_command(i_dcache_control_command),
  .control_region_start(i_dcache_control_region_start),
  .control_region_last(i_dcache_control_region_last),

  .access_cqready(i_dcache_access_cqready),
  .access_cqvalid(i_dcache_access_cqvalid),
  .access_cqaddr(i_dcache_access_cqaddr),
  .access_cqwrite(i_dcache_access_cqwrite),
  .access_cqwstrb(i_dcache_access_cqwstrb),
  .access_cqwdata(i_dcache_access_cqwdata),
  .access_cyvalid(i_dcache_access_cyvalid),
  .access_cyrdata(i_dcache_access_cyrdata),

  .cache_tag_renable(dcache_tag_renable),
  .cache_tag_raddr(dcache_tag_raddr),
  .cache_tag_rdata(dcache_tag_rdata),
  .cache_tag_wenable(dcache_tag_wenable),
  .cache_tag_waddr(dcache_tag_waddr),
  .cache_tag_wdata(dcache_tag_wdata),

  .cache_data_renable(dcache_data_renable),
  .cache_data_raddr(dcache_data_raddr),
  .cache_data_rdata(dcache_data_rdata),
  .cache_data_wenable(dcache_data_wenable),
  .cache_data_waddr(dcache_data_waddr),
  .cache_data_wstrb(dcache_data_wstrb),
  .cache_data_wdata(dcache_data_wdata),

  .cca_slqdready(i_dcache_cca_slqdready),
  .cca_slqvalid(i_dcache_cca_slqvalid),
  .cca_slqhint(i_dcache_cca_slqhint),
  .cca_slqlast(i_dcache_cca_slqlast),
  .cca_slqafy(i_dcache_cca_slqafy),
  .cca_slqdata(i_dcache_cca_slqdata),

  .cca_slydready(i_dcache_cca_slydready),
  .cca_slyvalid(i_dcache_cca_slyvalid),
  .cca_slyhint(i_dcache_cca_slyhint),
  .cca_slylast(i_dcache_cca_slylast),
  .cca_slydata(i_dcache_cca_slydata),

  .uca_slqdready(i_dcache_uca_slqdready),
  .uca_slqvalid(i_dcache_uca_slqvalid),
  .uca_slqhint(i_dcache_uca_slqhint),
  .uca_slqlast(i_dcache_uca_slqlast),
  .uca_slqafy(i_dcache_uca_slqafy),
  .uca_slqdata(i_dcache_uca_slqdata),

  .uca_slydready(i_dcache_uca_slydready),
  .uca_slyvalid(i_dcache_uca_slyvalid),
  .uca_slyhint(i_dcache_uca_slyhint),
  .uca_slylast(i_dcache_uca_slylast),
  .uca_slydata(i_dcache_uca_slydata)
);

assign i_dcache_caching_enable = 1;
assign i_dcache_cacheable_region_start_list = umr_base_addrs;
assign i_dcache_cacheable_region_last_list = umr_last_addrs;

assign from_dcache_control_ready = i_dcache_control_ready;
assign i_dcache_control_valid = to_dcache_control_valid;
assign i_dcache_control_command = to_dcache_control_command;
assign i_dcache_control_region_start = to_cache_control_base;
assign i_dcache_control_region_last = to_cache_control_last;

assign lsu_oimm_waitrequest = ~i_dcache_access_cqready;
assign i_dcache_access_cqvalid = lsu_oimm_requestvalid;
assign i_dcache_access_cqaddr = lsu_oimm_address;
assign i_dcache_access_cqwrite = ~lsu_oimm_readnotwrite;
assign i_dcache_access_cqwstrb = lsu_oimm_byteenable;
assign i_dcache_access_cqwdata = lsu_oimm_writedata;
assign lsu_oimm_readdatavalid = i_dcache_access_cyvalid;
assign lsu_oimm_readdata = i_dcache_access_cyrdata;

RVX_MODULE_035
#(
  .RVX_GPARA_3(DCACHE_BW_ADDR),
  .RVX_GPARA_1(DCACHE_EXTERNAL_WIDTH),
  .RVX_GPARA_2(AXI_ID_WIDTH),
  .MEMORY_OPERATION_TYPE(3),
  .HAS_BURDEN(0)
)
i_dcache_cca_2axi
(
	.rvx_port_36(clk),
	.rvx_port_02(~reset),
  .rvx_port_18(1'b 0),
  .rvx_port_21(1'b 1),

  .rvx_port_27(i_dcache_cca_slqdready),
  .rvx_port_04(i_dcache_cca_slqvalid),
  .rvx_port_43(i_dcache_cca_slqhint),
  .rvx_port_30(i_dcache_cca_slqlast),
  .rvx_port_25(i_dcache_cca_slqafy),
  .rvx_port_28(i_dcache_cca_slqdata),

  .rvx_port_31(i_dcache_cca_slydready),
  .rvx_port_16(i_dcache_cca_slyvalid),
  .rvx_port_00(i_dcache_cca_slyhint),
  .rvx_port_10(i_dcache_cca_slylast),
  .rvx_port_32(i_dcache_cca_slydata),

  .rvx_port_29(DC_AWID),
	.rvx_port_12(DC_AWADDR),
	.rvx_port_41(DC_AWLEN),
	.rvx_port_37(DC_AWSIZE),
	.rvx_port_24(DC_AWBURST),
	.rvx_port_42(DC_AWVALID),
	.rvx_port_26(DC_AWREADY),

	.rvx_port_44(DC_WID),
	.rvx_port_05(DC_WDATA),
	.rvx_port_20(DC_WSTRB),
	.rvx_port_35(DC_WLAST),
	.rvx_port_23(DC_WVALID),
	.rvx_port_08(DC_WREADY), 

	.rvx_port_09(DC_BID),
	.rvx_port_22(DC_BRESP),
	.rvx_port_17(DC_BVALID),
	.rvx_port_39(DC_BREADY),

	.rvx_port_19(DC_ARID),
	.rvx_port_01(DC_ARADDR),
	.rvx_port_13(DC_ARLEN),
	.rvx_port_34(DC_ARSIZE),
	.rvx_port_15(DC_ARBURST),
	.rvx_port_40(DC_ARVALID),
	.rvx_port_14(DC_ARREADY),

	.rvx_port_38(DC_RID),
	.rvx_port_07(DC_RDATA),
	.rvx_port_33(DC_RRESP),
	.rvx_port_03(DC_RLAST),
	.rvx_port_06(DC_RVALID),
	.rvx_port_11(DC_RREADY)
);

RVX_MODULE_035
#(
  .RVX_GPARA_3(DCACHE_BW_ADDR),
  .RVX_GPARA_1(DCACHE_EXTERNAL_WIDTH),
  .RVX_GPARA_2(AXI_ID_WIDTH),
  .MEMORY_OPERATION_TYPE(3),
  .HAS_BURDEN(0)
)
i_dcache_uca_2axi
(
	.rvx_port_36(clk),
	.rvx_port_02(~reset),
  .rvx_port_18(1'b 0),
  .rvx_port_21(1'b 1),

  .rvx_port_27(i_dcache_uca_slqdready),
  .rvx_port_04(i_dcache_uca_slqvalid),
  .rvx_port_43(i_dcache_uca_slqhint),
  .rvx_port_30(i_dcache_uca_slqlast),
  .rvx_port_25(i_dcache_uca_slqafy),
  .rvx_port_28(i_dcache_uca_slqdata),

  .rvx_port_31(i_dcache_uca_slydready),
  .rvx_port_16(i_dcache_uca_slyvalid),
  .rvx_port_00(i_dcache_uca_slyhint),
  .rvx_port_10(i_dcache_uca_slylast),
  .rvx_port_32(i_dcache_uca_slydata),

  .rvx_port_29(DUC_AWID),
	.rvx_port_12(DUC_AWADDR),
	.rvx_port_41(DUC_AWLEN),
	.rvx_port_37(DUC_AWSIZE),
	.rvx_port_24(DUC_AWBURST),
	.rvx_port_42(DUC_AWVALID),
	.rvx_port_26(DUC_AWREADY),

	.rvx_port_44(DUC_WID),
	.rvx_port_05(DUC_WDATA),
	.rvx_port_20(DUC_WSTRB),
	.rvx_port_35(DUC_WLAST),
	.rvx_port_23(DUC_WVALID),
	.rvx_port_08(DUC_WREADY), 

	.rvx_port_09(DUC_BID),
	.rvx_port_22(DUC_BRESP),
	.rvx_port_17(DUC_BVALID),
	.rvx_port_39(DUC_BREADY),

	.rvx_port_19(DUC_ARID),
	.rvx_port_01(DUC_ARADDR),
	.rvx_port_13(DUC_ARLEN),
	.rvx_port_34(DUC_ARSIZE),
	.rvx_port_15(DUC_ARBURST),
	.rvx_port_40(DUC_ARVALID),
	.rvx_port_14(DUC_ARREADY),

	.rvx_port_38(DUC_RID),
	.rvx_port_07(DUC_RDATA),
	.rvx_port_33(DUC_RRESP),
	.rvx_port_03(DUC_RLAST),
	.rvx_port_06(DUC_RVALID),
	.rvx_port_11(DUC_RREADY)
);

assign memory_interface_idle = (~i_icache_busy) & (~i_dcache_busy);

endmodule
