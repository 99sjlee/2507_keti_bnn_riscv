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
`include "ervp_external_peri_group_memorymap_offset.vh"





module RVX_MODULE_032
(
	rvx_port_29,
	rvx_port_24,

	rvx_port_27,
	rvx_port_08,
	rvx_port_17,
	rvx_port_19,
	rvx_port_21,
	rvx_port_10,
	rvx_port_04,
	rvx_port_03,

	rvx_port_07,
	rvx_port_18,
	rvx_port_36,
	rvx_port_13,
	rvx_port_32,
	rvx_port_23,
	rvx_port_35,
	rvx_port_12,
	rvx_port_16,
	rvx_port_06,
	rvx_port_28,
	rvx_port_25,
	rvx_port_00,
	rvx_port_05,
	rvx_port_20,
	rvx_port_02,
	rvx_port_33,
	rvx_port_14,
	rvx_port_11,
	rvx_port_31,
	rvx_port_09,
	rvx_port_15,
	rvx_port_22,
	rvx_port_26,
	rvx_port_30,
	rvx_port_01,
	rvx_port_34
);





parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_29, rvx_port_24;
input wire rvx_port_27;
input wire rvx_port_08;
input wire [RVX_GPARA_2-1:0] rvx_port_17;
input wire rvx_port_19;
input wire [RVX_GPARA_1-1:0] rvx_port_21;
output wire [RVX_GPARA_1-1:0] rvx_port_10;
output reg rvx_port_04;
output reg rvx_port_03;

input wire rvx_port_07;

output wire [1-1:0] rvx_port_18;
output wire [1-1:0] rvx_port_36;
input wire [1-1:0] rvx_port_13;
output wire rvx_port_32;

output wire [1-1:0] rvx_port_23;
output wire [1-1:0] rvx_port_35;
input wire [1-1:0] rvx_port_12;
output wire rvx_port_16;

output wire [1-1:0] rvx_port_06;
output wire [1-1:0] rvx_port_28;
input wire [1-1:0] rvx_port_25;
output wire rvx_port_00;

output wire [1-1:0] rvx_port_05;
output wire [1-1:0] rvx_port_20;
input wire [1-1:0] rvx_port_02;
output wire rvx_port_33;

output wire [1-1:0] rvx_port_14;

output wire [1-1:0] rvx_port_11;

output wire [1-1:0] rvx_port_31;

output wire rvx_port_09;

output wire [1-1:0] rvx_port_15;

output wire [32-1:0] rvx_port_22;

output wire [32-1:0] rvx_port_26;

output wire rvx_port_30;
output wire [32-1:0] rvx_port_01;

output wire [4-1:0] rvx_port_34;

genvar i;

wire [RVX_GPARA_1-1:0] rvx_signal_82;
reg [RVX_GPARA_1-1:0] rvx_signal_11;
wire rvx_signal_72;
wire rvx_signal_01;
wire rvx_signal_69;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_17;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_63;
wire [RVX_GPARA_2-1:0] rvx_signal_85;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_78;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_57;
wire [RVX_GPARA_1-1:0] rvx_signal_79;
reg rvx_signal_33;
wire [RVX_GPARA_1-1:0] rvx_signal_36;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_dcsel_user_pinout = 0;
wire rvx_signal_06;
reg rvx_signal_21;
wire [RVX_GPARA_1-1:0] rvx_signal_34;
reg rvx_signal_67;
wire [RVX_GPARA_1-1:0] rvx_signal_49;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_rstnn_user_pinout = 0;
wire rvx_signal_73;
reg rvx_signal_22;
wire [RVX_GPARA_1-1:0] rvx_signal_61;
reg rvx_signal_08;
wire [RVX_GPARA_1-1:0] rvx_signal_53;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vbat_user_pinout = 0;
wire rvx_signal_41;
reg rvx_signal_37;
wire [RVX_GPARA_1-1:0] rvx_signal_77;
reg rvx_signal_16;
wire [RVX_GPARA_1-1:0] rvx_signal_56;
wire [`BW_GPIO_VALUE-1:0] signal_spio_oled_vdd_user_pinout = 0;
wire rvx_signal_60;
reg rvx_signal_81;
wire [1-1:0] rvx_signal_84;
reg rvx_signal_44;
wire [1-1:0] rvx_signal_12;
wire rvx_signal_64;
reg [1-1:0] rvx_signal_07;
reg rvx_signal_32;
wire [1-1:0] rvx_signal_46;
reg rvx_signal_68;
wire [1-1:0] rvx_signal_62;
wire rvx_signal_31;
reg [1-1:0] rvx_signal_25;
reg rvx_signal_13;
wire [1-1:0] rvx_signal_02;
reg rvx_signal_30;
wire [1-1:0] rvx_signal_14;
wire rvx_signal_47;
reg [1-1:0] rvx_signal_55;
reg rvx_signal_20;
wire [1-1:0] rvx_signal_19;
reg rvx_signal_15;
wire [1-1:0] rvx_signal_39;
wire rvx_signal_75;
reg rvx_signal_38;
wire [1-1:0] rvx_signal_17;
reg rvx_signal_74;
wire [1-1:0] rvx_signal_09;
wire rvx_signal_52;
reg [1-1:0] rvx_signal_50;
reg rvx_signal_27;
wire [32-1:0] rvx_signal_35;
reg rvx_signal_23;
wire [32-1:0] rvx_signal_45;
wire rvx_signal_40;
reg [32-1:0] rvx_signal_66;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_48;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_24;
wire rvx_signal_00;
reg [32-1:0] rvx_signal_04;
reg rvx_signal_83;
wire [32-1:0] rvx_signal_54;
reg rvx_signal_29;
wire [32-1:0] rvx_signal_71;
wire rvx_signal_65;
reg rvx_signal_42;
wire [4-1:0] rvx_signal_76;
reg rvx_signal_58;
wire [4-1:0] rvx_signal_51;
wire rvx_signal_80;
reg [4-1:0] rvx_signal_18;

