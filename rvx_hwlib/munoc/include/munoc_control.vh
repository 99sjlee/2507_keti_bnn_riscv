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

`ifndef MUNOC_GDEF_64
`define MUNOC_GDEF_64

`include "munoc_extended_config.vh"

`define MUNOC_GDEF_26 1
`define MUNOC_GDEF_50 0
`define MUNOC_GDEF_11 1

`define MUNOC_GDEF_32 8
`define MUNOC_GDEF_07 8

`define MUNOC_GDEF_16 (`MUNOC_GDEF_26+`MUNOC_GDEF_32+`MUNOC_GDEF_07)

`define MUNOC_GDEF_15 1
`define MUNOC_GDEF_77 0
`define MUNOC_GDEF_73 1
`define MUNOC_GDEF_84 (`MUNOC_GDEF_15 + `BW_MAX_NODE_ID)

`define MUNOC_GDEF_30 32
`define MUNOC_GDEF_65 (`MUNOC_GDEF_30)
`define BW_SVRING_LINK 2

`endif

