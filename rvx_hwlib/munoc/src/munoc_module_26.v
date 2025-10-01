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
// 2024-05-08
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "munoc_include_04.vh"
`include "munoc_extended_config.vh"
`include "munoc_include_07.vh"
`include "ervp_axi_define.vh"





module MUNOC_MODULE_26
(
	munoc_port_01,
	munoc_port_35,
	munoc_port_14,

	munoc_port_20,
	munoc_port_33,
	munoc_port_21,
	munoc_port_32,
	munoc_port_04,
	munoc_port_22,
	munoc_port_30,

	munoc_port_13,
	munoc_port_31,
	munoc_port_08,
	munoc_port_12,
	munoc_port_27,
	munoc_port_18, 

	munoc_port_26,
	munoc_port_25,
	munoc_port_29,
	munoc_port_02,

	munoc_port_28,
	munoc_port_34,
	munoc_port_05,
	munoc_port_11,
	munoc_port_36,
	munoc_port_16,
	munoc_port_06,

	munoc_port_23,
	munoc_port_10,
	munoc_port_03,
	munoc_port_09,
	munoc_port_07,
	munoc_port_19,

	munoc_port_24,
	munoc_port_00,
	munoc_port_15,
	munoc_port_17
);





parameter MUNOC_GPARA_6 = 32;
parameter MUNOC_GPARA_7 = 32;
parameter MUNOC_GPARA_5 = 4;
parameter MUNOC_GPARA_3 = 0;
parameter MUNOC_GPARA_2 = 1;

parameter MUNOC_GPARA_8 = 16;
parameter MUNOC_GPARA_0 = 500;
parameter MUNOC_GPARA_4 = 1;

parameter MUNOC_GPARA_1 = -1;

input wire munoc_port_01, munoc_port_35;
input wire munoc_port_14;

input wire [MUNOC_GPARA_5-1:0] munoc_port_20;
input wire [MUNOC_GPARA_6-1:0] munoc_port_33;
input wire [`BW_AXI_ALEN-1:0] munoc_port_21;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_32;
input wire [`BW_AXI_ABURST-1:0] munoc_port_04;
input wire munoc_port_22;
input wire munoc_port_30;

input wire [MUNOC_GPARA_5-1:0] munoc_port_13;
input wire [MUNOC_GPARA_7-1:0] munoc_port_31;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_7)-1:0] munoc_port_08;
input wire munoc_port_12;
input wire munoc_port_27;
input wire munoc_port_18;

input wire [MUNOC_GPARA_5-1:0] munoc_port_26;
input wire [`BW_AXI_BRESP-1:0] munoc_port_25;
input wire munoc_port_29;
input wire munoc_port_02;

input wire [MUNOC_GPARA_5-1:0] munoc_port_28;
input wire [MUNOC_GPARA_6-1:0] munoc_port_34;
input wire [`BW_AXI_ALEN-1:0] munoc_port_05;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_11;
input wire [`BW_AXI_ABURST-1:0] munoc_port_36;
input wire munoc_port_16;
input wire munoc_port_06;

input wire [MUNOC_GPARA_5-1:0] munoc_port_23;
input wire [MUNOC_GPARA_7-1:0] munoc_port_10;
input wire [`BW_AXI_RRESP-1:0] munoc_port_03;
input wire munoc_port_09;
input wire munoc_port_07;
input wire munoc_port_19;

output reg [`MUNOC_GDEF_71-1:0] munoc_port_24;
output reg [`MUNOC_GDEF_71-1:0] munoc_port_00;
output wire [`MUNOC_GDEF_24-1:0] munoc_port_15;
output wire [`MUNOC_GDEF_80-1:0] munoc_port_17;

reg [MUNOC_GPARA_5-1:0] munoc_signal_31;
reg [MUNOC_GPARA_6-1:0] munoc_signal_43;
reg [`BW_AXI_ALEN-1:0] munoc_signal_36;
reg [`BW_AXI_ASIZE-1:0] munoc_signal_09;
reg [`BW_AXI_ABURST-1:0] munoc_signal_06;
reg munoc_signal_00;
reg munoc_signal_41;