assign rvx_signal_82 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_1,RVX_GPARA_0,rvx_port_21);
assign rvx_port_10 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_1,RVX_GPARA_0,rvx_signal_11);
assign {rvx_signal_85,rvx_signal_78} = paddr_offset;
assign rvx_signal_63 = {rvx_signal_85,addr_unused};
assign rvx_signal_69 = (rvx_signal_78==0);
assign rvx_signal_72 = rvx_port_27 & rvx_port_08 & rvx_signal_69 & (~rvx_port_19);
assign rvx_signal_01 = rvx_port_27 & rvx_port_08 & rvx_signal_69 & rvx_port_19;

assign rvx_signal_36 = $unsigned(rvx_port_21);
assign rvx_signal_49 = $unsigned(rvx_port_21);
assign rvx_signal_53 = $unsigned(rvx_port_21);
assign rvx_signal_56 = $unsigned(rvx_port_21);
assign rvx_signal_12 = $unsigned(rvx_port_21);
assign rvx_signal_62 = $unsigned(rvx_port_21);
assign rvx_signal_14 = $unsigned(rvx_port_21);
assign rvx_signal_39 = $unsigned(rvx_port_21);
assign rvx_signal_09 = $unsigned(rvx_port_21);
assign rvx_signal_45 = $unsigned(rvx_port_21);
assign rvx_signal_24 = $unsigned(rvx_port_21);
assign rvx_signal_71 = $unsigned(rvx_port_21);
assign rvx_signal_51 = $unsigned(rvx_port_21);

