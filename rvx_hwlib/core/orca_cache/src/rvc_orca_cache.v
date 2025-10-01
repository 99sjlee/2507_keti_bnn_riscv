// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE 
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS 
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE 
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL 
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE, 
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE 
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2019-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "platform_info.vh"

module RVC_ORCA_CACHE
(
	clk,
	rstnn,

	inst_sxrready,
	inst_sxrvalid,
	inst_sxrlast,
	inst_sxrresp,
	inst_sxrdata,
	inst_sxrid,
	inst_sxarready,
	inst_sxarvalid,
	inst_sxarburst,
	inst_sxarsize,
	inst_sxarlen,
	inst_sxaraddr,
	inst_sxarid,
	inst_sxbready,
	inst_sxbvalid,
	inst_sxbresp,
	inst_sxbid,
	inst_sxwready,
	inst_sxwvalid,
	inst_sxwlast,
	inst_sxwstrb,
	inst_sxwdata,
	inst_sxwid,
	inst_sxawready,
	inst_sxawvalid,
	inst_sxawburst,
	inst_sxawsize,
	inst_sxawlen,
	inst_sxawaddr,
	inst_sxawid,

	data_uc_sxrready,
	data_uc_sxrvalid,
	data_uc_sxrlast,
	data_uc_sxrresp,
	data_uc_sxrdata,
	data_uc_sxrid,
	data_uc_sxarready,
	data_uc_sxarvalid,
	data_uc_sxarburst,
	data_uc_sxarsize,
	data_uc_sxarlen,
	data_uc_sxaraddr,
	data_uc_sxarid,
	data_uc_sxbready,
	data_uc_sxbvalid,
	data_uc_sxbresp,
	data_uc_sxbid,
	data_uc_sxwready,
	data_uc_sxwvalid,
	data_uc_sxwlast,
	data_uc_sxwstrb,
	data_uc_sxwdata,
	data_uc_sxwid,
	data_uc_sxawready,
	data_uc_sxawvalid,
	data_uc_sxawburst,
	data_uc_sxawsize,
	data_uc_sxawlen,
	data_uc_sxawaddr,
	data_uc_sxawid,

	data_c_sxrready,
	data_c_sxrvalid,
	data_c_sxrlast,
	data_c_sxrresp,
	data_c_sxrdata,
	data_c_sxrid,
	data_c_sxarready,
	data_c_sxarvalid,
	data_c_sxarburst,
	data_c_sxarsize,
	data_c_sxarlen,
	data_c_sxaraddr,
	data_c_sxarid,
	data_c_sxbready,
	data_c_sxbvalid,
	data_c_sxbresp,
	data_c_sxbid,
	data_c_sxwready,
	data_c_sxwvalid,
	data_c_sxwlast,
	data_c_sxwstrb,
	data_c_sxwdata,
	data_c_sxwid,
	data_c_sxawready,
	data_c_sxawvalid,
	data_c_sxawburst,
	data_c_sxawsize,
	data_c_sxawlen,
	data_c_sxawaddr,
	data_c_sxawid,

	interrupt_vector,
	interrupt_out,

	spc,
	sinst
);

////////////////////////////
/* parameter input output */
////////////////////////////

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RESET_VECTOR = 32'h 0;
parameter ENABLE_EXCEPTIONS = 1;
parameter ENABLE_INTERRUPTS = 1;
parameter NUM_INTERRUPTS = 1;
parameter NUM_CACHED_REGION = 4;

localparam REGISTER_SIZE = 32;
localparam BW_ADDRESS = 32;

parameter ICACHE_SIZE            = 4096; // in bytes
parameter ICACHE_LINE_SIZE       = 16; // in bytes
parameter ICACHE_EXTERNAL_WIDTH  = 32;

parameter DCACHE_SIZE            = 4096; // in bytes
parameter DCACHE_LINE_SIZE       = 16; // in bytes
parameter DCACHE_EXTERNAL_WIDTH  = 32;
parameter DCACHE_WRITEBACK       = 1;

localparam I_NUM_LINES           = ICACHE_SIZE/ICACHE_LINE_SIZE;
localparam I_CACHEWORDS_PER_LINE = ICACHE_LINE_SIZE/(ICACHE_EXTERNAL_WIDTH/8);
localparam I_CACHEWORD_BITS      = LOG2RU_MIN1(I_NUM_LINES) + LOG2RU_MIN1(I_CACHEWORDS_PER_LINE);
localparam I_TAG_BITS            = BW_ADDRESS-LOG2RU_MIN1(ICACHE_SIZE);
localparam BW_ITAG_CELL          = I_TAG_BITS + 1;

