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


`ifndef __ERVP_AXI_DEFINE_H__
`define __ERVP_AXI_DEFINE_H__

`define BW_AXI_VALID 1
`define DEFAULT_BW_AXI_TID 4

`define BW_AXI_ALEN 8
`define BW_AXI_ASIZE 3
`define BW_AXI_ABURST 2
`define BW_AXI_ALOCK 2
`define BW_AXI_ACACHE 4
`define BW_AXI_APROT 3

`define BW_AXI3_ALEN 4
`define BW_AXI_RESP 2

`define BW_AXI_WSTRB(bw_node_data) `NUM_BYTE(bw_node_data)
`define BW_AXI_WLAST 1

`define BW_AXI_BRESP 2

`define BW_AXI_RRESP 2
`define BW_AXI_RLAST 1

`define MAX_BURST_LENGTH 16

`define AXI_BURST_FIXED (2'b 00)
`define AXI_BURST_INCR (2'b 01)
`define AXI_BURST_WRAP (2'b 10)

`define AXI_LENGTH_01 (4'b 0000)
`define AXI_LENGTH_02 (4'b 0001)
`define AXI_LENGTH_03 (4'b 0010)
`define AXI_LENGTH_04 (4'b 0011)
`define AXI_LENGTH_05 (4'b 0100)
`define AXI_LENGTH_06 (4'b 0101)
`define AXI_LENGTH_07 (4'b 0110)
`define AXI_LENGTH_08 (4'b 0111)
`define AXI_LENGTH_09 (4'b 1000)
`define AXI_LENGTH_10 (4'b 1001)
`define AXI_LENGTH_11 (4'b 1010)
`define AXI_LENGTH_12 (4'b 1011)
`define AXI_LENGTH_13 (4'b 1100)
`define AXI_LENGTH_14 (4'b 1101)
`define AXI_LENGTH_15 (4'b 1110)
`define AXI_LENGTH_16 (4'b 1111)

`define AXI_SIZE_001BYTE (3'b 000)
`define AXI_SIZE_002BYTE (3'b 001)
`define AXI_SIZE_004BYTE (3'b 010)
`define AXI_SIZE_008BYTE (3'b 011)
`define AXI_SIZE_016BYTE (3'b 100)
`define AXI_SIZE_032BYTE (3'b 101)
`define AXI_SIZE_064BYTE (3'b 110)
`define AXI_SIZE_128BYTE (3'b 111)

`define AXI_RESPONSE_OKAY (2'b 00)
`define AXI_RESPONSE_EXOKAY (2'b 01)
`define AXI_RESPONSE_SLVERR (2'b 10)
`define AXI_RESPONSE_DECERR (2'b 11)

`define BW_ARCHANNEL(bw_tid,bw_addr) ((bw_tid)+(bw_addr)+`BW_AXI_ALEN+`BW_AXI_ASIZE+`BW_AXI_ABURST)
`define BW_AWCHANNEL(bw_tid,bw_addr) ((bw_tid)+(bw_addr)+`BW_AXI_ALEN+`BW_AXI_ASIZE+`BW_AXI_ABURST)
`define BW_WCHANNEL(bw_tid,bw_data) ((bw_tid)+(bw_data)+`BW_AXI_WSTRB(bw_data)+`BW_AXI_WLAST)

`define BW_RCHANNEL(bw_tid,bw_data) ((bw_tid)+(bw_data)+`BW_AXI_RRESP+`BW_AXI_RLAST)
`define BW_BCHANNEL(bw_tid) ((bw_tid)+`BW_AXI_BRESP)

`define ULIMIT_OF_AXI_DATA_WIDTH (128*8)

`define GET_AXI_SIZE(bw_data) (((bw_data)==8)? `AXI_SIZE_001BYTE : (((bw_data)==16)? `AXI_SIZE_002BYTE : (((bw_data)==32)? `AXI_SIZE_004BYTE : (((bw_data)==64)? `AXI_SIZE_008BYTE : (((bw_data)==128)? `AXI_SIZE_016BYTE : (((bw_data)==256)? `AXI_SIZE_032BYTE : (((bw_data)==512)? `AXI_SIZE_064BYTE : (((bw_data)==1024)? `AXI_SIZE_128BYTE : -1))))))))

`endif
