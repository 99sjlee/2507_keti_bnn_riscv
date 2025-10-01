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




module RVX_MODULE_023
(
	rvx_port_03,
	rvx_port_10,

	rvx_port_01,
	rvx_port_07,
	rvx_port_08,
	rvx_port_02,
	rvx_port_00,
	rvx_port_05,
	rvx_port_09,
	rvx_port_12,

	rvx_port_04,
	rvx_port_14,
	rvx_port_13,
	rvx_port_06,
	rvx_port_11
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_03, rvx_port_10;
input wire rvx_port_01;
input wire rvx_port_07;
input wire [RVX_GPARA_0-1:0] rvx_port_08;
input wire rvx_port_02;
input wire [RVX_GPARA_2-1:0] rvx_port_00;
output wire [RVX_GPARA_2-1:0] rvx_port_05;
output reg rvx_port_09;
output reg rvx_port_12;

input wire rvx_port_04;

output wire [16-1:0] rvx_port_14;
input wire [(32)*(16)-1:0] rvx_port_13;
output wire [16-1:0] rvx_port_06;
output wire [(32)*(16)-1:0] rvx_port_11;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_52;
reg [RVX_GPARA_2-1:0] rvx_signal_24;
wire rvx_signal_15;
wire rvx_signal_72;
wire rvx_signal_20;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_08;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_89;
wire [RVX_GPARA_0-1:0] rvx_signal_71;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_84;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_38;
wire [32-1:0] rvx_signal_88;
reg rvx_signal_14;
wire [32-1:0] rvx_signal_86;
wire rvx_signal_10;
reg rvx_signal_66;
wire [32-1:0] rvx_signal_05;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_01;
wire rvx_signal_57;
reg rvx_signal_51;
wire [32-1:0] rvx_signal_22;
reg rvx_signal_45;
wire [32-1:0] rvx_signal_87;
wire rvx_signal_39;
reg rvx_signal_17;
wire [32-1:0] rvx_signal_60;
reg rvx_signal_03;
wire [32-1:0] rvx_signal_40;
wire rvx_signal_77;
reg rvx_signal_46;
wire [32-1:0] rvx_signal_44;
reg rvx_signal_62;
wire [32-1:0] rvx_signal_32;
wire rvx_signal_27;
reg rvx_signal_80;
wire [32-1:0] rvx_signal_79;
reg rvx_signal_61;
wire [32-1:0] rvx_signal_67;
wire rvx_signal_26;
reg rvx_signal_58;
wire [32-1:0] rvx_signal_07;
reg rvx_signal_23;
wire [32-1:0] rvx_signal_21;
wire rvx_signal_54;
reg rvx_signal_50;
wire [32-1:0] rvx_signal_08;
reg rvx_signal_04;
wire [32-1:0] rvx_signal_43;
wire rvx_signal_59;
reg rvx_signal_65;
wire [32-1:0] rvx_signal_28;
reg rvx_signal_81;
wire [32-1:0] rvx_signal_18;
wire rvx_signal_48;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_12;
reg rvx_signal_31;
wire [32-1:0] rvx_signal_35;
wire rvx_signal_13;
reg rvx_signal_68;
wire [32-1:0] rvx_signal_29;
reg rvx_signal_16;
wire [32-1:0] rvx_signal_02;
wire rvx_signal_75;
reg rvx_signal_53;
wire [32-1:0] rvx_signal_33;
reg rvx_signal_49;
wire [32-1:0] rvx_signal_55;
wire rvx_signal_76;
reg rvx_signal_37;
wire [32-1:0] rvx_signal_83;
reg rvx_signal_73;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_36;
reg rvx_signal_09;
wire [32-1:0] rvx_signal_41;
reg rvx_signal_25;
wire [32-1:0] rvx_signal_69;
wire rvx_signal_00;
reg rvx_signal_85;
wire [32-1:0] rvx_signal_82;
reg rvx_signal_63;
wire [32-1:0] rvx_signal_78;
wire rvx_signal_47;
reg rvx_signal_64;
wire [32-1:0] rvx_signal_19;
reg rvx_signal_11;
wire [32-1:0] rvx_signal_42;
wire rvx_signal_70;

assign rvx_signal_52 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_00);
assign rvx_port_05 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_24);
assign {rvx_signal_71,rvx_signal_84} = paddr_offset;
assign rvx_signal_89 = {rvx_signal_71,addr_unused};
assign rvx_signal_20 = (rvx_signal_84==0);
assign rvx_signal_15 = rvx_port_01 & rvx_port_07 & rvx_signal_20 & (~rvx_port_02);
assign rvx_signal_72 = rvx_port_01 & rvx_port_07 & rvx_signal_20 & rvx_port_02;

