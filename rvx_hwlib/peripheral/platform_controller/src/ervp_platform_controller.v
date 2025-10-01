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
`include "ervp_endian.vh"
`include "ervp_ahb_define.vh"
`include "ervp_platform_controller_memorymap_offset.vh"



module ERVP_PLATFORM_CONTROLLER
(
	clk,
	external_rstnn,
	boot_mode,
	jtag_select,
	initialized,
	app_finished,
	global_rstnn,
	global_rstpp,
	rstnn_seqeunce,
	rstpp_seqeunce,
	rpc_list,
	rinst_list,
	
	pjtag_rtck,
	pjtag_rtrstnn,
	pjtag_rtms,
	pjtag_rtdi,
	pjtag_rtdo,

	rstnn,
	
	shaddr,
	shburst,
	shmasterlock,
	shprot,
	shsize,
	shtrans,
	shwdata,
	shwrite,
	shrdata,
	shready,
	shresp,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr,

	noc_debug_spsel,
	noc_debug_spenable,
	noc_debug_spaddr,
	noc_debug_spwrite,
	noc_debug_spwdata,
	noc_debug_sprdata,
	noc_debug_spready,
	noc_debug_spslverr
);



parameter NUM_RESET = 1;
parameter NUM_CORE = 1;
parameter BW_ADDR = 32;
parameter BW_DATA = 32;
parameter BW_INITIALIZED = 1;
parameter ENDIAN_TYPE = `LITTLE_ENDIAN;
parameter NUM_AUTO_RESET = 1;

localparam  RVX_LPARA_0 = 3;
localparam  RVX_LPARA_1 = RVX_LPARA_0 + 1;
localparam  RVX_LPARA_3 = BW_ADDR;

