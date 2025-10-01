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
`include "ervp_external_peri_group_memorymap_offset.vh"





module RVX_MODULE_015
(
	rvx_port_18,
	rvx_port_15,

	rvx_port_05,
	rvx_port_22,

	rvx_port_10,
	rvx_port_23,
	rvx_port_11,
	rvx_port_19,
  rvx_port_02,
  rvx_port_03,
	rvx_port_04,

	rvx_port_01,
	rvx_port_07,
	rvx_port_20,
	rvx_port_14,

	rvx_port_17,
	rvx_port_09,

	rvx_port_08,
	rvx_port_21,
	rvx_port_00,
	rvx_port_12,
	rvx_port_24,
	rvx_port_16,

	rvx_port_13, 
	rvx_port_06, 
	rvx_port_25
);





parameter RVX_GPARA_0 = 8;

localparam  RVX_LPARA_1 = 2;
localparam  RVX_LPARA_0 = 2;

input wire rvx_port_18;
input wire rvx_port_15;

input wire rvx_port_05;
input wire [`BW_AIOIF_TYPE-1:0] rvx_port_22;

input wire [RVX_LPARA_1-1:0] rvx_port_10;
input wire [RVX_GPARA_0*RVX_LPARA_1-1:0] rvx_port_23;
input wire [RVX_LPARA_1-1:0] rvx_port_11;
output wire [RVX_GPARA_0*RVX_LPARA_1-1:0] rvx_port_19;
input wire [`BW_GPIO_VALUE*RVX_LPARA_1-1:0] rvx_port_02;
output wire [`BW_GPIO_VALUE*RVX_LPARA_1-1:0] rvx_port_03;
output wire [RVX_LPARA_1-1:0] rvx_port_04;

input wire rvx_port_01;
input wire rvx_port_07;
input wire rvx_port_20;
output wire rvx_port_14;

input wire rvx_port_17;
output wire rvx_port_09;

input wire rvx_port_08;
input wire rvx_port_21;
output wire rvx_port_00;
input wire rvx_port_12;
input wire rvx_port_24;
output wire rvx_port_16;

output reg [RVX_LPARA_0-1:0] rvx_port_13;
output reg [RVX_LPARA_0-1:0] rvx_port_06;
input wire [RVX_LPARA_0-1:0] rvx_port_25;

genvar i;

wire rvx_signal_19 [RVX_LPARA_1-1:0];
wire [RVX_GPARA_0-1:0] rvx_signal_20 [RVX_LPARA_1-1:0];
wire rvx_signal_02 [RVX_LPARA_1-1:0];
wire [RVX_GPARA_0-1:0] rvx_signal_15 [RVX_LPARA_1-1:0];
wire [`BW_GPIO_VALUE-1:0] rvx_signal_11 [RVX_LPARA_1-1:0];
wire [`BW_GPIO_VALUE-1:0] rvx_signal_21 [RVX_LPARA_1-1:0];
wire rvx_signal_04 [RVX_LPARA_1-1:0];

wire rvx_signal_08 [RVX_LPARA_1-1:0];
wire rvx_signal_07 [RVX_LPARA_1-1:0];
wire rvx_signal_00 [RVX_LPARA_1-1:0];

wire rvx_signal_03 [RVX_LPARA_0-1:0];
wire rvx_signal_05 [RVX_LPARA_0-1:0];
wire rvx_signal_14 [RVX_LPARA_0-1:0];
wire rvx_signal_16 [RVX_LPARA_0-1:0];

wire rvx_signal_17 [RVX_LPARA_0-1:0];
wire rvx_signal_09 [RVX_LPARA_0-1:0];
wire rvx_signal_18 [RVX_LPARA_0-1:0];
wire rvx_signal_10 [RVX_LPARA_0-1:0];

reg rvx_signal_01 [RVX_LPARA_0-1:0];
reg rvx_signal_06 [RVX_LPARA_0-1:0];
reg rvx_signal_12 [RVX_LPARA_0-1:0];
reg rvx_signal_13 [RVX_LPARA_0-1:0];

