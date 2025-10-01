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
`include "ervp_axi_define.vh"





module MUNOC_MODULE_20
(
	munoc_port_30,
	munoc_port_16,

	munoc_port_17,
	munoc_port_11,
	munoc_port_23,
	munoc_port_52,
	munoc_port_48,
	munoc_port_41,
	munoc_port_69,

	munoc_port_25,
	munoc_port_56,
	munoc_port_18,
	munoc_port_67,
	munoc_port_06,
	munoc_port_10, 

	munoc_port_68,
	munoc_port_49,
	munoc_port_63,
	munoc_port_64,

	munoc_port_02,
	munoc_port_37,
	munoc_port_38,
	munoc_port_58,
	munoc_port_61,
	munoc_port_13,
	munoc_port_19,

	munoc_port_54,
	munoc_port_24,
	munoc_port_00,
	munoc_port_14,
	munoc_port_09,
	munoc_port_43,

	munoc_port_29,
	munoc_port_60,
	munoc_port_47,
	munoc_port_70,
	munoc_port_05,
	munoc_port_36,
	munoc_port_51,

	munoc_port_65,
	munoc_port_26,
	munoc_port_59,
	munoc_port_57,
	munoc_port_62,
	munoc_port_08, 

	munoc_port_33,
	munoc_port_27,
	munoc_port_22,
	munoc_port_15,

	munoc_port_66,
	munoc_port_35,
	munoc_port_20,
	munoc_port_44,
	munoc_port_46,
	munoc_port_53,
	munoc_port_42,

	munoc_port_04,
	munoc_port_01,
	munoc_port_40,
	munoc_port_28,
	munoc_port_39,
	munoc_port_07,

	munoc_port_31,
	munoc_port_34,
	munoc_port_03,
	munoc_port_21,
	munoc_port_32,
	munoc_port_45,
	munoc_port_12,
	munoc_port_55,
	munoc_port_50
);





parameter MUNOC_GPARA_6 = 32;
parameter MUNOC_GPARA_3 = 32;
parameter MUNOC_GPARA_0 = `DEFAULT_BW_AXI_TID;

parameter MUNOC_GPARA_5 = 0;
parameter MUNOC_GPARA_1 = 4;
parameter MUNOC_GPARA_4 = 4'h f;
parameter MUNOC_GPARA_2 = 0;

localparam  MUNOC_LPARA_0 = 4;

input wire munoc_port_30;
input wire munoc_port_16;

input wire [MUNOC_GPARA_0-1:0] munoc_port_17;
input wire [MUNOC_GPARA_6-1:0] munoc_port_11;
input wire [`BW_AXI_ALEN-1:0] munoc_port_23;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_52;
input wire [`BW_AXI_ABURST-1:0] munoc_port_48;
input wire munoc_port_41;
output reg munoc_port_69;

input wire [MUNOC_GPARA_0-1:0] munoc_port_25;
input wire [MUNOC_GPARA_3-1:0] munoc_port_56;
input wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_18;
input wire munoc_port_67;
input wire munoc_port_06;
output reg munoc_port_10;

output wire [MUNOC_GPARA_0-1:0] munoc_port_68;
output wire [`BW_AXI_BRESP-1:0] munoc_port_49;
output wire munoc_port_63;
input wire munoc_port_64;

input wire [MUNOC_GPARA_0-1:0] munoc_port_02;
input wire [MUNOC_GPARA_6-1:0] munoc_port_37;
input wire [`BW_AXI_ALEN-1:0] munoc_port_38;
input wire [`BW_AXI_ASIZE-1:0] munoc_port_58;
input wire [`BW_AXI_ABURST-1:0] munoc_port_61;
input wire munoc_port_13;
output wire munoc_port_19;

output wire [MUNOC_GPARA_0-1:0] munoc_port_54;
output wire [MUNOC_GPARA_3-1:0] munoc_port_24;
output wire [`BW_AXI_RRESP-1:0] munoc_port_00;
output wire munoc_port_14;
output wire munoc_port_09;
input wire munoc_port_43;

output wire [MUNOC_GPARA_0-1:0] munoc_port_29;
output wire [MUNOC_GPARA_6-1:0] munoc_port_60;
output wire [`BW_AXI_ALEN-1:0] munoc_port_47;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_70;
output wire [`BW_AXI_ABURST-1:0] munoc_port_05;
output reg munoc_port_36;
input wire munoc_port_51;

output wire [MUNOC_GPARA_0-1:0] munoc_port_65;
output wire [MUNOC_GPARA_3-1:0] munoc_port_26;
output wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_port_59;
output wire munoc_port_57;
output reg munoc_port_62;
input wire munoc_port_08;

input wire [MUNOC_GPARA_0-1:0] munoc_port_33;
input wire [`BW_AXI_BRESP-1:0] munoc_port_27;
input wire munoc_port_22;
output wire munoc_port_15;

