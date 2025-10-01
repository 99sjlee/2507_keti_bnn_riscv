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




module RVX_MODULE_084
(
	rvx_port_12,
	rvx_port_10,

	rvx_port_04,
	rvx_port_01,
	rvx_port_05,
	rvx_port_08,
	rvx_port_03,
	rvx_port_02,
	rvx_port_11,
	rvx_port_09,

	rvx_port_07,
	rvx_port_06,
	rvx_port_00
);




parameter RVX_GPARA_0 = 1;
parameter RVX_GPARA_2 = 1;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;

`include "ervp_endian.vf"
`include "ervp_log_util.vf"

input wire rvx_port_12, rvx_port_10;
input wire rvx_port_04;
input wire rvx_port_01;
input wire [RVX_GPARA_0-1:0] rvx_port_05;
input wire rvx_port_08;
input wire [RVX_GPARA_2-1:0] rvx_port_03;
output wire [RVX_GPARA_2-1:0] rvx_port_02;
output reg rvx_port_11;
output reg rvx_port_09;

input wire rvx_port_07;

output wire [16-1:0] rvx_port_06;

output wire [(32)*(8)-1:0] rvx_port_00;

genvar i;

wire [RVX_GPARA_2-1:0] rvx_signal_11;
reg [RVX_GPARA_2-1:0] rvx_signal_45;
wire rvx_signal_06;
wire rvx_signal_29;
wire rvx_signal_43;

wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] paddr_offset = rvx_port_05;
wire [`BW_MMAP_OFFSET_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_48;
wire [RVX_GPARA_0-1:0] rvx_signal_09;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] rvx_signal_63;
wire [`BW_UNUSED_ERVP_EXTERNAL_PERI_GROUP-1:0] addr_unused = 0;
reg rvx_signal_51;
wire [32-1:0] rvx_signal_35;
reg rvx_signal_38;
wire [32-1:0] rvx_signal_50;
wire rvx_signal_08;
reg [32-1:0] rvx_signal_04;
reg rvx_signal_39;
wire [32-1:0] rvx_signal_00;
reg rvx_signal_20;
wire [32-1:0] rvx_signal_44;
wire rvx_signal_14;
reg [32-1:0] rvx_signal_03;
reg rvx_signal_23;
wire [32-1:0] rvx_signal_62;
reg rvx_signal_30;
wire [32-1:0] rvx_signal_17;
wire rvx_signal_32;
reg [32-1:0] rvx_signal_21;
reg rvx_signal_56;
wire [32-1:0] rvx_signal_53;
reg rvx_signal_59;
wire [32-1:0] rvx_signal_33;
wire rvx_signal_24;
reg [32-1:0] rvx_signal_31;
reg rvx_signal_19;
wire [32-1:0] rvx_signal_26;
reg rvx_signal_25;
wire [32-1:0] rvx_signal_52;
wire rvx_signal_61;
reg [32-1:0] rvx_signal_47;
reg rvx_signal_07;
wire [32-1:0] rvx_signal_10;
reg rvx_signal_02;
wire [32-1:0] rvx_signal_37;
wire rvx_signal_12;
reg [32-1:0] rvx_signal_28;
reg rvx_signal_36;
wire [32-1:0] rvx_signal_18;
reg rvx_signal_05;
wire [32-1:0] rvx_signal_41;
wire rvx_signal_42;
reg [32-1:0] rvx_signal_01;
reg rvx_signal_34;
wire [32-1:0] rvx_signal_55;
reg rvx_signal_60;
wire [32-1:0] rvx_signal_22;
wire rvx_signal_15;
reg [32-1:0] rvx_signal_54;
reg rvx_signal_57;
wire [16-1:0] rvx_signal_40;
reg rvx_signal_49;
wire [16-1:0] rvx_signal_46;
wire rvx_signal_27;
reg [16-1:0] rvx_signal_16;

assign rvx_signal_11 = CHANGE_ENDIAN_BUS2MAN(RVX_GPARA_2,RVX_GPARA_1,rvx_port_03);
assign rvx_port_02 = CHANGE_ENDIAN_MAN2BUS(RVX_GPARA_2,RVX_GPARA_1,rvx_signal_45);
assign {rvx_signal_09,rvx_signal_63} = paddr_offset;
assign rvx_signal_48 = {rvx_signal_09,addr_unused};
assign rvx_signal_43 = (rvx_signal_63==0);
assign rvx_signal_06 = rvx_port_04 & rvx_port_01 & rvx_signal_43 & (~rvx_port_08);
assign rvx_signal_29 = rvx_port_04 & rvx_port_01 & rvx_signal_43 & rvx_port_08;

assign rvx_signal_50 = $unsigned(rvx_port_03);
assign rvx_signal_44 = $unsigned(rvx_port_03);
assign rvx_signal_17 = $unsigned(rvx_port_03);
assign rvx_signal_33 = $unsigned(rvx_port_03);
assign rvx_signal_52 = $unsigned(rvx_port_03);
assign rvx_signal_37 = $unsigned(rvx_port_03);
assign rvx_signal_41 = $unsigned(rvx_port_03);
assign rvx_signal_22 = $unsigned(rvx_port_03);
assign rvx_signal_46 = $unsigned(rvx_port_03);