generate
	for(i=0; i<RVX_LPARA_1; i=i+1)
	begin : i_generate_gpio
		assign rvx_signal_19[i] = rvx_port_10[i];
		assign rvx_signal_20[i] = rvx_port_23[RVX_GPARA_0*(i+1)-1-:RVX_GPARA_0];
		assign rvx_signal_02[i] = rvx_port_11[i];
		assign rvx_port_19[RVX_GPARA_0*(i+1)-1-:RVX_GPARA_0] = rvx_signal_15[i];
    assign rvx_signal_11[i] = rvx_port_02[`BW_GPIO_VALUE*(i+1)-1-:`BW_GPIO_VALUE];
		assign rvx_port_03[`BW_GPIO_VALUE*(i+1)-1-:`BW_GPIO_VALUE] = rvx_signal_21[i];
		assign rvx_port_04[i] = rvx_signal_04[i];

		ERVP_GPIO
		#(
			.BW_DATA(RVX_GPARA_0),
			.BW_GPIO(1)
		)
		i_rvx_instance_0
		(
			.clk(rvx_port_18),
			.rstnn(rvx_port_15),

			.rwenable(rvx_signal_19[i]),
			.rwdata(rvx_signal_20[i]),
			.rrenable(rvx_signal_02[i]),
			.rrdata(rvx_signal_15[i]),
      .ruser_pinout(rvx_signal_11[i]),
      .ruser_pinin(rvx_signal_21[i]),
			.rinterrupt(rvx_signal_04[i]),
			.tick_gpio(rvx_port_05),

			.gpio_soe(rvx_signal_08[i]), 
			.gpio_soval(rvx_signal_07[i]),
			.gpio_sival(rvx_signal_00[i])
		);
	end
endgenerate

generate
	for(i=0; i<RVX_LPARA_0; i=i+1)
	begin : i_generate_port
		always@(*)
		begin
			rvx_port_13[i] = 0;
			rvx_port_06[i] = 0;
			rvx_signal_01[i] = 0;
			rvx_signal_06[i] = 0;
			rvx_signal_12[i] = 0;
			rvx_signal_13[i] = 0;

			case(rvx_port_22)
				`AIOIF_TYPE_GPIO:
				begin
					rvx_port_13[i] = rvx_signal_14[i];
					rvx_port_06[i] = rvx_signal_18[i];
					rvx_signal_12[i] = rvx_port_25[i];
				end
				`AIOIF_TYPE_SPI:
				begin
					rvx_port_13[i] = rvx_signal_03[i];
					rvx_port_06[i] = rvx_signal_17[i];
					rvx_signal_01[i] = rvx_port_25[i];
				end
				`AIOIF_TYPE_UART:
				begin
					rvx_port_13[i] = rvx_signal_05[i];
					rvx_port_06[i] = rvx_signal_09[i];
					rvx_signal_06[i] = rvx_port_25[i];
				end
				`AIOIF_TYPE_I2C:
				begin
					rvx_port_13[i] = rvx_signal_16[i];
					rvx_port_06[i] = rvx_signal_10[i];
					rvx_signal_13[i] = rvx_port_25[i];
				end
			endcase
		end
	end
endgenerate

assign rvx_signal_14[0] = rvx_signal_08[0];
assign rvx_signal_18[0] = rvx_signal_07[0];
assign rvx_signal_00[0] = rvx_signal_12[0];
assign rvx_signal_14[1] = rvx_signal_08[1];
assign rvx_signal_18[1] = rvx_signal_07[1];
assign rvx_signal_00[1] = rvx_signal_12[1];

assign rvx_signal_03[0] = 1;
assign rvx_signal_17[0] = rvx_port_07;
assign rvx_signal_03[1] = 0;
assign rvx_port_14 = rvx_signal_01[1];

assign rvx_signal_05[0] = 1;
assign rvx_signal_09[0] = rvx_port_17;
assign rvx_signal_05[1] = 0;
assign rvx_port_09 = rvx_signal_06[1];

assign rvx_signal_16[0] = ~rvx_port_08;
assign rvx_signal_10[0] = rvx_port_21;
assign rvx_port_00 = rvx_signal_13[0];

assign rvx_signal_16[1] = ~rvx_port_12;
assign rvx_signal_10[1] = rvx_port_24;
assign rvx_port_16 = rvx_signal_13[1];

endmodule
