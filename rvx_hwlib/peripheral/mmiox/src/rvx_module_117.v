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
`include "ervp_mmiox1_memorymap_offset.vh"





module RVX_MODULE_117
(
	rvx_port_25,
	rvx_port_10,

	rvx_port_17,
	rvx_port_07,
	rvx_port_27,
	rvx_port_24,
	rvx_port_35,
	rvx_port_22,
	rvx_port_03,
	rvx_port_34,

	rvx_port_39,
	rvx_port_13,
	rvx_port_16,
	rvx_port_38,
	rvx_port_21,
	rvx_port_09,
	rvx_port_12,
	rvx_port_37,
	rvx_port_18,
	rvx_port_20,
	rvx_port_14,
	rvx_port_15,
	rvx_port_00,
	rvx_port_01,
	rvx_port_31,
	rvx_port_11,
	rvx_port_36,
	rvx_port_40,
	rvx_port_08,
	rvx_port_04,
	rvx_port_28,
	rvx_port_06,
	rvx_port_41,
	rvx_port_19,
	rvx_port_05,
	rvx_port_33,
	rvx_port_30,
	rvx_port_26,
	rvx_port_29,
	rvx_port_23,
	rvx_port_32,
	rvx_port_02
);





parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_25, rvx_port_10;
input wire rvx_port_17;
input wire rvx_port_07;
input wire [RVX_GPARA_0-1:0] rvx_port_27;
input wire rvx_port_24;
input wire [RVX_GPARA_2-1:0] rvx_port_35;
output wire [RVX_GPARA_2-1:0] rvx_port_22;
output reg rvx_port_03;
output reg rvx_port_34;

input wire rvx_port_39;

output wire rvx_port_13;
input wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_16;
output wire rvx_port_38;
output wire [`BW_MMIO_CORE_CONFIG_SAWD-1:0] rvx_port_21;

output wire rvx_port_09;
input wire [`BW_MMIO_CORE_STATUS_SAWD-1:0] rvx_port_12;

output wire rvx_port_37;
input wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_18;
output wire rvx_port_20;
output wire [`BW_MMIO_CORE_CLEAR-1:0] rvx_port_14;

output wire rvx_port_15;
input wire [`BW_MMIO_LOG_FIFO_SAWD-1:0] rvx_port_00;
input wire rvx_port_01;

output wire rvx_port_31;
output wire [`BW_MMIO_INST_FIFO_SAWD-1:0] rvx_port_11;
input wire rvx_port_36;

input wire [`BW_MMIO_INST_STATUS-1:0] rvx_port_40;

output wire rvx_port_08;
output wire [`BW_MMIO_INPUT_FIFO_SAWD-1:0] rvx_port_04;
input wire rvx_port_28;

output wire rvx_port_06;
input wire [`BW_MMIO_OUTPUT_FIFO_SAWD-1:0] rvx_port_41;
input wire rvx_port_19;

input wire [`BW_MMIO_FIFO_STATUS-1:0] rvx_port_05;

output wire rvx_port_33;
output wire [`BW_MMIO_ITR_REQUEST-1:0] rvx_port_30;
input wire rvx_port_26;

output wire rvx_port_29;
input wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_23;
output wire rvx_port_32;
output wire [`BW_MMIO_ITR_STATUS-1:0] rvx_port_02;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_28;
reg [RVX_GPARA_2-1:0] rvx_signal_55;
wire rvx_signal_32;
wire rvx_signal_23;
wire rvx_signal_47;

