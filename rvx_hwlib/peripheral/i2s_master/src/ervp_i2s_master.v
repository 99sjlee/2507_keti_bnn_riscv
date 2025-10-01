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
`include "rvx_include_23.vh"
`include "platform_info.vh"



module ERVP_I2S_MASTER
(
	clk,
	rstnn,

	i2s_tx_mclk,
	i2s_tx_lrck,
	i2s_tx_sclk,
	i2s_tx_dout,
	i2s_rx_mclk,
	i2s_rx_lrck,
	i2s_rx_sclk,
	i2s_rx_din,
	rx_interrupt,

	rpsel,
	rpenable,
	rpaddr,
	rpwrite,
	rpwdata,
	rprdata,
	rpready,
	rpslverr
);



parameter BW_ADDR = `PLATFORM_ADDR;
parameter BW_DATA = 32;
parameter SAMPLING_RATE = `I2S_SAMPLING_RATE;

localparam  RVX_LPARA_02 = SAMPLING_RATE*256;
localparam  RVX_LPARA_04 = SAMPLING_RATE;

localparam  RVX_LPARA_08 = 32*2;
localparam  RVX_LPARA_06 = RVX_LPARA_02/(RVX_LPARA_04*RVX_LPARA_08);
localparam  RVX_LPARA_00 = 24;
localparam  RVX_LPARA_07 = 16;

input wire clk, rstnn;

output wire i2s_tx_mclk;
output wire i2s_tx_lrck;
output wire i2s_tx_sclk;
output wire i2s_tx_dout;
output wire i2s_rx_mclk;
output wire i2s_rx_lrck;
output wire i2s_rx_sclk;
input wire i2s_rx_din;
output reg rx_interrupt;

input wire rpsel;
input wire rpenable;
input wire [BW_ADDR-1:0] rpaddr;
input wire rpwrite;
input wire [BW_DATA-1:0] rpwdata;
output wire [BW_DATA-1:0] rprdata;
output wire rpready;
output wire rpslverr;

wire rvx_signal_16;
wire [8-1:0] rvx_signal_25;

wire rvx_signal_19;
wire [5-1:0] rvx_signal_30;

wire [8-1:0] rvx_signal_00;

wire rvx_signal_08;
wire rvx_signal_26;
wire [32-1:0] rvx_signal_05;
wire rvx_signal_28;
wire rvx_signal_23;
wire [32-1:0] rvx_signal_03;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_34;

wire rvx_signal_11;
wire rvx_signal_33;
wire [32-1:0] rvx_signal_02;
wire rvx_signal_13;
wire rvx_signal_14;
wire [32-1:0] rvx_signal_06;
reg rvx_signal_21;
wire [32-1:0] rvx_signal_22;

wire [8-1:0] rvx_signal_04;
wire rvx_signal_36;
reg rvx_signal_31;
reg rvx_signal_32;
wire rvx_signal_18;

localparam  RVX_LPARA_09 = 2;
localparam  RVX_LPARA_01 = 0;
localparam  RVX_LPARA_05 = 2;
localparam  RVX_LPARA_03 = 3;

reg [RVX_LPARA_09-1:0] rvx_signal_35;
reg rvx_signal_15;
reg rvx_signal_12;

wire rvx_signal_27;

wire [RVX_LPARA_00-1:0] rvx_signal_01;
wire [RVX_LPARA_00-1:0] rvx_signal_24;
wire [RVX_LPARA_00-1:0] rvx_signal_17;
reg [RVX_LPARA_07-1:0] rvx_signal_07;
reg [RVX_LPARA_07-1:0] rvx_signal_09;

reg rvx_signal_29;
reg rvx_signal_10;

