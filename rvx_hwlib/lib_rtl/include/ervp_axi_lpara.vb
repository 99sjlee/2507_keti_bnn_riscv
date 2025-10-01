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

localparam _BW_AXI_DATA_TEMP = AXI_PARA % 1000;
localparam BW_AXI_DATA_DEFAULT = 32;
localparam BW_AXI_DATA = (_BW_AXI_DATA_TEMP==0)? BW_AXI_DATA_DEFAULT : _BW_AXI_DATA_TEMP;

localparam AXI_PARA_2 = (AXI_PARA / 1000);
localparam _BW_AXI_ADDR_TEMP = AXI_PARA_2 % 100;
localparam BW_AXI_ADDR_DEFAULT = 32;
localparam BW_AXI_ADDR = (_BW_AXI_ADDR_TEMP==0)? BW_AXI_ADDR_DEFAULT : _BW_AXI_ADDR_TEMP;

localparam AXI_SIZE = `GET_AXI_SIZE(BW_AXI_DATA);
localparam BW_AXI_ADDR_OFFSET = AXI_SIZE;
