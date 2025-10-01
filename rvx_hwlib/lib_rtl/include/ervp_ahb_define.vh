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

`ifndef __ERVP_AHB_DEFINE_H__
`define __ERVP_AHB_DEFINE_H__

`define BW_AHB_BURST 3
`define BW_AHB_PROT 4
`define BW_AHB_SIZE 3
`define BW_AHB_TRANS 2

`define AHB_TRANS_IDLE	(2'b 00)
`define AHB_TRANS_BUSY	(2'b 01)
`define AHB_TRANS_NONSEQ	(2'b 10)
`define AHB_TRANS_SEQ	(2'b 11)

`define AHB_BURST_SINGLE (3'b 000)
`define AHB_BURST_INCR (3'b 001)
`define AHB_BURST_WRAP4 (3'b 010)
`define AHB_BURST_INCR4 (3'b 011)
`define AHB_BURST_WRAP8 (3'b 100)
`define AHB_BURST_INCR8 (3'b 101)
`define AHB_BURST_WRAP16 (3'b 110)
`define AHB_BURST_INCR16 (3'b 111)

`define AHB_SIZE_001BYTE (3'b 000)
`define AHB_SIZE_002BYTE (3'b 001)
`define AHB_SIZE_004BYTE (3'b 010)
`define AHB_SIZE_008BYTE (3'b 011)
`define AHB_SIZE_016BYTE (3'b 100)
`define AHB_SIZE_032BYTE (3'b 101)
`define AHB_SIZE_064BYTE (3'b 110)
`define AHB_SIZE_128BYTE (3'b 111)

`define AHB_RESPONSE_OKAY (1'b 0)
`define AHB_RESPONSE_ERROR (1'b 1)

`endif
