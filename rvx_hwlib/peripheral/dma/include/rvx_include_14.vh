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
parameter MAX_AXI_LENGTH = `AXI_LENGTH_16; 

localparam AXI_SIZE = `GET_AXI_SIZE(BW_AXI_DATA);
localparam AXI_SIZE_BYTE = (1 << AXI_SIZE);
localparam BW_DATA_BUFFER = (BW_AXI_DATA + 1); 
localparam BW_LINE_SIZE = `RVX_GDEF_367;
localparam BW_NUM_LINES = `RVX_GDEF_425;
