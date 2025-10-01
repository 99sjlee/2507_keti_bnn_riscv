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



module RVX_MODULE_094
(
	rvx_port_1,
  rvx_port_0,

  rvx_port_2
);



`include "rvx_include_05.vh"

input wire [BW_FPIR_VALUE-1:0] rvx_port_1;
input wire [BW_FPIR_VALUE-1:0] rvx_port_0;

output reg [`BW_FPIR_TYPE-1:0] rvx_port_2;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_03;
wire rvx_signal_02;
wire [BW_EXPONENT-1:0] rvx_signal_00;
wire [BW_SIGNIFICAND-1:0] rvx_signal_07;
wire [BW_GUARD-1:0] rvx_signal_10;
wire [BW_OVERFLOW-1:0] rvx_signal_04;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_08;
wire rvx_signal_11;
wire [BW_EXPONENT-1:0] rvx_signal_01;
wire [BW_SIGNIFICAND-1:0] rvx_signal_06;
wire [BW_GUARD-1:0] rvx_signal_09;
wire [BW_OVERFLOW-1:0] rvx_signal_05;

assign {rvx_signal_03, rvx_signal_02, rvx_signal_00, rvx_signal_07, rvx_signal_10, rvx_signal_04} = rvx_port_1;
assign {rvx_signal_08, rvx_signal_11, rvx_signal_01, rvx_signal_06, rvx_signal_09, rvx_signal_05} = rvx_port_0;

always@(*)
begin
	rvx_port_2 = `FPIR_TYPE_NORMAL;
	if(rvx_signal_03==`FPIR_TYPE_NAN)
    rvx_port_2 = `FPIR_TYPE_NAN;
	else if(rvx_signal_08==`FPIR_TYPE_NAN)
    rvx_port_2 = `FPIR_TYPE_NAN;
	else
		case(rvx_signal_03)
			`FPIR_TYPE_MINF:
				case(rvx_signal_08)
					`FPIR_TYPE_MINF:
						rvx_port_2 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_PINF:
						rvx_port_2 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_MZERO:
						rvx_port_2 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_PZERO:
						rvx_port_2 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_NORMAL:
						if(rvx_signal_11)
							rvx_port_2 = `FPIR_TYPE_PINF;
						else
							rvx_port_2 = `FPIR_TYPE_MINF;
				endcase
			`FPIR_TYPE_PINF:
				case(rvx_signal_08)
					`FPIR_TYPE_MINF:
						rvx_port_2 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
						rvx_port_2 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						rvx_port_2 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_PZERO:
						rvx_port_2 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_NORMAL:
						if(rvx_signal_11)
							rvx_port_2 = `FPIR_TYPE_MINF;
						else
							rvx_port_2 = `FPIR_TYPE_PINF;
				endcase
			`FPIR_TYPE_MZERO:
				case(rvx_signal_08)
					`FPIR_TYPE_MINF:
						rvx_port_2 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_PINF:
						rvx_port_2 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_MZERO:
						rvx_port_2 = `FPIR_TYPE_PZERO;
					`FPIR_TYPE_PZERO:
						rvx_port_2 = `FPIR_TYPE_MZERO;
					`FPIR_TYPE_NORMAL:
						if(rvx_signal_11)
							rvx_port_2 = `FPIR_TYPE_PZERO;
						else
							rvx_port_2 = `FPIR_TYPE_MZERO;
				endcase
			`FPIR_TYPE_PZERO:
				case(rvx_signal_08)
					`FPIR_TYPE_MINF:
						rvx_port_2 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_PINF:
						rvx_port_2 = `FPIR_TYPE_NAN;
					`FPIR_TYPE_MZERO:
						rvx_port_2 = `FPIR_TYPE_MZERO;
					`FPIR_TYPE_PZERO:
						rvx_port_2 = `FPIR_TYPE_PZERO;
					`FPIR_TYPE_NORMAL:
						if(rvx_signal_11)
							rvx_port_2 = `FPIR_TYPE_MZERO;
						else
							rvx_port_2 = `FPIR_TYPE_PZERO;
				endcase
			`FPIR_TYPE_NORMAL:
				case(rvx_signal_08)
					`FPIR_TYPE_MINF:
						if(rvx_signal_02)
							rvx_port_2 = `FPIR_TYPE_PINF;
						else
							rvx_port_2 = `FPIR_TYPE_MINF;
					`FPIR_TYPE_PINF:
						if(rvx_signal_02)
							rvx_port_2 = `FPIR_TYPE_MINF;
						else
							rvx_port_2 = `FPIR_TYPE_PINF;
					`FPIR_TYPE_MZERO:
						if(rvx_signal_02)
							rvx_port_2 = `FPIR_TYPE_PZERO;
						else
							rvx_port_2 = `FPIR_TYPE_MZERO;
					`FPIR_TYPE_PZERO:
						if(rvx_signal_02)
							rvx_port_2 = `FPIR_TYPE_MZERO;
						else
							rvx_port_2 = `FPIR_TYPE_PZERO;
					`FPIR_TYPE_NORMAL:
            rvx_port_2 = `FPIR_TYPE_NORMAL;
				endcase
		endcase
end

endmodule