reg [MUNOC_GPARA_5-1:0] munoc_signal_10;
reg [MUNOC_GPARA_7-1:0] munoc_signal_21;
reg [`BW_AXI_WSTRB(MUNOC_GPARA_7)-1:0] munoc_signal_15;
reg munoc_signal_29;
reg munoc_signal_40;
reg munoc_signal_07;

reg [MUNOC_GPARA_5-1:0] munoc_signal_34;
reg [`BW_AXI_BRESP-1:0] munoc_signal_30;
reg munoc_signal_23;
reg munoc_signal_08;

reg [MUNOC_GPARA_5-1:0] munoc_signal_11;
reg [MUNOC_GPARA_6-1:0] munoc_signal_26;
reg [`BW_AXI_ALEN-1:0] munoc_signal_22;
reg [`BW_AXI_ASIZE-1:0] munoc_signal_14;
reg [`BW_AXI_ABURST-1:0] munoc_signal_38;
reg munoc_signal_27;
reg munoc_signal_39;

reg [MUNOC_GPARA_5-1:0] munoc_signal_44;
reg [MUNOC_GPARA_7-1:0] munoc_signal_05;
reg [`BW_AXI_RRESP-1:0] munoc_signal_12;
reg munoc_signal_33;
reg munoc_signal_17;
reg munoc_signal_01;

wire munoc_signal_25;
wire munoc_signal_19;
wire munoc_signal_13;
wire munoc_signal_42;
wire munoc_signal_24;

wire munoc_signal_35;
wire munoc_signal_45;
wire munoc_signal_18;
reg munoc_signal_37;
reg munoc_signal_32;

wire munoc_signal_04, munoc_signal_03, munoc_signal_28;

wire munoc_signal_02, munoc_signal_20;
reg munoc_signal_16;

always @(posedge munoc_port_01 or negedge munoc_port_35)
begin
	if(munoc_port_35==0)
		{munoc_signal_31,
		munoc_signal_43,
		munoc_signal_36,
		munoc_signal_09,
		munoc_signal_06,
		munoc_signal_00,
		munoc_signal_41,

		munoc_signal_10,
		munoc_signal_21,
		munoc_signal_15,
		munoc_signal_29,
		munoc_signal_40,
		munoc_signal_07, 

		munoc_signal_34,
		munoc_signal_30,
		munoc_signal_23,
		munoc_signal_08,

		munoc_signal_11,
		munoc_signal_26,
		munoc_signal_22,
		munoc_signal_14,
		munoc_signal_38,
		munoc_signal_27,
		munoc_signal_39,

		munoc_signal_44,
		munoc_signal_05,
		munoc_signal_12,
		munoc_signal_33,
		munoc_signal_17,
		munoc_signal_01} <= 0;
	else if(munoc_port_14)
		{munoc_signal_31,
		munoc_signal_43,
		munoc_signal_36,
		munoc_signal_09,
		munoc_signal_06,
		munoc_signal_00,
		munoc_signal_41,

		munoc_signal_10,
		munoc_signal_21,
		munoc_signal_15,
		munoc_signal_29,
		munoc_signal_40,
		munoc_signal_07, 

		munoc_signal_34,
		munoc_signal_30,
		munoc_signal_23,
		munoc_signal_08,

		munoc_signal_11,
		munoc_signal_26,
		munoc_signal_22,
		munoc_signal_14,
		munoc_signal_38,
		munoc_signal_27,
		munoc_signal_39,

		munoc_signal_44,
		munoc_signal_05,
		munoc_signal_12,
		munoc_signal_33,
		munoc_signal_17,
		munoc_signal_01}
			<=
		{munoc_port_20,
		munoc_port_33,
		munoc_port_21,
		munoc_port_32,
		munoc_port_04,
		munoc_port_22,
		munoc_port_30,

		munoc_port_13,
		munoc_port_31,
		munoc_port_08,
		munoc_port_12,
		munoc_port_27,
		munoc_port_18, 

		munoc_port_26,
		munoc_port_25,
		munoc_port_29,
		munoc_port_02,

		munoc_port_28,
		munoc_port_34,
		munoc_port_05,
		munoc_port_11,
		munoc_port_36,
		munoc_port_16,
		munoc_port_06,

		munoc_port_23,
		munoc_port_10,
		munoc_port_03,
		munoc_port_09,
		munoc_port_07,
		munoc_port_19};
