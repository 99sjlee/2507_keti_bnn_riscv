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
`include "munoc_router_id.vh"
`include "munoc_node_id.vh"

module MUNOC_ROUTING_TABLE
(
	target_node,
	routing_info
);

parameter NETWORK_TYPE = `NOT_SELECTED;
parameter ROUTER_ID = -1;
parameter BW_NODE_ID = 1;
parameter NUM_OUTPUT = 1;

input wire [BW_NODE_ID-1:0] target_node;
output reg [NUM_OUTPUT-1:0] routing_info;

always@(*)
begin
	routing_info = 0;
	`include "munoc_routing_info.vh"
end

endmodule

