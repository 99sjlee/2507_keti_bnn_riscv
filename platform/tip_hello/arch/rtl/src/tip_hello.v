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
// 2025-08-05
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_platform_controller_memorymap_offset.vh"
`include "ervp_external_peri_group_memorymap_offset.vh"
`include "memorymap_info.vh"
`include "ervp_global.vh"
`include "platform_info.vh"
`include "munoc_network_include.vh"

module TIP_HELLO
(
	external_clk_0,
	external_clk_0_pair,
	external_rstnn,
	pjtag_rtck,
	pjtag_rtrstnn,
	pjtag_rtms,
	pjtag_rtdi,
	pjtag_rtdo,
	printf_tx,
	printf_rx
	`include "user_ddr4_port_dec.vh"
	`include "fast_dram_cell_port_dec.vh"
);


input wire external_clk_0;
input wire external_clk_0_pair;
input wire external_rstnn;
input wire pjtag_rtck;
input wire pjtag_rtrstnn;
input wire pjtag_rtms;
input wire pjtag_rtdi;
output wire pjtag_rtdo;
output wire printf_tx;
input wire printf_rx;

`include "user_ddr4_port_def.vh"
`include "fast_dram_cell_port_def.vh"


wire clk_system;
wire clk_core;
wire clk_system_external;
wire clk_system_debug;
wire clk_local_access;
wire clk_process_000;
wire clk_dram_if;
wire clk_dram_sys;
wire clk_dram_ref;
wire clk_noc;
wire gclk_system;
wire gclk_core;
wire gclk_system_external;
wire gclk_system_debug;
wire gclk_local_access;
wire gclk_process_000;
wire gclk_noc;
wire tick_1us;
wire tick_62d5ms;
wire tick_gpio;
wire spi_common_sclk;
wire spi_common_sdq0;
wire global_rstnn;
wire global_rstpp;
wire [(6)-1:0] rstnn_seqeunce;
wire [(6)-1:0] rstpp_seqeunce;
wire rstnn_user;
wire rstpp_user;
wire i_rtl_clk_system;
wire i_rtl_clk_core;
wire i_rtl_clk_system_external;
wire i_rtl_clk_system_debug;
wire i_rtl_clk_local_access;
wire i_rtl_clk_process_000;
wire i_rtl_clk_dram_if;
wire i_rtl_clk_dram_sys;
wire i_rtl_clk_dram_ref;
wire i_rtl_clk_noc;
wire i_rtl_gclk_system;
wire i_rtl_gclk_core;
wire i_rtl_gclk_system_external;
wire i_rtl_gclk_system_debug;
wire i_rtl_gclk_local_access;
wire i_rtl_gclk_process_000;
wire i_rtl_gclk_noc;
wire i_rtl_tick_1us;
wire i_rtl_tick_62d5ms;
wire i_rtl_tick_gpio;
wire i_rtl_spi_common_sclk;
wire i_rtl_spi_common_sdq0;
wire i_rtl_external_rstnn;
wire i_rtl_global_rstnn;
wire i_rtl_global_rstpp;
wire [(6)-1:0] i_rtl_rstnn_seqeunce;
wire [(6)-1:0] i_rtl_rstpp_seqeunce;
wire i_rtl_rstnn_user;
wire i_rtl_rstpp_user;
wire i_rtl_U_BNN_TOP_slave_clk;
wire i_rtl_U_BNN_TOP_slave_rstnn;
wire i_rtl_U_BNN_TOP_master_clk;
wire i_rtl_U_BNN_TOP_master_rstnn;
wire i_rtl_i_user_ddr4_rstnn_sys;
wire i_rtl_i_user_ddr4_clk_dram_if;
wire i_rtl_i_user_ddr4_rstnn_dram_if;
wire i_rtl_i_user_ddr4_initialized;
wire i_rtl_i_system_ddr_clk_ref;
wire i_rtl_i_system_ddr_clk_sys;
wire i_rtl_i_system_ddr_rstnn_sys;
wire i_rtl_i_system_ddr_clk_dram_if;
wire i_rtl_i_system_ddr_rstnn_dram_if;
wire i_rtl_i_system_ddr_initialized;
wire i_rtl_i_pll0_external_rstnn;
wire i_rtl_i_pll0_clk_system;
wire i_rtl_i_pll0_clk_dram_sys;
wire i_rtl_i_pll0_clk_dram_ref;
wire i_rtl_i_system_sram_clk;
wire i_rtl_i_system_sram_rstnn;
wire i_rtl_pjtag_rtck;
wire i_rtl_pjtag_rtrstnn;
wire i_rtl_pjtag_rtms;
wire i_rtl_pjtag_rtdi;
wire i_rtl_pjtag_rtdo;
wire i_rtl_printf_tx;
wire i_rtl_printf_rx;
wire i_rtl_U_BNN_TOP_slave_spsel;
wire i_rtl_U_BNN_TOP_slave_spenable;
wire i_rtl_U_BNN_TOP_slave_spwrite;
wire [(32)-1:0] i_rtl_U_BNN_TOP_slave_spaddr;
wire [(32)-1:0] i_rtl_U_BNN_TOP_slave_spwdata;
wire i_rtl_U_BNN_TOP_slave_spready;
wire [(32)-1:0] i_rtl_U_BNN_TOP_slave_sprdata;
wire i_rtl_U_BNN_TOP_slave_spslverr;
wire i_rtl_U_BNN_TOP_master_rxawready;
wire i_rtl_U_BNN_TOP_master_rxawvalid;
wire [(32)-1:0] i_rtl_U_BNN_TOP_master_rxawaddr;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxawid;
wire [(8)-1:0] i_rtl_U_BNN_TOP_master_rxawlen;
wire [(3)-1:0] i_rtl_U_BNN_TOP_master_rxawsize;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxawburst;
wire i_rtl_U_BNN_TOP_master_rxwready;
wire i_rtl_U_BNN_TOP_master_rxwvalid;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxwid;
wire [(64)-1:0] i_rtl_U_BNN_TOP_master_rxwdata;
wire [(64/8)-1:0] i_rtl_U_BNN_TOP_master_rxwstrb;
wire i_rtl_U_BNN_TOP_master_rxwlast;
wire i_rtl_U_BNN_TOP_master_rxbready;
wire i_rtl_U_BNN_TOP_master_rxbvalid;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxbid;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxbresp;
wire i_rtl_U_BNN_TOP_master_rxarready;
wire i_rtl_U_BNN_TOP_master_rxarvalid;
wire [(32)-1:0] i_rtl_U_BNN_TOP_master_rxaraddr;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxarid;
wire [(8)-1:0] i_rtl_U_BNN_TOP_master_rxarlen;
wire [(3)-1:0] i_rtl_U_BNN_TOP_master_rxarsize;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxarburst;
wire i_rtl_U_BNN_TOP_master_rxrready;
wire i_rtl_U_BNN_TOP_master_rxrvalid;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxrid;
wire [(64)-1:0] i_rtl_U_BNN_TOP_master_rxrdata;
wire i_rtl_U_BNN_TOP_master_rxrlast;
wire [(2)-1:0] i_rtl_U_BNN_TOP_master_rxrresp;
wire i_rtl_i_user_ddr4_sxawready;
wire i_rtl_i_user_ddr4_sxawvalid;
wire [(32)-1:0] i_rtl_i_user_ddr4_sxawaddr;
wire [(16)-1:0] i_rtl_i_user_ddr4_sxawid;
wire [(8)-1:0] i_rtl_i_user_ddr4_sxawlen;
wire [(3)-1:0] i_rtl_i_user_ddr4_sxawsize;
wire [(2)-1:0] i_rtl_i_user_ddr4_sxawburst;
wire i_rtl_i_user_ddr4_sxwready;
wire i_rtl_i_user_ddr4_sxwvalid;
wire [(16)-1:0] i_rtl_i_user_ddr4_sxwid;
wire [(128)-1:0] i_rtl_i_user_ddr4_sxwdata;
wire [(128/8)-1:0] i_rtl_i_user_ddr4_sxwstrb;
wire i_rtl_i_user_ddr4_sxwlast;
wire i_rtl_i_user_ddr4_sxbready;
wire i_rtl_i_user_ddr4_sxbvalid;
wire [(16)-1:0] i_rtl_i_user_ddr4_sxbid;
wire [(2)-1:0] i_rtl_i_user_ddr4_sxbresp;
wire i_rtl_i_user_ddr4_sxarready;
wire i_rtl_i_user_ddr4_sxarvalid;
wire [(32)-1:0] i_rtl_i_user_ddr4_sxaraddr;
wire [(16)-1:0] i_rtl_i_user_ddr4_sxarid;
wire [(8)-1:0] i_rtl_i_user_ddr4_sxarlen;
wire [(3)-1:0] i_rtl_i_user_ddr4_sxarsize;
wire [(2)-1:0] i_rtl_i_user_ddr4_sxarburst;
wire i_rtl_i_user_ddr4_sxrready;
wire i_rtl_i_user_ddr4_sxrvalid;
wire [(16)-1:0] i_rtl_i_user_ddr4_sxrid;
wire [(128)-1:0] i_rtl_i_user_ddr4_sxrdata;
wire i_rtl_i_user_ddr4_sxrlast;
wire [(2)-1:0] i_rtl_i_user_ddr4_sxrresp;
wire i_rtl_i_system_ddr_sxawready;
wire i_rtl_i_system_ddr_sxawvalid;
wire [(32)-1:0] i_rtl_i_system_ddr_sxawaddr;
wire [(16)-1:0] i_rtl_i_system_ddr_sxawid;
wire [(8)-1:0] i_rtl_i_system_ddr_sxawlen;
wire [(3)-1:0] i_rtl_i_system_ddr_sxawsize;
wire [(2)-1:0] i_rtl_i_system_ddr_sxawburst;
wire i_rtl_i_system_ddr_sxwready;
wire i_rtl_i_system_ddr_sxwvalid;
wire [(16)-1:0] i_rtl_i_system_ddr_sxwid;
wire [(128)-1:0] i_rtl_i_system_ddr_sxwdata;
wire [(128/8)-1:0] i_rtl_i_system_ddr_sxwstrb;
wire i_rtl_i_system_ddr_sxwlast;
wire i_rtl_i_system_ddr_sxbready;
wire i_rtl_i_system_ddr_sxbvalid;
wire [(16)-1:0] i_rtl_i_system_ddr_sxbid;
wire [(2)-1:0] i_rtl_i_system_ddr_sxbresp;
wire i_rtl_i_system_ddr_sxarready;
wire i_rtl_i_system_ddr_sxarvalid;
wire [(32)-1:0] i_rtl_i_system_ddr_sxaraddr;
wire [(16)-1:0] i_rtl_i_system_ddr_sxarid;
wire [(8)-1:0] i_rtl_i_system_ddr_sxarlen;
wire [(3)-1:0] i_rtl_i_system_ddr_sxarsize;
wire [(2)-1:0] i_rtl_i_system_ddr_sxarburst;
wire i_rtl_i_system_ddr_sxrready;
wire i_rtl_i_system_ddr_sxrvalid;
wire [(16)-1:0] i_rtl_i_system_ddr_sxrid;
wire [(128)-1:0] i_rtl_i_system_ddr_sxrdata;
wire i_rtl_i_system_ddr_sxrlast;
wire [(2)-1:0] i_rtl_i_system_ddr_sxrresp;
wire i_rtl_i_system_sram_sxawready;
wire i_rtl_i_system_sram_sxawvalid;
wire [(32)-1:0] i_rtl_i_system_sram_sxawaddr;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_rtl_i_system_sram_sxawid;
wire [(8)-1:0] i_rtl_i_system_sram_sxawlen;
wire [(3)-1:0] i_rtl_i_system_sram_sxawsize;
wire [(2)-1:0] i_rtl_i_system_sram_sxawburst;
wire i_rtl_i_system_sram_sxwready;
wire i_rtl_i_system_sram_sxwvalid;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_rtl_i_system_sram_sxwid;
wire [(128)-1:0] i_rtl_i_system_sram_sxwdata;
wire [(128/8)-1:0] i_rtl_i_system_sram_sxwstrb;
wire i_rtl_i_system_sram_sxwlast;
wire i_rtl_i_system_sram_sxbready;
wire i_rtl_i_system_sram_sxbvalid;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_rtl_i_system_sram_sxbid;
wire [(2)-1:0] i_rtl_i_system_sram_sxbresp;
wire i_rtl_i_system_sram_sxarready;
wire i_rtl_i_system_sram_sxarvalid;
wire [(32)-1:0] i_rtl_i_system_sram_sxaraddr;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_rtl_i_system_sram_sxarid;
wire [(8)-1:0] i_rtl_i_system_sram_sxarlen;
wire [(3)-1:0] i_rtl_i_system_sram_sxarsize;
wire [(2)-1:0] i_rtl_i_system_sram_sxarburst;
wire i_rtl_i_system_sram_sxrready;
wire i_rtl_i_system_sram_sxrvalid;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_rtl_i_system_sram_sxrid;
wire [(128)-1:0] i_rtl_i_system_sram_sxrdata;
wire i_rtl_i_system_sram_sxrlast;
wire [(2)-1:0] i_rtl_i_system_sram_sxrresp;
wire U_BNN_TOP_slave_clk;
wire U_BNN_TOP_slave_rstnn;
wire U_BNN_TOP_slave_rpsel;
wire U_BNN_TOP_slave_rpenable;
wire U_BNN_TOP_slave_rpwrite;
wire [(32)-1:0] U_BNN_TOP_slave_rpaddr;
wire [(32)-1:0] U_BNN_TOP_slave_rpwdata;
wire U_BNN_TOP_slave_rpready;
wire [(32)-1:0] U_BNN_TOP_slave_rprdata;
wire U_BNN_TOP_slave_rpslverr;
wire U_BNN_TOP_master_clk;
wire U_BNN_TOP_master_rstnn;
wire U_BNN_TOP_master_sxawready;
wire U_BNN_TOP_master_sxawvalid;
wire [(32)-1:0] U_BNN_TOP_master_sxawaddr;
wire [(2)-1:0] U_BNN_TOP_master_sxawid;
wire [(8)-1:0] U_BNN_TOP_master_sxawlen;
wire [(3)-1:0] U_BNN_TOP_master_sxawsize;
wire [(2)-1:0] U_BNN_TOP_master_sxawburst;
wire U_BNN_TOP_master_sxwready;
wire U_BNN_TOP_master_sxwvalid;
wire [(2)-1:0] U_BNN_TOP_master_sxwid;
wire [(64)-1:0] U_BNN_TOP_master_sxwdata;
wire [(64/8)-1:0] U_BNN_TOP_master_sxwstrb;
wire U_BNN_TOP_master_sxwlast;
wire U_BNN_TOP_master_sxbready;
wire U_BNN_TOP_master_sxbvalid;
wire [(2)-1:0] U_BNN_TOP_master_sxbid;
wire [(2)-1:0] U_BNN_TOP_master_sxbresp;
wire U_BNN_TOP_master_sxarready;
wire U_BNN_TOP_master_sxarvalid;
wire [(32)-1:0] U_BNN_TOP_master_sxaraddr;
wire [(2)-1:0] U_BNN_TOP_master_sxarid;
wire [(8)-1:0] U_BNN_TOP_master_sxarlen;
wire [(3)-1:0] U_BNN_TOP_master_sxarsize;
wire [(2)-1:0] U_BNN_TOP_master_sxarburst;
wire U_BNN_TOP_master_sxrready;
wire U_BNN_TOP_master_sxrvalid;
wire [(2)-1:0] U_BNN_TOP_master_sxrid;
wire [(64)-1:0] U_BNN_TOP_master_sxrdata;
wire U_BNN_TOP_master_sxrlast;
wire [(2)-1:0] U_BNN_TOP_master_sxrresp;
wire i_user_ddr4_rstnn_sys;
wire i_user_ddr4_clk_dram_if;
wire i_user_ddr4_rstnn_dram_if;
wire i_user_ddr4_initialized;
wire i_user_ddr4_rxawready;
wire i_user_ddr4_rxawvalid;
wire [(32)-1:0] i_user_ddr4_rxawaddr;
wire [(16)-1:0] i_user_ddr4_rxawid;
wire [(8)-1:0] i_user_ddr4_rxawlen;
wire [(3)-1:0] i_user_ddr4_rxawsize;
wire [(2)-1:0] i_user_ddr4_rxawburst;
wire i_user_ddr4_rxwready;
wire i_user_ddr4_rxwvalid;
wire [(16)-1:0] i_user_ddr4_rxwid;
wire [(128)-1:0] i_user_ddr4_rxwdata;
wire [(128/8)-1:0] i_user_ddr4_rxwstrb;
wire i_user_ddr4_rxwlast;
wire i_user_ddr4_rxbready;
wire i_user_ddr4_rxbvalid;
wire [(16)-1:0] i_user_ddr4_rxbid;
wire [(2)-1:0] i_user_ddr4_rxbresp;
wire i_user_ddr4_rxarready;
wire i_user_ddr4_rxarvalid;
wire [(32)-1:0] i_user_ddr4_rxaraddr;
wire [(16)-1:0] i_user_ddr4_rxarid;
wire [(8)-1:0] i_user_ddr4_rxarlen;
wire [(3)-1:0] i_user_ddr4_rxarsize;
wire [(2)-1:0] i_user_ddr4_rxarburst;
wire i_user_ddr4_rxrready;
wire i_user_ddr4_rxrvalid;
wire [(16)-1:0] i_user_ddr4_rxrid;
wire [(128)-1:0] i_user_ddr4_rxrdata;
wire i_user_ddr4_rxrlast;
wire [(2)-1:0] i_user_ddr4_rxrresp;
wire i_system_ddr_clk_ref;
wire i_system_ddr_clk_sys;
wire i_system_ddr_rstnn_sys;
wire i_system_ddr_clk_dram_if;
wire i_system_ddr_rstnn_dram_if;
wire i_system_ddr_initialized;
wire i_system_ddr_rxawready;
wire i_system_ddr_rxawvalid;
wire [(32)-1:0] i_system_ddr_rxawaddr;
wire [(16)-1:0] i_system_ddr_rxawid;
wire [(8)-1:0] i_system_ddr_rxawlen;
wire [(3)-1:0] i_system_ddr_rxawsize;
wire [(2)-1:0] i_system_ddr_rxawburst;
wire i_system_ddr_rxwready;
wire i_system_ddr_rxwvalid;
wire [(16)-1:0] i_system_ddr_rxwid;
wire [(128)-1:0] i_system_ddr_rxwdata;
wire [(128/8)-1:0] i_system_ddr_rxwstrb;
wire i_system_ddr_rxwlast;
wire i_system_ddr_rxbready;
wire i_system_ddr_rxbvalid;
wire [(16)-1:0] i_system_ddr_rxbid;
wire [(2)-1:0] i_system_ddr_rxbresp;
wire i_system_ddr_rxarready;
wire i_system_ddr_rxarvalid;
wire [(32)-1:0] i_system_ddr_rxaraddr;
wire [(16)-1:0] i_system_ddr_rxarid;
wire [(8)-1:0] i_system_ddr_rxarlen;
wire [(3)-1:0] i_system_ddr_rxarsize;
wire [(2)-1:0] i_system_ddr_rxarburst;
wire i_system_ddr_rxrready;
wire i_system_ddr_rxrvalid;
wire [(16)-1:0] i_system_ddr_rxrid;
wire [(128)-1:0] i_system_ddr_rxrdata;
wire i_system_ddr_rxrlast;
wire [(2)-1:0] i_system_ddr_rxrresp;
wire i_pll0_external_clk;
wire i_pll0_external_clk_pair;
wire i_pll0_external_rstnn;
wire i_pll0_clk_system;
wire i_pll0_clk_dram_sys;
wire i_pll0_clk_dram_ref;
wire i_system_sram_clk;
wire i_system_sram_rstnn;
wire i_system_sram_rxawready;
wire i_system_sram_rxawvalid;
wire [(32)-1:0] i_system_sram_rxawaddr;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_system_sram_rxawid;
wire [(8)-1:0] i_system_sram_rxawlen;
wire [(3)-1:0] i_system_sram_rxawsize;
wire [(2)-1:0] i_system_sram_rxawburst;
wire i_system_sram_rxwready;
wire i_system_sram_rxwvalid;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_system_sram_rxwid;
wire [(128)-1:0] i_system_sram_rxwdata;
wire [(128/8)-1:0] i_system_sram_rxwstrb;
wire i_system_sram_rxwlast;
wire i_system_sram_rxbready;
wire i_system_sram_rxbvalid;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_system_sram_rxbid;
wire [(2)-1:0] i_system_sram_rxbresp;
wire i_system_sram_rxarready;
wire i_system_sram_rxarvalid;
wire [(32)-1:0] i_system_sram_rxaraddr;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_system_sram_rxarid;
wire [(8)-1:0] i_system_sram_rxarlen;
wire [(3)-1:0] i_system_sram_rxarsize;
wire [(2)-1:0] i_system_sram_rxarburst;
wire i_system_sram_rxrready;
wire i_system_sram_rxrvalid;
wire [(`REQUIRED_BW_OF_SLAVE_TID)-1:0] i_system_sram_rxrid;
wire [(128)-1:0] i_system_sram_rxrdata;
wire i_system_sram_rxrlast;
wire [(2)-1:0] i_system_sram_rxrresp;

