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


module RVX_MODULE_111 ( 
    rvx_port_07    , 
    rvx_port_06 ,
    rvx_port_14  ,
    rvx_port_01  ,
    rvx_port_09  ,
    rvx_port_16 ,
    rvx_port_04    ,
    rvx_port_03   ,
    rvx_port_13  ,
    rvx_port_05,
    rvx_port_10   ,
    rvx_port_08   , 
    rvx_port_02   , 
    rvx_port_15   , 
    rvx_port_00 , 
    rvx_port_12 , 
    rvx_port_11
);


input           rvx_port_07;
input           rvx_port_06;
input           rvx_port_14;
input [31:0]    rvx_port_09;
input           rvx_port_16;
input           rvx_port_04;
input [9:2]     rvx_port_03;
input           rvx_port_13;
output [31:0]   rvx_port_01;

input           rvx_port_05;
input           rvx_port_15;
input           rvx_port_10;
output          rvx_port_02;
output          rvx_port_08;

output          rvx_port_12;
output          rvx_port_00;
output          rvx_port_11;

endmodule