RVX_MODULE_013
#(
	.RVX_GPARA_0(BW_ADDR),
	.RVX_GPARA_1(BW_DATA)
)
i_rvx_instance_1
(
	.rvx_port_30(clk),
	.rvx_port_06(rstnn),

	.rvx_port_01(rpsel),
	.rvx_port_11(rpenable),
	.rvx_port_20(rpaddr),
	.rvx_port_27(rpwrite),
	.rvx_port_24(rpwdata),
	.rvx_port_21(rprdata),
	.rvx_port_08(rpready),
	.rvx_port_28(rpslverr),

	.rvx_port_22(1'b 0),
	.rvx_port_05(rvx_signal_16),
	.rvx_port_18(rvx_signal_25),
	.rvx_port_19(rvx_signal_19),
	.rvx_port_29(rvx_signal_30),
	.rvx_port_07(rvx_signal_00),
	.rvx_port_26(rvx_signal_28),
	.rvx_port_09(rvx_signal_23),
	.rvx_port_02(rvx_signal_03),
	.rvx_port_10(rvx_signal_20),
	.rvx_port_12(rvx_signal_34),
	.rvx_port_14(rvx_signal_08),
	.rvx_port_03(rvx_signal_26),
	.rvx_port_13(rvx_signal_05),

	.rvx_port_31(rvx_signal_11),
	.rvx_port_16(rvx_signal_33),
	.rvx_port_04(rvx_signal_02),
	.rvx_port_23(rvx_signal_13),
	.rvx_port_17(rvx_signal_14),
	.rvx_port_15(rvx_signal_06),
	.rvx_port_25(rvx_signal_21),
	.rvx_port_00(rvx_signal_22)
);

assign rvx_signal_04 = (rvx_signal_16==1'b 1)? rvx_signal_25 : 0;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_35 <= RVX_LPARA_01;
	else if(rvx_signal_04[`RVX_GDEF_167])
		rvx_signal_35 <= RVX_LPARA_01;
	else
		case(rvx_signal_35)
			RVX_LPARA_01:
				if(rvx_signal_04[`RVX_GDEF_422])
					rvx_signal_35 <= RVX_LPARA_05;
			RVX_LPARA_05:
				if(~rvx_signal_23)
					rvx_signal_35 <= RVX_LPARA_03;
		endcase
end

assign rvx_signal_36 = rvx_signal_35[1];

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_31 <= 0;
	else if(rvx_signal_04[`RVX_GDEF_335])
		rvx_signal_31 <= 0;
	else if(rvx_signal_04[`RVX_GDEF_246])
		rvx_signal_31 <= 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_32 <= 0;
	else if(rvx_signal_04[`RVX_GDEF_149])
		rvx_signal_32 <= 0;
	else if(rvx_signal_04[`RVX_GDEF_337])
		rvx_signal_32 <= 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rx_interrupt <= 0;
	else if(rvx_signal_04[`RVX_GDEF_172])
		rx_interrupt <= 0;
	else if(rvx_signal_32 && (rx_interrupt==0) && rvx_signal_18)
		rx_interrupt <= 1;
end

assign rvx_signal_18 = (rvx_signal_02 >= rvx_signal_00);

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_15 <= 0;
	else if(rvx_signal_04[`RVX_GDEF_130])
		rvx_signal_15 <= 0;
	else if((rvx_signal_15==0) && (rvx_signal_35==RVX_LPARA_03) && rvx_signal_20 && rvx_signal_23)
		rvx_signal_15 <= 1;
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_12 <= 0;
	else if(rvx_signal_04[`RVX_GDEF_130])
		rvx_signal_12 <= 0;
	else if((rvx_signal_15==0) && rvx_signal_21 && rvx_signal_14) 
		rvx_signal_12 <= 1;
end

assign rvx_signal_30[`RVX_GDEF_199] = rvx_signal_36;
assign rvx_signal_30[`RVX_GDEF_410] = rvx_signal_31;
assign rvx_signal_30[`RVX_GDEF_307] = rvx_signal_32;
assign rvx_signal_30[`RVX_GDEF_151] = rvx_signal_15;
assign rvx_signal_30[`RVX_GDEF_083] = rvx_signal_12;

assign rvx_signal_27 = clk;

always @(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_29 <= 0;
		rvx_signal_10 <= 0;
	end
	else
	begin
		rvx_signal_29 <= i2s_rx_lrck;
		rvx_signal_10 <= i2s_tx_lrck;
	end
end

always @(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_21 <= 0;
		rvx_signal_20 <= 0;
	end
	else
	begin
		if(rvx_signal_29 & ~i2s_rx_lrck)
			rvx_signal_21 <= 1;
		else
			rvx_signal_21 <= 0;
		if(~rvx_signal_10 & i2s_tx_lrck)
			rvx_signal_20 <= 1;
		else
			rvx_signal_20 <= 0;
	end
end

assign i2s_rx_mclk = rvx_signal_27 & rvx_signal_31;

i2s_transceiver
#(
	.mclk_sclk_ratio(RVX_LPARA_06),
	.sclk_ws_ratio(RVX_LPARA_08),
	.d_width(RVX_LPARA_00)
)
i_rvx_instance_0
(
	.reset_n(rstnn),
	.enable(rvx_signal_31),
	.mclk(i2s_rx_mclk),
	.sclk(i2s_rx_sclk),
	.ws(i2s_rx_lrck),
	.sd_rx(i2s_rx_din),
	.l_data_rx(rvx_signal_01),
	.r_data_rx(rvx_signal_24),
	.sd_tx(),
	.l_data_tx(rvx_signal_17),
	.r_data_tx(rvx_signal_17)
);

assign rvx_signal_17 = 0;
assign rvx_signal_22 = {rvx_signal_01[RVX_LPARA_00-1:8], rvx_signal_24[RVX_LPARA_00-1:8]};

assign i2s_tx_mclk = rvx_signal_27 & rvx_signal_36;
assign i2s_tx_sclk = 0;

RVX_MODULE_030
#(
	.RVX_GPARA_2(RVX_LPARA_02),
	.RVX_GPARA_1(RVX_LPARA_04),
	.RVX_GPARA_0(RVX_LPARA_07)
)
i_rvx_instance_2
(
	.rvx_port_2(rstnn)
	,.rvx_port_6(rvx_signal_36)
	,.rvx_port_3(i2s_tx_mclk)
	,.rvx_port_4(i2s_tx_lrck)
	,.rvx_port_5()
	,.rvx_port_0(i2s_tx_dout)
	,.rvx_port_1(rvx_signal_07)
	,.rvx_port_7(rvx_signal_09)
);

always @(posedge clk or negedge rstnn)
begin
	if(rstnn==0)
	begin
		rvx_signal_07 <= 0;
		rvx_signal_09 <= 0;
	end
	else
	begin
		if(rvx_signal_20)
		begin
			if(rvx_signal_28)
			begin
				rvx_signal_07 <= rvx_signal_34[31:16];
				rvx_signal_09 <= rvx_signal_34[15:0];
			end
			else
			begin
				rvx_signal_07 <= 0;
				rvx_signal_09 <= 0;
			end
		end
	end
end

endmodule