TIP_HELLO_RTL
i_rtl
(
	.clk_system(i_rtl_clk_system),
	.clk_core(i_rtl_clk_core),
	.clk_system_external(i_rtl_clk_system_external),
	.clk_system_debug(i_rtl_clk_system_debug),
	.clk_local_access(i_rtl_clk_local_access),
	.clk_process_000(i_rtl_clk_process_000),
	.clk_dram_if(i_rtl_clk_dram_if),
	.clk_dram_sys(i_rtl_clk_dram_sys),
	.clk_dram_ref(i_rtl_clk_dram_ref),
	.clk_noc(i_rtl_clk_noc),
	.gclk_system(i_rtl_gclk_system),
	.gclk_core(i_rtl_gclk_core),
	.gclk_system_external(i_rtl_gclk_system_external),
	.gclk_system_debug(i_rtl_gclk_system_debug),
	.gclk_local_access(i_rtl_gclk_local_access),
	.gclk_process_000(i_rtl_gclk_process_000),
	.gclk_noc(i_rtl_gclk_noc),
	.tick_1us(i_rtl_tick_1us),
	.tick_62d5ms(i_rtl_tick_62d5ms),
	.tick_gpio(i_rtl_tick_gpio),
	.spi_common_sclk(i_rtl_spi_common_sclk),
	.spi_common_sdq0(i_rtl_spi_common_sdq0),
	.external_rstnn(i_rtl_external_rstnn),
	.global_rstnn(i_rtl_global_rstnn),
	.global_rstpp(i_rtl_global_rstpp),
	.rstnn_seqeunce(i_rtl_rstnn_seqeunce),
	.rstpp_seqeunce(i_rtl_rstpp_seqeunce),
	.rstnn_user(i_rtl_rstnn_user),
	.rstpp_user(i_rtl_rstpp_user),
	.U_BNN_TOP_slave_clk(i_rtl_U_BNN_TOP_slave_clk),
	.U_BNN_TOP_slave_rstnn(i_rtl_U_BNN_TOP_slave_rstnn),
	.U_BNN_TOP_master_clk(i_rtl_U_BNN_TOP_master_clk),
	.U_BNN_TOP_master_rstnn(i_rtl_U_BNN_TOP_master_rstnn),
	.i_user_ddr4_rstnn_sys(i_rtl_i_user_ddr4_rstnn_sys),
	.i_user_ddr4_clk_dram_if(i_rtl_i_user_ddr4_clk_dram_if),
	.i_user_ddr4_rstnn_dram_if(i_rtl_i_user_ddr4_rstnn_dram_if),
	.i_user_ddr4_initialized(i_rtl_i_user_ddr4_initialized),
	.i_system_ddr_clk_ref(i_rtl_i_system_ddr_clk_ref),
	.i_system_ddr_clk_sys(i_rtl_i_system_ddr_clk_sys),
	.i_system_ddr_rstnn_sys(i_rtl_i_system_ddr_rstnn_sys),
	.i_system_ddr_clk_dram_if(i_rtl_i_system_ddr_clk_dram_if),
	.i_system_ddr_rstnn_dram_if(i_rtl_i_system_ddr_rstnn_dram_if),
	.i_system_ddr_initialized(i_rtl_i_system_ddr_initialized),
	.i_pll0_external_rstnn(i_rtl_i_pll0_external_rstnn),
	.i_pll0_clk_system(i_rtl_i_pll0_clk_system),
	.i_pll0_clk_dram_sys(i_rtl_i_pll0_clk_dram_sys),
	.i_pll0_clk_dram_ref(i_rtl_i_pll0_clk_dram_ref),
	.i_system_sram_clk(i_rtl_i_system_sram_clk),
	.i_system_sram_rstnn(i_rtl_i_system_sram_rstnn),
	.pjtag_rtck(i_rtl_pjtag_rtck),
	.pjtag_rtrstnn(i_rtl_pjtag_rtrstnn),
	.pjtag_rtms(i_rtl_pjtag_rtms),
	.pjtag_rtdi(i_rtl_pjtag_rtdi),
	.pjtag_rtdo(i_rtl_pjtag_rtdo),
	.printf_tx(i_rtl_printf_tx),
	.printf_rx(i_rtl_printf_rx),
	.U_BNN_TOP_slave_spsel(i_rtl_U_BNN_TOP_slave_spsel),
	.U_BNN_TOP_slave_spenable(i_rtl_U_BNN_TOP_slave_spenable),
	.U_BNN_TOP_slave_spwrite(i_rtl_U_BNN_TOP_slave_spwrite),
	.U_BNN_TOP_slave_spaddr(i_rtl_U_BNN_TOP_slave_spaddr),
	.U_BNN_TOP_slave_spwdata(i_rtl_U_BNN_TOP_slave_spwdata),
	.U_BNN_TOP_slave_spready(i_rtl_U_BNN_TOP_slave_spready),
	.U_BNN_TOP_slave_sprdata(i_rtl_U_BNN_TOP_slave_sprdata),
	.U_BNN_TOP_slave_spslverr(i_rtl_U_BNN_TOP_slave_spslverr),
	.U_BNN_TOP_master_rxawready(i_rtl_U_BNN_TOP_master_rxawready),
	.U_BNN_TOP_master_rxawvalid(i_rtl_U_BNN_TOP_master_rxawvalid),
	.U_BNN_TOP_master_rxawaddr(i_rtl_U_BNN_TOP_master_rxawaddr),
	.U_BNN_TOP_master_rxawid(i_rtl_U_BNN_TOP_master_rxawid),
	.U_BNN_TOP_master_rxawlen(i_rtl_U_BNN_TOP_master_rxawlen),
	.U_BNN_TOP_master_rxawsize(i_rtl_U_BNN_TOP_master_rxawsize),
	.U_BNN_TOP_master_rxawburst(i_rtl_U_BNN_TOP_master_rxawburst),
	.U_BNN_TOP_master_rxwready(i_rtl_U_BNN_TOP_master_rxwready),
	.U_BNN_TOP_master_rxwvalid(i_rtl_U_BNN_TOP_master_rxwvalid),
	.U_BNN_TOP_master_rxwid(i_rtl_U_BNN_TOP_master_rxwid),
	.U_BNN_TOP_master_rxwdata(i_rtl_U_BNN_TOP_master_rxwdata),
	.U_BNN_TOP_master_rxwstrb(i_rtl_U_BNN_TOP_master_rxwstrb),
	.U_BNN_TOP_master_rxwlast(i_rtl_U_BNN_TOP_master_rxwlast),
	.U_BNN_TOP_master_rxbready(i_rtl_U_BNN_TOP_master_rxbready),
	.U_BNN_TOP_master_rxbvalid(i_rtl_U_BNN_TOP_master_rxbvalid),
	.U_BNN_TOP_master_rxbid(i_rtl_U_BNN_TOP_master_rxbid),
	.U_BNN_TOP_master_rxbresp(i_rtl_U_BNN_TOP_master_rxbresp),
	.U_BNN_TOP_master_rxarready(i_rtl_U_BNN_TOP_master_rxarready),
	.U_BNN_TOP_master_rxarvalid(i_rtl_U_BNN_TOP_master_rxarvalid),
	.U_BNN_TOP_master_rxaraddr(i_rtl_U_BNN_TOP_master_rxaraddr),
	.U_BNN_TOP_master_rxarid(i_rtl_U_BNN_TOP_master_rxarid),
	.U_BNN_TOP_master_rxarlen(i_rtl_U_BNN_TOP_master_rxarlen),
	.U_BNN_TOP_master_rxarsize(i_rtl_U_BNN_TOP_master_rxarsize),
	.U_BNN_TOP_master_rxarburst(i_rtl_U_BNN_TOP_master_rxarburst),
	.U_BNN_TOP_master_rxrready(i_rtl_U_BNN_TOP_master_rxrready),
	.U_BNN_TOP_master_rxrvalid(i_rtl_U_BNN_TOP_master_rxrvalid),
	.U_BNN_TOP_master_rxrid(i_rtl_U_BNN_TOP_master_rxrid),
	.U_BNN_TOP_master_rxrdata(i_rtl_U_BNN_TOP_master_rxrdata),
	.U_BNN_TOP_master_rxrlast(i_rtl_U_BNN_TOP_master_rxrlast),
	.U_BNN_TOP_master_rxrresp(i_rtl_U_BNN_TOP_master_rxrresp),
	.i_user_ddr4_sxawready(i_rtl_i_user_ddr4_sxawready),
	.i_user_ddr4_sxawvalid(i_rtl_i_user_ddr4_sxawvalid),
	.i_user_ddr4_sxawaddr(i_rtl_i_user_ddr4_sxawaddr),
	.i_user_ddr4_sxawid(i_rtl_i_user_ddr4_sxawid),
	.i_user_ddr4_sxawlen(i_rtl_i_user_ddr4_sxawlen),
	.i_user_ddr4_sxawsize(i_rtl_i_user_ddr4_sxawsize),
	.i_user_ddr4_sxawburst(i_rtl_i_user_ddr4_sxawburst),
	.i_user_ddr4_sxwready(i_rtl_i_user_ddr4_sxwready),
	.i_user_ddr4_sxwvalid(i_rtl_i_user_ddr4_sxwvalid),
	.i_user_ddr4_sxwid(i_rtl_i_user_ddr4_sxwid),
	.i_user_ddr4_sxwdata(i_rtl_i_user_ddr4_sxwdata),
	.i_user_ddr4_sxwstrb(i_rtl_i_user_ddr4_sxwstrb),
	.i_user_ddr4_sxwlast(i_rtl_i_user_ddr4_sxwlast),
	.i_user_ddr4_sxbready(i_rtl_i_user_ddr4_sxbready),
	.i_user_ddr4_sxbvalid(i_rtl_i_user_ddr4_sxbvalid),
	.i_user_ddr4_sxbid(i_rtl_i_user_ddr4_sxbid),
	.i_user_ddr4_sxbresp(i_rtl_i_user_ddr4_sxbresp),
	.i_user_ddr4_sxarready(i_rtl_i_user_ddr4_sxarready),
	.i_user_ddr4_sxarvalid(i_rtl_i_user_ddr4_sxarvalid),
	.i_user_ddr4_sxaraddr(i_rtl_i_user_ddr4_sxaraddr),
	.i_user_ddr4_sxarid(i_rtl_i_user_ddr4_sxarid),
	.i_user_ddr4_sxarlen(i_rtl_i_user_ddr4_sxarlen),
	.i_user_ddr4_sxarsize(i_rtl_i_user_ddr4_sxarsize),
	.i_user_ddr4_sxarburst(i_rtl_i_user_ddr4_sxarburst),
	.i_user_ddr4_sxrready(i_rtl_i_user_ddr4_sxrready),
	.i_user_ddr4_sxrvalid(i_rtl_i_user_ddr4_sxrvalid),
	.i_user_ddr4_sxrid(i_rtl_i_user_ddr4_sxrid),
	.i_user_ddr4_sxrdata(i_rtl_i_user_ddr4_sxrdata),
	.i_user_ddr4_sxrlast(i_rtl_i_user_ddr4_sxrlast),
	.i_user_ddr4_sxrresp(i_rtl_i_user_ddr4_sxrresp),
	.i_system_ddr_sxawready(i_rtl_i_system_ddr_sxawready),
	.i_system_ddr_sxawvalid(i_rtl_i_system_ddr_sxawvalid),
	.i_system_ddr_sxawaddr(i_rtl_i_system_ddr_sxawaddr),
	.i_system_ddr_sxawid(i_rtl_i_system_ddr_sxawid),
	.i_system_ddr_sxawlen(i_rtl_i_system_ddr_sxawlen),
	.i_system_ddr_sxawsize(i_rtl_i_system_ddr_sxawsize),
	.i_system_ddr_sxawburst(i_rtl_i_system_ddr_sxawburst),
	.i_system_ddr_sxwready(i_rtl_i_system_ddr_sxwready),
	.i_system_ddr_sxwvalid(i_rtl_i_system_ddr_sxwvalid),
	.i_system_ddr_sxwid(i_rtl_i_system_ddr_sxwid),
	.i_system_ddr_sxwdata(i_rtl_i_system_ddr_sxwdata),
	.i_system_ddr_sxwstrb(i_rtl_i_system_ddr_sxwstrb),
	.i_system_ddr_sxwlast(i_rtl_i_system_ddr_sxwlast),
	.i_system_ddr_sxbready(i_rtl_i_system_ddr_sxbready),
	.i_system_ddr_sxbvalid(i_rtl_i_system_ddr_sxbvalid),
	.i_system_ddr_sxbid(i_rtl_i_system_ddr_sxbid),
	.i_system_ddr_sxbresp(i_rtl_i_system_ddr_sxbresp),
	.i_system_ddr_sxarready(i_rtl_i_system_ddr_sxarready),
	.i_system_ddr_sxarvalid(i_rtl_i_system_ddr_sxarvalid),
	.i_system_ddr_sxaraddr(i_rtl_i_system_ddr_sxaraddr),
	.i_system_ddr_sxarid(i_rtl_i_system_ddr_sxarid),
	.i_system_ddr_sxarlen(i_rtl_i_system_ddr_sxarlen),
	.i_system_ddr_sxarsize(i_rtl_i_system_ddr_sxarsize),
	.i_system_ddr_sxarburst(i_rtl_i_system_ddr_sxarburst),
	.i_system_ddr_sxrready(i_rtl_i_system_ddr_sxrready),
	.i_system_ddr_sxrvalid(i_rtl_i_system_ddr_sxrvalid),
	.i_system_ddr_sxrid(i_rtl_i_system_ddr_sxrid),
	.i_system_ddr_sxrdata(i_rtl_i_system_ddr_sxrdata),
	.i_system_ddr_sxrlast(i_rtl_i_system_ddr_sxrlast),
	.i_system_ddr_sxrresp(i_rtl_i_system_ddr_sxrresp),
	.i_system_sram_sxawready(i_rtl_i_system_sram_sxawready),
	.i_system_sram_sxawvalid(i_rtl_i_system_sram_sxawvalid),
	.i_system_sram_sxawaddr(i_rtl_i_system_sram_sxawaddr),
	.i_system_sram_sxawid(i_rtl_i_system_sram_sxawid),
	.i_system_sram_sxawlen(i_rtl_i_system_sram_sxawlen),
	.i_system_sram_sxawsize(i_rtl_i_system_sram_sxawsize),
	.i_system_sram_sxawburst(i_rtl_i_system_sram_sxawburst),
	.i_system_sram_sxwready(i_rtl_i_system_sram_sxwready),
	.i_system_sram_sxwvalid(i_rtl_i_system_sram_sxwvalid),
	.i_system_sram_sxwid(i_rtl_i_system_sram_sxwid),
	.i_system_sram_sxwdata(i_rtl_i_system_sram_sxwdata),
	.i_system_sram_sxwstrb(i_rtl_i_system_sram_sxwstrb),
	.i_system_sram_sxwlast(i_rtl_i_system_sram_sxwlast),
	.i_system_sram_sxbready(i_rtl_i_system_sram_sxbready),
	.i_system_sram_sxbvalid(i_rtl_i_system_sram_sxbvalid),
	.i_system_sram_sxbid(i_rtl_i_system_sram_sxbid),
	.i_system_sram_sxbresp(i_rtl_i_system_sram_sxbresp),
	.i_system_sram_sxarready(i_rtl_i_system_sram_sxarready),
	.i_system_sram_sxarvalid(i_rtl_i_system_sram_sxarvalid),
	.i_system_sram_sxaraddr(i_rtl_i_system_sram_sxaraddr),
	.i_system_sram_sxarid(i_rtl_i_system_sram_sxarid),
	.i_system_sram_sxarlen(i_rtl_i_system_sram_sxarlen),
	.i_system_sram_sxarsize(i_rtl_i_system_sram_sxarsize),
	.i_system_sram_sxarburst(i_rtl_i_system_sram_sxarburst),
	.i_system_sram_sxrready(i_rtl_i_system_sram_sxrready),
	.i_system_sram_sxrvalid(i_rtl_i_system_sram_sxrvalid),
	.i_system_sram_sxrid(i_rtl_i_system_sram_sxrid),
	.i_system_sram_sxrdata(i_rtl_i_system_sram_sxrdata),
	.i_system_sram_sxrlast(i_rtl_i_system_sram_sxrlast),
	.i_system_sram_sxrresp(i_rtl_i_system_sram_sxrresp)
);

