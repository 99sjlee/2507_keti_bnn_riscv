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

localparam RCV_BW_LPI_BURDEN_NZ = `LEAST1(RCV_BW_LPI_BURDEN);
localparam SND_BW_LPI_BURDEN_NZ = `LEAST1(SND_BW_LPI_BURDEN);
localparam RCV_BW_LPI_QDATA = RCV_BW_LPI_BURDEN + BW_LPI_QPARCEL;
localparam RCV_BW_LPI_YDATA = RCV_BW_LPI_BURDEN + BW_LPI_YPARCEL;
localparam SND_BW_LPI_QDATA = SND_BW_LPI_BURDEN + BW_LPI_QPARCEL;
localparam SND_BW_LPI_YDATA = SND_BW_LPI_BURDEN + BW_LPI_YPARCEL;
