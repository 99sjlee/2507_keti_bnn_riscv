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
`include "ervp_platform_controller_memorymap_offset.vh"
`include "ervp_string_util.vh"
`include "platform_info.vh"





module RVX_MODULE_099
(
	rvx_port_19,
	rvx_port_18,

	rvx_port_16,
	rvx_port_11,
	rvx_port_03,
	rvx_port_04,
	rvx_port_10,
	rvx_port_02,
	rvx_port_00,

	rvx_port_06,
	rvx_port_17,
	rvx_port_14,
	rvx_port_20,
	rvx_port_08,
	rvx_port_12,
	rvx_port_15,
	rvx_port_01,

	rvx_port_22,
	rvx_port_09,
	rvx_port_07,
	rvx_port_05,
	rvx_port_13,
	rvx_port_24,
	rvx_port_21,
	rvx_port_23
);





parameter RVX_GPARA_4 = 1;
parameter RVX_GPARA_0 = 32;
parameter RVX_GPARA_2 = `LITTLE_ENDIAN;
parameter RVX_GPARA_1 = `LITTLE_ENDIAN;
parameter RVX_GPARA_3 = 1;

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"
`include "ervp_endian.vf"

localparam  RVX_LPARA_5 = 32;
localparam  RVX_LPARA_0 = 64;
localparam  RVX_LPARA_2 = REQUIRED_BITWIDTH_UNSIGNED(2*RVX_GPARA_4);
localparam  RVX_LPARA_1 = RVX_GPARA_0;
localparam  RVX_LPARA_4 = 32;
localparam  RVX_LPARA_6 = 4;
localparam  RVX_LPARA_3 = `MIN(RVX_GPARA_4, RVX_LPARA_6);

input wire rvx_port_19, rvx_port_18;

input wire [`BW_BOOT_MODE-1:0] rvx_port_16;
input wire rvx_port_11;
input wire [RVX_GPARA_3-1:0] rvx_port_03;
input wire rvx_port_04;
output wire rvx_port_10;
input wire [RVX_LPARA_1*RVX_GPARA_4-1:0] rvx_port_02;
input wire [RVX_LPARA_5*RVX_GPARA_4-1:0] rvx_port_00;

input wire rvx_port_06;
input wire rvx_port_17;
input wire [RVX_GPARA_0-1:0] rvx_port_14;
input wire rvx_port_20;
input wire [RVX_LPARA_5-1:0] rvx_port_08;
output wire [RVX_LPARA_5-1:0] rvx_port_12;
output wire rvx_port_15;
output wire rvx_port_01;

input wire rvx_port_22;
input wire rvx_port_09;
input wire [RVX_GPARA_0-1:0] rvx_port_07;
input wire rvx_port_05;
input wire [RVX_LPARA_5-1:0] rvx_port_13;
output wire [RVX_LPARA_5-1:0] rvx_port_24;
output wire rvx_port_21;
output wire rvx_port_23;

genvar i;

wire [RVX_LPARA_5-1:0] rvx_signal_04;
wire [RVX_LPARA_5-1:0] rvx_signal_22;
wire [RVX_LPARA_5-1:0] rvx_signal_35;
wire [RVX_LPARA_5-1:0] rvx_signal_46;

wire rvx_signal_14;
wire rvx_signal_13;
wire [RVX_GPARA_0-1:0] rvx_signal_37;
wire rvx_signal_11;
wire [RVX_LPARA_5-1:0] rvx_signal_43;
wire [RVX_LPARA_5-1:0] rvx_signal_21;
wire rvx_signal_38;
wire rvx_signal_45;

wire rvx_signal_07;
wire [4-1:0] rvx_signal_23;
wire rvx_signal_03;
wire [1-1:0] rvx_signal_12;
wire rvx_signal_10;
wire [1-1:0] rvx_signal_30;
wire rvx_signal_18;
wire [1-1:0] rvx_signal_33;
wire rvx_signal_39;
wire [1-1:0] rvx_signal_02;
wire rvx_signal_27;
wire [32-1:0] rvx_signal_06;
wire rvx_signal_16;
wire [32-1:0] rvx_signal_31;
wire [32-1:0] rvx_signal_28;
wire rvx_signal_08;
wire [32-1:0] rvx_signal_05;
wire rvx_signal_40;
wire [32-1:0] rvx_signal_34;
wire rvx_signal_44;
wire [32-1:0] rvx_signal_42;
wire rvx_signal_41;
wire [32-1:0] rvx_signal_32;
wire [4-1:0] rvx_signal_29;
wire [(32)*(4)-1:0] rvx_signal_47;
wire [4-1:0] rvx_signal_19;
wire [(32)*(4)-1:0] rvx_signal_26;

