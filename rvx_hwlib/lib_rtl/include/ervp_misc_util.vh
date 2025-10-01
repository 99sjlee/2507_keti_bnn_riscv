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


`ifndef __ERVP_MISC_UTIL_H__
`define __ERVP_MISC_UTIL_H__

`define ALL_ONE (~0)
`define IS_ALL_ONE(x) ($unsigned(~(x))==0)

`define MAX(a,b) (((a)>=(b))? (a) : (b))
`define MIN(a,b) (((a)<=(b))? (a) : (b))
`define LEAST1(a) `MAX(a,1)

`define DIVIDERU(dividend,divisor) ((((dividend)-1)/(divisor))+1)
`define DIVIDERD(dividend,divisor) (((dividend))/(divisor))
`define QUANTIZERU(value, step) (`DIVIDERU(value,step)*(step))

`define CHANGE_ENDIAN32(x) {x[8-1-:8],x[16-1-:8],x[24-1-:8],x[32-1-:8]}

`define BINARY2GRAY(value) (((value)>>1) ^ (value))

`define PLOG2(x) (((x)<=2)?1:(((x)<=4)?2:(((x)<=8)?3:(((x)<=16)?4:(((x)<=32)?5:(((x)<=64)?6:(((x)<=128)?7:(((x)<=256)?8:(((x)<=512)?9:(((x)<=1024)?10:(((x)<=2048)?11:(((x)<=4096)?12:(((x)<=8192)?13:16)))))))))))))

`define BW_BYTE 8
`define NUM_BYTE(bw_data) ((((bw_data)-1)/(`BW_BYTE))+1)

`endif