input wire clk;
input wire external_rstnn;
input wire [`BW_BOOT_MODE-1:0] boot_mode;
input wire jtag_select;
input wire [BW_INITIALIZED-1:0] initialized;
output wire app_finished;
output wire global_rstnn;
output wire global_rstpp;
output wire [NUM_RESET-1:0] rstnn_seqeunce;
output wire [NUM_RESET-1:0] rstpp_seqeunce;
input wire [RVX_LPARA_3*NUM_CORE-1:0] rpc_list;
input wire [BW_ADDR*NUM_CORE-1:0] rinst_list;

input wire pjtag_rtck;
input wire pjtag_rtrstnn;
input wire pjtag_rtms;
input wire pjtag_rtdi;
output wire pjtag_rtdo;

input wire rstnn;

output wire [BW_ADDR-1:0] shaddr;
output wire [`BW_AHB_BURST-1:0] shburst;
output wire shmasterlock;
output wire [`BW_AHB_PROT-1:0] shprot;
output wire [`BW_AHB_SIZE-1:0] shsize;
output wire [`BW_AHB_TRANS-1:0] shtrans;
output wire [BW_DATA-1:0] shwdata;
output wire shwrite;

input wire [BW_DATA-1:0] shrdata;
input wire shready;
input wire shresp;

input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

output wire noc_debug_spsel;
output wire noc_debug_spenable;
output wire [BW_ADDR-1:0] noc_debug_spaddr;
output wire noc_debug_spwrite;
output wire [BW_DATA-1:0] noc_debug_spwdata;
input wire [BW_DATA-1:0] noc_debug_sprdata;
input wire noc_debug_spready;
input wire noc_debug_spslverr;

wire rvx_signal_06;

localparam  RVX_LPARA_2 = RVX_LPARA_1;

genvar i;

wire rvx_signal_37;

wire rvx_signal_09;
wire rvx_signal_39;
wire [BW_ADDR-1:0] rvx_signal_43;
wire rvx_signal_12;
wire [BW_DATA-1:0] rvx_signal_19;
wire [BW_DATA-1:0] rvx_signal_25;
wire rvx_signal_01;
wire rvx_signal_15;

wire [RVX_LPARA_2*BW_ADDR-1:0] rvx_signal_38;
wire [BW_ADDR-1:0] rvx_signal_20 [RVX_LPARA_2-1:0];

wire [RVX_LPARA_2-1:0] rvx_signal_03;
wire [RVX_LPARA_2-1:0] rvx_signal_11;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_27;
wire [RVX_LPARA_2-1:0] rvx_signal_22;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_35;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_28;
wire [RVX_LPARA_2-1:0] rvx_signal_05;
wire [RVX_LPARA_2-1:0] rvx_signal_24;

wire [RVX_LPARA_2-1:0] rvx_signal_02;
wire [RVX_LPARA_2-1:0] rvx_signal_30;
wire [BW_ADDR-1:0] rvx_signal_36 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_2-1:0] rvx_signal_21;
wire [BW_DATA-1:0] rvx_signal_08 [RVX_LPARA_2-1:0];
wire [BW_DATA-1:0] rvx_signal_41 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_2-1:0] rvx_signal_14;
wire [RVX_LPARA_2-1:0] rvx_signal_40;

wire [RVX_LPARA_2-1:0] rvx_signal_18;
wire [RVX_LPARA_2-1:0] rvx_signal_31;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_10;
wire [RVX_LPARA_2-1:0] rvx_signal_04;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_00;
wire [RVX_LPARA_2*BW_DATA-1:0] rvx_signal_32;
wire [RVX_LPARA_2-1:0] rvx_signal_34;
wire [RVX_LPARA_2-1:0] rvx_signal_42;

wire [RVX_LPARA_2-1:0] rvx_signal_16;
wire [RVX_LPARA_2-1:0] rvx_signal_33;
wire [BW_ADDR-1:0] rvx_signal_29 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_2-1:0] rvx_signal_07;
wire [BW_DATA-1:0] rvx_signal_17 [RVX_LPARA_2-1:0];
wire [BW_DATA-1:0] rvx_signal_23 [RVX_LPARA_2-1:0];
wire [RVX_LPARA_2-1:0] rvx_signal_13;
wire [RVX_LPARA_2-1:0] rvx_signal_26;

assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET] = `SUBMODULE_ADDR_ERVP_PLATFORM_CONTROLLER_RESET;
assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER] = `SUBMODULE_ADDR_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER;
assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO] = `SUBMODULE_ADDR_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO;
assign rvx_signal_20[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL] = `SUBMODULE_ADDR_ERVP_PLATFORM_CONTROLLER_EXTERNAL;

generate
	for(i=0; i<RVX_LPARA_2; i=i+1)
	begin : i_merge_baseaddr
		assign rvx_signal_38[BW_ADDR*(i+1)-1 -:BW_ADDR] = rvx_signal_20[i];
	end
endgenerate

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_2),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1),
	.BW_SEL_INDEX(`BW_SEL_ERVP_PLATFORM_CONTROLLER_SUBMODULE)
)
i_rvx_instance_3
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rpsel),
	.rpenable(rpenable),
	.rpaddr(rpaddr),
	.rpwrite(rpwrite),
	.rpwdata(rpwdata),
	.rprdata(rprdata),
	.rpready(rpready),
	.rpslverr(rpslverr),
	.rpbaseaddr_list(rvx_signal_38),

	.spsel_list(rvx_signal_03),
	.spenable_list(rvx_signal_11),
	.spaddr_list(rvx_signal_27),
	.spwrite_list(rvx_signal_22),
	.spwdata_list(rvx_signal_35),
	.sprdata_list(rvx_signal_28),
	.spready_list(rvx_signal_05),
	.spslverr_list(rvx_signal_24)
);

