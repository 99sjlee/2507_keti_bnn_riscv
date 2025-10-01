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


`ifndef MUNOC_GDEF_20
`define MUNOC_GDEF_20

`define MUNOC_GDEF_97(bw_node_data) `MAX((REQUIRED_BITWIDTH_INDEX(`BW_LONGEST_MASTER_DATA/(bw_node_data))),(`BW_AXI_ALEN+1))

`define MUNOC_GDEF_75 (`BW_AXI_ALEN+3)

`define MUNOC_GDEF_13 (`BW_PACKET_DATATYPE+`BW_AXI_ASIZE+`BW_ADDR_OFFSET+`MUNOC_GDEF_75)
`define MUNOC_GDEF_93(bw_node_data) (`BW_MASTER_NODE_ID+`BW_LONGEST_AXI_TID+`MUNOC_GDEF_97(bw_node_data))

`endif