localparam D_NUM_LINES           = DCACHE_SIZE/DCACHE_LINE_SIZE;
localparam D_DIRTY_BITS          = (DCACHE_WRITEBACK==1)? 1: 0;
localparam D_CACHEWORDS_PER_LINE = DCACHE_LINE_SIZE/(DCACHE_EXTERNAL_WIDTH/8);
localparam D_CACHEWORD_BITS      = LOG2RU_MIN1(D_NUM_LINES) + LOG2RU_MIN1(D_CACHEWORDS_PER_LINE);
localparam D_TAG_BITS            = BW_ADDRESS-LOG2RU_MIN1(DCACHE_SIZE);
localparam BW_DTAG_CELL          = D_TAG_BITS + 1 + D_DIRTY_BITS;

input wire clk;
input wire rstnn;

output	wire		inst_sxrready;
input	wire		inst_sxrvalid;
input	wire		inst_sxrlast;
input	wire	[`BW_AXI_RRESP-1:0]	inst_sxrresp;
input	wire	[31:0]	inst_sxrdata;
input	wire	[3:0]	inst_sxrid;
input	wire		inst_sxarready;
output	wire		inst_sxarvalid;
output	wire	[`BW_AXI_ABURST-1:0]	inst_sxarburst;
output	wire	[`BW_AXI_ASIZE-1:0]	inst_sxarsize;
output	wire	[`BW_AXI_ALEN-1:0]	inst_sxarlen;
output	wire	[31:0]	inst_sxaraddr;
output	wire	[3:0]	inst_sxarid;
output	wire		inst_sxbready;
input	wire		inst_sxbvalid;
input	wire	[`BW_AXI_BRESP-1:0]	inst_sxbresp;
input	wire	[3:0]	inst_sxbid;
input	wire		inst_sxwready;
output	wire		inst_sxwvalid;
output	wire		inst_sxwlast;
output	wire	[`BW_AXI_WSTRB(32)-1:0]	inst_sxwstrb;
output	wire	[31:0]	inst_sxwdata;
output	wire	[3:0]	inst_sxwid;
input	wire		inst_sxawready;
output	wire		inst_sxawvalid;
output	wire	[`BW_AXI_ABURST-1:0]	inst_sxawburst;
output	wire	[`BW_AXI_ASIZE-1:0]	inst_sxawsize;
output	wire	[`BW_AXI_ALEN-1:0]	inst_sxawlen;
output	wire	[31:0]	inst_sxawaddr;
output	wire	[3:0]	inst_sxawid;

output	wire		data_uc_sxrready;
input	wire		data_uc_sxrvalid;
input	wire		data_uc_sxrlast;
input	wire	[`BW_AXI_RRESP-1:0]	data_uc_sxrresp;
input	wire	[31:0]	data_uc_sxrdata;
input	wire	[3:0]	data_uc_sxrid;
input	wire		data_uc_sxarready;
output	wire		data_uc_sxarvalid;
output	wire	[`BW_AXI_ABURST-1:0]	data_uc_sxarburst;
output	wire	[`BW_AXI_ASIZE-1:0]	data_uc_sxarsize;
output	wire	[`BW_AXI_ALEN-1:0]	data_uc_sxarlen;
output	wire	[31:0]	data_uc_sxaraddr;
output	wire	[3:0]	data_uc_sxarid;
output	wire		data_uc_sxbready;
input	wire		data_uc_sxbvalid;
input	wire	[`BW_AXI_BRESP-1:0]	data_uc_sxbresp;
input	wire	[3:0]	data_uc_sxbid;
input	wire		data_uc_sxwready;
output	wire		data_uc_sxwvalid;
output	wire		data_uc_sxwlast;
output	wire	[`BW_AXI_WSTRB(32)-1:0]	data_uc_sxwstrb;
output	wire	[31:0]	data_uc_sxwdata;
output	wire	[3:0]	data_uc_sxwid;
input	wire		data_uc_sxawready;
output	wire		data_uc_sxawvalid;
output	wire	[`BW_AXI_ABURST-1:0]	data_uc_sxawburst;
output	wire	[`BW_AXI_ASIZE-1:0]	data_uc_sxawsize;
output	wire	[`BW_AXI_ALEN-1:0]	data_uc_sxawlen;
output	wire	[31:0]	data_uc_sxawaddr;
output	wire	[3:0]	data_uc_sxawid;

