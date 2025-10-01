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
parameter BW_EXPONENT = 9;
parameter BW_SIGNIFICAND = 24;
parameter BW_GUARD = `MAX((48-BW_SIGNIFICAND),3);
parameter BW_OVERFLOW = `MAX((9-BW_EXPONENT),2);

localparam BW_FPIR_VALUE = `BW_FPIR_TYPE + 1 + BW_EXPONENT + BW_SIGNIFICAND + BW_GUARD + BW_OVERFLOW;

localparam BW_SIGNIFICAND_EXTENDED = BW_SIGNIFICAND + BW_GUARD;
localparam BW_EXPONENT_EXTENDED = BW_EXPONENT + BW_OVERFLOW;