output wire [MUNOC_GPARA_0-1:0] munoc_port_66;
output wire [MUNOC_GPARA_6-1:0] munoc_port_35;
output wire [`BW_AXI_ALEN-1:0] munoc_port_20;
output wire [`BW_AXI_ASIZE-1:0] munoc_port_44;
output wire [`BW_AXI_ABURST-1:0] munoc_port_46;
output wire munoc_port_53;
input wire munoc_port_42;

input wire [MUNOC_GPARA_0-1:0] munoc_port_04;
input wire [MUNOC_GPARA_3-1:0] munoc_port_01;
input wire [`BW_AXI_RRESP-1:0] munoc_port_40;
input wire munoc_port_28;
input wire munoc_port_39;
output wire munoc_port_07;

output wire [MUNOC_GPARA_6-1:0] munoc_port_31;
output wire munoc_port_34;
output wire munoc_port_03;
output wire munoc_port_21;
output wire [MUNOC_GPARA_3-1:0] munoc_port_32;
input wire [MUNOC_GPARA_3-1:0] munoc_port_45;
input wire munoc_port_12;
input wire munoc_port_55;
output reg munoc_port_50;

wire [MUNOC_GPARA_0-1:0] munoc_signal_54;
wire [MUNOC_GPARA_6-1:0] munoc_signal_53;
wire [`BW_AXI_ALEN-1:0] munoc_signal_27;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_57;
wire [`BW_AXI_ABURST-1:0] munoc_signal_02;
reg munoc_signal_56;
wire munoc_signal_30;

wire [MUNOC_GPARA_0-1:0] munoc_signal_15;
wire [MUNOC_GPARA_3-1:0] munoc_signal_17;
wire [`BW_AXI_WSTRB(MUNOC_GPARA_3)-1:0] munoc_signal_22;
wire munoc_signal_32;
reg munoc_signal_49;
wire munoc_signal_26;

wire [MUNOC_GPARA_0-1:0] munoc_signal_09;
wire [`BW_AXI_BRESP-1:0] munoc_signal_55;
wire munoc_signal_20;
wire munoc_signal_46;

wire [MUNOC_GPARA_0-1:0] munoc_signal_16;
wire [MUNOC_GPARA_6-1:0] munoc_signal_31;
wire [`BW_AXI_ALEN-1:0] munoc_signal_05;
wire [`BW_AXI_ASIZE-1:0] munoc_signal_13;
wire [`BW_AXI_ABURST-1:0] munoc_signal_51;
wire munoc_signal_29;
wire munoc_signal_44;

wire [MUNOC_GPARA_0-1:0] munoc_signal_11;
wire [MUNOC_GPARA_3-1:0] munoc_signal_59;
wire [`BW_AXI_RRESP-1:0] munoc_signal_04;
wire munoc_signal_23;
wire munoc_signal_24;
wire munoc_signal_08;

wire munoc_signal_00;
wire munoc_signal_18;
wire munoc_signal_60;
wire munoc_signal_50;
wire munoc_signal_39;

`define MUNOC_LDEF_4 2
`define MUNOC_LDEF_3 3
`define MUNOC_LDEF_1 0
`define MUNOC_LDEF_5 1
`define MUNOC_LDEF_0 2
`define MUNOC_LDEF_2 3
`define MUNOC_LDEF_6 4

reg [`MUNOC_LDEF_4-1:0] munoc_signal_61;
reg munoc_signal_28;
wire munoc_signal_62;
wire munoc_signal_52;

wire munoc_signal_01;
wire munoc_signal_33;
wire munoc_signal_47;
wire munoc_signal_35;

wire munoc_signal_34;
wire munoc_signal_38;
wire munoc_signal_21;
wire munoc_signal_37;

wire munoc_signal_41;
wire munoc_signal_45;