wire [`BW_BOOT_MODE-1:0] rvx_signal_01;
wire rvx_signal_36;
wire rvx_signal_20;
wire [RVX_LPARA_1*RVX_GPARA_4-1:0] rvx_signal_25;
wire [RVX_LPARA_4-1:0] rvx_signal_15 [RVX_LPARA_6-1:0];
wire [RVX_LPARA_5*RVX_GPARA_4-1:0] rvx_signal_48;
wire [RVX_LPARA_5-1:0] rvx_signal_09 [RVX_LPARA_6-1:0];

reg [RVX_LPARA_2-1:0] rvx_signal_24;
reg [`BW_BOOT_STATUS-1:0] rvx_signal_00;
reg rvx_signal_17;

assign rvx_signal_04 = CHANGE_ENDIAN_BUS2MAN(RVX_LPARA_5,RVX_GPARA_2,rvx_port_08);
assign rvx_port_12 = CHANGE_ENDIAN_MAN2BUS(RVX_LPARA_5,RVX_GPARA_2,rvx_signal_22);
assign rvx_signal_35 = CHANGE_ENDIAN_BUS2MAN(RVX_LPARA_5,RVX_GPARA_1,rvx_port_13);
assign rvx_port_24 = CHANGE_ENDIAN_MAN2BUS(RVX_LPARA_5,RVX_GPARA_1,rvx_signal_46);