generate
	for(i=0; i<RVX_LPARA_2; i=i+1)
	begin : i_split_and_merge_normal
		assign rvx_signal_02[i] = rvx_signal_03[i];
		assign rvx_signal_30[i] = rvx_signal_11[i];
		assign rvx_signal_36[i] = rvx_signal_27[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_21[i] = rvx_signal_22[i];
		assign rvx_signal_08[i] = rvx_signal_35[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_28[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_41[i];
		assign rvx_signal_05[i] = rvx_signal_14[i];
		assign rvx_signal_24[i] = rvx_signal_40[i];
	end
endgenerate

ERVP_APB_BUS
#(
	.NUM_MODULE(RVX_LPARA_2),
	.BW_ADDR(BW_ADDR),
	.BW_DATA(BW_DATA),
	.SEL_UPPER_INDEX(`BW_MMAP_OFFSET_ERVP_PLATFORM_CONTROLLER-1),
	.BW_SEL_INDEX(`BW_SEL_ERVP_PLATFORM_CONTROLLER_SUBMODULE)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),

	.rpsel(rvx_signal_09),
	.rpenable(rvx_signal_39),
	.rpaddr(rvx_signal_43),
	.rpwrite(rvx_signal_12),
	.rpwdata(rvx_signal_19),
	.rprdata(rvx_signal_25),
	.rpready(rvx_signal_01),
	.rpslverr(rvx_signal_15),
	.rpbaseaddr_list(rvx_signal_38),

	.spsel_list(rvx_signal_18),
	.spenable_list(rvx_signal_31),
	.spaddr_list(rvx_signal_10),
	.spwrite_list(rvx_signal_04),
	.spwdata_list(rvx_signal_00),
	.sprdata_list(rvx_signal_32),
	.spready_list(rvx_signal_34),
	.spslverr_list(rvx_signal_42)
);

generate
	for(i=0; i<RVX_LPARA_2; i=i+1)
	begin : i_split_and_merge_debug
		assign rvx_signal_16[i] = rvx_signal_18[i];
		assign rvx_signal_33[i] = rvx_signal_31[i];
		assign rvx_signal_29[i] = rvx_signal_10[BW_ADDR*(i+1)-1 -:BW_ADDR];
		assign rvx_signal_07[i] = rvx_signal_04[i];
		assign rvx_signal_17[i] = rvx_signal_00[BW_DATA*(i+1)-1 -:BW_DATA];
		assign rvx_signal_32[BW_DATA*(i+1)-1 -:BW_DATA] = rvx_signal_23[i];
		assign rvx_signal_34[i] = rvx_signal_13[i];
		assign rvx_signal_42[i] = rvx_signal_26[i];
	end
endgenerate

RVX_MODULE_033
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_1(BW_DATA),
	.RVX_GPARA_2(ENDIAN_TYPE)
)
i_rvx_instance_0
(
	.rvx_port_05(global_rstnn),

	.rvx_port_02(pjtag_rtck),
	.rvx_port_12(pjtag_rtrstnn),
	.rvx_port_10(pjtag_rtms),
	.rvx_port_18(pjtag_rtdi),
	.rvx_port_01(pjtag_rtdo),
	.rvx_port_17(rvx_signal_06),

	.rvx_port_24(clk),

	.rvx_port_08(shaddr),
	.rvx_port_06(shburst),
	.rvx_port_23(shmasterlock),
	.rvx_port_00(shprot),
	.rvx_port_03(shsize),
	.rvx_port_26(shtrans),
	.rvx_port_22(shwdata),
	.rvx_port_04(shwrite),
	.rvx_port_13(shrdata),
	.rvx_port_20(shready),
	.rvx_port_09(shresp),

	.rvx_port_21(rvx_signal_09),
	.rvx_port_15(rvx_signal_39),
	.rvx_port_16(rvx_signal_43),
	.rvx_port_14(rvx_signal_12),
	.rvx_port_25(rvx_signal_19),
	.rvx_port_19(rvx_signal_25),
	.rvx_port_11(rvx_signal_01),
	.rvx_port_07(rvx_signal_15)
);

