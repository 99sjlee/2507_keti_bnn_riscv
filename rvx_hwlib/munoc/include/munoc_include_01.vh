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


`ifndef MUNOC_GDEF_38
`define MUNOC_GDEF_38

`define MUNOC_GDEF_23 3

`define MUNOC_GDEF_85 0
`define MUNOC_GDEF_43 1
`define MUNOC_GDEF_00 2
`define MUNOC_GDEF_17 3
`define MUNOC_GDEF_67 4
`define MUNOC_GDEF_91 5

`define MUNOC_GDEF_88(bw_data) (((bw_data)==32)? `MUNOC_GDEF_85 : (((bw_data)==64)? `MUNOC_GDEF_43 : (((bw_data)==128)? `MUNOC_GDEF_00 : (((bw_data)==256)? `MUNOC_GDEF_17 : (((bw_data)==512)? `MUNOC_GDEF_67 : (((bw_data)==1024)? `MUNOC_GDEF_91 : -1))))))

`endif

