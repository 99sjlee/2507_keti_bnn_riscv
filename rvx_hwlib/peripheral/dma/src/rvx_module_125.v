// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
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
// 2025-07-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "rvx_include_06.vh"




module RVX_MODULE_125
(
	rvx_port_24,
	rvx_port_66,
  rvx_port_41,
	rvx_port_52,
	rvx_port_47,
	
	rvx_port_51,
	rvx_port_20,
	rvx_port_29,
	rvx_port_08,
	rvx_port_40,
	rvx_port_23,
	rvx_port_49,
	rvx_port_46,
	
	rvx_port_05,
	rvx_port_04,
	rvx_port_36,
	rvx_port_59,
	rvx_port_22,
	rvx_port_11,
	rvx_port_26,
	
	rvx_port_58,
	rvx_port_39,
	rvx_port_65,
	rvx_port_10,
	rvx_port_42,
	rvx_port_57,
	
	rvx_port_33,
	rvx_port_09,
	rvx_port_34,
	rvx_port_55,
	
	rvx_port_13,
	rvx_port_67,
	rvx_port_38,
	rvx_port_00,
	rvx_port_69,
	rvx_port_43,
	rvx_port_27,
	
	rvx_port_45,
	rvx_port_18,
	rvx_port_61,
	rvx_port_15,
	rvx_port_12,
	rvx_port_25,

  rvx_port_48,
	rvx_port_60,
	rvx_port_02,
	rvx_port_37,
	rvx_port_64,
	rvx_port_30,
	rvx_port_03,
	
	rvx_port_32,
	rvx_port_07,
	rvx_port_19,
	rvx_port_06,
	rvx_port_68,
	rvx_port_17,
	
	rvx_port_54,
	rvx_port_16,
	rvx_port_35,
	rvx_port_53,
	
	rvx_port_63,
	rvx_port_14,
	rvx_port_01,
	rvx_port_71,
	rvx_port_62,
	rvx_port_28,
	rvx_port_70,
	
	rvx_port_44,
	rvx_port_56,
	rvx_port_31,
	rvx_port_21,
	rvx_port_50,
	rvx_port_72
);




parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_1 = 32;
parameter BW_AXI_DATA = 32;
parameter RVX_GPARA_0 = 4;
parameter RVX_GPARA_3 = 4;

`include "rvx_include_14.vh"

localparam  RVX_LPARA_0 = (MAX_AXI_LENGTH+1)*RVX_GPARA_3;

input wire rvx_port_24;
input wire rvx_port_66;
input wire rvx_port_41;
input wire rvx_port_52;
input wire rvx_port_47;

input wire [RVX_GPARA_2-1:0] rvx_port_51;
input wire rvx_port_20;
input wire rvx_port_29;
input wire rvx_port_08;
input wire [RVX_GPARA_1-1:0] rvx_port_40;
output wire [RVX_GPARA_1-1:0] rvx_port_23;
output wire rvx_port_49;
output wire rvx_port_46;

output wire [RVX_GPARA_0-1:0] rvx_port_05;
output wire [RVX_GPARA_2-1:0] rvx_port_04;
output wire [`BW_AXI_ALEN-1:0] rvx_port_36;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_59;
output wire [`BW_AXI_ABURST-1:0] rvx_port_22;
output wire rvx_port_11;
input wire rvx_port_26;

output wire [RVX_GPARA_0-1:0] rvx_port_58;
output wire [BW_AXI_DATA-1:0] rvx_port_39;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_65;
output wire rvx_port_10;
output wire rvx_port_42;
input wire rvx_port_57;

input wire [RVX_GPARA_0-1:0] rvx_port_33;
input wire [`BW_AXI_BRESP-1:0] rvx_port_09;
input wire rvx_port_34;
output wire rvx_port_55;

output wire [RVX_GPARA_0-1:0] rvx_port_13;
output wire [RVX_GPARA_2-1:0] rvx_port_67;
output wire [`BW_AXI_ALEN-1:0] rvx_port_38;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_00;
output wire [`BW_AXI_ABURST-1:0] rvx_port_69;
output wire rvx_port_43;
input wire rvx_port_27;

