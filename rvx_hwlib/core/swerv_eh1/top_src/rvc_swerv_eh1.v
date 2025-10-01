// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reserved.   
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
// 2020-03-19
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "common_defines.vh"
`include "ervp_global.vh"
`include "ervp_axi_define.vh"

`include "global.vh"

module RVC_SWERV_EH1
(
	global_rstnn,
	clk,
	rstnn,

	ifu_sx4awready,
	ifu_sx4awvalid,
	ifu_sx4awaddr,
	ifu_sx4awid,
	ifu_sx4awlen,
	ifu_sx4awsize,
	ifu_sx4awburst,
	ifu_sx4wready,
	ifu_sx4wvalid,
	ifu_sx4wdata,
	ifu_sx4wstrb,
	ifu_sx4wlast,
	ifu_sx4bready,
	ifu_sx4bvalid,
	ifu_sx4bid,
	ifu_sx4bresp,
	ifu_sx4arready,
	ifu_sx4arvalid,
	ifu_sx4araddr,
	ifu_sx4arid,
	ifu_sx4arlen,
	ifu_sx4arsize,
	ifu_sx4arburst,
	ifu_sx4rready,
	ifu_sx4rvalid,
	ifu_sx4rid,
	ifu_sx4rdata,
	ifu_sx4rlast,
	ifu_sx4rresp,

	lsu_sx4awready,
	lsu_sx4awvalid,
	lsu_sx4awaddr,
	lsu_sx4awid,
	lsu_sx4awlen,
	lsu_sx4awsize,
	lsu_sx4awburst,
	lsu_sx4wready,
	lsu_sx4wvalid,
	lsu_sx4wdata,
	lsu_sx4wstrb,
	lsu_sx4wlast,
	lsu_sx4bready,
	lsu_sx4bvalid,
	lsu_sx4bid,
	lsu_sx4bresp,
	lsu_sx4arready,
	lsu_sx4arvalid,
	lsu_sx4araddr,
	lsu_sx4arid,
	lsu_sx4arlen,
	lsu_sx4arsize,
	lsu_sx4arburst,
	lsu_sx4rready,
	lsu_sx4rvalid,
	lsu_sx4rid,
	lsu_sx4rdata,
	lsu_sx4rlast,
	lsu_sx4rresp,

  sb_sx4awready,
	sb_sx4awvalid,
	sb_sx4awaddr,
	sb_sx4awid,
	sb_sx4awlen,
	sb_sx4awsize,
	sb_sx4awburst,
	sb_sx4wready,
	sb_sx4wvalid,
	sb_sx4wdata,
	sb_sx4wstrb,
	sb_sx4wlast,
	sb_sx4bready,
	sb_sx4bvalid,
	sb_sx4bid,
	sb_sx4bresp,
	sb_sx4arready,
	sb_sx4arvalid,
	sb_sx4araddr,
	sb_sx4arid,
	sb_sx4arlen,
	sb_sx4arsize,
	sb_sx4arburst,
	sb_sx4rready,
	sb_sx4rvalid,
	sb_sx4rid,
	sb_sx4rdata,
	sb_sx4rlast,
	sb_sx4rresp,

	interrupt_vector,
	interrupt_out,

	spc,
	sinst
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter RESET_VECTOR = 32'h 0;
parameter ENABLE_EXCEPTIONS = 1;
parameter ENABLE_INTERRUPTS = 1;
parameter NUM_INTERRUPTS = 1;

input wire global_rstnn;
input wire clk;
input wire rstnn;

parameter BW_ADDR = 32;
parameter IFU_BW_DATA = 64;
parameter IFU_BW_TID = `RV_IFU_BUS_TAG;
parameter LSU_BW_DATA = 64;
parameter LSU_BW_TID = `RV_LSU_BUS_TAG;
parameter SB_BW_DATA = 64;
parameter SB_BW_TID = `RV_SB_BUS_TAG;

input wire ifu_sx4awready;
output wire ifu_sx4awvalid;
output wire [(BW_ADDR)-1:0] ifu_sx4awaddr;
output wire [(IFU_BW_TID)-1:0] ifu_sx4awid;
output wire [(8)-1:0] ifu_sx4awlen;
output wire [(3)-1:0] ifu_sx4awsize;
output wire [(2)-1:0] ifu_sx4awburst;
input wire ifu_sx4wready;
output wire ifu_sx4wvalid;
output wire [(IFU_BW_DATA)-1:0] ifu_sx4wdata;
output wire [(IFU_BW_DATA/8)-1:0] ifu_sx4wstrb;
output wire ifu_sx4wlast;
output wire ifu_sx4bready;
input wire ifu_sx4bvalid;
input wire [(IFU_BW_TID)-1:0] ifu_sx4bid;
input wire [(2)-1:0] ifu_sx4bresp;
input wire ifu_sx4arready;
output wire ifu_sx4arvalid;
output wire [(BW_ADDR)-1:0] ifu_sx4araddr;
output wire [(IFU_BW_TID)-1:0] ifu_sx4arid;
output wire [(8)-1:0] ifu_sx4arlen;
output wire [(3)-1:0] ifu_sx4arsize;
output wire [(2)-1:0] ifu_sx4arburst;
output wire ifu_sx4rready;
input wire ifu_sx4rvalid;
input wire [(IFU_BW_TID)-1:0] ifu_sx4rid;
input wire [(IFU_BW_DATA)-1:0] ifu_sx4rdata;
input wire ifu_sx4rlast;
input wire [(2)-1:0] ifu_sx4rresp;

