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
localparam MEMORY_OPERATION_TYPE_READ = 1<<0;
localparam MEMORY_OPERATION_TYPE_WRITE = 1<<1;
localparam MEMORY_OPERATION_TYPE_BOTH = MEMORY_OPERATION_TYPE_READ|MEMORY_OPERATION_TYPE_WRITE;

localparam READ_SUPPORTED = ((MEMORY_OPERATION_TYPE&MEMORY_OPERATION_TYPE_READ)!=0);
localparam READ_ONLY_SUPPORTED = (MEMORY_OPERATION_TYPE==MEMORY_OPERATION_TYPE_READ);
localparam WRITE_SUPPORTED = ((MEMORY_OPERATION_TYPE&MEMORY_OPERATION_TYPE_WRITE)!=0);
localparam WRITE_ONLY_SUPPORTED = (MEMORY_OPERATION_TYPE==MEMORY_OPERATION_TYPE_WRITE);
localparam EXCLUSIVE_SUPPORTED = READ_ONLY_SUPPORTED | WRITE_ONLY_SUPPORTED;