reg [`MUNOC_LDEF_3-1:0] munoc_signal_48;
reg munoc_signal_19;
wire munoc_signal_43;
wire munoc_signal_03;

wire munoc_signal_42;
wire munoc_signal_06;
wire munoc_signal_14;
wire munoc_signal_36;

wire munoc_signal_07;
wire munoc_signal_58;
wire munoc_signal_12;
wire munoc_signal_40;

wire munoc_signal_10;
wire munoc_signal_25;

assign munoc_signal_54 = munoc_port_17;
assign munoc_signal_53 = munoc_port_11;
assign munoc_signal_27 = munoc_port_23;
assign munoc_signal_57 = munoc_port_52;
assign munoc_signal_02 = munoc_port_48;

assign munoc_signal_15 = munoc_port_25;
assign munoc_signal_17 = munoc_port_56;
assign munoc_signal_22 = munoc_port_18;
assign munoc_signal_32 = munoc_port_67;

assign munoc_signal_16 = munoc_port_02;
assign munoc_signal_31 = munoc_port_37;
assign munoc_signal_05 = munoc_port_38;
assign munoc_signal_13 = munoc_port_58;
assign munoc_signal_51 = munoc_port_61;

assign munoc_port_29 = munoc_port_17;
assign munoc_port_60 = munoc_port_11;
assign munoc_port_47 = munoc_port_23;
assign munoc_port_70 = munoc_port_52;
assign munoc_port_05 = munoc_port_48;

assign munoc_port_65 = munoc_port_25;
assign munoc_port_26 = munoc_port_56;
assign munoc_port_59 = munoc_port_18;
assign munoc_port_57 = munoc_port_67;

assign munoc_port_66 = munoc_port_02;
assign munoc_port_35 = munoc_port_37;
assign munoc_port_20 = munoc_port_38;
assign munoc_port_44 = munoc_port_58;
assign munoc_port_46 = munoc_port_61;

assign munoc_port_68 = munoc_signal_03? munoc_signal_09 : munoc_port_33;
assign munoc_port_49 = munoc_signal_03? munoc_signal_55 : munoc_port_27;

assign munoc_port_54 = munoc_signal_52? munoc_signal_11 : munoc_port_04;
assign munoc_port_24 = munoc_signal_52? munoc_signal_59 : munoc_port_01;
assign munoc_port_00 = munoc_signal_52? munoc_signal_04 : munoc_port_40;
assign munoc_port_14 = munoc_signal_52? munoc_signal_23 : munoc_port_28;

assign munoc_signal_00 = munoc_port_13 & munoc_port_19;
assign munoc_signal_18 = munoc_port_09 & munoc_port_43 & munoc_port_14;
assign munoc_signal_60 = munoc_port_41 & munoc_port_69;
assign munoc_signal_50 = munoc_port_06 & munoc_port_10 & munoc_port_67;
assign munoc_signal_39 = munoc_port_63 & munoc_port_64;

always@(posedge munoc_port_30, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
	begin
		munoc_signal_61 <= `MUNOC_LDEF_1;
		munoc_signal_28 <= 0;
	end
	else
	begin
		case(munoc_signal_61)
			`MUNOC_LDEF_1:
				if(munoc_port_13)
				begin
					munoc_signal_28 <= munoc_signal_62;
					if(munoc_signal_62)
					begin
						if(munoc_signal_41)
							munoc_signal_61 <= `MUNOC_LDEF_0;
						else
							munoc_signal_61 <= `MUNOC_LDEF_5;
					end
					else
					begin
						if(munoc_signal_45)
							munoc_signal_61 <= `MUNOC_LDEF_0;
						else
							munoc_signal_61 <= `MUNOC_LDEF_5;
					end
				end
			`MUNOC_LDEF_5:
				if(munoc_signal_28)
				begin
					if(munoc_signal_41)
						munoc_signal_61 <= `MUNOC_LDEF_0;
				end
				else
				begin
					if(munoc_signal_45)
						munoc_signal_61 <= `MUNOC_LDEF_0;
				end
			`MUNOC_LDEF_0:
				if(munoc_signal_00)
					munoc_signal_61 <= `MUNOC_LDEF_1;
		endcase
	end
end

assign munoc_signal_62 = (munoc_port_37[MUNOC_GPARA_6-1-:MUNOC_GPARA_1]==MUNOC_GPARA_4);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_1
(
	.clk(munoc_port_30),
	.rstnn(munoc_port_16),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_01),
	.wfull(munoc_signal_47),
	.wrequest(munoc_signal_33),
	.wdata(munoc_signal_35),
	.rready(munoc_signal_34),
	.rempty(munoc_signal_21),
	.rrequest(munoc_signal_38),
	.rdata(munoc_signal_37)
);