TIP_HELLO_USER_DDR4_00
i_user_ddr4
(
	.rstnn_sys(i_user_ddr4_rstnn_sys),
	.clk_dram_if(i_user_ddr4_clk_dram_if),
	.rstnn_dram_if(i_user_ddr4_rstnn_dram_if),
	.initialized(i_user_ddr4_initialized),
	.rxawready(i_user_ddr4_rxawready),
	.rxawvalid(i_user_ddr4_rxawvalid),
	.rxawaddr(i_user_ddr4_rxawaddr),
	.rxawid(i_user_ddr4_rxawid),
	.rxawlen(i_user_ddr4_rxawlen),
	.rxawsize(i_user_ddr4_rxawsize),
	.rxawburst(i_user_ddr4_rxawburst),
	.rxwready(i_user_ddr4_rxwready),
	.rxwvalid(i_user_ddr4_rxwvalid),
	.rxwid(i_user_ddr4_rxwid),
	.rxwdata(i_user_ddr4_rxwdata),
	.rxwstrb(i_user_ddr4_rxwstrb),
	.rxwlast(i_user_ddr4_rxwlast),
	.rxbready(i_user_ddr4_rxbready),
	.rxbvalid(i_user_ddr4_rxbvalid),
	.rxbid(i_user_ddr4_rxbid),
	.rxbresp(i_user_ddr4_rxbresp),
	.rxarready(i_user_ddr4_rxarready),
	.rxarvalid(i_user_ddr4_rxarvalid),
	.rxaraddr(i_user_ddr4_rxaraddr),
	.rxarid(i_user_ddr4_rxarid),
	.rxarlen(i_user_ddr4_rxarlen),
	.rxarsize(i_user_ddr4_rxarsize),
	.rxarburst(i_user_ddr4_rxarburst),
	.rxrready(i_user_ddr4_rxrready),
	.rxrvalid(i_user_ddr4_rxrvalid),
	.rxrid(i_user_ddr4_rxrid),
	.rxrdata(i_user_ddr4_rxrdata),
	.rxrlast(i_user_ddr4_rxrlast),
	.rxrresp(i_user_ddr4_rxrresp)
	`include "user_ddr4_port_mapping.vh"
);

TIP_HELLO_FAST_DRAM_01
i_system_ddr
(
	.clk_ref(i_system_ddr_clk_ref),
	.clk_sys(i_system_ddr_clk_sys),
	.rstnn_sys(i_system_ddr_rstnn_sys),
	.clk_dram_if(i_system_ddr_clk_dram_if),
	.rstnn_dram_if(i_system_ddr_rstnn_dram_if),
	.initialized(i_system_ddr_initialized),
	.rxawready(i_system_ddr_rxawready),
	.rxawvalid(i_system_ddr_rxawvalid),
	.rxawaddr(i_system_ddr_rxawaddr),
	.rxawid(i_system_ddr_rxawid),
	.rxawlen(i_system_ddr_rxawlen),
	.rxawsize(i_system_ddr_rxawsize),
	.rxawburst(i_system_ddr_rxawburst),
	.rxwready(i_system_ddr_rxwready),
	.rxwvalid(i_system_ddr_rxwvalid),
	.rxwid(i_system_ddr_rxwid),
	.rxwdata(i_system_ddr_rxwdata),
	.rxwstrb(i_system_ddr_rxwstrb),
	.rxwlast(i_system_ddr_rxwlast),
	.rxbready(i_system_ddr_rxbready),
	.rxbvalid(i_system_ddr_rxbvalid),
	.rxbid(i_system_ddr_rxbid),
	.rxbresp(i_system_ddr_rxbresp),
	.rxarready(i_system_ddr_rxarready),
	.rxarvalid(i_system_ddr_rxarvalid),
	.rxaraddr(i_system_ddr_rxaraddr),
	.rxarid(i_system_ddr_rxarid),
	.rxarlen(i_system_ddr_rxarlen),
	.rxarsize(i_system_ddr_rxarsize),
	.rxarburst(i_system_ddr_rxarburst),
	.rxrready(i_system_ddr_rxrready),
	.rxrvalid(i_system_ddr_rxrvalid),
	.rxrid(i_system_ddr_rxrid),
	.rxrdata(i_system_ddr_rxrdata),
	.rxrlast(i_system_ddr_rxrlast),
	.rxrresp(i_system_ddr_rxrresp)
	`include "fast_dram_cell_port_mapping.vh"
);

