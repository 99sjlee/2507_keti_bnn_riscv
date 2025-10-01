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




module RVX_MODULE_066
(
  rvx_port_5,
  rvx_port_0,
  rvx_port_6,
  rvx_port_4,
  rvx_port_2,
  rvx_port_3,
  rvx_port_1
);




parameter RVX_GPARA_1 = 1;
parameter RVX_GPARA_0 = 4;

input wire [RVX_GPARA_1-1:0] rvx_port_5;
output wire [RVX_GPARA_1-1:0] rvx_port_0;
input wire [RVX_GPARA_1*RVX_GPARA_0-1:0] rvx_port_6;
input wire [RVX_GPARA_1-1:0] rvx_port_4;
output wire rvx_port_2;
input wire rvx_port_3;
output wire [RVX_GPARA_0-1:0] rvx_port_1;

assign rvx_port_0 = rvx_port_3? rvx_port_4 : 0;
assign rvx_port_2 = ((rvx_port_5&rvx_port_4)!=0);

ERVP_MUX_WITH_ONEHOT_ENCODED_SELECT
#(
  .BW_DATA(RVX_GPARA_0),
  .NUM_DATA(RVX_GPARA_1)
 )
i_rvx_instance_0
(
	.data_input_list(rvx_port_6),
	.select(rvx_port_4),
	.data_output(rvx_port_1)
);

endmodule
