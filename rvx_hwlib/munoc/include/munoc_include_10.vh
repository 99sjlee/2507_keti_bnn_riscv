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


`ifndef MUNOC_GDEF_04
`define MUNOC_GDEF_04

`include "munoc_extended_config.vh"
`include "munoc_include_03.vh"
`include "munoc_include_06.vh"

`define MUNOC_GDEF_31(bw_addr,bw_data,bw_fwn_plit) (`MUNOC_GDEF_82(bw_addr,bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_55 3

`define MUNOC_GDEF_60(bw_addr,bw_fwn_plit) (`MUNOC_GDEF_34(bw_addr,bw_fwn_plit)*(bw_fwn_plit))
`define MUNOC_GDEF_28(bw_data,bw_fwn_plit) (`MUNOC_GDEF_37(bw_data,bw_fwn_plit)*(bw_fwn_plit))

`define MUNOC_GDEF_52 2

`define MUNOC_GDEF_56 (`REQUIRED_BW_OF_SLAVE_TID+`BW_PACKET_DATATYPE)
`define MUNOC_GDEF_58(bw_data,bw_bwn_plit) (`MUNOC_GDEF_87(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_03 2

`define MUNOC_GDEF_63(bw_data,bw_bwn_plit) (`MUNOC_GDEF_87(bw_data,bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_36(bw_bwn_plit) (`MUNOC_GDEF_47(bw_bwn_plit)*(bw_bwn_plit))
`define MUNOC_GDEF_57(bw_data,bw_bwn_plit) (`MUNOC_GDEF_06(bw_data,bw_bwn_plit)*(bw_bwn_plit))

`define MUNOC_GDEF_12 2

`endif