TIP_HELLO_CLOCK_PLL_0_02
i_pll0
(
	.external_clk(i_pll0_external_clk),
	.external_clk_pair(i_pll0_external_clk_pair),
	.external_rstnn(i_pll0_external_rstnn),
	.clk_system(i_pll0_clk_system),
	.clk_dram_sys(i_pll0_clk_dram_sys),
	.clk_dram_ref(i_pll0_clk_dram_ref)
);

TIP_HELLO_SRAM_AXI_03
i_system_sram
(
	.clk(i_system_sram_clk),
	.rstnn(i_system_sram_rstnn),
	.rxawready(i_system_sram_rxawready),
	.rxawvalid(i_system_sram_rxawvalid),
	.rxawaddr(i_system_sram_rxawaddr),
	.rxawid(i_system_sram_rxawid),
	.rxawlen(i_system_sram_rxawlen),
	.rxawsize(i_system_sram_rxawsize),
	.rxawburst(i_system_sram_rxawburst),
	.rxwready(i_system_sram_rxwready),
	.rxwvalid(i_system_sram_rxwvalid),
	.rxwid(i_system_sram_rxwid),
	.rxwdata(i_system_sram_rxwdata),
	.rxwstrb(i_system_sram_rxwstrb),
	.rxwlast(i_system_sram_rxwlast),
	.rxbready(i_system_sram_rxbready),
	.rxbvalid(i_system_sram_rxbvalid),
	.rxbid(i_system_sram_rxbid),
	.rxbresp(i_system_sram_rxbresp),
	.rxarready(i_system_sram_rxarready),
	.rxarvalid(i_system_sram_rxarvalid),
	.rxaraddr(i_system_sram_rxaraddr),
	.rxarid(i_system_sram_rxarid),
	.rxarlen(i_system_sram_rxarlen),
	.rxarsize(i_system_sram_rxarsize),
	.rxarburst(i_system_sram_rxarburst),
	.rxrready(i_system_sram_rxrready),
	.rxrvalid(i_system_sram_rxrvalid),
	.rxrid(i_system_sram_rxrid),
	.rxrdata(i_system_sram_rxrdata),
	.rxrlast(i_system_sram_rxrlast),
	.rxrresp(i_system_sram_rxrresp)
);

