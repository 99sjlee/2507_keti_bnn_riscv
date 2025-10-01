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
parameter BW_IEEE_EXPONENT          = 8;
parameter BW_IEEE_MANTISSA          = 23;

localparam BW_IEEE_VALUE = 1 + BW_IEEE_EXPONENT + BW_IEEE_MANTISSA;
localparam BW_IEEE_SIGNIFICAND = BW_IEEE_MANTISSA + 1;
localparam IEEE_EXPONENT_BIAS = (2**(BW_IEEE_EXPONENT-1)) - 1;
localparam IEEE_EXPONENT_MAX = (2**BW_IEEE_EXPONENT) - 2;
localparam IEEE_EXPONENT_MIN_NORMALIZED = 0 - (BW_IEEE_MANTISSA-1);

localparam IEEE_NAN_EXPONENT = IEEE_EXPONENT_MAX + 1;
localparam IEEE_NAN_MANTISSA = 1;

localparam IEEE_INF_EXPONENT = IEEE_EXPONENT_MAX + 1;
localparam IEEE_INF_MANTISSA = 0;
