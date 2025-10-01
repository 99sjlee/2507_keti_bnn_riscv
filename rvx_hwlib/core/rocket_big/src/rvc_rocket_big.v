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

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "rvx_include_18.vh"
`include "rvx_include_13.vh"

module RVC_ROCKET_BIG
(
	clk,
	rstnn,

	sxrready,
	sxrvalid,
	sxrlast,
	sxrresp,
	sxrdata,
	sxrid,
	sxarready,
	sxarvalid,
	sxarburst,
	sxarsize,
	sxarlen,
	sxaraddr,
	sxarid,
	sxbready,
	sxbvalid,
	sxbresp,
	sxbid,
	sxwready,
	sxwvalid,
	sxwlast,
	sxwstrb,
	sxwdata,
	sxwid,
	sxawready,
	sxawvalid,
	sxawburst,
	sxawsize,
	sxawlen,
	sxawaddr,
	sxawid,

	interrupt_vector,
	interrupt_out,
	
	spc,
	sinst
);

////////////////////////////
/* parameter input output */
////////////////////////////

parameter ENABLE_INTERRUPTS = 1;
parameter NUM_INTERRUPTS = 32;

localparam BW_DATA = 32;

localparam BW_TL_DATA = 32; // 8w
localparam BW_TL_ADDR = 32; // a
localparam BW_TL_SOURCE = 2; // z
localparam BW_TL_SIZE = 4; // o
localparam BW_TL_SINK = 3; // i

localparam BW_TL_MASK = (BW_TL_DATA/8); // w

input wire clk, rstnn;

input wire sxarready;
output wire sxarvalid;
output wire [`BW_AXI_ABURST-1:0] sxarburst;
output wire [`BW_AXI_ASIZE-1:0] sxarsize;
output wire [`BW_AXI_ALEN-1:0] sxarlen;
output wire [31:0] sxaraddr;
output wire [3:0] sxarid;

output wire sxrready;
input wire sxrvalid;
input wire sxrlast;
input wire [`BW_AXI_RRESP-1:0] sxrresp;
input wire [BW_DATA-1:0] sxrdata;
input wire [3:0] sxrid;

output wire sxbready;
input wire sxbvalid;
input wire [`BW_AXI_BRESP-1:0] sxbresp;
input wire [3:0] sxbid;

input wire sxwready;
output wire sxwvalid;
output wire sxwlast;
output wire [`BW_AXI_WSTRB(BW_DATA)-1:0] sxwstrb;
output wire [BW_DATA-1:0] sxwdata;
output wire [3:0] sxwid;

input wire sxawready;
output wire sxawvalid;
output wire [`BW_AXI_ABURST-1:0] sxawburst;
output wire [`BW_AXI_ASIZE-1:0] sxawsize;
output wire [`BW_AXI_ALEN-1:0] sxawlen;
output wire [31:0] sxawaddr;
output wire [3:0] sxawid;

input wire [NUM_INTERRUPTS-1:0] interrupt_vector;
output wire interrupt_out;

