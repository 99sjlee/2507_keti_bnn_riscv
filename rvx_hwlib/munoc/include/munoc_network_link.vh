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

`ifndef MUNOC_GDEF_45
`define MUNOC_GDEF_45

`include "munoc_network_type.vh"

`define MUNOC_GDEF_86 3
`define BW_FNI_LINK(bw_plit) ((bw_plit) + `MUNOC_GDEF_86)

`define MUNOC_GDEF_81 3
`define BW_BNI_LINK(bw_plit) ((bw_plit) + `MUNOC_GDEF_81)

`define MUNOC_GDEF_44(network_type) 0
`define MUNOC_GDEF_70(network_type) 1
`define MUNOC_GDEF_76(network_type) 2
`define MUNOC_GDEF_25(network_type) ((network_type==`FORWARD_NETWORK)? `MUNOC_GDEF_86 : `MUNOC_GDEF_81)
`define MUNOC_GDEF_19(network_type) ((network_type==`FORWARD_NETWORK)? `MUNOC_GDEF_86 : `MUNOC_GDEF_81)

`endif
