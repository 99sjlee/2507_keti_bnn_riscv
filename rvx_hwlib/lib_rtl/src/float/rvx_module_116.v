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
`include "fpir_define.vh"





module RVX_MODULE_116
(
	rvx_port_1,
  rvx_port_0,
  rvx_port_6,

  rvx_port_2,
  rvx_port_4,
  rvx_port_3,
	rvx_port_5
);





`include "rvx_include_05.vh"

`include "ervp_log_util.vf"
`include "ervp_bitwidth_util.vf"

parameter RVX_GPARA_0 = 0;
localparam  RVX_LPARA_1 = 0; 

localparam  RVX_LPARA_0 = REQUIRED_BITWIDTH_INDEX(BW_SIGNIFICAND_EXTENDED);

input wire [BW_FPIR_VALUE-1:0] rvx_port_1;
input wire [BW_FPIR_VALUE-1:0] rvx_port_0;
input wire rvx_port_6;

output wire [BW_FPIR_VALUE-1:0] rvx_port_2;
output wire [BW_FPIR_VALUE-1:0] rvx_port_4;
output wire rvx_port_3;
output wire [BW_FPIR_VALUE-1:0] rvx_port_5;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_13;
wire rvx_signal_04;
wire [BW_EXPONENT-1:0] rvx_signal_36;
wire [BW_SIGNIFICAND-1:0] rvx_signal_34;
wire [BW_GUARD-1:0] rvx_signal_38;
wire [BW_OVERFLOW-1:0] rvx_signal_07;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_27;
wire rvx_signal_31;
wire [BW_EXPONENT-1:0] rvx_signal_23;
wire [BW_SIGNIFICAND-1:0] rvx_signal_26;
wire [BW_GUARD-1:0] rvx_signal_44;
wire [BW_OVERFLOW-1:0] rvx_signal_43;

wire [BW_GUARD-1:0] rvx_signal_39;
wire [BW_GUARD-1:0] rvx_signal_00;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_10;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_12;

wire rvx_signal_22;
reg rvx_signal_08;
reg rvx_signal_02;

wire [BW_EXPONENT-1:0] rvx_signal_06;
wire [BW_EXPONENT-1:0] rvx_signal_41;
wire rvx_signal_05;
wire rvx_signal_16;

wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_18;
wire [RVX_LPARA_0-1:0] rvx_signal_37;
wire [BW_SIGNIFICAND_EXTENDED-1:0] rvx_signal_29;