wire [`BW_MMAP_OFFSET_ERVP_MMIOX1-1:0] paddr_offset = rvx_port_27;
wire [`BW_MMAP_OFFSET_ERVP_MMIOX1-1:0] rvx_signal_01;
wire [RVX_GPARA_0-1:0] rvx_signal_58;
wire [`BW_UNUSED_ERVP_MMIOX1-1:0] rvx_signal_42;
wire [`BW_UNUSED_ERVP_MMIOX1-1:0] addr_unused = 0;
reg rvx_signal_48;
wire [RVX_GPARA_2-1:0] rvx_signal_38;
reg rvx_signal_57;
wire [RVX_GPARA_2-1:0] rvx_signal_63;
wire rvx_signal_30;
reg rvx_signal_50;
wire [RVX_GPARA_2-1:0] rvx_signal_25;
reg rvx_signal_62;
wire [RVX_GPARA_2-1:0] rvx_signal_21;
wire rvx_signal_07;
reg rvx_signal_60;
wire [RVX_GPARA_2-1:0] rvx_signal_65;
reg rvx_signal_46;
wire [RVX_GPARA_2-1:0] rvx_signal_59;
wire rvx_signal_00;
reg rvx_signal_15;
wire [RVX_GPARA_2-1:0] rvx_signal_31;
reg rvx_signal_44;
wire [RVX_GPARA_2-1:0] rvx_signal_12;
wire rvx_signal_05;
reg rvx_signal_35;
wire [RVX_GPARA_2-1:0] rvx_signal_08;
reg rvx_signal_27;
wire [RVX_GPARA_2-1:0] rvx_signal_29;
wire rvx_signal_14;
reg rvx_signal_03;
wire [RVX_GPARA_2-1:0] rvx_signal_43;
reg rvx_signal_20;
wire [RVX_GPARA_2-1:0] rvx_signal_51;
wire rvx_signal_52;
wire [32-1:0] rvx_signal_22;
reg rvx_signal_10;
wire [RVX_GPARA_2-1:0] rvx_signal_33;
reg rvx_signal_64;
wire [RVX_GPARA_2-1:0] rvx_signal_02;
wire rvx_signal_36;
reg rvx_signal_41;
wire [RVX_GPARA_2-1:0] rvx_signal_04;
reg rvx_signal_18;
wire [RVX_GPARA_2-1:0] rvx_signal_06;
wire rvx_signal_11;
reg rvx_signal_09;
wire [RVX_GPARA_2-1:0] rvx_signal_61;
reg rvx_signal_54;
wire [RVX_GPARA_2-1:0] rvx_signal_53;
wire rvx_signal_66;
wire [32-1:0] rvx_signal_34;
reg rvx_signal_56;
wire [RVX_GPARA_2-1:0] rvx_signal_26;
reg rvx_signal_16;
wire [RVX_GPARA_2-1:0] rvx_signal_19;
wire rvx_signal_37;
reg rvx_signal_40;
wire [RVX_GPARA_2-1:0] rvx_signal_45;
reg rvx_signal_17;
wire [RVX_GPARA_2-1:0] rvx_signal_39;
wire rvx_signal_24;

assign rvx_signal_28 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_35);
assign rvx_port_22 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_55);
assign {rvx_signal_58,rvx_signal_42} = paddr_offset;
assign rvx_signal_01 = {rvx_signal_58,addr_unused};
assign rvx_signal_47 = (rvx_signal_42==0);
assign rvx_signal_32 = rvx_port_17 & rvx_port_07 & rvx_signal_47 & (~rvx_port_24);
assign rvx_signal_23 = rvx_port_17 & rvx_port_07 & rvx_signal_47 & rvx_port_24;

assign rvx_signal_63 = $unsigned(rvx_port_35);
assign rvx_signal_21 = $unsigned(rvx_port_35);
assign rvx_signal_59 = $unsigned(rvx_port_35);
assign rvx_signal_12 = $unsigned(rvx_port_35);
assign rvx_signal_29 = $unsigned(rvx_port_35);
assign rvx_signal_51 = $unsigned(rvx_port_35);
assign rvx_signal_02 = $unsigned(rvx_port_35);
assign rvx_signal_06 = $unsigned(rvx_port_35);
assign rvx_signal_53 = $unsigned(rvx_port_35);
assign rvx_signal_19 = $unsigned(rvx_port_35);
assign rvx_signal_39 = $unsigned(rvx_port_35);

