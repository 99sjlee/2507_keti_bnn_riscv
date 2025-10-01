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
`include "munoc_network_type.vh"
`include "munoc_network_link.vh"
`include "munoc_arbitration_type.vh"


module MUNOC_NETWORK_DUAL_ROUTER
(
	clk,
	rstnn,
	rfni_link_list,
	rfni_ready_list,
	rbni_link_list,
	rbni_ready_list,
	
	sfni_link_list,
	sfni_ready_list,
	sbni_link_list,
	sbni_ready_list
);


parameter ROUTER_ID = -1;
parameter BW_FNI_PHIT = 8;
parameter BW_BNI_PHIT = 8;
parameter NUM_MASTER = 1;
parameter NUM_SLAVE = 1;
parameter ARBITRATION_TYPE = `QOS_ARBITRATION;

localparam  MUNOC_LPARA_1 = `BW_FNI_LINK(BW_FNI_PHIT);
localparam  MUNOC_LPARA_0 = `BW_BNI_LINK(BW_BNI_PHIT);

input wire clk, rstnn;

input wire [MUNOC_LPARA_1*NUM_MASTER-1:0] rfni_link_list;
output wire [NUM_MASTER-1:0] rfni_ready_list;
output wire [MUNOC_LPARA_0*NUM_MASTER-1:0] rbni_link_list;
input wire [NUM_MASTER-1:0] rbni_ready_list;

output wire [MUNOC_LPARA_1*NUM_SLAVE-1:0] sfni_link_list;
input wire [NUM_SLAVE-1:0] sfni_ready_list;
input wire [MUNOC_LPARA_0*NUM_SLAVE-1:0] sbni_link_list;
output wire [NUM_SLAVE-1:0] sbni_ready_list;

MUNOC_NETWORK_ROUTER
#(
	.NETWORK_TYPE(`FORWARD_NETWORK),
	.ROUTER_ID(ROUTER_ID),
	.BW_PHIT(BW_FNI_PHIT),
	.NUM_INPUT(NUM_MASTER),
	.NUM_OUTPUT(NUM_SLAVE),
	.ARBITRATION_TYPE(ARBITRATION_TYPE)
)
i_munoc_instance_0
(
	.clk(clk),
	.rstnn(rstnn),
	.input_ready_list(rfni_ready_list),
	.input_port_list(rfni_link_list),
	.output_ready_list(sfni_ready_list),
	.output_port_list(sfni_link_list)
);

MUNOC_NETWORK_ROUTER
#(
	.NETWORK_TYPE(`BACKWARD_NETWORK),
	.ROUTER_ID(ROUTER_ID),
	.BW_PHIT(BW_BNI_PHIT),
	.NUM_INPUT(NUM_SLAVE),
	.NUM_OUTPUT(NUM_MASTER),
	.ARBITRATION_TYPE(ARBITRATION_TYPE)
)
i_munoc_instance_1
(
	.clk(clk),
	.rstnn(rstnn),
	.input_ready_list(sbni_ready_list),
	.input_port_list(sbni_link_list),
	.output_ready_list(rbni_ready_list),
	.output_port_list(rbni_link_list)
);

endmodule