RVX_MODULE_067
#(
	.RVX_GPARA_2(2),
	.RVX_GPARA_0(RVX_GPARA_0),
	.RVX_GPARA_3(RVX_LPARA_5),
	.RVX_GPARA_1(1)
)
i_rvx_instance_3
(
	.rvx_port_00(rvx_port_19),
	.rvx_port_14(rvx_port_18),

	.rvx_port_03({rvx_port_06,rvx_port_22}),
	.rvx_port_07({rvx_port_17,rvx_port_09}),
	.rvx_port_17({rvx_port_14,rvx_port_07}),
	.rvx_port_11({rvx_port_20,rvx_port_05}),
	.rvx_port_04({rvx_signal_04,rvx_signal_35}),
	.rvx_port_10(2'b 0),
	.rvx_port_02({rvx_signal_22,rvx_signal_46}),
	.rvx_port_13({rvx_port_15,rvx_port_21}),
	.rvx_port_05({rvx_port_01,rvx_port_23}),

	.rvx_port_06(rvx_signal_14),
	.rvx_port_19(rvx_signal_13),
	.rvx_port_01(rvx_signal_37),
	.rvx_port_15(rvx_signal_11),
	.rvx_port_08(rvx_signal_43),
	.rvx_port_09(),
	.rvx_port_12(rvx_signal_21),
	.rvx_port_16(rvx_signal_38),
	.rvx_port_18(rvx_signal_45)
);

RVX_MODULE_038
#(
	.RVX_GPARA_0(RVX_GPARA_0),
	.RVX_GPARA_1(RVX_LPARA_5),
	.RVX_GPARA_2(`LITTLE_ENDIAN)
)
i_rvx_instance_4
(
	.rvx_port_03(rvx_port_19),
	.rvx_port_18(rvx_port_18),

	.rvx_port_00(rvx_signal_14),
	.rvx_port_10(rvx_signal_13),
	.rvx_port_30(rvx_signal_37),
	.rvx_port_11(rvx_signal_11),
	.rvx_port_14(rvx_signal_43),
	.rvx_port_04(rvx_signal_21),
	.rvx_port_15(rvx_signal_38),
	.rvx_port_21(rvx_signal_45),

	.rvx_port_02(1'b 0),
	.rvx_port_16(rvx_signal_07),
	.rvx_port_22(rvx_signal_23),
	.rvx_port_08(rvx_signal_03),
	.rvx_port_34(rvx_signal_12),
	.rvx_port_37(rvx_signal_10),
	.rvx_port_36(rvx_signal_30),
	.rvx_port_06(rvx_signal_18),
	.rvx_port_09(rvx_signal_33),
	.rvx_port_32(rvx_signal_39),
	.rvx_port_31(rvx_signal_02),
	.rvx_port_19(rvx_signal_27),
	.rvx_port_13(rvx_signal_06),
	.rvx_port_29(rvx_signal_16),
	.rvx_port_27(rvx_signal_31),
  .rvx_port_26(rvx_signal_28),
	.rvx_port_25(rvx_signal_08),
	.rvx_port_01(rvx_signal_05),
	.rvx_port_28(rvx_signal_40),
	.rvx_port_07(rvx_signal_34),
	.rvx_port_33(rvx_signal_44),
	.rvx_port_35(rvx_signal_42),
	.rvx_port_24(rvx_signal_41),
	.rvx_port_20(rvx_signal_32),
	.rvx_port_23(rvx_signal_29),
	.rvx_port_05(rvx_signal_47),
	.rvx_port_12(rvx_signal_19),
	.rvx_port_17(rvx_signal_26)
);

ERVP_SYNCHRONIZER
#(
	.BW_DATA(`BW_BOOT_MODE)
)
i_rvx_instance_5
(
	.clk(rvx_port_19),
	.rstnn(rvx_port_18),
	.enable(1'b 1),
	.asynch_value(rvx_port_16),
	.synch_value(rvx_signal_01)
);
assign rvx_signal_23 = rvx_signal_01;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_6
(
	.clk(rvx_port_19),
	.rstnn(rvx_port_18),
	.enable(1'b 1),
	.asynch_value(rvx_port_11),
	.synch_value(rvx_signal_36)
);
assign rvx_signal_02 = rvx_signal_36;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_2
(
	.clk(rvx_port_19),
	.rstnn(rvx_port_18),
	.enable(1'b 1),
	.asynch_value(`IS_ALL_ONE({rvx_port_04,rvx_port_03})),
	.synch_value(rvx_signal_20)
);
assign rvx_signal_12 = rvx_signal_20;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_1*RVX_GPARA_4)
)
i_rvx_instance_0
(
	.clk(rvx_port_19),
	.rstnn(rvx_port_18),
	.enable(1'b 1),
	.asynch_value(rvx_port_02),
	.synch_value(rvx_signal_25)
);

generate
	for(i=0; i<RVX_LPARA_3; i=i+1)
	begin: i_gen_valid_pc
		assign rvx_signal_15[i] = rvx_signal_25[RVX_LPARA_1*(i+1)-1 -:RVX_LPARA_1];
	end
endgenerate

generate
	for(i=RVX_LPARA_3; i<RVX_LPARA_6; i=i+1)
	begin: i_gen_invalid_pc
		assign rvx_signal_15[i] = 32'h FFFFFFFF;
	end
endgenerate

generate
	for(i=0; i<RVX_LPARA_6; i=i+1)
	begin: i_concat_pc
		assign rvx_signal_47[RVX_LPARA_5*(i+1)-1-:RVX_LPARA_5] = rvx_signal_15[i];
	end
endgenerate

ERVP_SYNCHRONIZER
#(
	.BW_DATA(RVX_LPARA_5*RVX_GPARA_4)
)
i_rvx_instance_1
(
	.clk(rvx_port_19),
	.rstnn(rvx_port_18),
	.enable(1'b 1),
	.asynch_value(rvx_port_00),
	.synch_value(rvx_signal_48)
);

generate
	for(i=0; i<RVX_LPARA_3; i=i+1)
	begin: i_gen_valid_inst
		assign rvx_signal_09[i] = rvx_signal_48[RVX_LPARA_5*(i+1)-1 -:RVX_LPARA_5];
	end
endgenerate

generate
	for(i=RVX_LPARA_3; i<RVX_LPARA_6; i=i+1)
	begin: i_gen_invalid_inst
		assign rvx_signal_09[i] = 32'h FFFFFFFF;
	end
endgenerate

generate
	for(i=0; i<RVX_LPARA_6; i=i+1)
	begin: i_concat_inst
		assign rvx_signal_26[RVX_LPARA_5*(i+1)-1-:RVX_LPARA_5] = rvx_signal_09[i];
	end
endgenerate

`ifdef RTL_IMP
assign rvx_signal_42 = `IMP_TYPE_RTL;
`else
`ifdef FPGA_IMP
assign rvx_signal_42 = `IMP_TYPE_FPGA;
`else
assign rvx_signal_42 = `IMP_TYPE_CHIP;
`endif
`endif

`ifdef FLASH_BASE_ADDR
assign rvx_signal_32 = `FLASH_BASE_ADDR;
`else
assign rvx_signal_32 = 0;
`endif

always@(posedge rvx_port_19, negedge rvx_port_18)
begin
	if(rvx_port_18==0)
		rvx_signal_24 <= 0;
	else if(rvx_signal_08)
	begin
		rvx_signal_24 <= rvx_signal_24 + 1'b 1;
		`ifdef SIM_ENV
			if((rvx_signal_24+1)>RVX_GPARA_4)
				$display("\n[PROC_STATUS] %2d cores have finished @%d ns", (rvx_signal_24+1)-RVX_GPARA_4, $time);
		`endif
	end
end
assign rvx_signal_05 = rvx_signal_24;
assign rvx_signal_34 = rvx_signal_24;

always@(posedge rvx_port_19, negedge rvx_port_18)
begin
	if(rvx_port_18==0)
		rvx_signal_00 <= `BOOT_STATUS_RESETED;
	else
		case(rvx_signal_00)
			`BOOT_STATUS_RESETED:
				if(rvx_signal_27)
					rvx_signal_00 <= `BOOT_STATUS_APP_LOAD;
			`BOOT_STATUS_APP_LOAD:
				if(rvx_signal_16)
					rvx_signal_00 <= `BOOT_STATUS_ALL_READY;
			`BOOT_STATUS_ALL_READY:
				;
		endcase
end
assign rvx_signal_06 = rvx_signal_00;

always@(posedge rvx_port_19, negedge rvx_port_18)
begin
	if(rvx_port_18==0)
		rvx_signal_17 <= 0;
	else if(rvx_signal_18)
		rvx_signal_17 <= 1;
end
assign rvx_signal_30 = rvx_signal_17;

assign rvx_port_10 = ($unsigned(rvx_signal_24)==(2*RVX_GPARA_4));

endmodule
