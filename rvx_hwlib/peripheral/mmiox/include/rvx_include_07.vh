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
localparam MMIOX1_FIFO_PARA_1_BIT = 8;
localparam MMIOX1_FIFO_PARA_2_BIT = 8;
localparam MMIOX1_FIFO_PARA_3_BIT = 8;
localparam MMIOX1_FIFO_PARA_4_BIT = 8;

function integer CLIP_MMIOX1_DEPTH;
	input integer depth;
  input integer bitwidth;
  integer max_value;
begin
  max_value = (2**bitwidth) -1;
  CLIP_MMIOX1_DEPTH = (depth>max_value)? max_value : depth;
end
endfunction

function integer GEN_MMIOX1_FIFO_PARA;
	input integer log_fifo_depth;
  input integer inst_fifo_depth;
  input integer input_fifo_depth;
  input integer output_fifo_depth;
begin
  GEN_MMIOX1_FIFO_PARA = 0;
  GEN_MMIOX1_FIFO_PARA = GEN_MMIOX1_FIFO_PARA | (CLIP_MMIOX1_DEPTH(log_fifo_depth, MMIOX1_FIFO_PARA_1_BIT) << 0);
  GEN_MMIOX1_FIFO_PARA = GEN_MMIOX1_FIFO_PARA | (CLIP_MMIOX1_DEPTH(inst_fifo_depth, MMIOX1_FIFO_PARA_2_BIT) << (MMIOX1_FIFO_PARA_1_BIT));
  GEN_MMIOX1_FIFO_PARA = GEN_MMIOX1_FIFO_PARA | (CLIP_MMIOX1_DEPTH(input_fifo_depth, MMIOX1_FIFO_PARA_3_BIT) << (MMIOX1_FIFO_PARA_1_BIT+MMIOX1_FIFO_PARA_2_BIT));
  GEN_MMIOX1_FIFO_PARA = GEN_MMIOX1_FIFO_PARA | (CLIP_MMIOX1_DEPTH(output_fifo_depth, MMIOX1_FIFO_PARA_4_BIT) << (MMIOX1_FIFO_PARA_1_BIT+MMIOX1_FIFO_PARA_2_BIT+MMIOX1_FIFO_PARA_3_BIT));
end
endfunction
