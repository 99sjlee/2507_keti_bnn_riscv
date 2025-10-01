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




module RVX_MODULE_096
(
	rvx_port_2,
  rvx_port_0,
  rvx_port_1,

  rvx_port_3
);




`include "rvx_include_05.vh"

input wire [BW_FPIR_VALUE-1:0] rvx_port_2;
input wire [BW_FPIR_VALUE-1:0] rvx_port_0;
input wire rvx_port_1;

output wire [`BW_FPIR_TYPE-1:0] rvx_port_3;

wire [`BW_FPIR_TYPE-1:0] rvx_signal_0;
wire [`BW_FPIR_TYPE-1:0] rvx_signal_1;

RVX_MODULE_094
#(
  .BW_EXPONENT(BW_EXPONENT),
  .BW_SIGNIFICAND(BW_SIGNIFICAND),
  .BW_GUARD(BW_GUARD),
  .BW_OVERFLOW(BW_OVERFLOW)
)
i_rvx_instance_1
(
	.rvx_port_1(rvx_port_2),
  .rvx_port_0(rvx_port_0),
  .rvx_port_2(rvx_signal_0)
);

RVX_MODULE_061
#(
  .BW_EXPONENT(BW_EXPONENT),
  .BW_SIGNIFICAND(BW_SIGNIFICAND),
  .BW_GUARD(BW_GUARD),
  .BW_OVERFLOW(BW_OVERFLOW)
)
i_rvx_instance_0
(
	.rvx_port_0(rvx_port_2),
  .rvx_port_2(rvx_port_0),
  .rvx_port_1(rvx_signal_1)
);

assign rvx_port_3 = rvx_port_1? rvx_signal_1 : rvx_signal_0;

endmodule