always@(*)
begin
	rvx_port_03 = 0;
	rvx_signal_11 = 0;
	rvx_port_04 = 1;

	rvx_signal_57 = 0;
	rvx_signal_33 = 0;

	rvx_signal_21 = 0;
	rvx_signal_67 = 0;

	rvx_signal_22 = 0;
	rvx_signal_08 = 0;

	rvx_signal_37 = 0;
	rvx_signal_16 = 0;

	rvx_signal_81 = 0;
	rvx_signal_44 = 0;

	rvx_signal_32 = 0;
	rvx_signal_68 = 0;

	rvx_signal_13 = 0;
	rvx_signal_30 = 0;

	rvx_signal_20 = 0;
	rvx_signal_15 = 0;

	rvx_signal_38 = 0;
	rvx_signal_74 = 0;

	rvx_signal_27 = 0;
	rvx_signal_23 = 0;

	rvx_signal_05 = 0;
	rvx_signal_03 = 0;

	rvx_signal_83 = 0;
	rvx_signal_29 = 0;

	rvx_signal_42 = 0;
	rvx_signal_58 = 0;

	if(rvx_port_27==1'b 1)
	begin
		case(rvx_signal_63)
			`MMAP_OFFSET_SPIO_OLED_DCSEL:
			begin
				rvx_signal_57 = rvx_signal_72;
				rvx_signal_33 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_79);
				rvx_port_04 = rvx_signal_06;
			end
			`MMAP_OFFSET_SPIO_OLED_RSTNN:
			begin
				rvx_signal_21 = rvx_signal_72;
				rvx_signal_67 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_34);
				rvx_port_04 = rvx_signal_73;
			end
			`MMAP_OFFSET_SPIO_OLED_VBAT:
			begin
				rvx_signal_22 = rvx_signal_72;
				rvx_signal_08 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_61);
				rvx_port_04 = rvx_signal_41;
			end
			`MMAP_OFFSET_SPIO_OLED_VDD:
			begin
				rvx_signal_37 = rvx_signal_72;
				rvx_signal_16 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_77);
				rvx_port_04 = rvx_signal_60;
			end
			`MMAP_OFFSET_SPIO_WIFI_RSTNN:
			begin
				rvx_signal_81 = rvx_signal_72;
				rvx_signal_44 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_84);
				rvx_port_04 = rvx_signal_64;
			end
			`MMAP_OFFSET_SPIO_WIFI_WP:
			begin
				rvx_signal_32 = rvx_signal_72;
				rvx_signal_68 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_46);
				rvx_port_04 = rvx_signal_31;
			end
			`MMAP_OFFSET_SPIO_WIFI_HIBERNATE:
			begin
				rvx_signal_13 = rvx_signal_72;
				rvx_signal_30 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_02);
				rvx_port_04 = rvx_signal_47;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_CLEAR:
			begin
				rvx_signal_20 = rvx_signal_72;
				rvx_signal_15 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_19);
				rvx_port_04 = rvx_signal_75;
			end
			`MMAP_OFFSET_SPIO_WIFI_ITR_PENDING:
			begin
				rvx_signal_38 = rvx_signal_72;
				rvx_signal_74 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_17);
				rvx_port_04 = rvx_signal_52;
			end
			`MMAP_OFFSET_SPIO_SPI_CS_ACTIVE_LOW:
			begin
				rvx_signal_27 = rvx_signal_72;
				rvx_signal_23 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_35);
				rvx_port_04 = rvx_signal_40;
			end
			`MMAP_OFFSET_SPIO_SPI_SELECT:
			begin
				rvx_signal_05 = rvx_signal_72;
				rvx_signal_03 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_48);
				rvx_port_04 = rvx_signal_00;
			end
			`MMAP_OFFSET_SPIO_AIOIF_CONFIG:
			begin
				rvx_signal_83 = rvx_signal_72;
				rvx_signal_29 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_54);
				rvx_port_04 = rvx_signal_65;
			end
			`MMAP_OFFSET_SPIO_SERIAL_COMM_CONTROL:
			begin
				rvx_signal_42 = rvx_signal_72;
				rvx_signal_58 = rvx_signal_01;
				rvx_signal_11 = $unsigned(rvx_signal_76);
				rvx_port_04 = rvx_signal_80;
			end
			default:
				rvx_port_03 = 1;
		endcase
	end