assign i_rtl_external_rstnn = external_rstnn;
assign U_BNN_TOP_slave_clk = i_rtl_U_BNN_TOP_slave_clk;
assign U_BNN_TOP_slave_rstnn = i_rtl_U_BNN_TOP_slave_rstnn;
assign U_BNN_TOP_master_clk = i_rtl_U_BNN_TOP_master_clk;
assign U_BNN_TOP_master_rstnn = i_rtl_U_BNN_TOP_master_rstnn;
assign i_user_ddr4_rstnn_sys = i_rtl_i_user_ddr4_rstnn_sys;
assign i_rtl_i_user_ddr4_clk_dram_if = i_user_ddr4_clk_dram_if;
assign i_user_ddr4_rstnn_dram_if = i_rtl_i_user_ddr4_rstnn_dram_if;
assign i_rtl_i_user_ddr4_initialized = i_user_ddr4_initialized;
assign i_system_ddr_clk_ref = i_rtl_i_system_ddr_clk_ref;
assign i_system_ddr_clk_sys = i_rtl_i_system_ddr_clk_sys;
assign i_system_ddr_rstnn_sys = i_rtl_i_system_ddr_rstnn_sys;
assign i_rtl_i_system_ddr_clk_dram_if = i_system_ddr_clk_dram_if;
assign i_system_ddr_rstnn_dram_if = i_rtl_i_system_ddr_rstnn_dram_if;
assign i_rtl_i_system_ddr_initialized = i_system_ddr_initialized;
assign i_pll0_external_clk = external_clk_0;
assign i_pll0_external_clk_pair = external_clk_0_pair;
assign i_pll0_external_rstnn = i_rtl_i_pll0_external_rstnn;
assign i_rtl_i_pll0_clk_system = i_pll0_clk_system;
assign i_rtl_i_pll0_clk_dram_sys = i_pll0_clk_dram_sys;
assign i_rtl_i_pll0_clk_dram_ref = i_pll0_clk_dram_ref;
assign i_system_sram_clk = i_rtl_i_system_sram_clk;
assign i_system_sram_rstnn = i_rtl_i_system_sram_rstnn;
assign clk_system = i_rtl_clk_system;
assign clk_core = i_rtl_clk_core;
assign clk_system_external = i_rtl_clk_system_external;
assign clk_system_debug = i_rtl_clk_system_debug;
assign clk_local_access = i_rtl_clk_local_access;
assign clk_process_000 = i_rtl_clk_process_000;
assign clk_dram_if = i_rtl_clk_dram_if;
assign clk_dram_sys = i_rtl_clk_dram_sys;
assign clk_dram_ref = i_rtl_clk_dram_ref;
assign clk_noc = i_rtl_clk_noc;
assign gclk_system = i_rtl_gclk_system;
assign gclk_core = i_rtl_gclk_core;
assign gclk_system_external = i_rtl_gclk_system_external;
assign gclk_system_debug = i_rtl_gclk_system_debug;
assign gclk_local_access = i_rtl_gclk_local_access;
assign gclk_process_000 = i_rtl_gclk_process_000;
assign gclk_noc = i_rtl_gclk_noc;
assign tick_1us = i_rtl_tick_1us;
assign tick_62d5ms = i_rtl_tick_62d5ms;
assign tick_gpio = i_rtl_tick_gpio;
assign spi_common_sclk = i_rtl_spi_common_sclk;
assign spi_common_sdq0 = i_rtl_spi_common_sdq0;
assign global_rstnn = i_rtl_global_rstnn;
assign global_rstpp = i_rtl_global_rstpp;
assign rstnn_seqeunce = i_rtl_rstnn_seqeunce;
assign rstpp_seqeunce = i_rtl_rstpp_seqeunce;
assign rstnn_user = i_rtl_rstnn_user;
assign rstpp_user = i_rtl_rstpp_user;
assign i_rtl_pjtag_rtck = pjtag_rtck;
assign i_rtl_pjtag_rtrstnn = pjtag_rtrstnn;
assign i_rtl_pjtag_rtms = pjtag_rtms;
assign i_rtl_pjtag_rtdi = pjtag_rtdi;
assign pjtag_rtdo = i_rtl_pjtag_rtdo;
assign printf_tx = i_rtl_printf_tx;
assign i_rtl_printf_rx = printf_rx;
assign U_BNN_TOP_slave_rpsel = i_rtl_U_BNN_TOP_slave_spsel;
assign U_BNN_TOP_slave_rpenable = i_rtl_U_BNN_TOP_slave_spenable;
assign U_BNN_TOP_slave_rpwrite = i_rtl_U_BNN_TOP_slave_spwrite;
assign U_BNN_TOP_slave_rpaddr = i_rtl_U_BNN_TOP_slave_spaddr;
assign U_BNN_TOP_slave_rpwdata = i_rtl_U_BNN_TOP_slave_spwdata;
assign i_rtl_U_BNN_TOP_slave_spready = U_BNN_TOP_slave_rpready;
assign i_rtl_U_BNN_TOP_slave_sprdata = U_BNN_TOP_slave_rprdata;
assign i_rtl_U_BNN_TOP_slave_spslverr = U_BNN_TOP_slave_rpslverr;
assign U_BNN_TOP_master_sxawready = i_rtl_U_BNN_TOP_master_rxawready;
assign i_rtl_U_BNN_TOP_master_rxawvalid = U_BNN_TOP_master_sxawvalid;
assign i_rtl_U_BNN_TOP_master_rxawaddr = U_BNN_TOP_master_sxawaddr;
assign i_rtl_U_BNN_TOP_master_rxawid = U_BNN_TOP_master_sxawid;
assign i_rtl_U_BNN_TOP_master_rxawlen = U_BNN_TOP_master_sxawlen;
assign i_rtl_U_BNN_TOP_master_rxawsize = U_BNN_TOP_master_sxawsize;
assign i_rtl_U_BNN_TOP_master_rxawburst = U_BNN_TOP_master_sxawburst;
assign U_BNN_TOP_master_sxwready = i_rtl_U_BNN_TOP_master_rxwready;
assign i_rtl_U_BNN_TOP_master_rxwvalid = U_BNN_TOP_master_sxwvalid;
assign i_rtl_U_BNN_TOP_master_rxwid = U_BNN_TOP_master_sxwid;
assign i_rtl_U_BNN_TOP_master_rxwdata = U_BNN_TOP_master_sxwdata;
assign i_rtl_U_BNN_TOP_master_rxwstrb = U_BNN_TOP_master_sxwstrb;
assign i_rtl_U_BNN_TOP_master_rxwlast = U_BNN_TOP_master_sxwlast;
assign i_rtl_U_BNN_TOP_master_rxbready = U_BNN_TOP_master_sxbready;
assign U_BNN_TOP_master_sxbvalid = i_rtl_U_BNN_TOP_master_rxbvalid;
assign U_BNN_TOP_master_sxbid = i_rtl_U_BNN_TOP_master_rxbid;
assign U_BNN_TOP_master_sxbresp = i_rtl_U_BNN_TOP_master_rxbresp;
assign U_BNN_TOP_master_sxarready = i_rtl_U_BNN_TOP_master_rxarready;
assign i_rtl_U_BNN_TOP_master_rxarvalid = U_BNN_TOP_master_sxarvalid;
assign i_rtl_U_BNN_TOP_master_rxaraddr = U_BNN_TOP_master_sxaraddr;
assign i_rtl_U_BNN_TOP_master_rxarid = U_BNN_TOP_master_sxarid;
assign i_rtl_U_BNN_TOP_master_rxarlen = U_BNN_TOP_master_sxarlen;
assign i_rtl_U_BNN_TOP_master_rxarsize = U_BNN_TOP_master_sxarsize;
assign i_rtl_U_BNN_TOP_master_rxarburst = U_BNN_TOP_master_sxarburst;
assign i_rtl_U_BNN_TOP_master_rxrready = U_BNN_TOP_master_sxrready;
assign U_BNN_TOP_master_sxrvalid = i_rtl_U_BNN_TOP_master_rxrvalid;
assign U_BNN_TOP_master_sxrid = i_rtl_U_BNN_TOP_master_rxrid;
assign U_BNN_TOP_master_sxrdata = i_rtl_U_BNN_TOP_master_rxrdata;
assign U_BNN_TOP_master_sxrlast = i_rtl_U_BNN_TOP_master_rxrlast;
assign U_BNN_TOP_master_sxrresp = i_rtl_U_BNN_TOP_master_rxrresp;
assign i_rtl_i_user_ddr4_sxawready = i_user_ddr4_rxawready;
assign i_user_ddr4_rxawvalid = i_rtl_i_user_ddr4_sxawvalid;
assign i_user_ddr4_rxawaddr = i_rtl_i_user_ddr4_sxawaddr;
assign i_user_ddr4_rxawid = i_rtl_i_user_ddr4_sxawid;
assign i_user_ddr4_rxawlen = i_rtl_i_user_ddr4_sxawlen;
assign i_user_ddr4_rxawsize = i_rtl_i_user_ddr4_sxawsize;
assign i_user_ddr4_rxawburst = i_rtl_i_user_ddr4_sxawburst;
assign i_rtl_i_user_ddr4_sxwready = i_user_ddr4_rxwready;
assign i_user_ddr4_rxwvalid = i_rtl_i_user_ddr4_sxwvalid;
assign i_user_ddr4_rxwid = i_rtl_i_user_ddr4_sxwid;
assign i_user_ddr4_rxwdata = i_rtl_i_user_ddr4_sxwdata;
assign i_user_ddr4_rxwstrb = i_rtl_i_user_ddr4_sxwstrb;
assign i_user_ddr4_rxwlast = i_rtl_i_user_ddr4_sxwlast;
assign i_user_ddr4_rxbready = i_rtl_i_user_ddr4_sxbready;
assign i_rtl_i_user_ddr4_sxbvalid = i_user_ddr4_rxbvalid;
assign i_rtl_i_user_ddr4_sxbid = i_user_ddr4_rxbid;
assign i_rtl_i_user_ddr4_sxbresp = i_user_ddr4_rxbresp;
assign i_rtl_i_user_ddr4_sxarready = i_user_ddr4_rxarready;
assign i_user_ddr4_rxarvalid = i_rtl_i_user_ddr4_sxarvalid;
assign i_user_ddr4_rxaraddr = i_rtl_i_user_ddr4_sxaraddr;
assign i_user_ddr4_rxarid = i_rtl_i_user_ddr4_sxarid;
assign i_user_ddr4_rxarlen = i_rtl_i_user_ddr4_sxarlen;
assign i_user_ddr4_rxarsize = i_rtl_i_user_ddr4_sxarsize;
assign i_user_ddr4_rxarburst = i_rtl_i_user_ddr4_sxarburst;
assign i_user_ddr4_rxrready = i_rtl_i_user_ddr4_sxrready;
assign i_rtl_i_user_ddr4_sxrvalid = i_user_ddr4_rxrvalid;
assign i_rtl_i_user_ddr4_sxrid = i_user_ddr4_rxrid;
assign i_rtl_i_user_ddr4_sxrdata = i_user_ddr4_rxrdata;
assign i_rtl_i_user_ddr4_sxrlast = i_user_ddr4_rxrlast;
assign i_rtl_i_user_ddr4_sxrresp = i_user_ddr4_rxrresp;
assign i_rtl_i_system_ddr_sxawready = i_system_ddr_rxawready;
assign i_system_ddr_rxawvalid = i_rtl_i_system_ddr_sxawvalid;
assign i_system_ddr_rxawaddr = i_rtl_i_system_ddr_sxawaddr;
assign i_system_ddr_rxawid = i_rtl_i_system_ddr_sxawid;
assign i_system_ddr_rxawlen = i_rtl_i_system_ddr_sxawlen;
assign i_system_ddr_rxawsize = i_rtl_i_system_ddr_sxawsize;
assign i_system_ddr_rxawburst = i_rtl_i_system_ddr_sxawburst;
assign i_rtl_i_system_ddr_sxwready = i_system_ddr_rxwready;
assign i_system_ddr_rxwvalid = i_rtl_i_system_ddr_sxwvalid;
assign i_system_ddr_rxwid = i_rtl_i_system_ddr_sxwid;
assign i_system_ddr_rxwdata = i_rtl_i_system_ddr_sxwdata;
assign i_system_ddr_rxwstrb = i_rtl_i_system_ddr_sxwstrb;
assign i_system_ddr_rxwlast = i_rtl_i_system_ddr_sxwlast;
assign i_system_ddr_rxbready = i_rtl_i_system_ddr_sxbready;
assign i_rtl_i_system_ddr_sxbvalid = i_system_ddr_rxbvalid;
assign i_rtl_i_system_ddr_sxbid = i_system_ddr_rxbid;
assign i_rtl_i_system_ddr_sxbresp = i_system_ddr_rxbresp;
assign i_rtl_i_system_ddr_sxarready = i_system_ddr_rxarready;
assign i_system_ddr_rxarvalid = i_rtl_i_system_ddr_sxarvalid;
assign i_system_ddr_rxaraddr = i_rtl_i_system_ddr_sxaraddr;
assign i_system_ddr_rxarid = i_rtl_i_system_ddr_sxarid;
assign i_system_ddr_rxarlen = i_rtl_i_system_ddr_sxarlen;
assign i_system_ddr_rxarsize = i_rtl_i_system_ddr_sxarsize;
assign i_system_ddr_rxarburst = i_rtl_i_system_ddr_sxarburst;
assign i_system_ddr_rxrready = i_rtl_i_system_ddr_sxrready;
assign i_rtl_i_system_ddr_sxrvalid = i_system_ddr_rxrvalid;
assign i_rtl_i_system_ddr_sxrid = i_system_ddr_rxrid;
assign i_rtl_i_system_ddr_sxrdata = i_system_ddr_rxrdata;
assign i_rtl_i_system_ddr_sxrlast = i_system_ddr_rxrlast;
assign i_rtl_i_system_ddr_sxrresp = i_system_ddr_rxrresp;
assign i_rtl_i_system_sram_sxawready = i_system_sram_rxawready;
assign i_system_sram_rxawvalid = i_rtl_i_system_sram_sxawvalid;
assign i_system_sram_rxawaddr = i_rtl_i_system_sram_sxawaddr;
assign i_system_sram_rxawid = i_rtl_i_system_sram_sxawid;
assign i_system_sram_rxawlen = i_rtl_i_system_sram_sxawlen;
assign i_system_sram_rxawsize = i_rtl_i_system_sram_sxawsize;
assign i_system_sram_rxawburst = i_rtl_i_system_sram_sxawburst;
assign i_rtl_i_system_sram_sxwready = i_system_sram_rxwready;
assign i_system_sram_rxwvalid = i_rtl_i_system_sram_sxwvalid;
assign i_system_sram_rxwid = i_rtl_i_system_sram_sxwid;
assign i_system_sram_rxwdata = i_rtl_i_system_sram_sxwdata;
assign i_system_sram_rxwstrb = i_rtl_i_system_sram_sxwstrb;
assign i_system_sram_rxwlast = i_rtl_i_system_sram_sxwlast;
assign i_system_sram_rxbready = i_rtl_i_system_sram_sxbready;
assign i_rtl_i_system_sram_sxbvalid = i_system_sram_rxbvalid;
assign i_rtl_i_system_sram_sxbid = i_system_sram_rxbid;
assign i_rtl_i_system_sram_sxbresp = i_system_sram_rxbresp;
assign i_rtl_i_system_sram_sxarready = i_system_sram_rxarready;
assign i_system_sram_rxarvalid = i_rtl_i_system_sram_sxarvalid;
assign i_system_sram_rxaraddr = i_rtl_i_system_sram_sxaraddr;
assign i_system_sram_rxarid = i_rtl_i_system_sram_sxarid;
assign i_system_sram_rxarlen = i_rtl_i_system_sram_sxarlen;
assign i_system_sram_rxarsize = i_rtl_i_system_sram_sxarsize;
assign i_system_sram_rxarburst = i_rtl_i_system_sram_sxarburst;
assign i_system_sram_rxrready = i_rtl_i_system_sram_sxrready;
assign i_rtl_i_system_sram_sxrvalid = i_system_sram_rxrvalid;
assign i_rtl_i_system_sram_sxrid = i_system_sram_rxrid;
assign i_rtl_i_system_sram_sxrdata = i_system_sram_rxrdata;
assign i_rtl_i_system_sram_sxrlast = i_system_sram_rxrlast;
assign i_rtl_i_system_sram_sxrresp = i_system_sram_rxrresp;

`include "tip_hello_user_region.vh"

`ifdef USE_ILA
`include "ila_description.vh"
`endif

endmodule