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

module RVC_ORCA
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

	data_sxrready,
	data_sxrvalid,
	data_sxrlast,
	data_sxrresp,
	data_sxrdata,
	data_sxrid,
	data_sxarready,
	data_sxarvalid,
	data_sxarburst,
	data_sxarsize,
	data_sxarlen,
	data_sxaraddr,
	data_sxarid,
	data_sxbready,
	data_sxbvalid,
	data_sxbresp,
	data_sxbid,
	data_sxwready,
	data_sxwvalid,
	data_sxwlast,
	data_sxwstrb,
	data_sxwdata,
	data_sxwid,
	data_sxawready,
	data_sxawvalid,
	data_sxawburst,
	data_sxawsize,
	data_sxawlen,
	data_sxawaddr,
	data_sxawid,

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

localparam REGISTER_SIZE = 32;

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

output	wire		data_sxrready;
input	wire		data_sxrvalid;
input	wire		data_sxrlast;
input	wire	[`BW_AXI_RRESP-1:0]	data_sxrresp;
input	wire	[31:0]	data_sxrdata;
input	wire	[3:0]	data_sxrid;
input	wire		data_sxarready;
output	wire		data_sxarvalid;
output	wire	[`BW_AXI_ABURST-1:0]	data_sxarburst;
output	wire	[`BW_AXI_ASIZE-1:0]	data_sxarsize;
output	wire	[`BW_AXI_ALEN-1:0]	data_sxarlen;
output	wire	[31:0]	data_sxaraddr;
output	wire	[3:0]	data_sxarid;
output	wire		data_sxbready;
input	wire		data_sxbvalid;
input	wire	[`BW_AXI_BRESP-1:0]	data_sxbresp;
input	wire	[3:0]	data_sxbid;
input	wire		data_sxwready;
output	wire		data_sxwvalid;
output	wire		data_sxwlast;
output	wire	[`BW_AXI_WSTRB(32)-1:0]	data_sxwstrb;
output	wire	[31:0]	data_sxwdata;
output	wire	[3:0]	data_sxwid;
input	wire		data_sxawready;
output	wire		data_sxawvalid;
output	wire	[`BW_AXI_ABURST-1:0]	data_sxawburst;
output	wire	[`BW_AXI_ASIZE-1:0]	data_sxawsize;
output	wire	[`BW_AXI_ALEN-1:0]	data_sxawlen;
output	wire	[31:0]	data_sxawaddr;
output	wire	[3:0]	data_sxawid;

input wire [NUM_INTERRUPTS-1:0] interrupt_vector;
output wire interrupt_out;

output wire [32-1:0] spc;
output wire [32-1:0] sinst;

/////////////
/* signals */
/////////////

wire [NUM_INTERRUPTS-1:0] interrupts_extended;

wire executed;
wire [32-1:0] executed_pc;
wire [32-1:0] executed_inst;

////////////
/* logics */
////////////

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
	.UC_MEMORY_REGIONS(1),
	.DCACHE_WRITEBACK(0)
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

	.IUC_ARID(inst_sxarid),
	.IUC_ARADDR(inst_sxaraddr),
	.IUC_ARLEN(inst_sxarlen),
	.IUC_ARSIZE(inst_sxarsize),
	.IUC_ARBURST(inst_sxarburst),
	.IUC_ARLOCK(),
	.IUC_ARCACHE(),
	.IUC_ARPROT(),
	.IUC_ARVALID(inst_sxarvalid),
	.IUC_ARREADY(inst_sxarready),

	.IUC_RID(inst_sxrid),
	.IUC_RDATA(inst_sxrdata),
	.IUC_RRESP(inst_sxrresp),
	.IUC_RLAST(inst_sxrlast),
	.IUC_RVALID(inst_sxrvalid),
	.IUC_RREADY(inst_sxrready),

	.IUC_AWID(),
	.IUC_AWADDR(),
	.IUC_AWLEN(),
	.IUC_AWSIZE(),
	.IUC_AWBURST(),
	.IUC_AWLOCK(),
	.IUC_AWCACHE(),
	.IUC_AWPROT(),
	.IUC_AWVALID(),
	.IUC_AWREADY(1'b 0),

	.IUC_WID(),
	.IUC_WDATA(),
	.IUC_WSTRB(),
	.IUC_WLAST(),
	.IUC_WVALID(),
	.IUC_WREADY(1'b 0),

	.IUC_BID(inst_sxbid),
	.IUC_BRESP(inst_sxbresp),
	.IUC_BVALID(inst_sxbvalid),
	.IUC_BREADY(),

	.DUC_AWID(data_sxawid),
	.DUC_AWADDR(data_sxawaddr),
	.DUC_AWLEN(data_sxawlen),
	.DUC_AWSIZE(data_sxawsize),
	.DUC_AWBURST(data_sxawburst),
	.DUC_AWLOCK(),
	.DUC_AWCACHE(),
	.DUC_AWPROT(),
	.DUC_AWVALID(data_sxawvalid),
	.DUC_AWREADY(data_sxawready),

	.DUC_WID(data_sxwid),
	.DUC_WDATA(data_sxwdata),
	.DUC_WSTRB(data_sxwstrb),
	.DUC_WLAST(data_sxwlast),
	.DUC_WVALID(data_sxwvalid),
	.DUC_WREADY(data_sxwready),

	.DUC_BID(data_sxbid),
	.DUC_BRESP(data_sxbresp),
	.DUC_BVALID(data_sxbvalid),
	.DUC_BREADY(data_sxbready),

	.DUC_ARID(data_sxarid),
	.DUC_ARADDR(data_sxaraddr),
	.DUC_ARLEN(data_sxarlen),
	.DUC_ARSIZE(data_sxarsize),
	.DUC_ARBURST(data_sxarburst),
	.DUC_ARLOCK(),
	.DUC_ARCACHE(),
	.DUC_ARPROT(),
	.DUC_ARVALID(data_sxarvalid),
	.DUC_ARREADY(data_sxarready),

	.DUC_RID(data_sxrid),
	.DUC_RDATA(data_sxrdata),
	.DUC_RRESP(data_sxrresp),
	.DUC_RLAST(data_sxrlast),
	.DUC_RVALID(data_sxrvalid),
	.DUC_RREADY(data_sxrready),

	.IC_ARID(),
	.IC_ARADDR(),
	.IC_ARLEN(),
	.IC_ARSIZE(),
	.IC_ARBURST(),
	.IC_ARLOCK(),
	.IC_ARCACHE(),
	.IC_ARPROT(),
	.IC_ARVALID(),
	.IC_ARREADY(),

	.IC_RID(),
	.IC_RDATA(),
	.IC_RRESP(),
	.IC_RLAST(),
	.IC_RVALID(),
	.IC_RREADY(),

	.IC_AWID(),
	.IC_AWADDR(),
	.IC_AWLEN(),
	.IC_AWSIZE(),
	.IC_AWBURST(),
	.IC_AWLOCK(),
	.IC_AWCACHE(),
	.IC_AWPROT(),
	.IC_AWVALID(),
	.IC_AWREADY(),

	.IC_WID(),
	.IC_WDATA(),
	.IC_WSTRB(),
	.IC_WLAST(),
	.IC_WVALID(),
	.IC_WREADY(),
	.IC_BID(),
	.IC_BRESP(),
	.IC_BVALID(),
	.IC_BREADY(),

	.DC_AWID(),
	.DC_AWADDR(),
	.DC_AWLEN(),
	.DC_AWSIZE(),
	.DC_AWBURST(),
	.DC_AWLOCK(),
	.DC_AWCACHE(),
	.DC_AWPROT(),
	.DC_AWVALID(),
	.DC_AWREADY(),

	.DC_WID(),
	.DC_WDATA(),
	.DC_WSTRB(),
	.DC_WLAST(),
	.DC_WVALID(),
	.DC_WREADY(),

	.DC_BID(),
	.DC_BRESP(),
	.DC_BVALID(),
	.DC_BREADY(),

	.DC_ARID(),
	.DC_ARADDR(),
	.DC_ARLEN(),
	.DC_ARSIZE(),
	.DC_ARBURST(),
	.DC_ARLOCK(),
	.DC_ARCACHE(),
	.DC_ARPROT(),
	.DC_ARVALID(),
	.DC_ARREADY(),

	.DC_RID(),
	.DC_RDATA(),
	.DC_RRESP(),
	.DC_RLAST(),
	.DC_RVALID(),
	.DC_RREADY(),

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

	.icache_tag_raddr(),
	.icache_tag_rdata(),
	.icache_tag_waddr(),
	.icache_tag_wenable(),
	.icache_tag_wdata(),

	.icache_data_raddr(),
	.icache_data_rdata(),
	.icache_data_waddr(),
	.icache_data_wbe(),
	.icache_data_wdata(),

	.dcache_tag_raddr(),
	.dcache_tag_rdata(),
	.dcache_tag_waddr(),
	.dcache_tag_wenable(),
	.dcache_tag_wdata(),

	.dcache_data_raddr(),
	.dcache_data_rdata(),
	.dcache_data_waddr(),
	.dcache_data_wbe(),
	.dcache_data_wdata(),

	.spill_raddr(),
	.spill_rdata(),
	.spill_waddr(),
	.spill_wenable(),
	.spill_wdata(),

	.global_interrupts(interrupts_extended),

	.executed(executed),
	.executed_pc(executed_pc),
	.executed_inst(executed_inst)
);

assign inst_sxawid = 0;
assign inst_sxawaddr = 0;
assign inst_sxawlen = 0;
assign inst_sxawsize = 0;
assign inst_sxawburst = 0;
assign inst_sxawvalid = 0;

assign inst_sxwid = 0;
assign inst_sxwdata = 0;
assign inst_sxwstrb = 0;
assign inst_sxwlast = 0;
assign inst_sxwvalid = 0;

assign inst_sxbready = 0;

assign spc = executed_pc;
assign sinst = executed_inst;

assign interrupts_extended = (ENABLE_INTERRUPTS==1)? $unsigned(interrupt_vector) : 0;
assign interrupt_out = (interrupts_extended!=0);

endmodule