end

`ifdef __MUNOC_INCLUDE_TIMEOUT_MONITOR

	MUNOC_MODULE_23
	#(
		.MUNOC_GPARA_1(MUNOC_GPARA_8),
		.MUNOC_GPARA_0(MUNOC_GPARA_0)
	)
	i_munoc_instance_11
	(
		.munoc_port_2(munoc_port_01),
		.munoc_port_1(munoc_port_35),
		.munoc_port_0(munoc_port_14),
		.munoc_port_6(munoc_signal_00),
		.munoc_port_5(munoc_signal_41),
		.munoc_port_4(munoc_signal_25),
		.munoc_port_7(),
		.munoc_port_3()
	);

	MUNOC_MODULE_23
	#(
		.MUNOC_GPARA_1(MUNOC_GPARA_8),
		.MUNOC_GPARA_0(MUNOC_GPARA_0)
	)
	i_munoc_instance_09
	(
		.munoc_port_2(munoc_port_01),
		.munoc_port_1(munoc_port_35),
		.munoc_port_0(munoc_port_14),
		.munoc_port_6(munoc_signal_40),
		.munoc_port_5(munoc_signal_07),
		.munoc_port_4(munoc_signal_19),
		.munoc_port_7(),
		.munoc_port_3()
	);

	MUNOC_MODULE_23
	#(
		.MUNOC_GPARA_1(MUNOC_GPARA_8),
		.MUNOC_GPARA_0(MUNOC_GPARA_0)
	)
	i_munoc_instance_10
	(
		.munoc_port_2(munoc_port_01),
		.munoc_port_1(munoc_port_35),
		.munoc_port_0(munoc_port_14),
		.munoc_port_6(munoc_signal_23),
		.munoc_port_5(munoc_signal_08),
		.munoc_port_4(munoc_signal_13),
		.munoc_port_7(),
		.munoc_port_3()
	);

	MUNOC_MODULE_23
	#(
		.MUNOC_GPARA_1(MUNOC_GPARA_8),
		.MUNOC_GPARA_0(MUNOC_GPARA_0)
	)
	i_munoc_instance_06
	(
		.munoc_port_2(munoc_port_01),
		.munoc_port_1(munoc_port_35),
		.munoc_port_0(munoc_port_14),
		.munoc_port_6(munoc_signal_27),
		.munoc_port_5(munoc_signal_39),
		.munoc_port_4(munoc_signal_42),
		.munoc_port_7(),
		.munoc_port_3()
	);

	MUNOC_MODULE_23
	#(
		.MUNOC_GPARA_1(MUNOC_GPARA_8),
		.MUNOC_GPARA_0(MUNOC_GPARA_0)
	)
	i_munoc_instance_08
	(
		.munoc_port_2(munoc_port_01),
		.munoc_port_1(munoc_port_35),
		.munoc_port_0(munoc_port_14),
		.munoc_port_6(munoc_signal_17),
		.munoc_port_5(munoc_signal_01),
		.munoc_port_4(munoc_signal_24),
		.munoc_port_7(),
		.munoc_port_3()
	);

	MUNOC_MODULE_05
	#(
		.MUNOC_GPARA_4(MUNOC_GPARA_8),
		.MUNOC_GPARA_2(MUNOC_GPARA_0),
		.MUNOC_GPARA_0(6),
		.MUNOC_GPARA_3(1)
	)
	i_munoc_instance_01
	(
		.munoc_port_4(munoc_port_01),
		.munoc_port_6(munoc_port_35),
		.munoc_port_8(munoc_port_14),
		.munoc_port_0(munoc_signal_00 & munoc_signal_41),
		.munoc_port_3(munoc_signal_40 & munoc_signal_07 & munoc_signal_37),
		.munoc_port_2(munoc_signal_04),
		.munoc_port_7(munoc_signal_35),
		.munoc_port_1(),
		.munoc_port_5()
	);

	always @(posedge munoc_port_01 or negedge munoc_port_35)
	begin
		if(munoc_port_35==0)
			munoc_signal_37 <= 1;
		else if(munoc_port_14)
		begin
			if(munoc_signal_40 & munoc_signal_07)
			begin
				if(munoc_signal_29)
					munoc_signal_37 <= 1;
				else
					munoc_signal_37 <= 0;
			end
		end
	end

	MUNOC_MODULE_05
	#(
		.MUNOC_GPARA_4(MUNOC_GPARA_8),
		.MUNOC_GPARA_2(MUNOC_GPARA_0),
		.MUNOC_GPARA_0(6)
	)
	i_munoc_instance_07
	(
		.munoc_port_4(munoc_port_01),
		.munoc_port_6(munoc_port_35),
		.munoc_port_8(munoc_port_14),
		.munoc_port_0((MUNOC_GPARA_4==1) & munoc_signal_40 & munoc_signal_07 & munoc_signal_29),
		.munoc_port_3((MUNOC_GPARA_4==1) & munoc_signal_23 & munoc_signal_08),
		.munoc_port_2(munoc_signal_03),
		.munoc_port_7(munoc_signal_45),
		.munoc_port_1(),
		.munoc_port_5()
	);

	always @(posedge munoc_port_01 or negedge munoc_port_35)
	begin
		if(munoc_port_35==0)
			munoc_signal_32 <= 1;
		else if(munoc_port_14)
		begin
			if(munoc_signal_17 & munoc_signal_01)
			begin
				if(munoc_signal_33)
					munoc_signal_32 <= 1;
				else
					munoc_signal_32 <= 0;
			end
		end
	end

	MUNOC_MODULE_05
	#(
		.MUNOC_GPARA_4(MUNOC_GPARA_8),
		.MUNOC_GPARA_2(MUNOC_GPARA_0),
		.MUNOC_GPARA_0(6)
	)
	i_munoc_instance_00
	(
		.munoc_port_4(munoc_port_01),
		.munoc_port_6(munoc_port_35),
		.munoc_port_8(munoc_port_14),
		.munoc_port_0(munoc_signal_27 & munoc_signal_39),
		.munoc_port_3(munoc_signal_17 & munoc_signal_01 & munoc_signal_32),
		.munoc_port_2(munoc_signal_28),
		.munoc_port_7(munoc_signal_18),
		.munoc_port_1(),
		.munoc_port_5()
	);
`else
	assign {munoc_signal_25,munoc_signal_19,munoc_signal_13,munoc_signal_42,munoc_signal_24} = 0;
	assign {munoc_signal_35,munoc_signal_45,munoc_signal_18} = 0;
