`default_nettype wire
module TLDebugModuleOuter(
  input         clock,
  input         reset,
  output        auto_dmi_in_a_ready,
  input         auto_dmi_in_a_valid,
  input  [2:0]  auto_dmi_in_a_bits_opcode,
  input  [6:0]  auto_dmi_in_a_bits_address,
  input  [31:0] auto_dmi_in_a_bits_data,
  input         auto_dmi_in_d_ready,
  output        auto_dmi_in_d_valid,
  output [2:0]  auto_dmi_in_d_bits_opcode,
  output [31:0] auto_dmi_in_d_bits_data,
  output        auto_int_out_0,
  output        io_ctrl_ndreset,
  output        io_ctrl_dmactive,
  input         io_ctrl_dmactiveAck,
  input         io_innerCtrl_ready,
  output        io_innerCtrl_valid,
  output        io_innerCtrl_bits_resumereq,
  output [9:0]  io_innerCtrl_bits_hartsel,
  output        io_innerCtrl_bits_ackhavereset,
  output        io_innerCtrl_bits_hrmask_0,
  input         io_hgDebugInt_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [6:0] monitor_io_in_a_bits_address;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  reg  DMCONTROLReg_haltreq;
  reg  DMCONTROLReg_ndmreset;
  reg  DMCONTROLReg_dmactive;
  wire  _T_1 = ~DMCONTROLReg_dmactive;
  wire  in_bits_read = auto_dmi_in_a_bits_opcode == 3'h4;
  wire [2:0] in_bits_index = auto_dmi_in_a_bits_address[4:2];
  wire  out_iindex = in_bits_index[1];
  wire [2:0] out_findex = in_bits_index & 3'h5;
  wire  _out_T_2 = out_findex == 3'h0;
  wire [1:0] _out_backSel_T = 2'h1 << out_iindex;
  wire  out_backSel_0 = _out_backSel_T[0];
  wire  out_woready_1 = auto_dmi_in_a_valid & auto_dmi_in_d_ready & ~in_bits_read & out_backSel_0 & out_findex == 3'h0;
  wire  DMCONTROLWrData_ndmreset = auto_dmi_in_a_bits_data[1];
  wire  DMCONTROLWrData_haltreq = auto_dmi_in_a_bits_data[31];
  wire  DMCONTROLWrData_dmactive = auto_dmi_in_a_bits_data[0];
  reg  hrmaskReg_0;
  wire  DMCONTROLWrData_clrresethaltreq = auto_dmi_in_a_bits_data[2];
  wire  _T_11 = io_innerCtrl_bits_hartsel == 10'h0;
  wire  DMCONTROLWrData_setresethaltreq = auto_dmi_in_a_bits_data[3];
  wire  _GEN_23 = out_woready_1 & DMCONTROLWrData_setresethaltreq & _T_11 | hrmaskReg_0;
  wire  _GEN_24 = out_woready_1 & DMCONTROLWrData_clrresethaltreq & _T_11 ? 1'h0 : _GEN_23;
  wire  _T_18 = DMCONTROLReg_dmactive & io_ctrl_dmactiveAck;
  wire [4:0] out_prepend_3 = {1'h0,1'h0,1'h0,DMCONTROLReg_ndmreset,_T_18};
  wire [15:0] _out_T_51 = {{11'd0}, out_prepend_3};
  wire [17:0] out_prepend_5 = {1'h0,1'h0,_out_T_51};
  wire [25:0] _out_T_69 = {{8'd0}, out_prepend_5};
  wire  DMCONTROLWrData_ackhavereset = auto_dmi_in_a_bits_data[28];
  wire  DMCONTROLWrData_resumereq = auto_dmi_in_a_bits_data[30];
  wire [31:0] out_prepend_11 = {DMCONTROLReg_haltreq,1'h0,1'h0,1'h0,1'h0,1'h0,_out_T_69};
  wire  _GEN_35 = out_iindex ? _out_T_2 : _out_T_2;
  wire [31:0] _GEN_37 = out_iindex ? 32'h111380 : out_prepend_11;
  reg  debugIntRegs_0;
  reg  innerCtrlValidReg;
  reg  innerCtrlResumeReqReg;
  reg  innerCtrlAckHaveResetReg;
  wire  _innerCtrlValidReg_T = ~io_innerCtrl_ready;
  
  assign auto_dmi_in_a_ready = auto_dmi_in_d_ready;
  assign auto_dmi_in_d_valid = auto_dmi_in_a_valid;
  assign auto_dmi_in_d_bits_opcode = {{2'd0}, in_bits_read};
  assign auto_dmi_in_d_bits_data = _GEN_35 ? _GEN_37 : 32'h0;
  assign auto_int_out_0 = debugIntRegs_0 | io_hgDebugInt_0;
  assign io_ctrl_ndreset = DMCONTROLReg_ndmreset;
  assign io_ctrl_dmactive = DMCONTROLReg_dmactive;
  assign io_innerCtrl_valid = out_woready_1 | innerCtrlValidReg;
  assign io_innerCtrl_bits_resumereq = out_woready_1 & DMCONTROLWrData_resumereq | innerCtrlResumeReqReg;
  assign io_innerCtrl_bits_hartsel = 10'h0;
  assign io_innerCtrl_bits_ackhavereset = out_woready_1 & DMCONTROLWrData_ackhavereset | innerCtrlAckHaveResetReg;
  assign io_innerCtrl_bits_hrmask_0 = _T_1 ? 1'h0 : _GEN_24;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_dmi_in_d_ready;
  assign monitor_io_in_a_valid = auto_dmi_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_dmi_in_a_bits_opcode;
  assign monitor_io_in_a_bits_address = auto_dmi_in_a_bits_address;
  assign monitor_io_in_d_ready = auto_dmi_in_d_ready;
  assign monitor_io_in_d_valid = auto_dmi_in_a_valid;
  assign monitor_io_in_d_bits_opcode = {{2'd0}, in_bits_read};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      DMCONTROLReg_haltreq <= 1'h0;
    end else if (~DMCONTROLReg_dmactive) begin
      DMCONTROLReg_haltreq <= 1'h0;
    end else if (out_woready_1) begin
      DMCONTROLReg_haltreq <= DMCONTROLWrData_haltreq;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      DMCONTROLReg_ndmreset <= 1'h0;
    end else if (~DMCONTROLReg_dmactive) begin
      DMCONTROLReg_ndmreset <= 1'h0;
    end else if (out_woready_1) begin
      DMCONTROLReg_ndmreset <= DMCONTROLWrData_ndmreset;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      DMCONTROLReg_dmactive <= 1'h0;
    end else if (out_woready_1) begin
      DMCONTROLReg_dmactive <= DMCONTROLWrData_dmactive;
    end else if (~DMCONTROLReg_dmactive) begin
      DMCONTROLReg_dmactive <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      hrmaskReg_0 <= 1'h0;
    end else if (_T_1) begin
      hrmaskReg_0 <= 1'h0;
    end else if (out_woready_1 & DMCONTROLWrData_clrresethaltreq & _T_11) begin
      hrmaskReg_0 <= 1'h0;
    end else begin
      hrmaskReg_0 <= _GEN_23;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      debugIntRegs_0 <= 1'h0;
    end else if (_T_1) begin
      debugIntRegs_0 <= 1'h0;
    end else if (out_woready_1) begin
      debugIntRegs_0 <= DMCONTROLWrData_haltreq;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      innerCtrlValidReg <= 1'h0;
    end else begin
      innerCtrlValidReg <= io_innerCtrl_valid & ~io_innerCtrl_ready;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      innerCtrlResumeReqReg <= 1'h0;
    end else begin
      innerCtrlResumeReqReg <= io_innerCtrl_bits_resumereq & _innerCtrlValidReg_T;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      innerCtrlAckHaveResetReg <= 1'h0;
    end else begin
      innerCtrlAckHaveResetReg <= io_innerCtrl_bits_ackhavereset & _innerCtrlValidReg_T;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  DMCONTROLReg_haltreq = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  DMCONTROLReg_ndmreset = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  DMCONTROLReg_dmactive = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  hrmaskReg_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  debugIntRegs_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  innerCtrlValidReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  innerCtrlResumeReqReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  innerCtrlAckHaveResetReg = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    DMCONTROLReg_haltreq = 1'h0;
  end
  if (reset) begin
    DMCONTROLReg_ndmreset = 1'h0;
  end
  if (reset) begin
    DMCONTROLReg_dmactive = 1'h0;
  end
  if (reset) begin
    hrmaskReg_0 = 1'h0;
  end
  if (reset) begin
    debugIntRegs_0 = 1'h0;
  end
  if (reset) begin
    innerCtrlValidReg = 1'h0;
  end
  if (reset) begin
    innerCtrlResumeReqReg = 1'h0;
  end
  if (reset) begin
    innerCtrlAckHaveResetReg = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule