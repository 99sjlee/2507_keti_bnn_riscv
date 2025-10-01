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
function integer BW_AXI2LPIXM_BURDEN;
	input integer bw_xid;
begin
  BW_AXI2LPIXM_BURDEN = bw_xid;
end
endfunction

function integer BW_LPIXM_QPARCEL;
  input integer bw_addr;
	input integer bw_data;
  integer ADDR_PARCEL;
  integer WDATA_PARCEL;
begin
  BW_LPIXM_QPARCEL = 1 + `BW_AXI_ALEN + `BW_AXI_ASIZE + `BW_AXI_ABURST + `NUM_BYTE(bw_data) + bw_data + bw_addr; 
end
endfunction

function integer BW_LPIXM_YPARCEL;
	input integer bw_data;
begin
  BW_LPIXM_YPARCEL = 1 + `BW_AXI_RESP + bw_data; 
end
endfunction
