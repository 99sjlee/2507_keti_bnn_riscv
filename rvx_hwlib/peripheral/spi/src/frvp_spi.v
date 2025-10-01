//======================================================================
//Copyright SoC Design Research Group, 2016-2017, All rights reserved.  
//Intellgent SoC Research Division
//Electronics and Telecommunications Research Institute (ETRI)
//
//THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE 
//WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS 
//TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE 
//REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL 
//SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE, 
//IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE 
//COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
//----------------------------------------------------------------------

//======================================================================
// Sukho Lee (shlee99@etri.re.kr)
//----------------------------------------------------------------------

module FRVP_SPI
(
	clk,
	rstnn,

	spi_clk,
	spi_cs,
	spi_dq0_in,
	spi_dq0_out,
	spi_dq0_oe,
	spi_dq1_in,
	spi_dq1_out,
	spi_dq1_oe,
	spi_dq2_in,
	spi_dq2_out,
	spi_dq2_oe,
	spi_dq3_in,
	spi_dq3_out,
	spi_dq3_oe,
	interrupt,

	rpslverr,
	rpready,
	rprdata,
	rpwdata,
	rpenable,
	rpsel,
	rpwrite,
	rpaddr
);

////////////////////////////
/* parameter input wire output */
////////////////////////////

localparam SYNTHESIZED_BASEADDR = 32'h 90034000;

input wire clk;
input wire rstnn;

output wire spi_clk;
output wire spi_cs;
input wire spi_dq0_in;
output wire spi_dq0_out;
output wire spi_dq0_oe;
input wire spi_dq1_in;
output wire spi_dq1_out;
output wire spi_dq1_oe;
input wire spi_dq2_in;
output wire spi_dq2_out;
output wire spi_dq2_oe;
input wire spi_dq3_in;
output wire spi_dq3_out;
output wire spi_dq3_oe;
output wire interrupt;

output wire rpslverr;
output wire rpready;
output wire [31:0] rprdata;
input wire [31:0] rpwdata;
input wire rpenable;
input wire rpsel;
input wire rpwrite;
input wire [31:0] rpaddr;

/////////////
/* signals */
/////////////

genvar i;

wire io_tl_r_0_a_ready;
wire io_tl_r_0_a_valid;
wire [2:0] io_tl_r_0_a_bits_opcode;
wire [2:0] io_tl_r_0_a_bits_param;
wire [1:0] io_tl_r_0_a_bits_size;
wire [5:0] io_tl_r_0_a_bits_source;
wire [28:0] io_tl_r_0_a_bits_address;
wire [3:0] io_tl_r_0_a_bits_mask;
wire [31:0] io_tl_r_0_a_bits_data;
wire io_tl_r_0_b_ready;
wire io_tl_r_0_b_valid = 0;
wire [2:0] io_tl_r_0_b_bits_opcode = 0;
wire [1:0] io_tl_r_0_b_bits_param = 0;
wire [1:0] io_tl_r_0_b_bits_size = 0;
wire [5:0] io_tl_r_0_b_bits_source = 0;
wire [28:0] io_tl_r_0_b_bits_address = 0;
wire [3:0] io_tl_r_0_b_bits_mask = 0;
wire [31:0] io_tl_r_0_b_bits_data = 0;
wire io_tl_r_0_c_ready = 1;
wire io_tl_r_0_c_valid;
wire [2:0] io_tl_r_0_c_bits_opcode;
wire [2:0] io_tl_r_0_c_bits_param;
wire [1:0] io_tl_r_0_c_bits_size;
wire [5:0] io_tl_r_0_c_bits_source;
wire [28:0] io_tl_r_0_c_bits_address;
wire [31:0] io_tl_r_0_c_bits_data;
wire io_tl_r_0_c_bits_error;
wire io_tl_r_0_d_ready;
wire io_tl_r_0_d_valid;
wire [2:0] io_tl_r_0_d_bits_opcode;
wire [1:0] io_tl_r_0_d_bits_param = 0;
wire [1:0] io_tl_r_0_d_bits_size;
wire [5:0] io_tl_r_0_d_bits_source;
wire io_tl_r_0_d_bits_sink = 0;
wire [0:0] io_tl_r_0_d_bits_addr_lo = 0;
wire [31:0] io_tl_r_0_d_bits_data;
wire io_tl_r_0_d_bits_error = 0;
wire io_tl_r_0_e_ready = 1;
wire io_tl_r_0_e_valid;
wire io_tl_r_0_e_bits_sink;