output	wire		data_c_sxrready;
input	wire		data_c_sxrvalid;
input	wire		data_c_sxrlast;
input	wire	[`BW_AXI_RRESP-1:0]	data_c_sxrresp;
input	wire	[DCACHE_EXTERNAL_WIDTH-1:0]	data_c_sxrdata;
input	wire	[3:0]	data_c_sxrid;
input	wire		data_c_sxarready;
output	wire		data_c_sxarvalid;
output	wire	[`BW_AXI_ABURST-1:0]	data_c_sxarburst;
output	wire	[`BW_AXI_ASIZE-1:0]	data_c_sxarsize;
output	wire	[`BW_AXI_ALEN-1:0]	data_c_sxarlen;
output	wire	[31:0]	data_c_sxaraddr;
output	wire	[3:0]	data_c_sxarid;
output	wire		data_c_sxbready;
input	wire		data_c_sxbvalid;
input	wire	[`BW_AXI_BRESP-1:0]	data_c_sxbresp;
input	wire	[3:0]	data_c_sxbid;
input	wire		data_c_sxwready;
output	wire		data_c_sxwvalid;
output	wire		data_c_sxwlast;
output	wire	[`BW_AXI_WSTRB(DCACHE_EXTERNAL_WIDTH)-1:0]	data_c_sxwstrb;
output	wire	[DCACHE_EXTERNAL_WIDTH-1:0]	data_c_sxwdata;
output	wire	[3:0]	data_c_sxwid;
input	wire		data_c_sxawready;
output	wire		data_c_sxawvalid;
output	wire	[`BW_AXI_ABURST-1:0]	data_c_sxawburst;
output	wire	[`BW_AXI_ASIZE-1:0]	data_c_sxawsize;
output	wire	[`BW_AXI_ALEN-1:0]	data_c_sxawlen;
output	wire	[31:0]	data_c_sxawaddr;
output	wire	[3:0]	data_c_sxawid;

input wire [NUM_INTERRUPTS-1:0] interrupt_vector;
output wire interrupt_out;

output wire [32-1:0] spc;
output wire [32-1:0] sinst;

/////////////
/* signals */
/////////////

wire inst_uc_sxrready;
wire inst_uc_sxrvalid;
wire inst_uc_sxrlast;
wire [`BW_AXI_RRESP-1:0] inst_uc_sxrresp;
wire [31:0] inst_uc_sxrdata;
wire [3:0] inst_uc_sxrid;
wire inst_uc_sxarready;
wire inst_uc_sxarvalid;
wire [`BW_AXI_ABURST-1:0] inst_uc_sxarburst;
wire [`BW_AXI_ASIZE-1:0] inst_uc_sxarsize;
wire [`BW_AXI_ALEN-1:0] inst_uc_sxarlen;
wire [31:0] inst_uc_sxaraddr;
wire [3:0] inst_uc_sxarid;
wire inst_uc_sxbready;
wire inst_uc_sxbvalid;
wire [`BW_AXI_BRESP-1:0] inst_uc_sxbresp;
wire [3:0] inst_uc_sxbid;
wire inst_uc_sxwready;
wire inst_uc_sxwvalid;
wire inst_uc_sxwlast;
wire [`BW_AXI_WSTRB(32)-1:0] inst_uc_sxwstrb;
wire [31:0] inst_uc_sxwdata;
wire [3:0] inst_uc_sxwid;
wire inst_uc_sxawready;
wire inst_uc_sxawvalid;
wire [`BW_AXI_ABURST-1:0] inst_uc_sxawburst;
wire [`BW_AXI_ASIZE-1:0] inst_uc_sxawsize;
wire [`BW_AXI_ALEN-1:0] inst_uc_sxawlen;
wire [31:0] inst_uc_sxawaddr;
wire [3:0] inst_uc_sxawid;

