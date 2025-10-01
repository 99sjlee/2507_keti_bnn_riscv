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



module MUNOC_XMI_MASTER_NETWORK_INTERFACE_MODULE_ASYNCH
(
	clk_master,
	rstnn_master,
	clk_network,
	rstnn_network,

	comm_disable,
	
	sfni_link,
	sfni_ready,
	sbni_link,
	sbni_ready,

	rlxqdready,
  rlxqvalid,
  rlxqlast,
  rlxqwrite,
  rlxqlen,
  rlxqsize,
  rlxqburst,
  rlxqwstrb,
  rlxqwdata,
  rlxqaddr,
  rlxqburden,
  rlxydready,
  rlxyvalid,
  rlxylast,
  rlxywreply,
  rlxyresp,
  rlxyrdata,
  rlxyburden,

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

localparam  MUNOC_LPARA_00 = 2;
localparam  MUNOC_LPARA_02 = 2;
localparam  MUNOC_LPARA_08 = 2;
localparam  MUNOC_LPARA_07 = 2;
localparam  MUNOC_LPARA_03 = 2;

localparam  MUNOC_LPARA_01 = BW_PLATFORM_ADDR;
localparam  MUNOC_LPARA_06 = BW_NODE_DATA;
localparam  MUNOC_LPARA_04 = BW_BURDEN_NZ;
localparam  MUNOC_LPARA_09 = 0;
localparam  MUNOC_LPARA_05 = 0;

input wire clk_master, rstnn_master;
input wire clk_network, rstnn_network;

input wire comm_disable;

output wire [`BW_FNI_LINK(BW_FNI_PHIT)-1:0] sfni_link;
input wire sfni_ready;
input wire [`BW_BNI_LINK(BW_BNI_PHIT)-1:0] sbni_link;
output wire sbni_ready;

output wire [(2)-1:0] rlxqdready;
input wire rlxqvalid;
input wire rlxqlast;
input wire rlxqwrite;
input wire [`BW_AXI_ALEN-1:0] rlxqlen;
input wire [`BW_AXI_ASIZE-1:0] rlxqsize;
input wire [`BW_AXI_ABURST-1:0] rlxqburst;
input wire [`BW_AXI_WSTRB(MUNOC_LPARA_06)-1:0] rlxqwstrb;
input wire [MUNOC_LPARA_06-1:0] rlxqwdata;
input wire [MUNOC_LPARA_01-1:0] rlxqaddr;
input wire [BW_BURDEN_NZ-1:0] rlxqburden;
input wire [(2)-1:0] rlxydready;
output wire rlxyvalid;
output wire rlxylast;
output wire rlxywreply;
output wire [`BW_AXI_RESP-1:0] rlxyresp;
output wire [MUNOC_LPARA_06-1:0] rlxyrdata;
output wire [BW_BURDEN_NZ-1:0] rlxyburden;

input wire [`BW_SVRING_LINK-1:0] svri_rlink;
output wire svri_rack;
output wire [`BW_SVRING_LINK-1:0] svri_slink;
input wire svri_sack;

wire [MUNOC_LPARA_04-1:0] munoc_signal_10;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_00;
wire [`BW_AXI_ALEN-1:0] munoc_signal_01;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_12;
wire [`BW_AXI_ABURST-1:0] munoc_signal_37;
wire munoc_signal_32;
wire munoc_signal_18;

wire [MUNOC_LPARA_04-1:0] munoc_signal_40;
wire [BW_NODE_DATA-1:0] munoc_signal_38;
wire [`BW_AXI_WSTRB(BW_NODE_DATA)-1:0] munoc_signal_48;
wire munoc_signal_19;
wire munoc_signal_13;
wire munoc_signal_20;

wire [MUNOC_LPARA_04-1:0] munoc_signal_31;
wire [`BW_AXI_BRESP-1:0] munoc_signal_08;
wire munoc_signal_43;
wire munoc_signal_41;

wire [MUNOC_LPARA_04-1:0] munoc_signal_02;
wire [BW_PLATFORM_ADDR-1:0] munoc_signal_11;
wire [`BW_AXI_ALEN-1:0] munoc_signal_21;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_25;
wire [`BW_AXI_ABURST-1:0] munoc_signal_03;
wire munoc_signal_30;
wire munoc_signal_44;

wire [MUNOC_LPARA_04-1:0] munoc_signal_24;
wire [BW_NODE_DATA-1:0] munoc_signal_16;
wire [`BW_AXI_RRESP-1:0] munoc_signal_33;
wire munoc_signal_09;
wire munoc_signal_06;
wire munoc_signal_17;

wire [BW_PLATFORM_ADDR-1:0] munoc_signal_07;
wire munoc_signal_39;
wire munoc_signal_36;
wire munoc_signal_15;
wire [BW_NODE_DATA-1:0] munoc_signal_23;
wire [BW_NODE_DATA-1:0] local_sprdata = 0;
wire local_spready = 0;
wire local_spslverr = 0;
wire munoc_signal_45;

`include "lpit_function.vb"
`include "lpixm_function.vb"
localparam  BW_LPIXM_ADDR = BW_PLATFORM_ADDR;
localparam  BW_LPIXM_DATA = BW_NODE_DATA;
localparam  BW_LPI_BURDEN = HAS_BURDEN? BW_BURDEN : 0;
`include "lpixm_lpara.vb"

wire [2-1:0] munoc_signal_05;
wire munoc_signal_27;
wire munoc_signal_14;
wire munoc_signal_04;
wire munoc_signal_35;
wire [BW_LPI_QDATA-1:0] munoc_signal_46;

wire [2-1:0] munoc_signal_28;
wire munoc_signal_34;
wire munoc_signal_29;
wire munoc_signal_22;
wire [BW_LPI_YDATA-1:0] munoc_signal_49;

 MUNOC_AXI4_MASTER_NETWORK_INTERFACE_MODULE_ASYNCH
 #(
  .NAME(NAME),
  .NODE_ID(NODE_ID),
  .BW_FNI_PHIT(BW_FNI_PHIT),
  .BW_BNI_PHIT(BW_BNI_PHIT),
  .BW_PLATFORM_ADDR(BW_PLATFORM_ADDR),
  .BW_NODE_DATA(BW_NODE_DATA),
  .BW_AXI_MASTER_TID(MUNOC_LPARA_04),
  .LOCAL_ENABLE(MUNOC_LPARA_09),
  .LOCAL_UPPER_ADDR(MUNOC_LPARA_05),
  .TID_CONTROL_TYPE(TID_CONTROL_TYPE),
  .NUM_AXIAR_BUFFER(MUNOC_LPARA_00),
  .NUM_AXIAW_BUFFER(MUNOC_LPARA_02),
  .NUM_AXIW_BUFFER(MUNOC_LPARA_08),
  .NUM_AXIR_BUFFER(MUNOC_LPARA_07),
  .NUM_AXIB_BUFFER(MUNOC_LPARA_03)
)
i_munoc_instance_1
(
	.clk_master(clk_master),
	.rstnn_master(rstnn_master),
	.clk_network(clk_network),
	.rstnn_network(rstnn_network),

	.comm_disable(comm_disable),
	
	.sfni_link(sfni_link),
	.sfni_ready(sfni_ready),
	.sbni_link(sbni_link),
	.sbni_ready(sbni_ready),

	.rx4awid(munoc_signal_10),
	.rx4awaddr(munoc_signal_00),
	.rx4awlen(munoc_signal_01),
	.rx4awsize(munoc_signal_12),
	.rx4awburst(munoc_signal_37),
	.rx4awvalid(munoc_signal_32),
	.rx4awready(munoc_signal_18),

	.rx4wdata(munoc_signal_38),
	.rx4wstrb(munoc_signal_48),
	.rx4wlast(munoc_signal_19),
	.rx4wvalid(munoc_signal_13),
	.rx4wready(munoc_signal_20), 

	.rx4bid(munoc_signal_31),
	.rx4bresp(munoc_signal_08),
	.rx4bvalid(munoc_signal_43),
	.rx4bready(munoc_signal_41),

	.rx4arid(munoc_signal_02),
	.rx4araddr(munoc_signal_11),
	.rx4arlen(munoc_signal_21),
	.rx4arsize(munoc_signal_25),
	.rx4arburst(munoc_signal_03),
	.rx4arvalid(munoc_signal_30),
	.rx4arready(munoc_signal_44),

	.rx4rid(munoc_signal_24),
	.rx4rdata(munoc_signal_16),
	.rx4rresp(munoc_signal_33),
	.rx4rlast(munoc_signal_09),
	.rx4rvalid(munoc_signal_06),
	.rx4rready(munoc_signal_17),

	.local_spaddr(munoc_signal_07),
	.local_spwrite(munoc_signal_39),
	.local_spsel(munoc_signal_36),
	.local_spenable(munoc_signal_15),
	.local_spwdata(munoc_signal_23),
	.local_sprdata(local_sprdata),
	.local_spready(local_spready),
	.local_spslverr(local_spslverr),

	.local_allows_holds(munoc_signal_45),

	.svri_rlink(svri_rlink),
	.svri_rack(svri_rack),
	.svri_slink(svri_slink),
	.svri_sack(svri_sack)
);

RVX_MODULE_035
#(
  .RVX_GPARA_3(MUNOC_LPARA_01),
  .RVX_GPARA_1(MUNOC_LPARA_06),
  .RVX_GPARA_2(MUNOC_LPARA_04),
  .MEMORY_OPERATION_TYPE(3),
  .HAS_BURDEN(HAS_BURDEN),
  .BW_BURDEN(BW_LPI_BURDEN)
)
i_munoc_instance_0
(
	.rvx_port_36(clk_master),
	.rvx_port_02(rstnn_master),
  .rvx_port_18(1'b 0),
  .rvx_port_21(1'b 1 ),

  .rvx_port_27(munoc_signal_05),
  .rvx_port_04(munoc_signal_27),
  .rvx_port_43(munoc_signal_14),
  .rvx_port_30(munoc_signal_04),
  .rvx_port_25(munoc_signal_35),
  .rvx_port_28(munoc_signal_46),

  .rvx_port_31(munoc_signal_28),
  .rvx_port_16(munoc_signal_34),
  .rvx_port_00(munoc_signal_29),
  .rvx_port_10(munoc_signal_22),
  .rvx_port_32(munoc_signal_49),

  .rvx_port_29(munoc_signal_10),
	.rvx_port_12(munoc_signal_00),
	.rvx_port_41(munoc_signal_01),
	.rvx_port_37(munoc_signal_12),
	.rvx_port_24(munoc_signal_37),
	.rvx_port_42(munoc_signal_32),
	.rvx_port_26(munoc_signal_18),

	.rvx_port_44(munoc_signal_40),
  .rvx_port_05(munoc_signal_38),
	.rvx_port_20(munoc_signal_48),
	.rvx_port_35(munoc_signal_19),
	.rvx_port_23(munoc_signal_13),
	.rvx_port_08(munoc_signal_20), 

	.rvx_port_09(munoc_signal_31),
	.rvx_port_22(munoc_signal_08),
	.rvx_port_17(munoc_signal_43),
	.rvx_port_39(munoc_signal_41),

	.rvx_port_19(munoc_signal_02),
	.rvx_port_01(munoc_signal_11),
	.rvx_port_13(munoc_signal_21),
	.rvx_port_34(munoc_signal_25),
	.rvx_port_15(munoc_signal_03),
	.rvx_port_40(munoc_signal_30),
	.rvx_port_14(munoc_signal_44),

	.rvx_port_38(munoc_signal_24),
	.rvx_port_07(munoc_signal_16),
	.rvx_port_33(munoc_signal_33),
	.rvx_port_03(munoc_signal_09),
	.rvx_port_06(munoc_signal_06),
	.rvx_port_11(munoc_signal_17)
);

assign rlxqdready = munoc_signal_05;
assign munoc_signal_27 = rlxqvalid;
assign munoc_signal_14 = 0;
assign munoc_signal_04 = rlxqlast;
assign munoc_signal_35 = (~rlxqwrite) | rlxqlast;
assign munoc_signal_46 = {rlxqburden,rlxqwrite,rlxqlen,rlxqsize,rlxqburst,rlxqwstrb,rlxqwdata,rlxqaddr};

assign munoc_signal_28 = rlxydready;
assign rlxyvalid = munoc_signal_34;
assign rlxylast = munoc_signal_22;
assign {rlxyburden,rlxywreply,rlxyresp,rlxyrdata} = munoc_signal_49;

endmodule
