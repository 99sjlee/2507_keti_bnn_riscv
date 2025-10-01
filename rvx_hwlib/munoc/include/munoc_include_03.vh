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


`ifndef MUNOC_GDEF_39
`define MUNOC_GDEF_39

`include "munoc_extended_config.vh"
`include "ervp_axi_define.vh"
`include "munoc_include_01.vh"

`define MUNOC_GDEF_33 1
`define MUNOC_GDEF_92 0
`define MUNOC_GDEF_42 1

`define MUNOC_GDEF_01(bw_addr) (`BW_SLAVE_NODE_ID+`MUNOC_GDEF_33+`BW_PACKET_DATATYPE+`BW_MASTER_NODE_ID+`BW_LONGEST_AXI_TID+(bw_addr)+`BW_AXI_ALEN+`BW_AXI_ASIZE+`BW_AXI_ABURST)
`ifdef __MUNOC_USE_SINGLE_DATA_WIDTH
	`define MUNOC_GDEF_53(target_node,packet_type,datatype,source_node,tid,addr,len,size,burst) {target_node,packet_type,source_node,tid,addr,len,size,burst}
`else
	`define MUNOC_GDEF_53(target_node,packet_type,datatype,source_node,tid,addr,len,size,burst) {target_node,packet_type,datatype,source_node,tid,addr,len,size,burst}
`endif
`define MUNOC_GDEF_40(bw_data) (`MUNOC_GDEF_59(bw_data)+`BW_AXI_WLAST)
`define MUNOC_GDEF_96(last,packed_data) {last,packed_data}

`define MUNOC_GDEF_59(bw_data) ((bw_data)+`NUM_BYTE(bw_data))
`define MUNOC_GDEF_34(bw_addr,bw_fwn_plit) `DIVIDERU(`MUNOC_GDEF_01(bw_addr),bw_fwn_plit)
`define MUNOC_GDEF_37(bw_data, bw_fwn_plit) `DIVIDERU(`MUNOC_GDEF_40(bw_data),bw_fwn_plit)
`define MUNOC_GDEF_82(bw_addr, bw_data, bw_fwn_plit) `MAX(`MUNOC_GDEF_34(bw_addr,bw_fwn_plit),`MUNOC_GDEF_37(bw_data,bw_fwn_plit))

`endif