input wire lsu_sx4awready;
output wire lsu_sx4awvalid;
output wire [(BW_ADDR)-1:0] lsu_sx4awaddr;
output wire [(LSU_BW_TID)-1:0] lsu_sx4awid;
output wire [(8)-1:0] lsu_sx4awlen;
output wire [(3)-1:0] lsu_sx4awsize;
output wire [(2)-1:0] lsu_sx4awburst;
input wire lsu_sx4wready;
output wire lsu_sx4wvalid;
output wire [(LSU_BW_DATA)-1:0] lsu_sx4wdata;
output wire [(LSU_BW_DATA/8)-1:0] lsu_sx4wstrb;
output wire lsu_sx4wlast;
output wire lsu_sx4bready;
input wire lsu_sx4bvalid;
input wire [(LSU_BW_TID)-1:0] lsu_sx4bid;
input wire [(2)-1:0] lsu_sx4bresp;
input wire lsu_sx4arready;
output wire lsu_sx4arvalid;
output wire [(BW_ADDR)-1:0] lsu_sx4araddr;
output wire [(LSU_BW_TID)-1:0] lsu_sx4arid;
output wire [(8)-1:0] lsu_sx4arlen;
output wire [(3)-1:0] lsu_sx4arsize;
output wire [(2)-1:0] lsu_sx4arburst;
output wire lsu_sx4rready;
input wire lsu_sx4rvalid;
input wire [(LSU_BW_TID)-1:0] lsu_sx4rid;
input wire [(LSU_BW_DATA)-1:0] lsu_sx4rdata;
input wire lsu_sx4rlast;
input wire [(2)-1:0] lsu_sx4rresp;

input wire sb_sx4awready;
output wire sb_sx4awvalid;
output wire [(BW_ADDR)-1:0] sb_sx4awaddr;
output wire [(SB_BW_TID)-1:0] sb_sx4awid;
output wire [(8)-1:0] sb_sx4awlen;
output wire [(3)-1:0] sb_sx4awsize;
output wire [(2)-1:0] sb_sx4awburst;
input wire sb_sx4wready;
output wire sb_sx4wvalid;
output wire [(SB_BW_DATA)-1:0] sb_sx4wdata;
output wire [(SB_BW_DATA/8)-1:0] sb_sx4wstrb;
output wire sb_sx4wlast;
output wire sb_sx4bready;
input wire sb_sx4bvalid;
input wire [(SB_BW_TID)-1:0] sb_sx4bid;
input wire [(2)-1:0] sb_sx4bresp;
input wire sb_sx4arready;
output wire sb_sx4arvalid;
output wire [(BW_ADDR)-1:0] sb_sx4araddr;
output wire [(SB_BW_TID)-1:0] sb_sx4arid;
output wire [(8)-1:0] sb_sx4arlen;
output wire [(3)-1:0] sb_sx4arsize;
output wire [(2)-1:0] sb_sx4arburst;
output wire sb_sx4rready;
input wire sb_sx4rvalid;
input wire [(SB_BW_TID)-1:0] sb_sx4rid;
input wire [(SB_BW_DATA)-1:0] sb_sx4rdata;
input wire sb_sx4rlast;
input wire [(2)-1:0] sb_sx4rresp;

input wire [NUM_INTERRUPTS-1:0] interrupt_vector;
output wire interrupt_out;

output reg [32-1:0] spc;
output reg [32-1:0] sinst;

////////////
/* signals */
////////////

wire [32-1:0] reset_vector = RESET_VECTOR;