wire auto_io_out_sck;
wire auto_io_out_dq_0_i;
wire auto_io_out_dq_0_o;
wire auto_io_out_dq_0_oe;
wire auto_io_out_dq_1_i;
wire auto_io_out_dq_1_o;
wire auto_io_out_dq_1_oe;
wire auto_io_out_dq_2_i;
wire auto_io_out_dq_2_o;
wire auto_io_out_dq_2_oe;
wire auto_io_out_dq_3_i;
wire auto_io_out_dq_3_o;
wire auto_io_out_dq_3_oe;
wire auto_io_out_cs_0;
wire auto_io_out_cs_1;
wire auto_io_out_cs_2;
wire auto_io_out_cs_3;

////////////
/* logics */
////////////

RVX_MODULE_012 
#(
	.RVX_GPARA_3(32),
	.RVX_GPARA_6(32),
	.RVX_GPARA_8(29),
	.RVX_GPARA_1(32),
	.RVX_GPARA_7(6),
	.RVX_GPARA_5(2),
	.RVX_GPARA_0(1),
	.RVX_GPARA_2(SYNTHESIZED_BASEADDR),
	.RVX_GPARA_4(8)
)
ervp_apb2tilelink
(
	.rvx_port_11(clk),
	.rvx_port_25(rstnn),

	.rvx_port_05(rpsel),
	.rvx_port_01(rpenable),
	.rvx_port_06(rpaddr),
	.rvx_port_22(rpwrite),
	.rvx_port_08(rpwdata),
	.rvx_port_30(rprdata),
	.rvx_port_34(rpready),
	.rvx_port_09(rpslverr),

	.rvx_port_04(io_tl_r_0_a_ready),
	.rvx_port_32(io_tl_r_0_a_valid),
	.rvx_port_47(io_tl_r_0_a_bits_opcode),
	.rvx_port_28(io_tl_r_0_a_bits_param),
	.rvx_port_39(io_tl_r_0_a_bits_size),
	.rvx_port_48(io_tl_r_0_a_bits_source),
	.rvx_port_46(io_tl_r_0_a_bits_address),
	.rvx_port_03(io_tl_r_0_a_bits_mask),
	.rvx_port_31(io_tl_r_0_a_bits_data),
	.rvx_port_43(io_tl_r_0_b_ready),
	.rvx_port_44(io_tl_r_0_b_valid),
	.rvx_port_10(io_tl_r_0_b_bits_opcode),
	.rvx_port_35(io_tl_r_0_b_bits_param),
	.rvx_port_33(io_tl_r_0_b_bits_size),
	.rvx_port_07(io_tl_r_0_b_bits_source),
	.rvx_port_27(io_tl_r_0_b_bits_address),
	.rvx_port_49(io_tl_r_0_b_bits_mask),
	.rvx_port_19(io_tl_r_0_b_bits_data),
	.rvx_port_45(io_tl_r_0_c_ready),
	.rvx_port_42(io_tl_r_0_c_valid),
	.rvx_port_00(io_tl_r_0_c_bits_opcode),
	.rvx_port_29(io_tl_r_0_c_bits_param),
	.rvx_port_21(io_tl_r_0_c_bits_size),
	.rvx_port_40(io_tl_r_0_c_bits_source),
	.rvx_port_23(io_tl_r_0_c_bits_address),
	.rvx_port_12(io_tl_r_0_c_bits_data),
	.rvx_port_14(io_tl_r_0_c_bits_error),
	.rvx_port_36(io_tl_r_0_d_ready),
	.rvx_port_26(io_tl_r_0_d_valid),
	.rvx_port_41(io_tl_r_0_d_bits_opcode),
	.rvx_port_17(io_tl_r_0_d_bits_param),
	.rvx_port_18(io_tl_r_0_d_bits_size),
	.rvx_port_37(io_tl_r_0_d_bits_source),
	.rvx_port_16(io_tl_r_0_d_bits_sink),
	.rvx_port_38(io_tl_r_0_d_bits_addr_lo),
	.rvx_port_02(io_tl_r_0_d_bits_data),
	.rvx_port_15(io_tl_r_0_d_bits_error),
	.rvx_port_13(io_tl_r_0_e_ready),
	.rvx_port_20(io_tl_r_0_e_valid),
	.rvx_port_24(io_tl_r_0_e_bits_sink)
);

