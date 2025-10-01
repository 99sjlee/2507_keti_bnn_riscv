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
`ifndef __ERVP_JTAG_MEMORYMAP_OFFSET_H__
`define __ERVP_JTAG_MEMORYMAP_OFFSET_H__

`define BW_MMAP_OFFSET_ERVP_JTAG 5
`define ERVP_JTAG_ADDR_INTERVAL 8
`define BW_UNUSED_ERVP_JTAG 3
`define NUM_ERVP_JTAG_SUBMODULE 1

`define MMAP_SUBOFFSET_JTAG_INST (32'h 0)
`define MMAP_SUBOFFSET_JTAG_REQUEST (32'h 8)
`define MMAP_SUBOFFSET_JTAG_RESPONSE (32'h 10)

`define MMAP_OFFSET_JTAG_INST (`MMAP_SUBOFFSET_JTAG_INST)
`define MMAP_OFFSET_JTAG_REQUEST (`MMAP_SUBOFFSET_JTAG_REQUEST)
`define MMAP_OFFSET_JTAG_RESPONSE (`MMAP_SUBOFFSET_JTAG_RESPONSE)

`define BW_JTAG_INST 4
`define JTAG_INST_DEFAULT_VALUE 0
`define JTAG_INST_EXTEST 0
`define JTAG_INST_RESERVED 1
`define JTAG_INST_IDCODE 2
`define JTAG_INST_BYPASS -1
`define JTAG_INST_REQUEST 8
`define JTAG_INST_RESPONSE 9
`define JTAG_INST_NUM_REQUEST 10
`define JTAG_INST_NUM_RESPONSE 11

`define BW_JTAG_REQUEST 32
`define JTAG_REQUEST_DEFAULT_VALUE 0

`define BW_JTAG_RESPONSE 32
`define JTAG_RESPONSE_DEFAULT_VALUE 0

`define BW_JTAG_CMD 2
`define JTAG_CMD_DEFAULT_VALUE 0
`define JTAG_CMD_SYSTEM_READ 0
`define JTAG_CMD_SYSTEM_WRITE 1
`define JTAG_CMD_MEMORY_READ 2
`define JTAG_CMD_MEMORY_WRITE 3

`define BW_JTAG_RESULT 2
`define JTAG_RESULT_DEFAULT_VALUE 0
`define JTAG_RESULT_OKAY 0
`define JTAG_RESULT_ERROR 1
`define JTAG_RESULT_BUSY 2

`endif