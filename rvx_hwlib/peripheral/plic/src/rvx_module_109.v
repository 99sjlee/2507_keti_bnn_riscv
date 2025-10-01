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
`default_nettype wire



module RVX_MODULE_109(
  input   rvx_port_4,
  input   rvx_port_2,
  input   rvx_port_3,
  output  rvx_port_0,
  input   rvx_port_5,
  input   rvx_port_1
);


  reg  rvx_signal_0;

  wire  _T_8;
  wire  _GEN_0;
  wire  _GEN_1;
  wire  _T_12;
  wire  _T_13;
  assign _T_8 = rvx_port_3 & rvx_port_5;
  assign _GEN_0 = _T_8 ? 1'h1 : rvx_signal_0;
  assign _GEN_1 = rvx_port_1 ? 1'h0 : _GEN_0;
  assign _T_12 = rvx_signal_0 == 1'h0;
  assign _T_13 = rvx_port_3 & _T_12;
  assign rvx_port_0 = _T_13;

always @(posedge rvx_port_4, posedge rvx_port_2) begin
  if (rvx_port_2) begin
    rvx_signal_0 <= 1'h0;
  end else begin
    if (rvx_port_1) begin
      rvx_signal_0 <= 1'h0;
    end else begin
      if (_T_8) begin
        rvx_signal_0 <= 1'h1;
      end
    end
  end
end

endmodule