always@(*)
begin
	rvx_port_09 = 0;
	rvx_signal_45 = 0;
	rvx_port_11 = 1;

	rvx_signal_51 = 0;
	rvx_signal_38 = 0;

	rvx_signal_39 = 0;
	rvx_signal_20 = 0;

	rvx_signal_23 = 0;
	rvx_signal_30 = 0;

	rvx_signal_56 = 0;
	rvx_signal_59 = 0;

	rvx_signal_19 = 0;
	rvx_signal_25 = 0;

	rvx_signal_07 = 0;
	rvx_signal_02 = 0;

	rvx_signal_36 = 0;
	rvx_signal_05 = 0;

	rvx_signal_34 = 0;
	rvx_signal_60 = 0;

	rvx_signal_57 = 0;
	rvx_signal_49 = 0;

	if(rvx_port_04==1'b 1)
	begin
		case(rvx_signal_48)
			`MMAP_OFFSET_EPG_MISC_EXTREG00:
			begin
				rvx_signal_51 = rvx_signal_06;
				rvx_signal_38 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_35);
				rvx_port_11 = rvx_signal_08;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG01:
			begin
				rvx_signal_39 = rvx_signal_06;
				rvx_signal_20 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_00);
				rvx_port_11 = rvx_signal_14;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG02:
			begin
				rvx_signal_23 = rvx_signal_06;
				rvx_signal_30 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_62);
				rvx_port_11 = rvx_signal_32;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG03:
			begin
				rvx_signal_56 = rvx_signal_06;
				rvx_signal_59 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_53);
				rvx_port_11 = rvx_signal_24;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG04:
			begin
				rvx_signal_19 = rvx_signal_06;
				rvx_signal_25 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_26);
				rvx_port_11 = rvx_signal_61;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG05:
			begin
				rvx_signal_07 = rvx_signal_06;
				rvx_signal_02 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_10);
				rvx_port_11 = rvx_signal_12;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG06:
			begin
				rvx_signal_36 = rvx_signal_06;
				rvx_signal_05 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_18);
				rvx_port_11 = rvx_signal_42;
			end
			`MMAP_OFFSET_EPG_MISC_EXTREG07:
			begin
				rvx_signal_34 = rvx_signal_06;
				rvx_signal_60 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_55);
				rvx_port_11 = rvx_signal_15;
			end
			`MMAP_OFFSET_EPG_MISC_GPIO_TICK_CFG:
			begin
				rvx_signal_57 = rvx_signal_06;
				rvx_signal_49 = rvx_signal_29;
				rvx_signal_45 = $unsigned(rvx_signal_40);
				rvx_port_11 = rvx_signal_27;
			end
			default:
				rvx_port_09 = 1;
		endcase
	end
end

always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_04 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_38==1'b 1)
		rvx_signal_04 <= rvx_signal_50;
end
assign rvx_signal_35 = rvx_signal_04;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_03 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_20==1'b 1)
		rvx_signal_03 <= rvx_signal_44;
end
assign rvx_signal_00 = rvx_signal_03;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_21 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_30==1'b 1)
		rvx_signal_21 <= rvx_signal_17;
end
assign rvx_signal_62 = rvx_signal_21;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_31 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_59==1'b 1)
		rvx_signal_31 <= rvx_signal_33;
end
assign rvx_signal_53 = rvx_signal_31;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_47 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_25==1'b 1)
		rvx_signal_47 <= rvx_signal_52;
end
assign rvx_signal_26 = rvx_signal_47;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_28 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_02==1'b 1)
		rvx_signal_28 <= rvx_signal_37;
end
assign rvx_signal_10 = rvx_signal_28;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_01 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_05==1'b 1)
		rvx_signal_01 <= rvx_signal_41;
end
assign rvx_signal_18 = rvx_signal_01;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_54 <= `EPG_MISC_EXTREG_DEFAULT_VALUE;
	else if (rvx_signal_60==1'b 1)
		rvx_signal_54 <= rvx_signal_22;
end
assign rvx_signal_55 = rvx_signal_54;
always@(posedge rvx_port_12, negedge rvx_port_10)
begin
	if(rvx_port_10==0)
		rvx_signal_16 <= `EPG_MISC_GPIO_TICK_CFG_DEFAULT_VALUE;
	else if (rvx_signal_49==1'b 1)
		rvx_signal_16 <= rvx_signal_46;
end
assign rvx_signal_40 = rvx_signal_16;
assign rvx_port_06 = rvx_signal_16;
assign rvx_signal_27 = 1;

assign rvx_port_00[(32)*((00)+1)-1-:32] = rvx_signal_04;

assign rvx_port_00[(32)*((01)+1)-1-:32] = rvx_signal_03;

assign rvx_port_00[(32)*((02)+1)-1-:32] = rvx_signal_21;

assign rvx_port_00[(32)*((03)+1)-1-:32] = rvx_signal_31;

assign rvx_port_00[(32)*((04)+1)-1-:32] = rvx_signal_47;

assign rvx_port_00[(32)*((05)+1)-1-:32] = rvx_signal_28;

assign rvx_port_00[(32)*((06)+1)-1-:32] = rvx_signal_01;

assign rvx_port_00[(32)*((07)+1)-1-:32] = rvx_signal_54;

assign rvx_signal_08 = 1;

assign rvx_signal_14 = 1;

assign rvx_signal_32 = 1;

assign rvx_signal_24 = 1;

assign rvx_signal_61 = 1;

assign rvx_signal_12 = 1;

assign rvx_signal_42 = 1;

assign rvx_signal_15 = 1;

endmodule