reg  [`BW_FPIR_TYPE-1:0] rvx_signal_17;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_21;
wire rvx_signal_35;
wire [BW_EXPONENT-1:0] rvx_signal_25;
wire [BW_SIGNIFICAND-1:0] rvx_signal_11;
wire [BW_GUARD-1:0] rvx_signal_03;
wire [BW_OVERFLOW-1:0] rvx_signal_40;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_28;
wire rvx_signal_24;
wire [BW_EXPONENT-1:0] rvx_signal_15;
wire [BW_SIGNIFICAND-1:0] rvx_signal_32;
wire [BW_GUARD-1:0] rvx_signal_01;
wire [BW_OVERFLOW-1:0] rvx_signal_30;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_14;
wire rvx_signal_20;
wire [BW_EXPONENT-1:0] rvx_signal_33;
wire [BW_SIGNIFICAND-1:0] rvx_signal_09;
wire [BW_GUARD-1:0] rvx_signal_19;
reg  [BW_OVERFLOW-1:0] rvx_signal_42;

assign {rvx_signal_13, rvx_signal_04, rvx_signal_36, rvx_signal_34, rvx_signal_38, rvx_signal_07} = rvx_port_1;
assign {rvx_signal_27, rvx_signal_31, rvx_signal_23, rvx_signal_26, rvx_signal_44, rvx_signal_43} = rvx_port_0;
assign rvx_port_2 = {rvx_signal_21, rvx_signal_35, rvx_signal_25, rvx_signal_11, rvx_signal_03, rvx_signal_40};
assign rvx_port_4 = {rvx_signal_28, rvx_signal_24, rvx_signal_15, rvx_signal_32, rvx_signal_01, rvx_signal_30};
assign rvx_port_5 = {rvx_signal_14, rvx_signal_20, rvx_signal_33, rvx_signal_09, rvx_signal_19, rvx_signal_42};

assign rvx_signal_39 = (RVX_GPARA_0==0)? 0 : rvx_signal_38;
assign rvx_signal_00 = (RVX_GPARA_0==0)? 0 : rvx_signal_44;

assign rvx_signal_10 = {rvx_signal_34, rvx_signal_39};
assign rvx_signal_12 = {rvx_signal_26, rvx_signal_00};

always@(*)
begin
	rvx_signal_17 = `FPIR_TYPE_NORMAL;
	if(rvx_signal_13==`FPIR_TYPE_NAN)
    rvx_signal_17 = `FPIR_TYPE_NAN;
	else if(rvx_signal_27==`FPIR_TYPE_NAN)
    rvx_signal_17 = `FPIR_TYPE_NAN;
	else
		case(rvx_signal_13)
			`FPIR_TYPE_MINF:
				case(rvx_signal_27)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_NAN;
            else
              rvx_signal_17 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_MINF;
            else
              rvx_signal_17 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_MZERO:
						rvx_signal_17 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PZERO:
						rvx_signal_17 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_NORMAL:
						rvx_signal_17 = `FPIR_TYPE_MINF;
				endcase
			`FPIR_TYPE_PINF:
				case(rvx_signal_27)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_PINF;
            else
              rvx_signal_17 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_NAN;
            else
              rvx_signal_17 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_17 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_PZERO:
						rvx_signal_17 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_NORMAL:
						rvx_signal_17 = `FPIR_TYPE_PINF;
				endcase
			`FPIR_TYPE_MZERO:
				case(rvx_signal_27)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_PINF;
            else
              rvx_signal_17 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_MINF;
            else
              rvx_signal_17 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_17 = `FPIR_TYPE_MZERO;
					`FPIR_TYPE_PZERO:
						rvx_signal_17 = `FPIR_TYPE_PZERO;
				endcase
			`FPIR_TYPE_PZERO:
				case(rvx_signal_27)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_PINF;
            else
              rvx_signal_17 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_MINF;
            else
              rvx_signal_17 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_signal_17 = `FPIR_TYPE_PZERO;
					`FPIR_TYPE_PZERO:
						rvx_signal_17 = `FPIR_TYPE_PZERO;
				endcase
			`FPIR_TYPE_NORMAL:
				case(rvx_signal_27)
					`FPIR_TYPE_MINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_PINF;
            else
              rvx_signal_17 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
            if(rvx_port_6)
              rvx_signal_17 = `FPIR_TYPE_MINF;
            else
              rvx_signal_17 = `FPIR_TYPE_PINF;
				endcase
		endcase
end

assign rvx_signal_06 = $signed(rvx_signal_36) - $signed(rvx_signal_23);
assign rvx_signal_05 = rvx_signal_06[BW_EXPONENT-1]; 
assign rvx_signal_41 = (rvx_signal_05)? ((~rvx_signal_06)+1'b 1) : rvx_signal_06;
assign rvx_signal_16 = ($unsigned(rvx_signal_41) >= BW_SIGNIFICAND_EXTENDED);

RVX_MODULE_055
#(
  .RVX_GPARA_2(BW_SIGNIFICAND_EXTENDED),
	.RVX_GPARA_1(RVX_LPARA_0)
)
i_rvx_instance_0
(
  .rvx_port_0(rvx_signal_18),
  .rvx_port_1(rvx_signal_37),
  .rvx_port_2(rvx_signal_29)
);

assign rvx_signal_18 = rvx_signal_05? rvx_signal_10 : rvx_signal_12;
assign rvx_signal_37 = rvx_signal_41;

assign rvx_signal_21 = rvx_signal_17;
assign rvx_signal_35 = rvx_signal_04;
assign rvx_signal_25 = (rvx_signal_05)? rvx_signal_23 : rvx_signal_36;
assign {rvx_signal_11,rvx_signal_03} = rvx_signal_05? rvx_signal_29 : rvx_signal_10;
assign rvx_signal_40 = 0;

assign rvx_signal_28 = rvx_signal_17;
assign rvx_signal_24 = rvx_signal_31 ^ rvx_port_6;
assign rvx_signal_15 = rvx_signal_05? rvx_signal_23 : rvx_signal_36;
assign {rvx_signal_32,rvx_signal_01} = rvx_signal_05? rvx_signal_12 : rvx_signal_29;
assign rvx_signal_30 = 0;

assign rvx_signal_22 = (rvx_signal_17!=`FPIR_TYPE_NORMAL);

always@(*)
begin
	rvx_signal_08 = 0;
	if(rvx_signal_17==`FPIR_TYPE_NORMAL)
		case(rvx_signal_27)
			`FPIR_TYPE_MZERO,
			`FPIR_TYPE_PZERO:
				rvx_signal_08 = 1;
			`FPIR_TYPE_NORMAL:
				if(rvx_signal_16 && (~rvx_signal_05))
					rvx_signal_08 = 1;
		endcase
end

always@(*)
begin
	rvx_signal_02 = 0;
	if(rvx_signal_17==`FPIR_TYPE_NORMAL)
		case(rvx_signal_13)
			`FPIR_TYPE_MZERO,
			`FPIR_TYPE_PZERO:
				rvx_signal_02 = 1;
			`FPIR_TYPE_NORMAL:
				if(rvx_signal_16 && rvx_signal_05)
					rvx_signal_02 = 1;
		endcase
end

assign rvx_port_3 = (rvx_signal_22 | rvx_signal_08 | rvx_signal_02);
assign rvx_signal_14 = rvx_signal_17;
assign rvx_signal_20 = rvx_signal_08? rvx_signal_04 : rvx_signal_24;
assign rvx_signal_33 = rvx_signal_08? rvx_signal_36 : rvx_signal_23;
assign rvx_signal_09 = rvx_signal_08? rvx_signal_34 : rvx_signal_26;
assign rvx_signal_19 = rvx_signal_08? rvx_signal_38 : rvx_signal_44;
always@(*)
begin
  rvx_signal_42 = 0;
  if(rvx_signal_08)
  begin
    if(rvx_signal_36[BW_EXPONENT-1])
      rvx_signal_42 = -1;
  end
  else
  begin
    if(rvx_signal_23[BW_EXPONENT-1])
      rvx_signal_42 = -1;
  end
end

endmodule