assign munoc_signal_33 = (MUNOC_GPARA_5==0)? 0 : munoc_signal_00;
assign munoc_signal_35 = munoc_signal_62;
assign munoc_signal_38 = (MUNOC_GPARA_5==0)? 0 : munoc_signal_18;
assign munoc_signal_52 = (MUNOC_GPARA_5==0)? 0 : munoc_signal_37;

assign munoc_signal_41 = (~munoc_signal_47);
assign munoc_signal_45 = (~munoc_signal_47);

always@(posedge munoc_port_30, negedge munoc_port_16)
begin
	if(munoc_port_16==0)
	begin
		munoc_signal_48 <= `MUNOC_LDEF_1;
		munoc_signal_19 <= 0;
	end
	else
	begin
		case(munoc_signal_48)
			`MUNOC_LDEF_1:
				if(munoc_port_41)
				begin
					munoc_signal_19 <= munoc_signal_43;
					if(munoc_signal_43)
					begin
						if(munoc_signal_10)
							munoc_signal_48 <= `MUNOC_LDEF_0;
						else
							munoc_signal_48 <= `MUNOC_LDEF_5;
					end
					else
					begin
						if(munoc_signal_25)
							munoc_signal_48 <= `MUNOC_LDEF_0;
						else
							munoc_signal_48 <= `MUNOC_LDEF_5;
					end
				end
			`MUNOC_LDEF_5:
				if(munoc_signal_19)
				begin
					if(munoc_signal_10)
						munoc_signal_48 <= `MUNOC_LDEF_0;
				end
				else
				begin
					if(munoc_signal_25)
						munoc_signal_48 <= `MUNOC_LDEF_0;
				end
			`MUNOC_LDEF_0:
				if(munoc_signal_60 && munoc_signal_50)
					munoc_signal_48 <= `MUNOC_LDEF_1;
				else if(munoc_signal_60)
					munoc_signal_48 <= `MUNOC_LDEF_6;
				else if(munoc_signal_50)
					munoc_signal_48 <= `MUNOC_LDEF_2;
			`MUNOC_LDEF_2:
				if(munoc_signal_60)
					munoc_signal_48 <= `MUNOC_LDEF_1;
			`MUNOC_LDEF_6:
				if(munoc_signal_50)
					munoc_signal_48 <= `MUNOC_LDEF_1;
		endcase
	end
end

assign munoc_signal_43 = (munoc_port_11[MUNOC_GPARA_6-1-:MUNOC_GPARA_1]==MUNOC_GPARA_4);

ERVP_SMALL_FIFO
#(
	.BW_DATA(1),
	.DEPTH(4)
)
i_munoc_instance_0
(
	.clk(munoc_port_30),
	.rstnn(munoc_port_16),
	.enable(1'b 1),
  .clear(1'b 0),
	.wready(munoc_signal_42),
	.wfull(munoc_signal_14),
	.wrequest(munoc_signal_06),
	.wdata(munoc_signal_36),
	.rready(munoc_signal_07),
	.rempty(munoc_signal_12),
	.rrequest(munoc_signal_58),
	.rdata(munoc_signal_40)
);

assign munoc_signal_06 = (MUNOC_GPARA_5==0)? 0 : munoc_signal_60;
assign munoc_signal_36 = munoc_signal_43;
assign munoc_signal_58 = (MUNOC_GPARA_5==0)? 0 : munoc_signal_39;
assign munoc_signal_03 = (MUNOC_GPARA_5==0)? 0 : munoc_signal_40;

assign munoc_signal_10 = (~munoc_signal_14);
assign munoc_signal_25 = (~munoc_signal_14);

assign munoc_signal_29 = (MUNOC_GPARA_5==0)? 0 : ((munoc_signal_61==`MUNOC_LDEF_0) & munoc_signal_28);
assign munoc_port_53 = (MUNOC_GPARA_5==0)? munoc_port_13 : ((munoc_signal_61==`MUNOC_LDEF_0) & (~munoc_signal_28));
assign munoc_port_19 = (MUNOC_GPARA_5==0)? munoc_port_42 : (munoc_signal_61==`MUNOC_LDEF_0) & (((munoc_signal_28) & munoc_signal_44) | ((~munoc_signal_28) & munoc_port_42));

assign munoc_signal_08 = (MUNOC_GPARA_5==0)? 0 : (munoc_signal_34 & (munoc_signal_52) & munoc_port_43);
assign munoc_port_07 = (MUNOC_GPARA_5==0)? munoc_port_43 : (munoc_signal_34 & (~munoc_signal_52) & munoc_port_43);
assign munoc_port_09 = (MUNOC_GPARA_5==0)? munoc_port_39 : (munoc_signal_34 & (((munoc_signal_52) & munoc_signal_24) | ((~munoc_signal_52) & munoc_port_39)));

always@(*)
begin
	munoc_signal_56 = 0;
	munoc_port_36 = 0;
	munoc_port_69 = 0;
	if(MUNOC_GPARA_5==0)
	begin
		munoc_port_36 = munoc_port_41;
		munoc_port_69 = munoc_port_51;
	end
	else
	begin
		case(munoc_signal_48)
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_2:
			begin
				if(munoc_signal_19)
				begin
					munoc_signal_56 = 1'b 1;
					munoc_port_69 = munoc_signal_30;
				end
				else
				begin
					munoc_port_36 = 1'b 1;
					munoc_port_69 = munoc_port_51;
				end
			end
		endcase
	end
end

always@(*)
begin
	munoc_signal_49 = 0;
	munoc_port_62 = 0;
	munoc_port_10 = 0;
	if(MUNOC_GPARA_5==0)
	begin
		munoc_port_62 = munoc_port_06;
		munoc_port_10 = munoc_port_08;
	end
	else
	begin
		case(munoc_signal_48)
			`MUNOC_LDEF_0,
			`MUNOC_LDEF_6:
			begin
				if(munoc_signal_19)
				begin
					munoc_signal_49 = munoc_port_06;
					munoc_port_10 = munoc_signal_26;
				end
				else
				begin
					munoc_port_62 = munoc_port_06;
					munoc_port_10 = munoc_port_08;
				end
			end
		endcase
	end
end

assign munoc_signal_46 = (MUNOC_GPARA_5==0)? 0 : (munoc_signal_07 & (munoc_signal_03) & munoc_port_64);
assign munoc_port_15 = (MUNOC_GPARA_5==0)? munoc_port_64 : (munoc_signal_07 & (~munoc_signal_03) & munoc_port_64);
assign munoc_port_63 = (MUNOC_GPARA_5==0)? munoc_port_22 : (munoc_signal_07 & (((munoc_signal_03) & munoc_signal_20) | ((~munoc_signal_03) & munoc_port_22)));

MUNOC_AXI2APB_BRIDGE
#(
	.BW_AXI_TID(MUNOC_GPARA_0),
	.BW_PLATFORM_ADDR(MUNOC_GPARA_6),
	.BW_NODE_DATA(MUNOC_GPARA_3),
	.CHECK_WID(MUNOC_GPARA_2)
)
i_munoc_instance_2
(
	.clk(munoc_port_30),
	.rstnn(munoc_port_16),

	.rxawid(munoc_signal_54),
	.rxawaddr(munoc_signal_53),
	.rxawlen(munoc_signal_27),
	.rxawsize(munoc_signal_57),
	.rxawburst(munoc_signal_02),
	.rxawvalid(munoc_signal_56),
	.rxawready(munoc_signal_30),

	.rxwid(munoc_signal_15),
	.rxwdata(munoc_signal_17),
	.rxwstrb(munoc_signal_22),
	.rxwlast(munoc_signal_32),
	.rxwvalid(munoc_signal_49),
	.rxwready(munoc_signal_26),

	.rxbid(munoc_signal_09),
	.rxbresp(munoc_signal_55),
	.rxbvalid(munoc_signal_20),
	.rxbready(munoc_signal_46),

	.rxarid(munoc_signal_16),
	.rxaraddr(munoc_signal_31),
	.rxarlen(munoc_signal_05),
	.rxarsize(munoc_signal_13),
	.rxarburst(munoc_signal_51),
	.rxarvalid(munoc_signal_29),
	.rxarready(munoc_signal_44),

	.rxrid(munoc_signal_11),
	.rxrdata(munoc_signal_59),
	.rxrresp(munoc_signal_04),
	.rxrlast(munoc_signal_23),
	.rxrvalid(munoc_signal_24),
	.rxrready(munoc_signal_08),

	.spaddr(munoc_port_31),
	.spwrite(munoc_port_34),
	.spsel(munoc_port_03),
	.spenable(munoc_port_21),
	.spwdata(munoc_port_32),
	.sptid(),
	.sprdata(munoc_port_45),
	.spready(munoc_port_12),
	.spslverr(munoc_port_55),
	.spwstrb()
);

always@(*)
begin
	munoc_port_50 = 1;
	if(munoc_signal_52)
		if(munoc_port_39)
			munoc_port_50 = 0;
	if(munoc_signal_03)
		if(munoc_port_22)
			munoc_port_50 = 0;
end

endmodule
