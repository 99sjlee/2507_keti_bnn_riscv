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
`include "ervp_trigger_cond.vh"
`include "ervp_external_peri_group_memorymap_offset.vh"



module ERVP_GPIO
(
	clk,
	rstnn,

	rwenable,
	rwdata,
	rrenable,
	rrdata,
  ruser_pinout,
  ruser_pinin,
	rinterrupt,
	tick_gpio,

	gpio_soe, 
	gpio_soval,
	gpio_sival
);



parameter BW_DATA = 32;
parameter BW_GPIO = 4;

input wire clk;
input wire rstnn;

input wire rwenable;
input wire [BW_DATA-1:0] rwdata;
input wire rrenable;
output wire [BW_DATA-1:0] rrdata;
input wire [`BW_GPIO_VALUE-1:0] ruser_pinout;
output wire [`BW_GPIO_VALUE-1:0] ruser_pinin;
output wire rinterrupt;
input wire tick_gpio;

output wire [BW_GPIO-1:0] gpio_soe;
output wire [BW_GPIO-1:0] gpio_soval;
input wire [BW_GPIO-1:0] gpio_sival;

localparam  RVX_LPARA_0 = 2;

reg [BW_GPIO-1:0] rvx_signal_05; 
wire [`BW_GPIO_CMD-1:0] rvx_signal_04;
reg [`BW_GPIO_CONFIG-1:0] rvx_signal_08;
reg [`BW_ERVP_TRIGGER_COND-1:0] rvx_signal_07;

wire rvx_signal_11;
wire rvx_signal_09;

wire [BW_GPIO-1:0] rvx_signal_10;
wire [BW_GPIO-1:0] rvx_signal_02;
wire [BW_GPIO-1:0] rvx_signal_03;

wire [BW_GPIO-1:0] rvx_signal_00;

reg [`BW_GPIO_CMD-1:0] rvx_signal_12;
wire [RVX_LPARA_0-1:0] rvx_signal_06;
wire [BW_DATA-1:0] rvx_signal_01;

assign rvx_signal_04 = rwenable? rwdata : 0;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_05 <= 0;
	else if(rvx_signal_04[`GPIO_CMD_INDEX_WE_VALUE])
		rvx_signal_05 <= rwdata[BW_DATA-1:16];
end

assign gpio_soval = rvx_signal_08[`GPIO_CONFIG_INDEX_USER_IO_SELECT]? ruser_pinout : rvx_signal_05;
assign gpio_soe = rvx_signal_08[`GPIO_CONFIG_INDEX_IS_OUTPUT_PORT]? `ALL_ONE : 0;

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
		rvx_signal_08 <= 0;
	else if(rvx_signal_04[`GPIO_CMD_INDEX_WE_CONFIG])
		rvx_signal_08 <= rwdata[BW_DATA-1:`BW_GPIO_CMD];
end

always@(posedge clk, negedge rstnn)
begin
	if(rstnn==0)
    rvx_signal_07 <= 0;
	else if(rvx_signal_04[`GPIO_CMD_INDEX_WE_ITR_COND])
    rvx_signal_07 <= rwdata[BW_DATA-1:(`BW_GPIO_CMD+`BW_GPIO_CONFIG)];
end

assign rvx_signal_11 = (~rvx_signal_08[`GPIO_CONFIG_INDEX_IS_OUTPUT_PORT]) & rvx_signal_08[`GPIO_CONFIG_INDEX_ITR_ENABLE];
assign rvx_signal_09 = (~rvx_signal_08[`GPIO_CONFIG_INDEX_IS_OUTPUT_PORT]) & rvx_signal_08[`GPIO_CONFIG_INDEX_DEBOUNCE_ENABLE];

assign ruser_pinin = rvx_signal_08[`GPIO_CONFIG_INDEX_USER_IO_SELECT]? rvx_signal_01 : 0;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(BW_GPIO)
)
i_rvx_instance_2
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(~rvx_signal_08[`GPIO_CONFIG_INDEX_IS_OUTPUT_PORT]),
	.asynch_value(gpio_sival),
	.synch_value(rvx_signal_10)
);

ERVP_DEBOUNCER
#(
	.BW_DATA(BW_GPIO)
)
i_rvx_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.enable(rvx_signal_09),
	.tick(tick_gpio),
	.input_raw(rvx_signal_10),
	.input_debounced(rvx_signal_02)
);

assign rvx_signal_03 = rvx_signal_08[`GPIO_CONFIG_INDEX_DEBOUNCE_ENABLE]? rvx_signal_02 : rvx_signal_10;

assign rvx_signal_00 = rvx_signal_08[`GPIO_CONFIG_INDEX_IS_OUTPUT_PORT]? rvx_signal_05 : rvx_signal_03;

always@(*)
begin
  rvx_signal_12 = 0;
  rvx_signal_12[`GPIO_CMD_INDEX_CLEAR_ITR] = rinterrupt;
end

assign rvx_signal_06 = 0;
assign rvx_signal_01 = rvx_signal_08[`GPIO_CONFIG_INDEX_IS_SIGNED_VALUE]? $signed(rvx_signal_00) : $unsigned(rvx_signal_00);

assign rrdata = {rvx_signal_01,rvx_signal_06,rvx_signal_07,rvx_signal_08,rvx_signal_12};

RVX_MODULE_021
#(
	.RVX_GPARA_0(BW_GPIO)
)
i_rvx_instance_0
(
	.rvx_port_2(clk),
	.rvx_port_5(rstnn),
	.rvx_port_1(rvx_signal_11),
	.rvx_port_6(rvx_signal_04[`GPIO_CMD_INDEX_CLEAR_ITR]),
	.rvx_port_4(rvx_signal_08[`GPIO_CONFIG_INDEX_IS_SIGNED_VALUE]),
	.rvx_port_0(rvx_signal_07),
	.rvx_port_7(rvx_signal_03),
	.rvx_port_8(rvx_signal_05),
	.rvx_port_3(rinterrupt)
);

endmodule