input wire [RVX_GPARA_0-1:0] rvx_port_45;
input wire [BW_AXI_DATA-1:0] rvx_port_18;
input wire [`BW_AXI_RRESP-1:0] rvx_port_61;
input wire rvx_port_15;
input wire rvx_port_12;
output wire rvx_port_25;

output wire [RVX_GPARA_0-1:0] rvx_port_48;
output wire [RVX_GPARA_2-1:0] rvx_port_60;
output wire [`BW_AXI_ALEN-1:0] rvx_port_02;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_37;
output wire [`BW_AXI_ABURST-1:0] rvx_port_64;
output wire rvx_port_30;
input wire rvx_port_03;

output wire [RVX_GPARA_0-1:0] rvx_port_32;
output wire [BW_AXI_DATA-1:0] rvx_port_07;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] rvx_port_19;
output wire rvx_port_06;
output wire rvx_port_68;
input wire rvx_port_17;

input wire [RVX_GPARA_0-1:0] rvx_port_54;
input wire [`BW_AXI_BRESP-1:0] rvx_port_16;
input wire rvx_port_35;
output wire rvx_port_53;

output wire [RVX_GPARA_0-1:0] rvx_port_63;
output wire [RVX_GPARA_2-1:0] rvx_port_14;
output wire [`BW_AXI_ALEN-1:0] rvx_port_01;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_71;
output wire [`BW_AXI_ABURST-1:0] rvx_port_62;
output wire rvx_port_28;
input wire rvx_port_70;

input wire [RVX_GPARA_0-1:0] rvx_port_44;
input wire [BW_AXI_DATA-1:0] rvx_port_56;
input wire [`BW_AXI_RRESP-1:0] rvx_port_31;
input wire rvx_port_21;
input wire rvx_port_50;
output wire rvx_port_72;

ERVP_DMA
#(
  .BW_ADDR(RVX_GPARA_2),
  .BW_APB_DATA(RVX_GPARA_1),
  .BW_AXI_DATA(BW_AXI_DATA),
  .BW_AXI_TID(RVX_GPARA_0),
  .NUM_TXN_BUFFER(RVX_GPARA_3)
)
i_rvx_instance_0
(
	.clk_axi(rvx_port_24),
	.rstnn_axi(rvx_port_66),
  .clk_apb(rvx_port_41),
	.rstnn_apb(rvx_port_52),
	.tick_1us(rvx_port_47),
	
	.control_rpaddr(rvx_port_51),
	.control_rpwrite(rvx_port_20),
	.control_rpsel(rvx_port_29),
	.control_rpenable(rvx_port_08),
	.control_rpwdata(rvx_port_40),
	.control_rprdata(rvx_port_23),
	.control_rpready(rvx_port_49),
	.control_rpslverr(rvx_port_46),
	
	.sxawid(rvx_port_48),
	.sxawaddr(rvx_port_60),
	.sxawlen(rvx_port_02),
	.sxawsize(rvx_port_37),
	.sxawburst(rvx_port_64),
	.sxawvalid(rvx_port_30),
	.sxawready(rvx_port_03),
	
	.sxwid(rvx_port_32),
	.sxwdata(rvx_port_07),
	.sxwstrb(rvx_port_19),
	.sxwlast(rvx_port_06),
	.sxwvalid(rvx_port_68),
	.sxwready(rvx_port_17),
	
	.sxbid(rvx_port_54),
	.sxbresp(rvx_port_16),
	.sxbvalid(rvx_port_35),
	.sxbready(rvx_port_53),
	
	.sxarid(rvx_port_13),
	.sxaraddr(rvx_port_67),
	.sxarlen(rvx_port_38),
	.sxarsize(rvx_port_00),
	.sxarburst(rvx_port_69),
	.sxarvalid(rvx_port_43),
	.sxarready(rvx_port_27),
	
	.sxrid(rvx_port_45),
	.sxrdata(rvx_port_18),
	.sxrresp(rvx_port_61),
	.sxrlast(rvx_port_15),
	.sxrvalid(rvx_port_12),
	.sxrready(rvx_port_25)
);

assign rvx_port_05 = 0;
assign rvx_port_04 = 0;
assign rvx_port_36 = 0;
assign rvx_port_59 = 0;
assign rvx_port_22 = 0;
assign rvx_port_11 = 0;

assign rvx_port_58 = 0;
assign rvx_port_39 = 0;
assign rvx_port_65 = 0;
assign rvx_port_10 = 0;
assign rvx_port_42 = 0;

assign rvx_port_55 = 0;

assign rvx_port_63 = 0;
assign rvx_port_14 = 0;
assign rvx_port_01 = 0;
assign rvx_port_71 = 0;
assign rvx_port_62 = 0;
assign rvx_port_28 = 0;

assign rvx_port_72 = 0;

endmodule