RVX_MODULE_003
#(
	.RVX_GPARA_1(0),
	.RVX_GPARA_0(NUM_RESET),
	.RVX_GPARA_2(NUM_AUTO_RESET),
	.RVX_GPARA_4(BW_DATA),
	.RVX_GPARA_3(ENDIAN_TYPE)
)
i_rvx_instance_4
(
	.rvx_port_14(clk),
	.rvx_port_04(external_rstnn),
	.rvx_port_00(global_rstnn),
	.rvx_port_07(global_rstpp),
	.rvx_port_06(boot_mode),
	.rvx_port_11(jtag_select),
	.rvx_port_05(1'b 1),
	.rvx_port_03(rstnn_seqeunce),
	.rvx_port_02(rstpp_seqeunce),
	.rvx_port_09(rvx_signal_37),

	.rvx_port_01(rvx_signal_16[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET]),
	.rvx_port_13(rvx_signal_33[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET]),
	.rvx_port_17(rvx_signal_29[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET]),
	.rvx_port_10(rvx_signal_07[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET]),
	.rvx_port_08(rvx_signal_17[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET]),
	.rvx_port_16(rvx_signal_23[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET]),
	.rvx_port_15(rvx_signal_13[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET]),
	.rvx_port_12(rvx_signal_26[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET])
);

assign rvx_signal_41[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET] = 0;
assign rvx_signal_14[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET] = 1;
assign rvx_signal_40[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_RESET] = 1;

RVX_MODULE_099
#(
	.RVX_GPARA_4(NUM_CORE),
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_2(ENDIAN_TYPE),
	.RVX_GPARA_1(ENDIAN_TYPE),
	.RVX_GPARA_3(BW_INITIALIZED)
)
i_rvx_instance_2
(
	.rvx_port_19(clk),
	.rvx_port_18(rstnn),

	.rvx_port_16(boot_mode),
	.rvx_port_11(jtag_select),
	.rvx_port_03(initialized),
	.rvx_port_04(rvx_signal_37),
	.rvx_port_10(app_finished),
	.rvx_port_02(rpc_list),
	.rvx_port_00(rinst_list),

	.rvx_port_06(rvx_signal_02[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_17(rvx_signal_30[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_14(rvx_signal_36[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_20(rvx_signal_21[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_08(rvx_signal_08[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_12(rvx_signal_41[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_15(rvx_signal_14[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_01(rvx_signal_40[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),

	.rvx_port_22(rvx_signal_16[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_09(rvx_signal_33[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_07(rvx_signal_29[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_05(rvx_signal_07[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_13(rvx_signal_17[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_24(rvx_signal_23[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_21(rvx_signal_13[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER]),
	.rvx_port_23(rvx_signal_26[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_PLATFORM_REGISTER])
);

RVX_MODULE_065
#(
	.RVX_GPARA_1(BW_ADDR),
	.RVX_GPARA_0(ENDIAN_TYPE),
	.RVX_GPARA_2(ENDIAN_TYPE)
)
i_rvx_instance_5
(
	.rvx_port_04(clk),
	.rvx_port_16(rstnn),

	.rvx_port_12(rvx_signal_02[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_15(rvx_signal_30[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_09(rvx_signal_36[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_06(rvx_signal_21[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_03(rvx_signal_08[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_17(rvx_signal_41[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_01(rvx_signal_14[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_08(rvx_signal_40[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),

	.rvx_port_07(rvx_signal_16[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_05(rvx_signal_33[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_02(rvx_signal_29[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_10(rvx_signal_07[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_00(rvx_signal_17[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_11(rvx_signal_23[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_13(rvx_signal_13[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO]),
	.rvx_port_14(rvx_signal_26[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_DESIGN_INFO])
);

assign noc_debug_spsel = rvx_signal_16[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL];
assign noc_debug_spenable = rvx_signal_33[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL];
assign noc_debug_spaddr = rvx_signal_29[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL];
assign noc_debug_spwrite = rvx_signal_07[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL];
assign noc_debug_spwdata = rvx_signal_17[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL];
assign rvx_signal_23[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL] = noc_debug_sprdata;
assign rvx_signal_13[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL] = noc_debug_spready;
assign rvx_signal_26[`SUBMODULE_INDEX_ERVP_PLATFORM_CONTROLLER_EXTERNAL] = noc_debug_spslverr;

endmodule