assign rvx_signal_86 = $unsigned(rvx_port_00);
assign rvx_signal_01 = $unsigned(rvx_port_00);
assign rvx_signal_87 = $unsigned(rvx_port_00);
assign rvx_signal_40 = $unsigned(rvx_port_00);
assign rvx_signal_32 = $unsigned(rvx_port_00);
assign rvx_signal_67 = $unsigned(rvx_port_00);
assign rvx_signal_21 = $unsigned(rvx_port_00);
assign rvx_signal_43 = $unsigned(rvx_port_00);
assign rvx_signal_18 = $unsigned(rvx_port_00);
assign rvx_signal_35 = $unsigned(rvx_port_00);
assign rvx_signal_02 = $unsigned(rvx_port_00);
assign rvx_signal_55 = $unsigned(rvx_port_00);
assign rvx_signal_06 = $unsigned(rvx_port_00);
assign rvx_signal_69 = $unsigned(rvx_port_00);
assign rvx_signal_78 = $unsigned(rvx_port_00);
assign rvx_signal_42 = $unsigned(rvx_port_00);

always@(*)
begin
	rvx_port_12 = 0;
	rvx_signal_24 = 0;
	rvx_port_09 = 1;

	rvx_signal_38 = 0;
	rvx_signal_14 = 0;

	rvx_signal_66 = 0;
	rvx_signal_56 = 0;

	rvx_signal_51 = 0;
	rvx_signal_45 = 0;

	rvx_signal_17 = 0;
	rvx_signal_03 = 0;

	rvx_signal_46 = 0;
	rvx_signal_62 = 0;

	rvx_signal_80 = 0;
	rvx_signal_61 = 0;

	rvx_signal_58 = 0;
	rvx_signal_23 = 0;

	rvx_signal_50 = 0;
	rvx_signal_04 = 0;

	rvx_signal_65 = 0;
	rvx_signal_81 = 0;

	rvx_signal_30 = 0;
	rvx_signal_31 = 0;

	rvx_signal_68 = 0;
	rvx_signal_16 = 0;

	rvx_signal_53 = 0;
	rvx_signal_49 = 0;

	rvx_signal_37 = 0;
	rvx_signal_73 = 0;

	rvx_signal_09 = 0;
	rvx_signal_25 = 0;

	rvx_signal_85 = 0;
	rvx_signal_63 = 0;

	rvx_signal_64 = 0;
	rvx_signal_11 = 0;

	if(rvx_port_01==1'b 1)
	begin
		case(rvx_signal_89)
			`MMAP_OFFSET_GPIO_USER_GPIO00:
			begin
				rvx_signal_38 = rvx_signal_15;
				rvx_signal_14 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_88);
				rvx_port_09 = rvx_signal_10;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO01:
			begin
				rvx_signal_66 = rvx_signal_15;
				rvx_signal_56 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_05);
				rvx_port_09 = rvx_signal_57;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO02:
			begin
				rvx_signal_51 = rvx_signal_15;
				rvx_signal_45 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_22);
				rvx_port_09 = rvx_signal_39;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO03:
			begin
				rvx_signal_17 = rvx_signal_15;
				rvx_signal_03 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_60);
				rvx_port_09 = rvx_signal_77;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO04:
			begin
				rvx_signal_46 = rvx_signal_15;
				rvx_signal_62 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_44);
				rvx_port_09 = rvx_signal_27;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO05:
			begin
				rvx_signal_80 = rvx_signal_15;
				rvx_signal_61 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_79);
				rvx_port_09 = rvx_signal_26;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO06:
			begin
				rvx_signal_58 = rvx_signal_15;
				rvx_signal_23 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_07);
				rvx_port_09 = rvx_signal_54;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO07:
			begin
				rvx_signal_50 = rvx_signal_15;
				rvx_signal_04 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_08);
				rvx_port_09 = rvx_signal_59;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO08:
			begin
				rvx_signal_65 = rvx_signal_15;
				rvx_signal_81 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_28);
				rvx_port_09 = rvx_signal_48;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO09:
			begin
				rvx_signal_30 = rvx_signal_15;
				rvx_signal_31 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_12);
				rvx_port_09 = rvx_signal_13;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO10:
			begin
				rvx_signal_68 = rvx_signal_15;
				rvx_signal_16 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_29);
				rvx_port_09 = rvx_signal_75;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO11:
			begin
				rvx_signal_53 = rvx_signal_15;
				rvx_signal_49 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_33);
				rvx_port_09 = rvx_signal_76;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO12:
			begin
				rvx_signal_37 = rvx_signal_15;
				rvx_signal_73 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_83);
				rvx_port_09 = rvx_signal_36;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO13:
			begin
				rvx_signal_09 = rvx_signal_15;
				rvx_signal_25 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_41);
				rvx_port_09 = rvx_signal_00;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO14:
			begin
				rvx_signal_85 = rvx_signal_15;
				rvx_signal_63 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_82);
				rvx_port_09 = rvx_signal_47;
			end
			`MMAP_OFFSET_GPIO_USER_GPIO15:
			begin
				rvx_signal_64 = rvx_signal_15;
				rvx_signal_11 = rvx_signal_72;
				rvx_signal_24 = $unsigned(rvx_signal_19);
				rvx_port_09 = rvx_signal_70;
			end
			default:
				rvx_port_12 = 1;
		endcase
	end
end

assign rvx_port_14[00] = rvx_signal_38;
assign rvx_signal_88 = rvx_port_13[(32)*((00)+1)-1-:32];
assign rvx_port_06[00] = rvx_signal_14;
assign rvx_port_11[(32)*((00)+1)-1-:32] = rvx_signal_86;

assign rvx_port_14[01] = rvx_signal_66;
assign rvx_signal_05 = rvx_port_13[(32)*((01)+1)-1-:32];
assign rvx_port_06[01] = rvx_signal_56;
assign rvx_port_11[(32)*((01)+1)-1-:32] = rvx_signal_01;

assign rvx_port_14[02] = rvx_signal_51;
assign rvx_signal_22 = rvx_port_13[(32)*((02)+1)-1-:32];
assign rvx_port_06[02] = rvx_signal_45;
assign rvx_port_11[(32)*((02)+1)-1-:32] = rvx_signal_87;

assign rvx_port_14[03] = rvx_signal_17;
assign rvx_signal_60 = rvx_port_13[(32)*((03)+1)-1-:32];
assign rvx_port_06[03] = rvx_signal_03;
assign rvx_port_11[(32)*((03)+1)-1-:32] = rvx_signal_40;

assign rvx_port_14[04] = rvx_signal_46;
assign rvx_signal_44 = rvx_port_13[(32)*((04)+1)-1-:32];
assign rvx_port_06[04] = rvx_signal_62;
assign rvx_port_11[(32)*((04)+1)-1-:32] = rvx_signal_32;

assign rvx_port_14[05] = rvx_signal_80;
assign rvx_signal_79 = rvx_port_13[(32)*((05)+1)-1-:32];
assign rvx_port_06[05] = rvx_signal_61;
assign rvx_port_11[(32)*((05)+1)-1-:32] = rvx_signal_67;

assign rvx_port_14[06] = rvx_signal_58;
assign rvx_signal_07 = rvx_port_13[(32)*((06)+1)-1-:32];
assign rvx_port_06[06] = rvx_signal_23;
assign rvx_port_11[(32)*((06)+1)-1-:32] = rvx_signal_21;

assign rvx_port_14[07] = rvx_signal_50;
assign rvx_signal_08 = rvx_port_13[(32)*((07)+1)-1-:32];
assign rvx_port_06[07] = rvx_signal_04;
assign rvx_port_11[(32)*((07)+1)-1-:32] = rvx_signal_43;

assign rvx_port_14[08] = rvx_signal_65;
assign rvx_signal_28 = rvx_port_13[(32)*((08)+1)-1-:32];
assign rvx_port_06[08] = rvx_signal_81;
assign rvx_port_11[(32)*((08)+1)-1-:32] = rvx_signal_18;

assign rvx_port_14[09] = rvx_signal_30;
assign rvx_signal_12 = rvx_port_13[(32)*((09)+1)-1-:32];
assign rvx_port_06[09] = rvx_signal_31;
assign rvx_port_11[(32)*((09)+1)-1-:32] = rvx_signal_35;

assign rvx_port_14[10] = rvx_signal_68;
assign rvx_signal_29 = rvx_port_13[(32)*((10)+1)-1-:32];
assign rvx_port_06[10] = rvx_signal_16;
assign rvx_port_11[(32)*((10)+1)-1-:32] = rvx_signal_02;

assign rvx_port_14[11] = rvx_signal_53;
assign rvx_signal_33 = rvx_port_13[(32)*((11)+1)-1-:32];
assign rvx_port_06[11] = rvx_signal_49;
assign rvx_port_11[(32)*((11)+1)-1-:32] = rvx_signal_55;

assign rvx_port_14[12] = rvx_signal_37;
assign rvx_signal_83 = rvx_port_13[(32)*((12)+1)-1-:32];
assign rvx_port_06[12] = rvx_signal_73;
assign rvx_port_11[(32)*((12)+1)-1-:32] = rvx_signal_06;

assign rvx_port_14[13] = rvx_signal_09;
assign rvx_signal_41 = rvx_port_13[(32)*((13)+1)-1-:32];
assign rvx_port_06[13] = rvx_signal_25;
assign rvx_port_11[(32)*((13)+1)-1-:32] = rvx_signal_69;

assign rvx_port_14[14] = rvx_signal_85;
assign rvx_signal_82 = rvx_port_13[(32)*((14)+1)-1-:32];
assign rvx_port_06[14] = rvx_signal_63;
assign rvx_port_11[(32)*((14)+1)-1-:32] = rvx_signal_78;

assign rvx_port_14[15] = rvx_signal_64;
assign rvx_signal_19 = rvx_port_13[(32)*((15)+1)-1-:32];
assign rvx_port_06[15] = rvx_signal_11;
assign rvx_port_11[(32)*((15)+1)-1-:32] = rvx_signal_42;

assign rvx_signal_10 = 1;

assign rvx_signal_57 = 1;

assign rvx_signal_39 = 1;

assign rvx_signal_77 = 1;

assign rvx_signal_27 = 1;

assign rvx_signal_26 = 1;

assign rvx_signal_54 = 1;

assign rvx_signal_59 = 1;

assign rvx_signal_48 = 1;

assign rvx_signal_13 = 1;

assign rvx_signal_75 = 1;

assign rvx_signal_76 = 1;

assign rvx_signal_36 = 1;

assign rvx_signal_00 = 1;

assign rvx_signal_47 = 1;

assign rvx_signal_70 = 1;

endmodule
