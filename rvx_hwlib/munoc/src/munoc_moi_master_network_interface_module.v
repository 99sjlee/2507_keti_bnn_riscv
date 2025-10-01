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
// 2024-05-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_04.vh"
`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_network_link.vh"
`include "munoc_control.vh"
`include "munoc_include_10.vh"
`include "munoc_tid_control_type.vh"



module MUNOC_MOI_MASTER_NETWORK_INTERFACE_MODULE
(
	clk,
	rstnn,

	comm_disable,

	sfni_link,
	sfni_ready,
	sbni_link,
	sbni_ready,

  rlmqdready,
  rlmqvalid,
  rlmqaddr,
  rlmqwrite,
  rlmqwdata,
  rlmqwpermit,
  rlmqburden,
  rlmydready,
  rlmyvalid,
  rlmyrdata,
  rlmyburden,

	svri_rlink,
	svri_rack,
	svri_slink,
	svri_sack
);



parameter NAME = "";
parameter NODE_ID = -1;
parameter BW_FNI_PHIT = 8;
parameter BW_BNI_PHIT = 8;
parameter BW_PLATFORM_ADDR = 32;
parameter BW_NODE_DATA = 32;
parameter TID_CONTROL_TYPE = `SINGLE_TARGET_SLAVE;
parameter BW_SUBDATA = `BW_BYTE;

`include "burden_para.vb"

localparam  MUNOC_LPARA_2 = 2;
localparam  MUNOC_LPARA_6 = 2;
localparam  MUNOC_LPARA_0 = 2;
localparam  MUNOC_LPARA_3 = 2;
localparam  MUNOC_LPARA_7 = 2;

localparam  MUNOC_LPARA_4 = BW_BURDEN_NZ;
localparam  MUNOC_LPARA_1 = 0;
localparam  MUNOC_LPARA_5 = 0;

input wire clk, rstnn;

input wire comm_disable;

output wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] sfni_link;
input wire sfni_ready;
input wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] sbni_link;
output wire sbni_ready;

output wire [2-1:0] rlmqdready;
input wire rlmqvalid;
input wire [BW_PLATFORM_ADDR-1:0] rlmqaddr;
input wire rlmqwrite;
input wire [BW_NODE_DATA-1:0] rlmqwdata;
input wire [`DIVIDERU(BW_NODE_DATA, BW_SUBDATA)-1:0] rlmqwpermit;
input wire [BW_BURDEN_NZ-1:0] rlmqburden;

input wire [2-1:0] rlmydready;
output wire rlmyvalid;
output wire [BW_NODE_DATA-1:0] rlmyrdata;
output wire [BW_BURDEN_NZ-1:0] rlmyburden;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [MUNOC_LPARA_4-1:0] munoc_signal_41;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_05;
wire [`BW_AXI_ALEN-1:0] munoc_signal_19;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_26;
wire [`BW_AXI_ABURST-1:0] munoc_signal_16;
wire munoc_signal_11;
wire munoc_signal_43;

wire [BW_NODE_DATA-1:0] munoc_signal_21;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_04;
wire munoc_signal_40;
wire munoc_signal_46;
wire munoc_signal_39;

wire [MUNOC_LPARA_4-1:0] munoc_signal_10;
wire [`BW_AXI_BRESP-1:0] munoc_signal_32;
wire munoc_signal_14;
wire munoc_signal_36;

wire [MUNOC_LPARA_4-1:0] munoc_signal_12;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_37;
wire [`BW_AXI_ALEN-1:0] munoc_signal_08;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_00;
wire [`BW_AXI_ABURST-1:0] munoc_signal_29;
wire munoc_signal_47;
wire munoc_signal_23;

wire [MUNOC_LPARA_4-1:0] munoc_signal_45;
wire [BW_NODE_DATA-1:0] munoc_signal_33;
wire [`BW_AXI_RRESP-1:0] munoc_signal_27;
wire munoc_signal_20;
wire munoc_signal_02;
wire munoc_signal_38;

wire [BW_PLATFORM_ADDR-1:0] munoc_signal_09;
wire munoc_signal_07;
wire munoc_signal_15;
wire munoc_signal_24;
wire [BW_NODE_DATA-1:0] munoc_signal_30;
wire [BW_NODE_DATA-1:0] local_sprdata = 0;
wire local_spready = 0;
wire local_spslverr = 0;
wire munoc_signal_22;