//wire clk;
wire rst_l;
wire dbg_rst_l;
wire [31:1] rst_vec;
wire nmi_int;
wire [31:1] nmi_vec;
wire [63:0] trace_rv_i_insn_ip;
wire [63:0] trace_rv_i_address_ip;
wire [2:0] trace_rv_i_valid_ip;
wire [2:0] trace_rv_i_exception_ip;
wire [4:0] trace_rv_i_ecause_ip;
wire [2:0] trace_rv_i_interrupt_ip;
wire [31:0] trace_rv_i_tval_ip;
wire lsu_axi_awvalid;
wire lsu_axi_awready;
wire [`RV_LSU_BUS_TAG-1:0] lsu_axi_awid;
wire [31:0] lsu_axi_awaddr;
wire [3:0] lsu_axi_awregion;
wire [7:0] lsu_axi_awlen;
wire [2:0] lsu_axi_awsize;
wire [1:0] lsu_axi_awburst;
wire lsu_axi_awlock;
wire [3:0] lsu_axi_awcache;
wire [2:0] lsu_axi_awprot;
wire [3:0] lsu_axi_awqos;
wire lsu_axi_wvalid;
wire lsu_axi_wready;
wire [63:0] lsu_axi_wdata;
wire [7:0] lsu_axi_wstrb;
wire lsu_axi_wlast;
wire lsu_axi_bvalid;
wire lsu_axi_bready;
wire [1:0] lsu_axi_bresp;
wire [`RV_LSU_BUS_TAG-1:0] lsu_axi_bid;
wire lsu_axi_arvalid;
wire lsu_axi_arready;
wire [`RV_LSU_BUS_TAG-1:0] lsu_axi_arid;
wire [31:0] lsu_axi_araddr;
wire [3:0] lsu_axi_arregion;
wire [7:0] lsu_axi_arlen;
wire [2:0] lsu_axi_arsize;
wire [1:0] lsu_axi_arburst;
wire lsu_axi_arlock;
wire [3:0] lsu_axi_arcache;
wire [2:0] lsu_axi_arprot;
wire [3:0] lsu_axi_arqos;
wire lsu_axi_rvalid;
wire lsu_axi_rready;
wire [`RV_LSU_BUS_TAG-1:0] lsu_axi_rid;
wire [63:0] lsu_axi_rdata;
wire [1:0] lsu_axi_rresp;
wire lsu_axi_rlast;
wire ifu_axi_awvalid;
wire ifu_axi_awready;
wire [`RV_IFU_BUS_TAG-1:0] ifu_axi_awid;
wire [31:0] ifu_axi_awaddr;
wire [3:0] ifu_axi_awregion;
wire [7:0] ifu_axi_awlen;
wire [2:0] ifu_axi_awsize;
wire [1:0] ifu_axi_awburst;
wire ifu_axi_awlock;
wire [3:0] ifu_axi_awcache;
wire [2:0] ifu_axi_awprot;
wire [3:0] ifu_axi_awqos;
wire ifu_axi_wvalid;
wire ifu_axi_wready;
wire [63:0] ifu_axi_wdata;
wire [7:0] ifu_axi_wstrb;
wire ifu_axi_wlast;
wire ifu_axi_bvalid;
wire ifu_axi_bready;
wire [1:0] ifu_axi_bresp;
wire [`RV_IFU_BUS_TAG-1:0] ifu_axi_bid;
wire ifu_axi_arvalid;
wire ifu_axi_arready;
wire [`RV_IFU_BUS_TAG-1:0] ifu_axi_arid;
wire [31:0] ifu_axi_araddr;
wire [3:0] ifu_axi_arregion;
wire [7:0] ifu_axi_arlen;
wire [2:0] ifu_axi_arsize;
wire [1:0] ifu_axi_arburst;
wire ifu_axi_arlock;
wire [3:0] ifu_axi_arcache;
wire [2:0] ifu_axi_arprot;
wire [3:0] ifu_axi_arqos;
wire ifu_axi_rvalid;
wire ifu_axi_rready;
wire [`RV_IFU_BUS_TAG-1:0] ifu_axi_rid;
wire [63:0] ifu_axi_rdata;
wire [1:0] ifu_axi_rresp;
wire ifu_axi_rlast;
wire sb_axi_awvalid;
wire sb_axi_awready;
wire [`RV_SB_BUS_TAG-1:0] sb_axi_awid;
wire [31:0] sb_axi_awaddr;
wire [3:0] sb_axi_awregion;
wire [7:0] sb_axi_awlen;
wire [2:0] sb_axi_awsize;
wire [1:0] sb_axi_awburst;
wire sb_axi_awlock;
wire [3:0] sb_axi_awcache;
wire [2:0] sb_axi_awprot;
wire [3:0] sb_axi_awqos;
wire sb_axi_wvalid;
wire sb_axi_wready;
wire [63:0] sb_axi_wdata;
wire [7:0] sb_axi_wstrb;
wire sb_axi_wlast;
wire sb_axi_bvalid;
wire sb_axi_bready;
wire [1:0] sb_axi_bresp;
wire [`RV_SB_BUS_TAG-1:0] sb_axi_bid;
wire sb_axi_arvalid;
wire sb_axi_arready;
wire [`RV_SB_BUS_TAG-1:0] sb_axi_arid;
wire [31:0] sb_axi_araddr;
wire [3:0] sb_axi_arregion;
wire [7:0] sb_axi_arlen;
wire [2:0] sb_axi_arsize;
wire [1:0] sb_axi_arburst;
wire sb_axi_arlock;
wire [3:0] sb_axi_arcache;
wire [2:0] sb_axi_arprot;
wire [3:0] sb_axi_arqos;
wire sb_axi_rvalid;
wire sb_axi_rready;
wire [`RV_SB_BUS_TAG-1:0] sb_axi_rid;
wire [63:0] sb_axi_rdata;
wire [1:0] sb_axi_rresp;
wire sb_axi_rlast;
wire dma_axi_awvalid;
wire dma_axi_awready;
wire [`RV_DMA_BUS_TAG-1:0] dma_axi_awid;
wire [31:0] dma_axi_awaddr;
wire [2:0] dma_axi_awsize;
wire [2:0] dma_axi_awprot;
wire [7:0] dma_axi_awlen;
wire [1:0] dma_axi_awburst;
wire dma_axi_wvalid;
wire dma_axi_wready;
wire [63:0] dma_axi_wdata;
wire [7:0] dma_axi_wstrb;
wire dma_axi_wlast;
wire dma_axi_bvalid;
wire dma_axi_bready;
wire [1:0] dma_axi_bresp;
wire [`RV_DMA_BUS_TAG-1:0] dma_axi_bid;
wire dma_axi_arvalid;
wire dma_axi_arready;
wire [`RV_DMA_BUS_TAG-1:0] dma_axi_arid;
wire [31:0] dma_axi_araddr;
wire [2:0] dma_axi_arsize;
wire [2:0] dma_axi_arprot;
wire [7:0] dma_axi_arlen;
wire [1:0] dma_axi_arburst;
wire dma_axi_rvalid;
wire dma_axi_rready;
wire [`RV_DMA_BUS_TAG-1:0] dma_axi_rid;
wire [63:0] dma_axi_rdata;
wire [1:0] dma_axi_rresp;
wire dma_axi_rlast;
wire lsu_bus_clk_en;
wire ifu_bus_clk_en;
wire dbg_bus_clk_en;
wire dma_bus_clk_en;
wire timer_int;
wire [`RV_PIC_TOTAL_INT:1] extintsrc_req;
wire [1:0] dec_tlu_perfcnt0;
wire [1:0] dec_tlu_perfcnt1;
wire [1:0] dec_tlu_perfcnt2;
wire [1:0] dec_tlu_perfcnt3;
wire dmi_reg_en;
wire [6:0] dmi_reg_addr;
wire dmi_reg_wr_en;
wire [31:0] dmi_reg_wdata;
wire [31:0] dmi_reg_rdata;
wire dmi_hard_reset;
wire mpc_debug_halt_req;
wire mpc_debug_run_req;
wire mpc_reset_run_req;
wire mpc_debug_halt_ack;
wire mpc_debug_run_ack;
wire debug_brkpt_status;
wire i_cpu_halt_req;
wire o_cpu_halt_ack;
wire o_cpu_halt_status;
wire o_debug_mode_status;
wire i_cpu_run_req;
wire o_cpu_run_ack;
wire scan_mode;
wire mbist_mode;

////////////
/* logics */
////////////

swerv_top
i_top
(
	.clk(clk),
	.rst_l(rst_l),
	.dbg_rst_l(dbg_rst_l),
	.rst_vec(rst_vec),
	.nmi_int(nmi_int),
	.nmi_vec(nmi_vec),
	.trace_rv_i_insn_ip(trace_rv_i_insn_ip),
	.trace_rv_i_address_ip(trace_rv_i_address_ip),
	.trace_rv_i_valid_ip(trace_rv_i_valid_ip),
	.trace_rv_i_exception_ip(trace_rv_i_exception_ip),
	.trace_rv_i_ecause_ip(trace_rv_i_ecause_ip),
	.trace_rv_i_interrupt_ip(trace_rv_i_interrupt_ip),
	.trace_rv_i_tval_ip(trace_rv_i_tval_ip),
	.lsu_axi_awvalid(lsu_axi_awvalid),
	.lsu_axi_awready(lsu_axi_awready),
	.lsu_axi_awid(lsu_axi_awid),
	.lsu_axi_awaddr(lsu_axi_awaddr),
	.lsu_axi_awregion(lsu_axi_awregion),
	.lsu_axi_awlen(lsu_axi_awlen),
	.lsu_axi_awsize(lsu_axi_awsize),
	.lsu_axi_awburst(lsu_axi_awburst),
	.lsu_axi_awlock(lsu_axi_awlock),
	.lsu_axi_awcache(lsu_axi_awcache),
	.lsu_axi_awprot(lsu_axi_awprot),
	.lsu_axi_awqos(lsu_axi_awqos),
	.lsu_axi_wvalid(lsu_axi_wvalid),
	.lsu_axi_wready(lsu_axi_wready),
	.lsu_axi_wdata(lsu_axi_wdata),
	.lsu_axi_wstrb(lsu_axi_wstrb),
	.lsu_axi_wlast(lsu_axi_wlast),
	.lsu_axi_bvalid(lsu_axi_bvalid),
	.lsu_axi_bready(lsu_axi_bready),
	.lsu_axi_bresp(lsu_axi_bresp),
	.lsu_axi_bid(lsu_axi_bid),
	.lsu_axi_arvalid(lsu_axi_arvalid),
	.lsu_axi_arready(lsu_axi_arready),
	.lsu_axi_arid(lsu_axi_arid),
	.lsu_axi_araddr(lsu_axi_araddr),
	.lsu_axi_arregion(lsu_axi_arregion),
	.lsu_axi_arlen(lsu_axi_arlen),
	.lsu_axi_arsize(lsu_axi_arsize),
	.lsu_axi_arburst(lsu_axi_arburst),
	.lsu_axi_arlock(lsu_axi_arlock),
	.lsu_axi_arcache(lsu_axi_arcache),
	.lsu_axi_arprot(lsu_axi_arprot),
	.lsu_axi_arqos(lsu_axi_arqos),
	.lsu_axi_rvalid(lsu_axi_rvalid),
	.lsu_axi_rready(lsu_axi_rready),
	.lsu_axi_rid(lsu_axi_rid),
	.lsu_axi_rdata(lsu_axi_rdata),
	.lsu_axi_rresp(lsu_axi_rresp),
	.lsu_axi_rlast(lsu_axi_rlast),
	.ifu_axi_awvalid(ifu_axi_awvalid),
	.ifu_axi_awready(ifu_axi_awready),
	.ifu_axi_awid(ifu_axi_awid),
	.ifu_axi_awaddr(ifu_axi_awaddr),
	.ifu_axi_awregion(ifu_axi_awregion),
	.ifu_axi_awlen(ifu_axi_awlen),
	.ifu_axi_awsize(ifu_axi_awsize),
	.ifu_axi_awburst(ifu_axi_awburst),
	.ifu_axi_awlock(ifu_axi_awlock),
	.ifu_axi_awcache(ifu_axi_awcache),
	.ifu_axi_awprot(ifu_axi_awprot),
	.ifu_axi_awqos(ifu_axi_awqos),
	.ifu_axi_wvalid(ifu_axi_wvalid),
	.ifu_axi_wready(ifu_axi_wready),
	.ifu_axi_wdata(ifu_axi_wdata),
	.ifu_axi_wstrb(ifu_axi_wstrb),
	.ifu_axi_wlast(ifu_axi_wlast),
	.ifu_axi_bvalid(ifu_axi_bvalid),
	.ifu_axi_bready(ifu_axi_bready),
	.ifu_axi_bresp(ifu_axi_bresp),
	.ifu_axi_bid(ifu_axi_bid),
	.ifu_axi_arvalid(ifu_axi_arvalid),
	.ifu_axi_arready(ifu_axi_arready),
	.ifu_axi_arid(ifu_axi_arid),
	.ifu_axi_araddr(ifu_axi_araddr),
	.ifu_axi_arregion(ifu_axi_arregion),
	.ifu_axi_arlen(ifu_axi_arlen),
	.ifu_axi_arsize(ifu_axi_arsize),
	.ifu_axi_arburst(ifu_axi_arburst),
	.ifu_axi_arlock(ifu_axi_arlock),
	.ifu_axi_arcache(ifu_axi_arcache),
	.ifu_axi_arprot(ifu_axi_arprot),
	.ifu_axi_arqos(ifu_axi_arqos),
	.ifu_axi_rvalid(ifu_axi_rvalid),
	.ifu_axi_rready(ifu_axi_rready),
	.ifu_axi_rid(ifu_axi_rid),
	.ifu_axi_rdata(ifu_axi_rdata),
	.ifu_axi_rresp(ifu_axi_rresp),
	.ifu_axi_rlast(ifu_axi_rlast),
	.sb_axi_awvalid(sb_axi_awvalid),
	.sb_axi_awready(sb_axi_awready),
	.sb_axi_awid(sb_axi_awid),
	.sb_axi_awaddr(sb_axi_awaddr),
	.sb_axi_awregion(sb_axi_awregion),
	.sb_axi_awlen(sb_axi_awlen),
	.sb_axi_awsize(sb_axi_awsize),
	.sb_axi_awburst(sb_axi_awburst),
	.sb_axi_awlock(sb_axi_awlock),
	.sb_axi_awcache(sb_axi_awcache),
	.sb_axi_awprot(sb_axi_awprot),
	.sb_axi_awqos(sb_axi_awqos),
	.sb_axi_wvalid(sb_axi_wvalid),
	.sb_axi_wready(sb_axi_wready),
	.sb_axi_wdata(sb_axi_wdata),
	.sb_axi_wstrb(sb_axi_wstrb),
	.sb_axi_wlast(sb_axi_wlast),
	.sb_axi_bvalid(sb_axi_bvalid),
	.sb_axi_bready(sb_axi_bready),
	.sb_axi_bresp(sb_axi_bresp),
	.sb_axi_bid(sb_axi_bid),
	.sb_axi_arvalid(sb_axi_arvalid),
	.sb_axi_arready(sb_axi_arready),
	.sb_axi_arid(sb_axi_arid),
	.sb_axi_araddr(sb_axi_araddr),
	.sb_axi_arregion(sb_axi_arregion),
	.sb_axi_arlen(sb_axi_arlen),
	.sb_axi_arsize(sb_axi_arsize),
	.sb_axi_arburst(sb_axi_arburst),
	.sb_axi_arlock(sb_axi_arlock),
	.sb_axi_arcache(sb_axi_arcache),
	.sb_axi_arprot(sb_axi_arprot),
	.sb_axi_arqos(sb_axi_arqos),
	.sb_axi_rvalid(sb_axi_rvalid),
	.sb_axi_rready(sb_axi_rready),
	.sb_axi_rid(sb_axi_rid),
	.sb_axi_rdata(sb_axi_rdata),
	.sb_axi_rresp(sb_axi_rresp),
	.sb_axi_rlast(sb_axi_rlast),
	.dma_axi_awvalid(dma_axi_awvalid),
	.dma_axi_awready(dma_axi_awready),
	.dma_axi_awid(dma_axi_awid),
	.dma_axi_awaddr(dma_axi_awaddr),
	.dma_axi_awsize(dma_axi_awsize),
	.dma_axi_awprot(dma_axi_awprot),
	.dma_axi_awlen(dma_axi_awlen),
	.dma_axi_awburst(dma_axi_awburst),
	.dma_axi_wvalid(dma_axi_wvalid),
	.dma_axi_wready(dma_axi_wready),
	.dma_axi_wdata(dma_axi_wdata),
	.dma_axi_wstrb(dma_axi_wstrb),
	.dma_axi_wlast(dma_axi_wlast),
	.dma_axi_bvalid(dma_axi_bvalid),
	.dma_axi_bready(dma_axi_bready),
	.dma_axi_bresp(dma_axi_bresp),
	.dma_axi_bid(dma_axi_bid),
	.dma_axi_arvalid(dma_axi_arvalid),
	.dma_axi_arready(dma_axi_arready),
	.dma_axi_arid(dma_axi_arid),
	.dma_axi_araddr(dma_axi_araddr),
	.dma_axi_arsize(dma_axi_arsize),
	.dma_axi_arprot(dma_axi_arprot),
	.dma_axi_arlen(dma_axi_arlen),
	.dma_axi_arburst(dma_axi_arburst),
	.dma_axi_rvalid(dma_axi_rvalid),
	.dma_axi_rready(dma_axi_rready),
	.dma_axi_rid(dma_axi_rid),
	.dma_axi_rdata(dma_axi_rdata),
	.dma_axi_rresp(dma_axi_rresp),
	.dma_axi_rlast(dma_axi_rlast),
	.lsu_bus_clk_en(lsu_bus_clk_en),
	.ifu_bus_clk_en(ifu_bus_clk_en),
	.dbg_bus_clk_en(dbg_bus_clk_en),
	.dma_bus_clk_en(dma_bus_clk_en),
	.timer_int(timer_int),
	.extintsrc_req(extintsrc_req),
	.dec_tlu_perfcnt0(dec_tlu_perfcnt0),
	.dec_tlu_perfcnt1(dec_tlu_perfcnt1),
	.dec_tlu_perfcnt2(dec_tlu_perfcnt2),
	.dec_tlu_perfcnt3(dec_tlu_perfcnt3),
	.dmi_reg_en(dmi_reg_en),
	.dmi_reg_addr(dmi_reg_addr),
	.dmi_reg_wr_en(dmi_reg_wr_en),
	.dmi_reg_wdata(dmi_reg_wdata),
	.dmi_reg_rdata(dmi_reg_rdata),
	.dmi_hard_reset(dmi_hard_reset),
	.mpc_debug_halt_req(mpc_debug_halt_req),
	.mpc_debug_run_req(mpc_debug_run_req),
	.mpc_reset_run_req(mpc_reset_run_req),
	.mpc_debug_halt_ack(mpc_debug_halt_ack),
	.mpc_debug_run_ack(mpc_debug_run_ack),
	.debug_brkpt_status(debug_brkpt_status),
	.i_cpu_halt_req(i_cpu_halt_req),
	.o_cpu_halt_ack(o_cpu_halt_ack),
	.o_cpu_halt_status(o_cpu_halt_status),
	.o_debug_mode_status(o_debug_mode_status),
	.i_cpu_run_req(i_cpu_run_req),
	.o_cpu_run_ack(o_cpu_run_ack),
	.scan_mode(scan_mode),
	.mbist_mode(mbist_mode)
);

// clk
assign rst_l = rstnn;
assign dbg_rst_l = global_rstnn;
assign rst_vec[31:1] = reset_vector[31:1];
assign nmi_int = 0;
assign nmi_vec = 0;

// trace_rv_i_insn_ip
// trace_rv_i_address_ip
// trace_rv_i_valid_ip
// trace_rv_i_exception_ip
// trace_rv_i_ecause_ip
// trace_rv_i_interrupt_ip
// trace_rv_i_tval_ip

/* lsu */

assign lsu_sx4awvalid = lsu_axi_awvalid;
assign lsu_axi_awready = lsu_sx4awready;
assign lsu_sx4awid = lsu_axi_awid;
assign lsu_sx4awaddr = lsu_axi_awaddr;
// lsu_axi_awregion;
assign lsu_sx4awlen = lsu_axi_awlen;
assign lsu_sx4awsize = lsu_axi_awsize;
assign lsu_sx4awburst = lsu_axi_awburst;
// lsu_axi_awlock;
// lsu_axi_awcache;
// lsu_axi_awprot;
// lsu_axi_awqos;

assign lsu_sx4wvalid = lsu_axi_wvalid;
assign lsu_axi_wready = lsu_sx4wready;
assign lsu_sx4wdata = lsu_axi_wdata;
assign lsu_sx4wstrb = lsu_axi_wstrb;
assign lsu_sx4wlast = lsu_axi_wlast;

assign lsu_axi_bvalid = lsu_sx4bvalid;
assign lsu_sx4bready = lsu_axi_bready;
assign lsu_axi_bresp = lsu_sx4bresp;
assign lsu_axi_bid = lsu_sx4bid;

assign lsu_sx4arvalid = lsu_axi_arvalid;
assign lsu_axi_arready = lsu_sx4arready;
assign lsu_sx4arid = lsu_axi_arid;
assign lsu_sx4araddr = lsu_axi_araddr;
// lsu_axi_arregion;
assign lsu_sx4arlen = lsu_axi_arlen;
assign lsu_sx4arsize = lsu_axi_arsize;
assign lsu_sx4arburst = lsu_axi_arburst;
// lsu_axi_arlock;
// lsu_axi_arcache;
// lsu_axi_arprot;
// lsu_axi_arqos;

assign lsu_axi_rvalid = lsu_sx4rvalid;
assign lsu_sx4rready = lsu_axi_rready;
assign lsu_axi_rid = lsu_sx4rid;
assign lsu_axi_rdata = lsu_sx4rdata;
assign lsu_axi_rresp = lsu_sx4rresp;
assign lsu_axi_rlast = lsu_sx4rlast;

/* ifu */

assign ifu_sx4awvalid = ifu_axi_awvalid;
assign ifu_axi_awready = ifu_sx4awready;
assign ifu_sx4awid = ifu_axi_awid;
assign ifu_sx4awaddr = ifu_axi_awaddr;
// ifu_axi_awregion;
assign ifu_sx4awlen = ifu_axi_awlen;
assign ifu_sx4awsize = ifu_axi_awsize;
assign ifu_sx4awburst = ifu_axi_awburst;
// ifu_axi_awlock;
// ifu_axi_awcache;
// ifu_axi_awprot;
// ifu_axi_awqos;

assign ifu_sx4wvalid = ifu_axi_wvalid;
assign ifu_axi_wready = ifu_sx4wready;
assign ifu_sx4wdata = ifu_axi_wdata;
assign ifu_sx4wstrb = ifu_axi_wstrb;
assign ifu_sx4wlast = ifu_axi_wlast;

assign ifu_axi_bvalid = ifu_sx4bvalid;
assign ifu_sx4bready = ifu_axi_bready;
assign ifu_axi_bresp = ifu_sx4bresp;
assign ifu_axi_bid = ifu_sx4bid;

assign ifu_sx4arvalid = ifu_axi_arvalid;
assign ifu_axi_arready = ifu_sx4arready;
assign ifu_sx4arid = ifu_axi_arid;
assign ifu_sx4araddr = ifu_axi_araddr;
// ifu_axi_arregion;
assign ifu_sx4arlen = ifu_axi_arlen;
assign ifu_sx4arsize = ifu_axi_arsize;
assign ifu_sx4arburst = ifu_axi_arburst;
// ifu_axi_arlock;
// ifu_axi_arcache;
// ifu_axi_arprot;
// ifu_axi_arqos;

assign ifu_axi_rvalid = ifu_sx4rvalid;
assign ifu_sx4rready = ifu_axi_rready;
assign ifu_axi_rid = ifu_sx4rid;
assign ifu_axi_rdata = ifu_sx4rdata;
assign ifu_axi_rresp = ifu_sx4rresp;
assign ifu_axi_rlast = ifu_sx4rlast;

/* sb */
assign sb_sx4awvalid = sb_axi_awvalid;
assign sb_axi_awready = sb_sx4awready;
assign sb_sx4awid = sb_axi_awid;
assign sb_sx4awaddr = sb_axi_awaddr;
// sb_axi_awregion;
assign sb_sx4awlen = sb_axi_awlen;
assign sb_sx4awsize = sb_axi_awsize;
assign sb_sx4awburst = sb_axi_awburst;
// sb_axi_awlock;
// sb_axi_awcache;
// sb_axi_awprot;
// sb_axi_awqos;

assign sb_sx4wvalid = sb_axi_wvalid;
assign sb_axi_wready = sb_sx4wready;
assign sb_sx4wdata = sb_axi_wdata;
assign sb_sx4wstrb = sb_axi_wstrb;
assign sb_sx4wlast = sb_axi_wlast;

assign sb_axi_bvalid = sb_sx4bvalid;
assign sb_sx4bready = sb_axi_bready;
assign sb_axi_bresp = sb_sx4bresp;
assign sb_axi_bid = sb_sx4bid;

assign sb_sx4arvalid = sb_axi_arvalid;
assign sb_axi_arready = sb_sx4arready;
assign sb_sx4arid = sb_axi_arid;
assign sb_sx4araddr = sb_axi_araddr;
// sb_axi_arregion;
assign sb_sx4arlen = sb_axi_arlen;
assign sb_sx4arsize = sb_axi_arsize;
assign sb_sx4arburst = sb_axi_arburst;
// sb_axi_arlock;
// sb_axi_arcache;
// sb_axi_arprot;
// sb_axi_arqos;

assign sb_axi_rvalid = sb_sx4rvalid;
assign sb_sx4rready = sb_axi_rready;
assign sb_axi_rid = sb_sx4rid;
assign sb_axi_rdata = sb_sx4rdata;
assign sb_axi_rresp = sb_sx4rresp;
assign sb_axi_rlast = sb_sx4rlast;

// dma
assign dma_axi_awvalid = 0;
assign dma_axi_awid = 0;
assign dma_axi_awaddr = 0;
//assign dma_axi_awregion = 0;
assign dma_axi_awlen = 0;
assign dma_axi_awsize = 0;
assign dma_axi_awburst = 0;
// assign dma_axi_awlock = 0;
// assign dma_axi_awcache = 0;
assign dma_axi_awprot = 0;
// assign dma_axi_awqos = 0;

assign dma_axi_wvalid = 0;
assign dma_axi_wdata = 0;
assign dma_axi_wstrb = 0;
assign dma_axi_wlast = 0;

assign dma_axi_bready = 0;

assign dma_axi_arvalid = 0;
assign dma_axi_arid = 0;
assign dma_axi_araddr = 0;
//assign dma_axi_arregion = 0;
assign dma_axi_arlen = 0;
assign dma_axi_arsize = 0;
assign dma_axi_arburst = 0;
// assign dma_axi_arlock = 0;
//assign dma_axi_arcache = 0;
assign dma_axi_arprot = 0;
// assign dma_axi_arqos = 0;

assign dma_axi_rready = 0;

//
assign lsu_bus_clk_en = 1;
assign ifu_bus_clk_en = 1;
assign dbg_bus_clk_en = 1;
assign dma_bus_clk_en = 1;

assign timer_int = 0;
assign extintsrc_req = 0;

// dec_tlu_perfcnt0
// dec_tlu_perfcnt1
// dec_tlu_perfcnt2
// dec_tlu_perfcnt3

assign dmi_reg_en = 0;
assign dmi_reg_addr = 0;
assign dmi_reg_wr_en = 0;
assign dmi_reg_wdata = 0;
// dmi_reg_rdata
assign dmi_hard_reset = 0;

assign mpc_debug_halt_req = 0;
assign mpc_debug_run_req = 0;
assign mpc_reset_run_req = 1;
// mpc_debug_halt_ack
// mpc_debug_run_ack
// debug_brkpt_status

assign i_cpu_halt_req = 0;
// o_cpu_halt_ack
// o_cpu_halt_status
// o_debug_mode_status
assign i_cpu_run_req = 0;
// o_cpu_run_ack

assign scan_mode = 0;
assign mbist_mode = 0;

always @(posedge clk or negedge rstnn)
begin 
	if(~rstnn)
	begin
		spc   <= 0;
		sinst <= 0;
	end
	else if(trace_rv_i_valid_ip[0]==1)
	begin
		spc   <= trace_rv_i_address_ip[(0+1)*32-1 -:32];
		sinst <= trace_rv_i_insn_ip[(0+1)*32-1 -:32];
	end
	else if(trace_rv_i_valid_ip[1]==1)
	begin
		spc   <= trace_rv_i_address_ip[(1+1)*32-1 -:32];
		sinst <= trace_rv_i_insn_ip[(1+1)*32-1 -:32];
	end
end

endmodule