wire inst_c_sxrready;
wire inst_c_sxrvalid;
wire inst_c_sxrlast;
wire [`BW_AXI_RRESP-1:0] inst_c_sxrresp;
wire [ICACHE_EXTERNAL_WIDTH-1:0] inst_c_sxrdata;
wire [3:0] inst_c_sxrid;
wire inst_c_sxarready;
wire inst_c_sxarvalid;
wire [`BW_AXI_ABURST-1:0] inst_c_sxarburst;
wire [`BW_AXI_ASIZE-1:0] inst_c_sxarsize;
wire [`BW_AXI_ALEN-1:0] inst_c_sxarlen;
wire [31:0] inst_c_sxaraddr;
wire [3:0] inst_c_sxarid;
wire inst_c_sxbready;
wire inst_c_sxbvalid;
wire [`BW_AXI_BRESP-1:0] inst_c_sxbresp;
wire [3:0] inst_c_sxbid;
wire inst_c_sxwready;
wire inst_c_sxwvalid;
wire inst_c_sxwlast;
wire [`BW_AXI_WSTRB(ICACHE_EXTERNAL_WIDTH)-1:0] inst_c_sxwstrb;
wire [ICACHE_EXTERNAL_WIDTH-1:0] inst_c_sxwdata;
wire [3:0] inst_c_sxwid;
wire inst_c_sxawready;
wire inst_c_sxawvalid;
wire [`BW_AXI_ABURST-1:0] inst_c_sxawburst;
wire [`BW_AXI_ASIZE-1:0] inst_c_sxawsize;
wire [`BW_AXI_ALEN-1:0] inst_c_sxawlen;
wire [31:0] inst_c_sxawaddr;
wire [3:0] inst_c_sxawid;

`define INST_UC 0
`define INST_CC 1
reg inst_request_select;
wire inst_response_select;

wire inst_response_buffer_wfull;
wire inst_response_buffer_wrequest;
wire inst_response_buffer_wdata;

wire inst_response_buffer_rrequest;
wire inst_response_buffer_rdata;

wire [LOG2RU_MIN1(I_NUM_LINES)-1:0] icache_tag_raddr;
wire [BW_ITAG_CELL-1:0] icache_tag_rdata;
wire [LOG2RU_MIN1(I_NUM_LINES)-1:0] icache_tag_waddr;
wire icache_tag_wenable;
wire [BW_ITAG_CELL-1:0] icache_tag_wdata;

wire [I_CACHEWORD_BITS-1:0] icache_data_raddr;
wire [ICACHE_EXTERNAL_WIDTH-1:0] icache_data_rdata;
wire [I_CACHEWORD_BITS-1:0] icache_data_waddr;
wire [(ICACHE_EXTERNAL_WIDTH/8)-1:0] icache_data_wbe;
wire [ICACHE_EXTERNAL_WIDTH-1:0] icache_data_wdata;
wire icache_data_wenable;

wire [LOG2RU_MIN1(D_NUM_LINES)-1:0] dcache_tag_raddr;
wire [BW_DTAG_CELL-1:0] dcache_tag_rdata;
wire [LOG2RU_MIN1(D_NUM_LINES)-1:0] dcache_tag_waddr;
wire dcache_tag_wenable;
wire [BW_DTAG_CELL-1:0] dcache_tag_wdata;

wire [D_CACHEWORD_BITS-1:0] dcache_data_raddr;
wire [DCACHE_EXTERNAL_WIDTH-1:0] dcache_data_rdata;
wire [D_CACHEWORD_BITS-1:0] dcache_data_waddr;
wire [(DCACHE_EXTERNAL_WIDTH/8)-1:0] dcache_data_wbe;
wire [DCACHE_EXTERNAL_WIDTH-1:0] dcache_data_wdata;
wire dcache_data_wenable;

wire [LOG2RU_MIN1(D_CACHEWORDS_PER_LINE)-1:0] spill_raddr;
wire [DCACHE_EXTERNAL_WIDTH-1:0] spill_rdata;
wire [LOG2RU_MIN1(D_CACHEWORDS_PER_LINE)-1:0] spill_waddr;
wire spill_wenable;
wire [DCACHE_EXTERNAL_WIDTH-1:0] spill_wdata;

wire [NUM_INTERRUPTS-1:0] interrupts_extended;

wire executed;
wire [32-1:0] executed_pc;
wire [32-1:0] executed_inst;

////////////
/* logics */
////////////

assign icache_data_wenable = (icache_data_wbe==0)? 0: 1;
assign dcache_data_wenable = (dcache_data_wbe==0)? 0: 1;

orca
#(
	.PIPELINE_STAGES(5),
	.REGISTER_SIZE(REGISTER_SIZE),
	.MULTIPLY_ENABLE(1),
	.DIVIDE_ENABLE(1),
	.RESET_VECTOR(RESET_VECTOR),
	.ENABLE_EXCEPTIONS(ENABLE_EXCEPTIONS),
	.ENABLE_EXT_INTERRUPTS(ENABLE_INTERRUPTS),
	.NUM_INTERRUPTS(NUM_INTERRUPTS),
	.AXI_ID_WIDTH(4),
	.LOG2_BURSTLENGTH(`BW_AXI_ALEN),
	.UC_MEMORY_REGIONS(NUM_CACHED_REGION),
	.ICACHE_SIZE(ICACHE_SIZE),
	.ICACHE_LINE_SIZE(ICACHE_LINE_SIZE),
	.ICACHE_EXTERNAL_WIDTH(ICACHE_EXTERNAL_WIDTH),
	.DCACHE_SIZE(DCACHE_SIZE),
	.DCACHE_LINE_SIZE(DCACHE_LINE_SIZE),
	.DCACHE_EXTERNAL_WIDTH(DCACHE_EXTERNAL_WIDTH),
	.DCACHE_WRITEBACK(DCACHE_WRITEBACK)
)
i_orca
(
	.clk(clk),
	.reset(~rstnn),
	.avm_data_address(),
	.avm_data_byteenable(),
	.avm_data_read(),
	.avm_data_readdata(),
	.avm_data_write(),
	.avm_data_writedata(),
	.avm_data_waitrequest(),
	.avm_data_readdatavalid(),
	.avm_instruction_address(),
	.avm_instruction_read(),
	.avm_instruction_readdata(),
	.avm_instruction_waitrequest(),
	.avm_instruction_readdatavalid(),
	.data_ADR_O(),
	.data_DAT_I(),
	.data_DAT_O(),
	.data_WE_O(),
	.data_SEL_O(),
	.data_STB_O(),
	.data_ACK_I(),
	.data_CYC_O(),
	.data_CTI_O(),
	.data_STALL_I(),
	.instr_ADR_O(),
	.instr_DAT_I(),
	.instr_STB_O(),
	.instr_ACK_I(),
	.instr_CYC_O(),
	.instr_CTI_O(),
	.instr_STALL_I(),

	.IUC_ARID(inst_uc_sxarid),
	.IUC_ARADDR(inst_uc_sxaraddr),
	.IUC_ARLEN(inst_uc_sxarlen),
	.IUC_ARSIZE(inst_uc_sxarsize),
	.IUC_ARBURST(inst_uc_sxarburst),
	.IUC_ARLOCK(),
	.IUC_ARCACHE(),
	.IUC_ARPROT(),
	.IUC_ARVALID(inst_uc_sxarvalid),
	.IUC_ARREADY(inst_uc_sxarready),

	.IUC_RID(inst_uc_sxrid),
	.IUC_RDATA(inst_uc_sxrdata),
	.IUC_RRESP(inst_uc_sxrresp),
	.IUC_RLAST(inst_uc_sxrlast),
	.IUC_RVALID(inst_uc_sxrvalid),
	.IUC_RREADY(inst_uc_sxrready),

	.IUC_AWID(inst_uc_sxawid),
	.IUC_AWADDR(inst_uc_sxawaddr),
	.IUC_AWLEN(inst_uc_sxawlen),
	.IUC_AWSIZE(inst_uc_sxawsize),
	.IUC_AWBURST(inst_uc_sxawburst),
	.IUC_AWLOCK(),
	.IUC_AWCACHE(),
	.IUC_AWPROT(),
	.IUC_AWVALID(inst_uc_sxawvalid),
	.IUC_AWREADY(inst_uc_sxawready),

	.IUC_WID(inst_uc_sxwid),
	.IUC_WDATA(inst_uc_sxwdata),
	.IUC_WSTRB(inst_uc_sxwstrb),
	.IUC_WLAST(inst_uc_sxwlast),
	.IUC_WVALID(inst_uc_sxwvalid),
	.IUC_WREADY(inst_uc_sxwready),
	.IUC_BID(inst_uc_sxbid),
	.IUC_BRESP(inst_uc_sxbresp),
	.IUC_BVALID(inst_uc_sxbvalid),
	.IUC_BREADY(inst_uc_sxbready),

	.DUC_AWID(data_uc_sxawid),
	.DUC_AWADDR(data_uc_sxawaddr),
	.DUC_AWLEN(data_uc_sxawlen),
	.DUC_AWSIZE(data_uc_sxawsize),
	.DUC_AWBURST(data_uc_sxawburst),
	.DUC_AWLOCK(),
	.DUC_AWCACHE(),
	.DUC_AWPROT(),
	.DUC_AWVALID(data_uc_sxawvalid),
	.DUC_AWREADY(data_uc_sxawready),

	.DUC_WID(data_uc_sxwid),
	.DUC_WDATA(data_uc_sxwdata),
	.DUC_WSTRB(data_uc_sxwstrb),
	.DUC_WLAST(data_uc_sxwlast),
	.DUC_WVALID(data_uc_sxwvalid),
	.DUC_WREADY(data_uc_sxwready),

	.DUC_BID(data_uc_sxbid),
	.DUC_BRESP(data_uc_sxbresp),
	.DUC_BVALID(data_uc_sxbvalid),
	.DUC_BREADY(data_uc_sxbready),

	.DUC_ARID(data_uc_sxarid),
	.DUC_ARADDR(data_uc_sxaraddr),
	.DUC_ARLEN(data_uc_sxarlen),
	.DUC_ARSIZE(data_uc_sxarsize),
	.DUC_ARBURST(data_uc_sxarburst),
	.DUC_ARLOCK(),
	.DUC_ARCACHE(),
	.DUC_ARPROT(),
	.DUC_ARVALID(data_uc_sxarvalid),
	.DUC_ARREADY(data_uc_sxarready),

	.DUC_RID(data_uc_sxrid),
	.DUC_RDATA(data_uc_sxrdata),
	.DUC_RRESP(data_uc_sxrresp),
	.DUC_RLAST(data_uc_sxrlast),
	.DUC_RVALID(data_uc_sxrvalid),
	.DUC_RREADY(data_uc_sxrready),

	.IC_ARID(inst_c_sxarid),
	.IC_ARADDR(inst_c_sxaraddr),
	.IC_ARLEN(inst_c_sxarlen),
	.IC_ARSIZE(inst_c_sxarsize),
	.IC_ARBURST(inst_c_sxarburst),
	.IC_ARLOCK(),
	.IC_ARCACHE(),
	.IC_ARPROT(),
	.IC_ARVALID(inst_c_sxarvalid),
	.IC_ARREADY(inst_c_sxarready),

	.IC_RID(inst_c_sxrid),
	.IC_RDATA(inst_c_sxrdata),
	.IC_RRESP(inst_c_sxrresp),
	.IC_RLAST(inst_c_sxrlast),
	.IC_RVALID(inst_c_sxrvalid),
	.IC_RREADY(inst_c_sxrready),

	.IC_AWID(inst_c_sxawid),
	.IC_AWADDR(inst_c_sxawaddr),
	.IC_AWLEN(inst_c_sxawlen),
	.IC_AWSIZE(inst_c_sxawsize),
	.IC_AWBURST(inst_c_sxawburst),
	.IC_AWLOCK(),
	.IC_AWCACHE(),
	.IC_AWPROT(),
	.IC_AWVALID(inst_c_sxawvalid),
	.IC_AWREADY(inst_c_sxawready),

	.IC_WID(inst_c_sxwid),
	.IC_WDATA(inst_c_sxwdata),
	.IC_WSTRB(inst_c_sxwstrb),
	.IC_WLAST(inst_c_sxwlast),
	.IC_WVALID(inst_c_sxwvalid),
	.IC_WREADY(inst_c_sxwready),
	.IC_BID(inst_c_sxbid),
	.IC_BRESP(inst_c_sxbresp),
	.IC_BVALID(inst_c_sxbvalid),
	.IC_BREADY(inst_c_sxbready),

	.DC_AWID(data_c_sxawid),
	.DC_AWADDR(data_c_sxawaddr),
	.DC_AWLEN(data_c_sxawlen),
	.DC_AWSIZE(data_c_sxawsize),
	.DC_AWBURST(data_c_sxawburst),
	.DC_AWLOCK(),
	.DC_AWCACHE(),
	.DC_AWPROT(),
	.DC_AWVALID(data_c_sxawvalid),
	.DC_AWREADY(data_c_sxawready),

	.DC_WID(data_c_sxwid),
	.DC_WDATA(data_c_sxwdata),
	.DC_WSTRB(data_c_sxwstrb),
	.DC_WLAST(data_c_sxwlast),
	.DC_WVALID(data_c_sxwvalid),
	.DC_WREADY(data_c_sxwready),

	.DC_BID(data_c_sxbid),
	.DC_BRESP(data_c_sxbresp),
	.DC_BVALID(data_c_sxbvalid),
	.DC_BREADY(data_c_sxbready),

	.DC_ARID(data_c_sxarid),
	.DC_ARADDR(data_c_sxaraddr),
	.DC_ARLEN(data_c_sxarlen),
	.DC_ARSIZE(data_c_sxarsize),
	.DC_ARBURST(data_c_sxarburst),
	.DC_ARLOCK(),
	.DC_ARCACHE(),
	.DC_ARPROT(),
	.DC_ARVALID(data_c_sxarvalid),
	.DC_ARREADY(data_c_sxarready),

	.DC_RID(data_c_sxrid),
	.DC_RDATA(data_c_sxrdata),
	.DC_RRESP(data_c_sxrresp),
	.DC_RLAST(data_c_sxrlast),
	.DC_RVALID(data_c_sxrvalid),
	.DC_RREADY(data_c_sxrready),

	.ILMB_Addr(),
	.ILMB_Byte_Enable(),
	.ILMB_Data_Write(),
	.ILMB_AS(),
	.ILMB_Read_Strobe(),
	.ILMB_Write_Strobe(),
	.ILMB_Data_Read(32'h 0),
	.ILMB_Ready(1'b 0),
	.ILMB_Wait(1'b 0),
	.ILMB_CE(1'b 0),
	.ILMB_UE(1'b 0),

	.DLMB_Addr(),
	.DLMB_Byte_Enable(),
	.DLMB_Data_Write(),
	.DLMB_AS(),
	.DLMB_Read_Strobe(),
	.DLMB_Write_Strobe(),
	.DLMB_Data_Read(32'h 0),
	.DLMB_Ready(1'b 0),
	.DLMB_Wait(1'b 0),
	.DLMB_CE(1'b 0),
	.DLMB_UE(1'b 0),

	.timer_value(64'h 0),
	.timer_interrupt(1'b 0),

	.vcp_data0(),
	.vcp_data1(),
	.vcp_data2(),
	.vcp_instruction(),
	.vcp_valid_instr(),
	.vcp_ready(1'b 0),
	.vcp_illegal(1'b 0),
	.vcp_writeback_data(32'h 0),
	.vcp_writeback_en(1'b 0),
	.vcp_alu_data1(32'h 0),
	.vcp_alu_data2(32'h 0),
	.vcp_alu_source_valid(1'b 0),
	.vcp_alu_result(),
	.vcp_alu_result_valid(),

	.icache_tag_raddr(icache_tag_raddr),
	.icache_tag_rdata(icache_tag_rdata),
	.icache_tag_waddr(icache_tag_waddr),
	.icache_tag_wenable(icache_tag_wenable),
	.icache_tag_wdata(icache_tag_wdata),

	.icache_data_raddr(icache_data_raddr),
	.icache_data_rdata(icache_data_rdata),
	.icache_data_waddr(icache_data_waddr),
	.icache_data_wbe(icache_data_wbe),
	.icache_data_wdata(icache_data_wdata),

	.dcache_tag_raddr(dcache_tag_raddr),
	.dcache_tag_rdata(dcache_tag_rdata),
	.dcache_tag_waddr(dcache_tag_waddr),
	.dcache_tag_wenable(dcache_tag_wenable),
	.dcache_tag_wdata(dcache_tag_wdata),

	.dcache_data_raddr(dcache_data_raddr),
	.dcache_data_rdata(dcache_data_rdata),
	.dcache_data_waddr(dcache_data_waddr),
	.dcache_data_wbe(dcache_data_wbe),
	.dcache_data_wdata(dcache_data_wdata),

	.spill_raddr(spill_raddr),
	.spill_rdata(spill_rdata),
	.spill_waddr(spill_waddr),
	.spill_wenable(spill_wenable),
	.spill_wdata(spill_wdata),

	.global_interrupts(interrupts_extended),

	.executed(executed),
	.executed_pc(executed_pc),
	.executed_inst(executed_inst)
);

ERVP_MEMORY_CELL_1R1WC
#(
	.DEPTH(I_NUM_LINES),
	.WIDTH(BW_ITAG_CELL),
	.BW_INDEX(LOG2RU(I_NUM_LINES)),
	.USE_SUBWORD_ENABLE(0)
)
i_cell_for_icache_tag
(
	.clk(clk),
	.rstnn(1'b 1),

	.windex(icache_tag_waddr),
	.wenable(icache_tag_wenable),
	.wpermit(1'b 0),
	.wdata(icache_tag_wdata),

	.rindex(icache_tag_raddr),
	.rdata_asynch(),
	.renable(1'b 1),
	.rdata_synch(icache_tag_rdata)
);

ERVP_MEMORY_CELL_1R1WC
#(
	.DEPTH(ICACHE_SIZE/(ICACHE_EXTERNAL_WIDTH/8)),
	.WIDTH(ICACHE_EXTERNAL_WIDTH),
	.BW_INDEX(LOG2RU(ICACHE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))),
	.USE_SUBWORD_ENABLE(1),
	.BW_SUBWORD(8)
)
i_cell_for_icache_data
(
	.clk(clk),
	.rstnn(1'b 1),

	.windex(icache_data_waddr),
	.wenable(icache_data_wenable),
	.wpermit(icache_data_wbe),
	.wdata(icache_data_wdata),

	.rindex(icache_data_raddr),
	.rdata_asynch(),
	.renable(1'b 1),
	.rdata_synch(icache_data_rdata)
);

ERVP_MEMORY_CELL_1R1WC
#(
	.DEPTH(D_NUM_LINES),
	.WIDTH(BW_DTAG_CELL),
	.BW_INDEX(LOG2RU(D_NUM_LINES)),
	.USE_SUBWORD_ENABLE(0)
)
i_cell_for_dcache_tag
(
	.clk(clk),
	.rstnn(1'b 1),

	.windex(dcache_tag_waddr),
	.wenable(dcache_tag_wenable),
	.wpermit(1'b 0),
	.wdata(dcache_tag_wdata),

	.rindex(dcache_tag_raddr),
	.rdata_asynch(),
	.renable(1'b 1),
	.rdata_synch(dcache_tag_rdata)
);

ERVP_MEMORY_CELL_1R1WC
#(
	.DEPTH(DCACHE_SIZE/(DCACHE_EXTERNAL_WIDTH/8)),
	.WIDTH(DCACHE_EXTERNAL_WIDTH),
	.BW_INDEX(LOG2RU(DCACHE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))),
	.USE_SUBWORD_ENABLE(1),
	.BW_SUBWORD(8)
)
i_cell_for_dcache_data
(
	.clk(clk),
	.rstnn(1'b 1),

	.windex(dcache_data_waddr),
	.wenable(dcache_data_wenable),
	.wpermit(dcache_data_wbe),
	.wdata(dcache_data_wdata),

	.rindex(dcache_data_raddr),
	.rdata_asynch(),
	.renable(1'b 1),
	.rdata_synch(dcache_data_rdata)
);

ERVP_REGISTER_FILE_1R1WC
#(
	.DEPTH(D_CACHEWORDS_PER_LINE),
	.WIDTH(DCACHE_EXTERNAL_WIDTH),
	.BW_INDEX(LOG2RU(D_CACHEWORDS_PER_LINE))
)
i_register_file_for_wbuffer
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

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		inst_request_select <= `INST_UC;
	else
	begin
		case(inst_request_select)
			`INST_UC:
				if((inst_uc_sxarvalid==0) && (inst_c_sxarvalid==1))
					inst_request_select <= `INST_CC;
			`INST_CC:
				if((inst_uc_sxarvalid==1) && (inst_c_sxarvalid==0))
					inst_request_select <= `INST_UC;
		endcase
	end
end

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(3)
)
i_inst_response
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(),
	.wfull(inst_response_buffer_wfull),
	.wrequest(inst_response_buffer_wrequest),
	.wdata(inst_response_buffer_wdata),
	.rready(),
	.rempty(),
	.rrequest(inst_response_buffer_rrequest),
	.rdata(inst_response_buffer_rdata)
);

assign inst_response_buffer_wrequest = inst_sxarvalid & inst_sxarready;
assign inst_response_buffer_wdata = inst_request_select;
assign inst_response_buffer_rrequest = inst_sxrvalid & inst_sxrready & inst_sxrlast;
assign inst_response_select = inst_response_buffer_rdata;

assign inst_sxarvalid = (~inst_response_buffer_wfull) & ((inst_request_select==`INST_UC)? inst_uc_sxarvalid : inst_c_sxarvalid);
assign inst_sxarburst = (inst_request_select==`INST_UC)? inst_uc_sxarburst : inst_c_sxarburst;
assign inst_sxarsize = (inst_request_select==`INST_UC)? inst_uc_sxarsize : inst_c_sxarsize;
assign inst_sxarlen = (inst_request_select==`INST_UC)? inst_uc_sxarlen : inst_c_sxarlen;
assign inst_sxaraddr = (inst_request_select==`INST_UC)? inst_uc_sxaraddr : inst_c_sxaraddr;
assign inst_sxarid = (inst_request_select==`INST_UC)? inst_uc_sxarid : inst_c_sxarid;
assign inst_sxrready = (inst_response_select==`INST_UC)? inst_uc_sxrready : inst_c_sxrready;

assign inst_uc_sxarready = (~inst_response_buffer_wfull) & ((inst_request_select==`INST_UC)? inst_sxarready : 0);
assign inst_uc_sxrvalid = (inst_response_select==`INST_UC)? inst_sxrvalid : 0;
assign inst_uc_sxrlast = inst_sxrlast;
assign inst_uc_sxrresp = inst_sxrresp;
assign inst_uc_sxrdata = inst_sxrdata;
assign inst_uc_sxrid = inst_sxrid;	

assign inst_c_sxarready = (~inst_response_buffer_wfull) & ((inst_request_select==`INST_CC)? inst_sxarready : 0);
assign inst_c_sxrvalid = (inst_response_select==`INST_CC)? inst_sxrvalid : 0;
assign inst_c_sxrlast = inst_sxrlast;
assign inst_c_sxrresp = inst_sxrresp;
assign inst_c_sxrdata = inst_sxrdata;
assign inst_c_sxrid = inst_sxrid;

//

assign inst_sxawvalid = 0;
assign inst_sxawburst = 0;
assign inst_sxawsize = 0;
assign inst_sxawlen = 0;
assign inst_sxawaddr = 0;
assign inst_sxawid = 0;

assign inst_sxwvalid = 0;
assign inst_sxwlast = 0;
assign inst_sxwstrb = 0;
assign inst_sxwdata = 0;
assign inst_sxwid = 0;

assign inst_sxbready = 0;

assign inst_uc_sxawready = 0;
assign inst_uc_sxwready = 0;
assign inst_uc_sxbvalid = 0;
assign inst_uc_sxbresp = 0;
assign inst_uc_sxbid = 0;

assign inst_c_sxawready = 0;
assign inst_c_sxwready = 0;
assign inst_c_sxbvalid = 0;
assign inst_c_sxbresp = 0;
assign inst_c_sxbid = 0;

assign spc = executed_pc;
assign sinst = executed_inst;

assign interrupts_extended = (ENABLE_INTERRUPTS==1)? $unsigned(interrupt_vector) : 0;
assign interrupt_out = (interrupts_extended!=0);

endmodule