always@(*)
begin
	rvx_port_34 = 0;
	rvx_signal_55 = 0;
	rvx_port_03 = 1;

	rvx_signal_48 = 0;
	rvx_signal_57 = 0;

	rvx_signal_50 = 0;
	rvx_signal_62 = 0;

	rvx_signal_60 = 0;
	rvx_signal_46 = 0;

	rvx_signal_15 = 0;
	rvx_signal_44 = 0;

	rvx_signal_35 = 0;
	rvx_signal_27 = 0;

	rvx_signal_03 = 0;
	rvx_signal_20 = 0;

	rvx_signal_10 = 0;
	rvx_signal_64 = 0;

	rvx_signal_41 = 0;
	rvx_signal_18 = 0;

	rvx_signal_09 = 0;
	rvx_signal_54 = 0;

	rvx_signal_56 = 0;
	rvx_signal_16 = 0;

	rvx_signal_40 = 0;
	rvx_signal_17 = 0;

	if(rvx_port_17==1'b 1)
	begin
		case(rvx_signal_01)
			`MMAP_OFFSET_MMIO_CORE_CONFIG_SAWD:
			begin
				rvx_signal_48 = rvx_signal_32;
				rvx_signal_57 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_38);
				rvx_port_03 = rvx_signal_30;
			end
			`MMAP_OFFSET_MMIO_CORE_STATUS_SAWD:
			begin
				rvx_signal_50 = rvx_signal_32;
				rvx_signal_62 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_25);
				rvx_port_03 = rvx_signal_07;
			end
			`MMAP_OFFSET_MMIO_CORE_CLEAR:
			begin
				rvx_signal_60 = rvx_signal_32;
				rvx_signal_46 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_65);
				rvx_port_03 = rvx_signal_00;
			end
			`MMAP_OFFSET_MMIO_LOG_FIFO_SAWD:
			begin
				rvx_signal_15 = rvx_signal_32;
				rvx_signal_44 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_31);
				rvx_port_03 = rvx_signal_05;
			end
			`MMAP_OFFSET_MMIO_INST_FIFO_SAWD:
			begin
				rvx_signal_35 = rvx_signal_32;
				rvx_signal_27 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_08);
				rvx_port_03 = rvx_signal_14;
			end
			`MMAP_OFFSET_MMIO_INST_STATUS:
			begin
				rvx_signal_03 = rvx_signal_32;
				rvx_signal_20 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_43);
				rvx_port_03 = rvx_signal_52;
			end
			`MMAP_OFFSET_MMIO_INPUT_FIFO_SAWD:
			begin
				rvx_signal_10 = rvx_signal_32;
				rvx_signal_64 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_33);
				rvx_port_03 = rvx_signal_36;
			end
			`MMAP_OFFSET_MMIO_OUTPUT_FIFO_SAWD:
			begin
				rvx_signal_41 = rvx_signal_32;
				rvx_signal_18 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_04);
				rvx_port_03 = rvx_signal_11;
			end
			`MMAP_OFFSET_MMIO_FIFO_STATUS:
			begin
				rvx_signal_09 = rvx_signal_32;
				rvx_signal_54 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_61);
				rvx_port_03 = rvx_signal_66;
			end
			`MMAP_OFFSET_MMIO_ITR_REQUEST:
			begin
				rvx_signal_56 = rvx_signal_32;
				rvx_signal_16 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_26);
				rvx_port_03 = rvx_signal_37;
			end
			`MMAP_OFFSET_MMIO_ITR_STATUS:
			begin
				rvx_signal_40 = rvx_signal_32;
				rvx_signal_17 = rvx_signal_23;
				rvx_signal_55 = $unsigned(rvx_signal_45);
				rvx_port_03 = rvx_signal_24;
			end
			default:
				rvx_port_34 = 1;
		endcase
	end
end

ERVP_MMIO_WIDE_READ
#(
	.BW_MMIO(RVX_GPARA_2),
	.BW_WIDE_DATA(32)
)
i_rvx_instance_1
(
	.clk(rvx_port_25),
	.rstnn(rvx_port_10),
	.clear(1'b 0),
	.enable(1'b 1),
	.mmio_re(rvx_signal_03),
	.mmio_rdata(rvx_signal_43),
	.wide_data_in(rvx_signal_22)
);
ERVP_MMIO_WIDE_READ
#(
	.BW_MMIO(RVX_GPARA_2),
	.BW_WIDE_DATA(32)
)
i_rvx_instance_0
(
	.clk(rvx_port_25),
	.rstnn(rvx_port_10),
	.clear(1'b 0),
	.enable(1'b 1),
	.mmio_re(rvx_signal_09),
	.mmio_rdata(rvx_signal_61),
	.wide_data_in(rvx_signal_34)
);
assign rvx_port_13 = rvx_signal_48;
assign rvx_signal_38 = rvx_port_16;
assign rvx_port_38 = rvx_signal_57;
assign rvx_port_21 = rvx_signal_63;
assign rvx_signal_30 = 1;
assign rvx_port_09 = rvx_signal_50;
assign rvx_signal_25 = rvx_port_12;
assign rvx_signal_07 = 1;
assign rvx_port_37 = rvx_signal_60;
assign rvx_signal_65 = rvx_port_18;
assign rvx_port_20 = rvx_signal_46;
assign rvx_port_14 = rvx_signal_59;
assign rvx_signal_00 = 1;
assign rvx_port_15 = rvx_signal_15;
assign rvx_signal_31 = rvx_port_00;
assign rvx_signal_05 = rvx_port_01;
assign rvx_signal_08 = 0;
assign rvx_port_31 = rvx_signal_27;
assign rvx_port_11 = rvx_signal_29;
assign rvx_signal_14 = rvx_port_36;
assign rvx_signal_22 = rvx_port_40;
assign rvx_signal_52 = 1;
assign rvx_signal_33 = 0;
assign rvx_port_08 = rvx_signal_64;
assign rvx_port_04 = rvx_signal_02;
assign rvx_signal_36 = rvx_port_28;
assign rvx_port_06 = rvx_signal_41;
assign rvx_signal_04 = rvx_port_41;
assign rvx_signal_11 = rvx_port_19;
assign rvx_signal_34 = rvx_port_05;
assign rvx_signal_66 = 1;
assign rvx_signal_26 = 0;
assign rvx_port_33 = rvx_signal_16;
assign rvx_port_30 = rvx_signal_19;
assign rvx_signal_37 = rvx_port_26;
assign rvx_port_29 = rvx_signal_40;
assign rvx_signal_45 = rvx_port_23;
assign rvx_port_32 = rvx_signal_17;
assign rvx_port_02 = rvx_signal_39;
assign rvx_signal_24 = 1;

endmodule