frvp_spi_TLSPI_1 spi4(
	.clock(clk),
	.reset(~rstnn),
	.auto_int_xing_out_sync_0(interrupt),
	.auto_control_xing_in_a_ready(io_tl_r_0_a_ready),
	.auto_control_xing_in_a_valid(io_tl_r_0_a_valid),
	.auto_control_xing_in_a_bits_opcode(io_tl_r_0_a_bits_opcode),
	.auto_control_xing_in_a_bits_param(io_tl_r_0_a_bits_param),
	.auto_control_xing_in_a_bits_size(io_tl_r_0_a_bits_size),
	.auto_control_xing_in_a_bits_source(io_tl_r_0_a_bits_source),
	.auto_control_xing_in_a_bits_address(io_tl_r_0_a_bits_address),
	.auto_control_xing_in_a_bits_mask(io_tl_r_0_a_bits_mask),
	.auto_control_xing_in_a_bits_data(io_tl_r_0_a_bits_data),
	.auto_control_xing_in_a_bits_corrupt(1'b0),
	.auto_control_xing_in_d_ready(io_tl_r_0_d_ready),
	.auto_control_xing_in_d_valid(io_tl_r_0_d_valid),
	.auto_control_xing_in_d_bits_opcode(io_tl_r_0_d_bits_opcode),
	.auto_control_xing_in_d_bits_size(io_tl_r_0_d_bits_size),
	.auto_control_xing_in_d_bits_source(io_tl_r_0_d_bits_source),
	.auto_control_xing_in_d_bits_data(io_tl_r_0_d_bits_data),

	.auto_io_out_sck(auto_io_out_sck),
	.auto_io_out_cs_0(auto_io_out_cs_0),
	.auto_io_out_cs_1(auto_io_out_cs_1),
	.auto_io_out_cs_2(auto_io_out_cs_2),
	.auto_io_out_cs_3(auto_io_out_cs_3),
	.auto_io_out_dq_0_i(auto_io_out_dq_0_i),
	.auto_io_out_dq_0_o(auto_io_out_dq_0_o),
	.auto_io_out_dq_0_oe(auto_io_out_dq_0_oe),
	.auto_io_out_dq_1_i(auto_io_out_dq_1_i),
	.auto_io_out_dq_1_o(auto_io_out_dq_1_o),
	.auto_io_out_dq_1_oe(auto_io_out_dq_1_oe),
	.auto_io_out_dq_2_i(auto_io_out_dq_2_i),
	.auto_io_out_dq_2_o(auto_io_out_dq_2_o),
	.auto_io_out_dq_2_oe(auto_io_out_dq_2_oe),
	.auto_io_out_dq_3_i(auto_io_out_dq_3_i),
	.auto_io_out_dq_3_o(auto_io_out_dq_3_o),
	.auto_io_out_dq_3_oe(auto_io_out_dq_3_oe)
);

assign spi_cs = auto_io_out_cs_0;
assign spi_clk = auto_io_out_sck;

assign auto_io_out_dq_0_i = spi_dq0_in;
assign spi_dq0_out = auto_io_out_dq_0_o;
assign spi_dq0_oe = auto_io_out_dq_0_oe;
assign auto_io_out_dq_1_i = spi_dq1_in;
assign spi_dq1_out = auto_io_out_dq_1_o;
assign spi_dq1_oe = auto_io_out_dq_1_oe;
assign auto_io_out_dq_2_i = spi_dq2_in;
assign spi_dq2_out = auto_io_out_dq_2_o;
assign spi_dq2_oe = auto_io_out_dq_2_oe;
assign auto_io_out_dq_3_i = spi_dq3_in;
assign spi_dq3_out = auto_io_out_dq_3_o;
assign spi_dq3_oe = auto_io_out_dq_3_oe;

endmodule