`include "lpit_function.vb"
`include "lpimo_function.vb"
localparam  BW_LPIMO_ADDR = BW_PLATFORM_ADDR;
localparam  BW_LPIMO_DATA = BW_NODE_DATA;
localparam  BW_LPI_BURDEN = HAS_BURDEN? BW_BURDEN : 0;
`include "lpimo_lpara.vb"

wire [2-1:0] munoc_signal_01;
wire munoc_signal_25;
wire munoc_signal_06;
wire munoc_signal_17;
wire munoc_signal_44;
wire [BW_LPI_QDATA-1:0] munoc_signal_34;

wire [2-1:0] munoc_signal_28;
wire munoc_signal_35;
wire munoc_signal_13;
wire munoc_signal_42;
wire [BW_LPI_YDATA-1:0] munoc_signal_31;

MUNOC_AXI4_MASTER_NETWORK_INTERFACE_MODULE
#(
  .NAME(NAME),
  .NODE_ID(NODE_ID),
  .BW_FNI_PHIT(BW_FNI_PHIT),
  .BW_BNI_PHIT(BW_BNI_PHIT),
  .BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
  .BW_NODE_DATA(BW_NODE_DATA),
  .BW_AXI_MASTER_TID(MUNOC_LPARA_4),
  .LOCAL_ENABLE(MUNOC_LPARA_1),
  .LOCAL_UPPER_ADDR(MUNOC_LPARA_5),
  .TID_CONTROL_TYPE(TID_CONTROL_TYPE),
  .NUM_AXIAR_BUFFER(MUNOC_LPARA_2),
  .NUM_AXIAW_BUFFER(MUNOC_LPARA_6),
  .NUM_AXIW_BUFFER(MUNOC_LPARA_0),
  .NUM_AXIR_BUFFER(MUNOC_LPARA_3),
  .NUM_AXIB_BUFFER(MUNOC_LPARA_7)
)
i_munoc_instance_1
(
	.clk(clk),
	.rstnn(rstnn),

	.comm_disable(comm_disable),

	.sfni_link(sfni_link),
	.sfni_ready(sfni_ready),
	.sbni_link(sbni_link),
	.sbni_ready(sbni_ready),

	.rx4awid(munoc_signal_41),
	.rx4awaddr(munoc_signal_05),
	.rx4awlen(munoc_signal_19),
	.rx4awsize(munoc_signal_26),
	.rx4awburst(munoc_signal_16),
	.rx4awvalid(munoc_signal_11),
	.rx4awready(munoc_signal_43),

	.rx4wdata(munoc_signal_21),
	.rx4wstrb(munoc_signal_04),
	.rx4wlast(munoc_signal_40),
	.rx4wvalid(munoc_signal_46),
	.rx4wready(munoc_signal_39), 

	.rx4bid(munoc_signal_10),
	.rx4bresp(munoc_signal_32),
	.rx4bvalid(munoc_signal_14),
	.rx4bready(munoc_signal_36),

	.rx4arid(munoc_signal_12),
	.rx4araddr(munoc_signal_37),
	.rx4arlen(munoc_signal_08),
	.rx4arsize(munoc_signal_00),
	.rx4arburst(munoc_signal_29),
	.rx4arvalid(munoc_signal_47),
	.rx4arready(munoc_signal_23),

	.rx4rid(munoc_signal_45),
	.rx4rdata(munoc_signal_33),
	.rx4rresp(munoc_signal_27),
	.rx4rlast(munoc_signal_20),
	.rx4rvalid(munoc_signal_02),
	.rx4rready(munoc_signal_38),

	.local_spaddr(munoc_signal_09),
	.local_spwrite(munoc_signal_07),
	.local_spsel(munoc_signal_15),
	.local_spenable(munoc_signal_24),
	.local_spwdata(munoc_signal_30),
	.local_sprdata(local_sprdata),
	.local_spready(local_spready),
	.local_spslverr(local_spslverr),

	.local_allows_holds(munoc_signal_22),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

RVX_MODULE_104
#(
  .RVX_GPARA_1(BW_PLATFORM_ADDR),
  .RVX_GPARA_3(BW_NODE_DATA),
  .MEMORY_OPERATION_TYPE(3),
  .RVX_GPARA_2(MUNOC_LPARA_4),
  .HAS_BURDEN(HAS_BURDEN),
  .BW_BURDEN(BW_BURDEN)
)
i_munoc_instance_0
(
	.rvx_port_31(clk),
	.rvx_port_42(rstnn),
  .rvx_port_39(1'b 0),
  .rvx_port_21(1'b 1 ),

  .rvx_port_35(munoc_signal_01),
  .rvx_port_41(munoc_signal_25),
  .rvx_port_24(munoc_signal_06),
  .rvx_port_23(munoc_signal_17),
  .rvx_port_09(munoc_signal_44),
  .rvx_port_06(munoc_signal_34),

  .rvx_port_04(munoc_signal_28),
  .rvx_port_14(munoc_signal_35),
  .rvx_port_16(munoc_signal_13),
  .rvx_port_28(munoc_signal_42),
  .rvx_port_30(munoc_signal_31),

  .rvx_port_05(munoc_signal_41),
	.rvx_port_22(munoc_signal_05),
	.rvx_port_38(munoc_signal_19),
	.rvx_port_08(munoc_signal_26),
	.rvx_port_27(munoc_signal_16),
	.rvx_port_32(munoc_signal_11),
	.rvx_port_26(munoc_signal_43),

	.rvx_port_10(munoc_signal_21),
	.rvx_port_29(munoc_signal_04),
	.rvx_port_03(munoc_signal_40),
	.rvx_port_43(munoc_signal_46),
	.rvx_port_40(munoc_signal_39), 

	.rvx_port_07(munoc_signal_10),
	.rvx_port_33(munoc_signal_32),
	.rvx_port_25(munoc_signal_14),
	.rvx_port_17(munoc_signal_36),

	.rvx_port_00(munoc_signal_12),
	.rvx_port_13(munoc_signal_37),
	.rvx_port_20(munoc_signal_08),
	.rvx_port_12(munoc_signal_00),
	.rvx_port_11(munoc_signal_29),
	.rvx_port_19(munoc_signal_47),
	.rvx_port_37(munoc_signal_23),

	.rvx_port_15(munoc_signal_45),
	.rvx_port_34(munoc_signal_33),
	.rvx_port_01(munoc_signal_27),
	.rvx_port_18(munoc_signal_20),
	.rvx_port_02(munoc_signal_02),
	.rvx_port_36(munoc_signal_38)
);

assign rlmqdready = munoc_signal_01;
assign munoc_signal_25 = rlmqvalid;
assign munoc_signal_06 = 0;
assign munoc_signal_17 = 1;
assign munoc_signal_44 = ~rlmqwrite;
assign munoc_signal_34 = {rlmqburden,rlmqwrite,rlmqwpermit,rlmqwdata,rlmqaddr};

assign munoc_signal_28 = rlmydready;
assign rlmyvalid = munoc_signal_35;
assign {rlmyburden,rlmyrdata} = munoc_signal_31;

endmodule