`endif

always@(*)
begin
	munoc_port_24 = 0;
	munoc_port_00 = 0;
	if(MUNOC_GPARA_1==1)
	begin
		munoc_port_24 = {munoc_signal_24,munoc_signal_13,munoc_signal_35};
		munoc_port_00 = {munoc_signal_25,munoc_signal_19,munoc_signal_42,munoc_signal_45,munoc_signal_18};
	end
	else
		munoc_port_24 = {munoc_signal_25,munoc_signal_19,munoc_signal_42,munoc_signal_45,munoc_signal_18};
		munoc_port_00 = {munoc_signal_24,munoc_signal_13,munoc_signal_35};
	begin
	end
end

`ifdef __MUNOC_INCLUDE_BANDWIDTH_MONITOR

	MUNOC_MODULE_05
	#(
		.MUNOC_GPARA_4(MUNOC_GPARA_8),
		.MUNOC_GPARA_2(MUNOC_GPARA_0),
		.MUNOC_GPARA_0(6)
	)
	i_munoc_instance_03
	(
		.munoc_port_4(munoc_port_01),
		.munoc_port_6(munoc_port_35),
		.munoc_port_8(munoc_port_14),
		.munoc_port_0(munoc_signal_00 & munoc_signal_41),
		.munoc_port_3((MUNOC_GPARA_4==1)? (munoc_signal_23 & munoc_signal_08) : (munoc_signal_40 & munoc_signal_07 & munoc_signal_29)),
		.munoc_port_2(munoc_signal_20),
		.munoc_port_7(),
		.munoc_port_1(),
		.munoc_port_5()
	);

	MUNOC_MODULE_05
	#(
		.MUNOC_GPARA_4(MUNOC_GPARA_8),
		.MUNOC_GPARA_2(MUNOC_GPARA_0),
		.MUNOC_GPARA_0(6)
	)
	i_munoc_instance_04
	(
		.munoc_port_4(munoc_port_01),
		.munoc_port_6(munoc_port_35),
		.munoc_port_8(munoc_port_14),
		.munoc_port_0(munoc_signal_27 & munoc_signal_39),
		.munoc_port_3(munoc_signal_17 & munoc_signal_01 & munoc_signal_33),
		.munoc_port_2(munoc_signal_02),
		.munoc_port_7(),
		.munoc_port_1(),
		.munoc_port_5()
	);

	always@(*)
	begin
		munoc_signal_16 = 1;
		if(munoc_signal_27)
			munoc_signal_16 = 0;
		else if(munoc_signal_00)
			munoc_signal_16 = 0;
		else if(munoc_signal_40)
			munoc_signal_16 = 0;
		else if(~munoc_signal_20)
			munoc_signal_16 = 0;
		else if(~munoc_signal_02)
			munoc_signal_16 = 0;
	end

	MUNOC_MODULE_19
	#(
		.MUNOC_GPARA_1(`MUNOC_GDEF_24),
		.MUNOC_GPARA_2(`MUNOC_GDEF_10),
		.MUNOC_GPARA_0(`MUNOC_GDEF_05)
		)
	i_munoc_instance_02
	(
		.munoc_port_3(munoc_port_01),
		.munoc_port_4(munoc_port_35),
		.munoc_port_1(munoc_port_14),
		.munoc_port_2(munoc_signal_16),
		.munoc_port_0(munoc_port_15)
	);
`else
	assign munoc_port_15 = 0;
`endif

`ifdef __MUNOC_INCLUDE_AXI_CHECKER

	MUNOC_MODULE_18
	#(
		.MUNOC_GPARA_1(MUNOC_GPARA_6),
		.MUNOC_GPARA_2(MUNOC_GPARA_7),
		.MUNOC_GPARA_3(MUNOC_GPARA_5),
		.MUNOC_GPARA_0(MUNOC_GPARA_3)
	)
	i_munoc_instance_05
	(
		.munoc_port_09(munoc_port_01),
		.munoc_port_00(munoc_port_35),
		.munoc_port_06((MUNOC_GPARA_2==1) & munoc_port_14),

		.munoc_port_29(munoc_signal_31),
		.munoc_port_27(munoc_signal_43),
		.munoc_port_26(munoc_signal_36),
		.munoc_port_24(munoc_signal_09),
		.munoc_port_25(munoc_signal_06),
		.munoc_port_01(munoc_signal_00),
		.munoc_port_21(munoc_signal_41),

		.munoc_port_04(munoc_signal_10),
		.munoc_port_19(munoc_signal_21),
		.munoc_port_05(munoc_signal_15),
		.munoc_port_15(munoc_signal_29),
		.munoc_port_12(munoc_signal_40),
		.munoc_port_20(munoc_signal_07), 

		.munoc_port_14(munoc_signal_34),
		.munoc_port_17(munoc_signal_30),
		.munoc_port_07(munoc_signal_23),
		.munoc_port_03(munoc_signal_08),

		.munoc_port_23(munoc_signal_11),
		.munoc_port_33(munoc_signal_26),
		.munoc_port_32(munoc_signal_22),
		.munoc_port_08(munoc_signal_14),
		.munoc_port_10(munoc_signal_38),
		.munoc_port_31(munoc_signal_27),
		.munoc_port_22(munoc_signal_39),

		.munoc_port_13(munoc_signal_44),
		.munoc_port_18(munoc_signal_05),
		.munoc_port_02(munoc_signal_12),
		.munoc_port_16(munoc_signal_33),
		.munoc_port_28(munoc_signal_17),
		.munoc_port_11(munoc_signal_01),

		.munoc_port_30(munoc_port_17)
	);

`else
	assign munoc_port_17 = 0;
`endif

endmodule