end

ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_3
(
	.clk(rvx_port_29),
	.rstnn(rvx_port_24),
	.rwenable(rvx_signal_33),
	.rwdata(rvx_signal_36),
	.rrenable(rvx_signal_57),
	.rrdata(rvx_signal_79),
	.ruser_pinout(signal_spio_oled_dcsel_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_32),
	.tick_gpio(rvx_port_07),
	.gpio_soe(rvx_port_18),
	.gpio_soval(rvx_port_36),
	.gpio_sival(rvx_port_13)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_2
(
	.clk(rvx_port_29),
	.rstnn(rvx_port_24),
	.rwenable(rvx_signal_67),
	.rwdata(rvx_signal_49),
	.rrenable(rvx_signal_21),
	.rrdata(rvx_signal_34),
	.ruser_pinout(signal_spio_oled_rstnn_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_16),
	.tick_gpio(rvx_port_07),
	.gpio_soe(rvx_port_23),
	.gpio_soval(rvx_port_35),
	.gpio_sival(rvx_port_12)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_0
(
	.clk(rvx_port_29),
	.rstnn(rvx_port_24),
	.rwenable(rvx_signal_08),
	.rwdata(rvx_signal_53),
	.rrenable(rvx_signal_22),
	.rrdata(rvx_signal_61),
	.ruser_pinout(signal_spio_oled_vbat_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_00),
	.tick_gpio(rvx_port_07),
	.gpio_soe(rvx_port_06),
	.gpio_soval(rvx_port_28),
	.gpio_sival(rvx_port_25)
);
ERVP_GPIO
#(
	.BW_DATA(RVX_GPARA_1),
	.BW_GPIO(1)
)
i_rvx_instance_1
(
	.clk(rvx_port_29),
	.rstnn(rvx_port_24),
	.rwenable(rvx_signal_16),
	.rwdata(rvx_signal_56),
	.rrenable(rvx_signal_37),
	.rrdata(rvx_signal_77),
	.ruser_pinout(signal_spio_oled_vdd_user_pinout),
	.ruser_pinin(),
	.rinterrupt(rvx_port_33),
	.tick_gpio(rvx_port_07),
	.gpio_soe(rvx_port_05),
	.gpio_soval(rvx_port_20),
	.gpio_sival(rvx_port_02)
);
always@(posedge rvx_port_29, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_07 <= `SPIO_WIFI_RSTNN_DEFAULT_VALUE;
	else if (rvx_signal_44==1'b 1)
		rvx_signal_07 <= rvx_signal_12;
end
assign rvx_signal_84 = rvx_signal_07;
always@(posedge rvx_port_29, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_25 <= `SPIO_WIFI_WP_DEFAULT_VALUE;
	else if (rvx_signal_68==1'b 1)
		rvx_signal_25 <= rvx_signal_62;
end
assign rvx_signal_46 = rvx_signal_25;
always@(posedge rvx_port_29, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_55 <= `SPIO_WIFI_HIBERNATE_DEFAULT_VALUE;
	else if (rvx_signal_30==1'b 1)
		rvx_signal_55 <= rvx_signal_14;
end
assign rvx_signal_02 = rvx_signal_55;
always@(posedge rvx_port_29, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_50 <= `SPIO_WIFI_ITR_PENDING_DEFAULT_VALUE;
	else if (rvx_signal_74==1'b 1)
		rvx_signal_50 <= rvx_signal_09;
end
assign rvx_signal_17 = rvx_signal_50;
always@(posedge rvx_port_29, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_66 <= `SPIO_SPI_CS_ACTIVE_LOW_DEFAULT_VALUE;
	else if (rvx_signal_23==1'b 1)
		rvx_signal_66 <= rvx_signal_45;
end
assign rvx_signal_35 = rvx_signal_66;
always@(posedge rvx_port_29, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_04 <= `SPIO_SPI_SELECT_DEFAULT_VALUE;
	else if (rvx_signal_03==1'b 1)
		rvx_signal_04 <= rvx_signal_24;
end
assign rvx_signal_48 = rvx_signal_04;
always@(posedge rvx_port_29, negedge rvx_port_24)
begin
	if(rvx_port_24==0)
		rvx_signal_18 <= `SPIO_SERIAL_COMM_CONTROL_DEFAULT_VALUE;
	else if (rvx_signal_58==1'b 1)
		rvx_signal_18 <= rvx_signal_51;
end
assign rvx_signal_76 = rvx_signal_18;
assign rvx_signal_06 = 1;
assign rvx_signal_73 = 1;
assign rvx_signal_41 = 1;
assign rvx_signal_60 = 1;
assign rvx_port_14 = rvx_signal_07;
assign rvx_signal_64 = 1;
assign rvx_port_11 = rvx_signal_25;
assign rvx_signal_31 = 1;
assign rvx_port_31 = rvx_signal_55;
assign rvx_signal_47 = 1;
assign rvx_port_09 = rvx_signal_15;
assign rvx_signal_19 = 0;
assign rvx_signal_75 = 1;
assign rvx_port_15 = rvx_signal_50;
assign rvx_signal_52 = 1;
assign rvx_port_22 = rvx_signal_66;
assign rvx_signal_40 = 1;
assign rvx_port_26 = rvx_signal_04;
assign rvx_signal_00 = 1;
assign rvx_signal_54 = 0;
assign rvx_port_30 = rvx_signal_29;
assign rvx_port_01 = rvx_signal_71;
assign rvx_signal_65 = 1;
assign rvx_port_34 = rvx_signal_18;
assign rvx_signal_80 = 1;

endmodule
