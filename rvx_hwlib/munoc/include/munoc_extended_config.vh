// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reserved.    
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
// 2015-05
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************


`ifndef __MUNOC_EXTENDED_CONFIG_H__
`define __MUNOC_EXTENDED_CONFIG_H__

`include "munoc_config.vh"
//`include "munoc_gravity_config.vh"
`include "ervp_axi_define.vh"

`ifdef MUNOC_INCLUDE_CONTROLLER
	`define __MUNOC_INCLUDE_CONTROLLER
	`ifdef MUNOC_INCLUDE_ROUTING_ERROR
		`define __MUNOC_INCLUDE_ROUTING_ERROR
	`endif

	`ifdef MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
		`define __MUNOC_INCLUDE_UNDEFINED_REGION_ACCESS_LOG
	`endif

	`ifdef MUNOC_INCLUDE_TIMEOUT_MONITOR
		`define __MUNOC_INCLUDE_TIMEOUT_MONITOR
	`endif

	`ifdef MUNOC_INCLUDE_BANDWIDTH_MONITOR
		`define __MUNOC_INCLUDE_BANDWIDTH_MONITOR
	`endif

	`ifdef MUNOC_INCLUDE_AXI_CHECKER
		`define __MUNOC_INCLUDE_AXI_CHECKER
	`endif
`endif

`ifdef MUNOC_USE_SINGLE_DATA_WIDTH
	`define __MUNOC_USE_SINGLE_DATA_WIDTH
`endif

`define ULIMIT_OF_DATA_WIDTH 128
`define LLIMIT_OF_DATA_WIDTH 32

`define BW_ADDR_OFFSET 4 // log2(`ULIMIT_OF_DATA_WIDTH/`BW_BYTE)

`define BW_MAX_NODE_ID `MAX(`BW_SLAVE_NODE_ID,`BW_MASTER_NODE_ID)

`define REQUIRED_BW_OF_SLAVE_TID (`BW_MASTER_NODE_ID+`BW_LONGEST_AXI_TID)

`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
	`define BW_PACKET_DATATYPE 0
`else
	`define BW_PACKET_DATATYPE 3
`endif


`define MAX_BW_FNI_PHIT `MAX((`BW_SLAVE_NODE_ID+1+`BW_PACKET_DATATYPE+`BW_MASTER_NODE_ID+`BW_LONGEST_AXI_TID+32+`BW_AXI_ALEN+`BW_AXI_ASIZE+`BW_AXI_ABURST),(`BW_LONGEST_MASTER_DATA+`BW_AXI_WSTRB(`BW_LONGEST_MASTER_DATA)+`BW_AXI_WLAST))
`define MIN_BW_FNI_PHIT `BW_SLAVE_NODE_ID

`define MAX_BW_BNI_PHIT (`BW_AXI_RLAST+`BW_AXI_RRESP+`BW_LONGEST_MASTER_DATA)
`define MIN_BW_BNI_PHIT (`BW_MASTER_NODE_ID+1+`BW_LONGEST_AXI_TID+2)

`endif