`ifdef RTL_IMP
output reg [32-1:0] spc;
output reg [32-1:0] sinst;
`else
output wire [32-1:0] spc;
output wire [32-1:0] sinst;
`endif

/////////////
/* signals */
/////////////

wire clock;
wire reset;
wire auto_wfi_out_0;
wire auto_int_local_in_3_0;
wire auto_int_local_in_2_0;
wire auto_int_local_in_1_0;
wire auto_int_local_in_1_1;
wire auto_int_local_in_0_0;
wire auto_hartid_in;
wire auto_tl_other_masters_out_a_ready;
wire auto_tl_other_masters_out_a_valid;
wire [2:0] auto_tl_other_masters_out_a_bits_opcode;
wire [2:0] auto_tl_other_masters_out_a_bits_param;
wire [3:0] auto_tl_other_masters_out_a_bits_size;
wire [1:0] auto_tl_other_masters_out_a_bits_source;
wire [31:0] auto_tl_other_masters_out_a_bits_address;
wire [3:0] auto_tl_other_masters_out_a_bits_mask;
wire [31:0] auto_tl_other_masters_out_a_bits_data;
wire auto_tl_other_masters_out_c_ready;
wire auto_tl_other_masters_out_c_valid;
wire [2:0] auto_tl_other_masters_out_c_bits_opcode;
wire [2:0] auto_tl_other_masters_out_c_bits_param;
wire [3:0] auto_tl_other_masters_out_c_bits_size;
wire [31:0] auto_tl_other_masters_out_c_bits_address;
wire [31:0] auto_tl_other_masters_out_c_bits_data;
wire auto_tl_other_masters_out_d_ready;
wire auto_tl_other_masters_out_d_valid;
wire [2:0] auto_tl_other_masters_out_d_bits_opcode;
wire [1:0] auto_tl_other_masters_out_d_bits_param;
wire [3:0] auto_tl_other_masters_out_d_bits_size;
wire [1:0] auto_tl_other_masters_out_d_bits_source;
wire [2:0] auto_tl_other_masters_out_d_bits_sink;
wire auto_tl_other_masters_out_d_bits_denied;
wire [31:0] auto_tl_other_masters_out_d_bits_data;
wire auto_tl_other_masters_out_d_bits_corrupt;
wire auto_tl_other_masters_out_e_ready;
wire auto_tl_other_masters_out_e_valid;
wire [2:0] auto_tl_other_masters_out_e_bits_sink;

wire tla_ready;
wire tla_valid;
wire [`RVX_GDEF_324-1:0] tla_opcode;
wire [`RVX_GDEF_202-1:0] tla_param;
wire [BW_TL_SIZE-1:0] tla_size;
wire [BW_TL_SOURCE-1:0] tla_source;
wire [BW_TL_ADDR-1:0] tla_address;
wire [BW_TL_MASK-1:0] tla_mask;
wire [BW_TL_DATA-1:0] tla_data;
wire tla_corrupt;

wire tlb_ready;
wire tlb_valid;
wire [`RVX_GDEF_324-1:0] tlb_opcode;
wire [`RVX_GDEF_202-1:0] tlb_param;
wire [BW_TL_SIZE-1:0] tlb_size;
wire [BW_TL_SOURCE-1:0] tlb_source;
wire [BW_TL_ADDR-1:0] tlb_address;
wire [BW_TL_MASK-1:0] tlb_mask;
wire [BW_TL_DATA-1:0] tlb_data;

wire tlc_ready;
wire tlc_valid;
wire [`RVX_GDEF_324-1:0] tlc_opcode;
wire [`RVX_GDEF_202-1:0] tlc_param;
wire [BW_TL_SIZE-1:0] tlc_size;
wire [BW_TL_SOURCE-1:0] tlc_source;
wire [BW_TL_ADDR-1:0] tlc_address;
wire [BW_TL_MASK-1:0] tlc_mask;
wire [BW_TL_DATA-1:0] tlc_data;
wire tlc_corrupt;

wire tld_ready;
wire tld_valid;
wire [`RVX_GDEF_324-1:0] tld_opcode;
wire [`RVX_GDEF_202-1:0] tld_param;
wire [BW_TL_SIZE-1:0] tld_size;
wire [BW_TL_SOURCE-1:0] tld_source;
wire [BW_TL_SINK-1:0] tld_sink;
wire tld_denied;
wire [BW_TL_DATA-1:0] tld_data;
wire tld_corrupt;

wire tle_ready;
wire tle_valid;
wire [BW_TL_SINK-1:0] tle_sink;

wire [31-1:0] interrupts_extended;

////////////
/* logics */
////////////

RocketTile
i_rocket
(
	.clock(clock),
	.reset(reset),

  .auto_wfi_out_0(auto_wfi_out_0),
  .auto_int_local_in_3_0(auto_int_local_in_3_0),
  .auto_int_local_in_2_0(auto_int_local_in_2_0),
  .auto_int_local_in_1_0(auto_int_local_in_1_0),
  .auto_int_local_in_1_1(auto_int_local_in_1_1),
  .auto_int_local_in_0_0(auto_int_local_in_0_0),
  .auto_hartid_in(auto_hartid_in),
  .auto_tl_other_masters_out_a_ready(auto_tl_other_masters_out_a_ready),
  .auto_tl_other_masters_out_a_valid(auto_tl_other_masters_out_a_valid),
  .auto_tl_other_masters_out_a_bits_opcode(auto_tl_other_masters_out_a_bits_opcode),
  .auto_tl_other_masters_out_a_bits_param(auto_tl_other_masters_out_a_bits_param),
  .auto_tl_other_masters_out_a_bits_size(auto_tl_other_masters_out_a_bits_size),
  .auto_tl_other_masters_out_a_bits_source(auto_tl_other_masters_out_a_bits_source),
  .auto_tl_other_masters_out_a_bits_address(auto_tl_other_masters_out_a_bits_address),
  .auto_tl_other_masters_out_a_bits_mask(auto_tl_other_masters_out_a_bits_mask),
  .auto_tl_other_masters_out_a_bits_data(auto_tl_other_masters_out_a_bits_data),
  .auto_tl_other_masters_out_c_ready(auto_tl_other_masters_out_c_ready),
  .auto_tl_other_masters_out_c_valid(auto_tl_other_masters_out_c_valid),
  .auto_tl_other_masters_out_c_bits_opcode(auto_tl_other_masters_out_c_bits_opcode),
  .auto_tl_other_masters_out_c_bits_param(auto_tl_other_masters_out_c_bits_param),
  .auto_tl_other_masters_out_c_bits_size(auto_tl_other_masters_out_c_bits_size),
  .auto_tl_other_masters_out_c_bits_address(auto_tl_other_masters_out_c_bits_address),
  .auto_tl_other_masters_out_c_bits_data(auto_tl_other_masters_out_c_bits_data),
  .auto_tl_other_masters_out_d_ready(auto_tl_other_masters_out_d_ready),
  .auto_tl_other_masters_out_d_valid(auto_tl_other_masters_out_d_valid),
  .auto_tl_other_masters_out_d_bits_opcode(auto_tl_other_masters_out_d_bits_opcode),
  .auto_tl_other_masters_out_d_bits_param(auto_tl_other_masters_out_d_bits_param),
  .auto_tl_other_masters_out_d_bits_size(auto_tl_other_masters_out_d_bits_size),
  .auto_tl_other_masters_out_d_bits_source(auto_tl_other_masters_out_d_bits_source),
  .auto_tl_other_masters_out_d_bits_sink(auto_tl_other_masters_out_d_bits_sink),
  .auto_tl_other_masters_out_d_bits_denied(auto_tl_other_masters_out_d_bits_denied),
  .auto_tl_other_masters_out_d_bits_data(auto_tl_other_masters_out_d_bits_data),
  .auto_tl_other_masters_out_d_bits_corrupt(auto_tl_other_masters_out_d_bits_corrupt),
  .auto_tl_other_masters_out_e_ready(auto_tl_other_masters_out_e_ready),
  .auto_tl_other_masters_out_e_valid(auto_tl_other_masters_out_e_valid),
  .auto_tl_other_masters_out_e_bits_sink(auto_tl_other_masters_out_e_bits_sink)
);

assign clock = clk;
assign reset = ~rstnn;

assign auto_int_local_in_3_0 = 0;
assign auto_int_local_in_2_0 = interrupts_extended[`RVX_GDEF_275];
assign auto_int_local_in_1_0 = 0;
assign auto_int_local_in_1_1 = interrupts_extended[`RVX_GDEF_086];
assign auto_int_local_in_0_0 = 0;

assign auto_hartid_in = 0;

assign auto_tl_other_masters_out_a_ready = tla_ready;
assign tla_valid = auto_tl_other_masters_out_a_valid;
assign tla_opcode = auto_tl_other_masters_out_a_bits_opcode;
assign tla_param = auto_tl_other_masters_out_a_bits_param;
assign tla_size = auto_tl_other_masters_out_a_bits_size;
assign tla_source = auto_tl_other_masters_out_a_bits_source;
assign tla_address = auto_tl_other_masters_out_a_bits_address;
assign tla_mask = auto_tl_other_masters_out_a_bits_mask;
assign tla_data = auto_tl_other_masters_out_a_bits_data;
assign tla_corrupt = 0;

assign tlb_ready = 0;

/*
assign tlb_ready = auto_tl_other_masters_out_b_ready;
assign auto_tl_other_masters_out_b_valid = tlb_valid;
assign auto_tl_other_masters_out_b_bits_opcode = tlb_opcode;
assign auto_tl_other_masters_out_b_bits_param = tlb_param;
assign auto_tl_other_masters_out_b_bits_size = tlb_size;
assign auto_tl_other_masters_out_b_bits_source = tlb_source;
assign auto_tl_other_masters_out_b_bits_address = tlb_address;
assign auto_tl_other_masters_out_b_bits_mask = 0;
*/

assign auto_tl_other_masters_out_c_ready = tlc_ready;
assign tlc_valid = auto_tl_other_masters_out_c_valid;
assign tlc_opcode = auto_tl_other_masters_out_c_bits_opcode;
assign tlc_param = auto_tl_other_masters_out_c_bits_param;
assign tlc_size = auto_tl_other_masters_out_c_bits_size;
assign tlc_source = 0;
assign tlc_address = auto_tl_other_masters_out_c_bits_address;
assign tlc_mask = -1;
assign tlc_data = auto_tl_other_masters_out_c_bits_data;
assign tlc_corrupt = 0;

assign tld_ready = auto_tl_other_masters_out_d_ready;
assign auto_tl_other_masters_out_d_valid = tld_valid;
assign auto_tl_other_masters_out_d_bits_opcode = tld_opcode;
assign auto_tl_other_masters_out_d_bits_param = tld_param;
assign auto_tl_other_masters_out_d_bits_size = tld_size;
assign auto_tl_other_masters_out_d_bits_source = tld_source;
assign auto_tl_other_masters_out_d_bits_sink = tld_sink;
assign auto_tl_other_masters_out_d_bits_denied = 0;
assign auto_tl_other_masters_out_d_bits_data = tld_data;
assign auto_tl_other_masters_out_d_bits_corrupt = tld_corrupt;

assign auto_tl_other_masters_out_e_ready = tle_ready;
assign tle_valid = auto_tl_other_masters_out_e_valid;
assign tle_sink = auto_tl_other_masters_out_e_bits_sink;

RVX_MODULE_110
#(
	.RVX_GPARA_5(BW_TL_DATA),
	.RVX_GPARA_0(BW_TL_ADDR),
	.RVX_GPARA_1(BW_TL_SOURCE),
	.RVX_GPARA_2(BW_TL_SIZE),
	.RVX_GPARA_4(BW_TL_SINK),
	.RVX_GPARA_3(4)
)
i_tl2axi
(
	.rvx_port_44(clk),
	.rvx_port_26(rstnn),

	.rvx_port_21(tla_ready),
	.rvx_port_11(tla_valid),
	.rvx_port_58(tla_opcode),
	.rvx_port_09(tla_param),
	.rvx_port_02(tla_size),
	.rvx_port_40(tla_source),
	.rvx_port_52(tla_address),
	.rvx_port_17(tla_mask),
	.rvx_port_59(tla_data),
	.rvx_port_37(tla_corrupt),

	.rvx_port_36(tlb_ready),
	.rvx_port_54(tlb_valid),
	.rvx_port_28(tlb_opcode),
	.rvx_port_01(tlb_param),
	.rvx_port_35(tlb_size),
	.rvx_port_56(tlb_source),
	.rvx_port_48(tlb_address),
	.rvx_port_27(tlb_mask),
	.rvx_port_16(tlb_data),

	.rvx_port_50(tlc_ready),
	.rvx_port_63(tlc_valid),
	.rvx_port_18(tlc_opcode),
	.rvx_port_07(tlc_param),
	.rvx_port_05(tlc_size),
	.rvx_port_49(tlc_source),
	.rvx_port_67(tlc_address),
	.rvx_port_38(tlc_data),
	.rvx_port_31(tlc_mask),
	.rvx_port_23(tlc_corrupt),

	.rvx_port_34(tld_ready),
	.rvx_port_53(tld_valid),
	.rvx_port_65(tld_opcode),
	.rvx_port_14(tld_param),
	.rvx_port_25(tld_size),
	.rvx_port_10(tld_source),
	.rvx_port_45(tld_sink),
	.rvx_port_64(tld_denied),
	.rvx_port_41(tld_data),
	.rvx_port_29(tld_corrupt),

	.rvx_port_43(tle_ready),
	.rvx_port_19(tle_valid),
	.rvx_port_00(tle_sink),

	.rvx_port_32(sxawid),
	.rvx_port_24(sxawaddr),
	.rvx_port_61(sxawlen),
	.rvx_port_30(sxawsize),
	.rvx_port_47(sxawburst),
	.rvx_port_72(sxawvalid),
	.rvx_port_55(sxawready),

	.rvx_port_39(sxwdata),
	.rvx_port_69(sxwstrb),
	.rvx_port_04(sxwlast),
	.rvx_port_08(sxwvalid),
	.rvx_port_62(sxwready), 

	.rvx_port_57(sxbid),
	.rvx_port_06(sxbresp),
	.rvx_port_15(sxbvalid),
	.rvx_port_20(sxbready),

	.rvx_port_42(sxarid),
	.rvx_port_12(sxaraddr),
	.rvx_port_03(sxarlen),
	.rvx_port_70(sxarsize),
	.rvx_port_60(sxarburst),
	.rvx_port_68(sxarvalid),
	.rvx_port_13(sxarready),

	.rvx_port_66(sxrid),
	.rvx_port_22(sxrdata),
	.rvx_port_46(sxrresp),
	.rvx_port_33(sxrlast),
	.rvx_port_71(sxrvalid),
	.rvx_port_51(sxrready)
);

/////////////////////////////////////////////////

assign sxwid = 0;

`ifdef RTL_IMP
always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
	begin
		spc <= 0;
		sinst <= 0;
	end
	else if(i_rocket.core.wb_reg_valid)
	begin
		spc <= i_rocket.core.wb_reg_pc[31:0];
		sinst <= i_rocket.core.wb_reg_inst[31:0];
	end
end
`else

assign spc = 0;
assign sinst = 0;

`endif

assign interrupts_extended = (ENABLE_INTERRUPTS==1)? $unsigned(interrupt_vector) : 0;
assign interrupt_out = (interrupt_vector!=0);

endmodule

