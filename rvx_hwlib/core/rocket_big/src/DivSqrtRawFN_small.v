`default_nettype wire
module DivSqrtRawFN_small(
  input         clock,
  input         reset,
  output        io_inReady,
  input         io_inValid,
  input         io_sqrtOp,
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [24:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [24:0] io_b_sig,
  input  [2:0]  io_roundingMode,
  output        io_rawOutValid_div,
  output        io_rawOutValid_sqrt,
  output [2:0]  io_roundingModeOut,
  output        io_invalidExc,
  output        io_infiniteExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [26:0] io_rawOut_sig
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
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] cycleNum;
  reg  inReady;
  reg  rawOutValid;
  reg  sqrtOp_Z;
  reg  majorExc_Z;
  reg  isNaN_Z;
  reg  isInf_Z;
  reg  isZero_Z;
  reg  sign_Z;
  reg [9:0] sExp_Z;
  reg [23:0] fractB_Z;
  reg [2:0] roundingMode_Z;
  reg [25:0] rem_Z;
  reg  notZeroRem_Z;
  reg [25:0] sigX_Z;
  wire  notSigNaNIn_invalidExc_S_div = io_a_isZero & io_b_isZero | io_a_isInf & io_b_isInf;
  wire  _notSigNaNIn_invalidExc_S_sqrt_T = ~io_a_isNaN;
  wire  notSigNaNIn_invalidExc_S_sqrt = ~io_a_isNaN & ~io_a_isZero & io_a_sign;
  wire  _majorExc_S_T_2 = io_a_isNaN & ~io_a_sig[22];
  wire  _majorExc_S_T_3 = _majorExc_S_T_2 | notSigNaNIn_invalidExc_S_sqrt;
  wire  _majorExc_S_T_9 = io_b_isNaN & ~io_b_sig[22];
  wire  _majorExc_S_T_11 = _majorExc_S_T_2 | _majorExc_S_T_9 | notSigNaNIn_invalidExc_S_div;
  wire  _majorExc_S_T_15 = _notSigNaNIn_invalidExc_S_sqrt_T & ~io_a_isInf & io_b_isZero;
  wire  _majorExc_S_T_16 = _majorExc_S_T_11 | _majorExc_S_T_15;
  wire  _isNaN_S_T = io_a_isNaN | notSigNaNIn_invalidExc_S_sqrt;
  wire  _isNaN_S_T_2 = io_a_isNaN | io_b_isNaN | notSigNaNIn_invalidExc_S_div;
  wire  _sign_S_T = ~io_sqrtOp;
  wire  sign_S = io_a_sign ^ ~io_sqrtOp & io_b_sign;
  wire  specialCaseA_S = io_a_isNaN | io_a_isInf | io_a_isZero;
  wire  specialCaseB_S = io_b_isNaN | io_b_isInf | io_b_isZero;
  wire  _normalCase_S_div_T = ~specialCaseA_S;
  wire  normalCase_S_div = ~specialCaseA_S & ~specialCaseB_S;
  wire  normalCase_S_sqrt = _normalCase_S_div_T & ~io_a_sign;
  wire  normalCase_S = io_sqrtOp ? normalCase_S_sqrt : normalCase_S_div;
  wire [7:0] _sExpQuot_S_div_T_2 = ~io_b_sExp[7:0];
  wire [8:0] _sExpQuot_S_div_T_4 = {io_b_sExp[8],_sExpQuot_S_div_T_2};
  wire [9:0] _GEN_15 = {{1{_sExpQuot_S_div_T_4[8]}},_sExpQuot_S_div_T_4};
  wire [10:0] sExpQuot_S_div = $signed(io_a_sExp) + $signed(_GEN_15);
  wire [3:0] _sSatExpQuot_S_div_T_2 = 11'sh1c0 <= $signed(sExpQuot_S_div) ? 4'h6 : sExpQuot_S_div[9:6];
  wire [9:0] sSatExpQuot_S_div = {_sSatExpQuot_S_div_T_2,sExpQuot_S_div[5:0]};
  wire  _evenSqrt_S_T_1 = ~io_a_sExp[0];
  wire  evenSqrt_S = io_sqrtOp & ~io_a_sExp[0];
  wire  oddSqrt_S = io_sqrtOp & io_a_sExp[0];
  wire  idle = cycleNum == 5'h0;
  wire  entering = inReady & io_inValid;
  wire  entering_normalCase = entering & normalCase_S;
  wire  skipCycle2 = cycleNum == 5'h3 & sigX_Z[25];
  wire  _inReady_T_1 = entering & ~normalCase_S;
  wire [4:0] _inReady_T_17 = cycleNum - 5'h1;
  wire  _inReady_T_18 = _inReady_T_17 <= 5'h1;
  wire  _inReady_T_19 = ~entering & ~skipCycle2 & _inReady_T_18;
  wire  _inReady_T_20 = _inReady_T_1 | _inReady_T_19;
  wire  _inReady_T_23 = _inReady_T_20 | skipCycle2;
  wire  _rawOutValid_T_18 = _inReady_T_17 == 5'h1;
  wire  _rawOutValid_T_19 = ~entering & ~skipCycle2 & _rawOutValid_T_18;
  wire  _rawOutValid_T_20 = _inReady_T_1 | _rawOutValid_T_19;
  wire  _rawOutValid_T_23 = _rawOutValid_T_20 | skipCycle2;
  wire [4:0] _cycleNum_T_4 = io_a_sExp[0] ? 5'h18 : 5'h19;
  wire [4:0] _cycleNum_T_5 = io_sqrtOp ? _cycleNum_T_4 : 5'h1a;
  wire [4:0] _cycleNum_T_6 = entering_normalCase ? _cycleNum_T_5 : 5'h0;
  wire [4:0] _GEN_16 = {{4'd0}, _inReady_T_1};
  wire [4:0] _cycleNum_T_7 = _GEN_16 | _cycleNum_T_6;
  wire [4:0] _cycleNum_T_14 = ~entering & ~skipCycle2 ? _inReady_T_17 : 5'h0;
  wire [4:0] _cycleNum_T_15 = _cycleNum_T_7 | _cycleNum_T_14;
  wire [4:0] _GEN_17 = {{4'd0}, skipCycle2};
  wire [4:0] _cycleNum_T_17 = _cycleNum_T_15 | _GEN_17;
  wire  _GEN_0 = ~idle | entering ? _inReady_T_23 : inReady;
  wire [8:0] _sExp_Z_T = io_a_sExp[9:1];
  wire [9:0] _sExp_Z_T_1 = $signed(_sExp_Z_T) + 9'sh80;
  wire  _T_2 = ~inReady;
  wire  _T_3 = ~inReady & sqrtOp_Z;
  wire  _fractB_Z_T_1 = inReady & _sign_S_T;
  wire [23:0] _fractB_Z_T_3 = {io_b_sig[22:0], 1'h0};
  wire [23:0] _fractB_Z_T_4 = inReady & _sign_S_T ? _fractB_Z_T_3 : 24'h0;
  wire  _fractB_Z_T_5 = inReady & io_sqrtOp;
  wire [22:0] _fractB_Z_T_8 = inReady & io_sqrtOp & io_a_sExp[0] ? 23'h400000 : 23'h0;
  wire [23:0] _GEN_18 = {{1'd0}, _fractB_Z_T_8};
  wire [23:0] _fractB_Z_T_9 = _fractB_Z_T_4 | _GEN_18;
  wire [23:0] _fractB_Z_T_14 = _fractB_Z_T_5 & _evenSqrt_S_T_1 ? 24'h800000 : 24'h0;
  wire [23:0] _fractB_Z_T_15 = _fractB_Z_T_9 | _fractB_Z_T_14;
  wire [22:0] _fractB_Z_T_25 = _T_2 ? fractB_Z[23:1] : 23'h0;
  wire [23:0] _GEN_19 = {{1'd0}, _fractB_Z_T_25};
  wire [23:0] _fractB_Z_T_26 = _fractB_Z_T_15 | _GEN_19;
  wire [25:0] _rem_T_2 = {io_a_sig, 1'h0};
  wire [25:0] _rem_T_3 = inReady & ~oddSqrt_S ? _rem_T_2 : 26'h0;
  wire  _rem_T_4 = inReady & oddSqrt_S;
  wire [1:0] _rem_T_7 = io_a_sig[23:22] - 2'h1;
  wire [24:0] _rem_T_9 = {io_a_sig[21:0], 3'h0};
  wire [26:0] _rem_T_10 = {_rem_T_7,_rem_T_9};
  wire [26:0] _rem_T_11 = inReady & oddSqrt_S ? _rem_T_10 : 27'h0;
  wire [26:0] _GEN_20 = {{1'd0}, _rem_T_3};
  wire [26:0] _rem_T_12 = _GEN_20 | _rem_T_11;
  wire [26:0] _rem_T_14 = {rem_Z, 1'h0};
  wire [26:0] _rem_T_15 = _T_2 ? _rem_T_14 : 27'h0;
  wire [26:0] rem = _rem_T_12 | _rem_T_15;
  wire [31:0] _bitMask_T = 32'h1 << cycleNum;
  wire [29:0] bitMask = _bitMask_T[31:2];
  wire [25:0] _trialTerm_T_2 = {io_b_sig, 1'h0};
  wire [25:0] _trialTerm_T_3 = _fractB_Z_T_1 ? _trialTerm_T_2 : 26'h0;
  wire [24:0] _trialTerm_T_5 = inReady & evenSqrt_S ? 25'h1000000 : 25'h0;
  wire [25:0] _GEN_21 = {{1'd0}, _trialTerm_T_5};
  wire [25:0] _trialTerm_T_6 = _trialTerm_T_3 | _GEN_21;
  wire [25:0] _trialTerm_T_8 = _rem_T_4 ? 26'h2800000 : 26'h0;
  wire [25:0] _trialTerm_T_9 = _trialTerm_T_6 | _trialTerm_T_8;
  wire [23:0] _trialTerm_T_11 = _T_2 ? fractB_Z : 24'h0;
  wire [25:0] _GEN_22 = {{2'd0}, _trialTerm_T_11};
  wire [25:0] _trialTerm_T_12 = _trialTerm_T_9 | _GEN_22;
  wire  _trialTerm_T_14 = ~sqrtOp_Z;
  wire [24:0] _trialTerm_T_17 = _T_2 & ~sqrtOp_Z ? 25'h1000000 : 25'h0;
  wire [25:0] _GEN_23 = {{1'd0}, _trialTerm_T_17};
  wire [25:0] _trialTerm_T_18 = _trialTerm_T_12 | _GEN_23;
  wire [26:0] _trialTerm_T_21 = {sigX_Z, 1'h0};
  wire [26:0] _trialTerm_T_22 = _T_3 ? _trialTerm_T_21 : 27'h0;
  wire [26:0] _GEN_24 = {{1'd0}, _trialTerm_T_18};
  wire [26:0] trialTerm = _GEN_24 | _trialTerm_T_22;
  wire [27:0] _trialRem_T = {1'b0,$signed(rem)};
  wire [27:0] _trialRem_T_1 = {1'b0,$signed(trialTerm)};
  wire [28:0] trialRem = $signed(_trialRem_T) - $signed(_trialRem_T_1);
  wire  newBit = 29'sh0 <= $signed(trialRem);
  wire [28:0] _nextRem_Z_T = $signed(_trialRem_T) - $signed(_trialRem_T_1);
  wire [28:0] _nextRem_Z_T_1 = newBit ? _nextRem_Z_T : {{2'd0}, rem};
  wire [25:0] nextRem_Z = _nextRem_Z_T_1[25:0];
  wire [25:0] _sigX_Z_T_2 = {newBit, 25'h0};
  wire [25:0] _sigX_Z_T_3 = _fractB_Z_T_1 ? _sigX_Z_T_2 : 26'h0;
  wire [24:0] _sigX_Z_T_5 = _fractB_Z_T_5 ? 25'h1000000 : 25'h0;
  wire [25:0] _GEN_30 = {{1'd0}, _sigX_Z_T_5};
  wire [25:0] _sigX_Z_T_6 = _sigX_Z_T_3 | _GEN_30;
  wire [23:0] _sigX_Z_T_8 = {newBit, 23'h0};
  wire [23:0] _sigX_Z_T_9 = _rem_T_4 ? _sigX_Z_T_8 : 24'h0;
  wire [25:0] _GEN_31 = {{2'd0}, _sigX_Z_T_9};
  wire [25:0] _sigX_Z_T_10 = _sigX_Z_T_6 | _GEN_31;
  wire [25:0] _sigX_Z_T_12 = _T_2 ? sigX_Z : 26'h0;
  wire [25:0] _sigX_Z_T_13 = _sigX_Z_T_10 | _sigX_Z_T_12;
  wire [29:0] _sigX_Z_T_16 = _T_2 & newBit ? bitMask : 30'h0;
  wire [29:0] _GEN_32 = {{4'd0}, _sigX_Z_T_13};
  wire [29:0] _sigX_Z_T_17 = _GEN_32 | _sigX_Z_T_16;
  wire [29:0] _GEN_14 = entering | _T_2 ? _sigX_Z_T_17 : {{4'd0}, sigX_Z};
  wire [26:0] _GEN_33 = {{26'd0}, notZeroRem_Z};
  assign io_inReady = inReady;
  assign io_rawOutValid_div = rawOutValid & _trialTerm_T_14;
  assign io_rawOutValid_sqrt = rawOutValid & sqrtOp_Z;
  assign io_roundingModeOut = roundingMode_Z;
  assign io_invalidExc = majorExc_Z & isNaN_Z;
  assign io_infiniteExc = majorExc_Z & ~isNaN_Z;
  assign io_rawOut_isNaN = isNaN_Z;
  assign io_rawOut_isInf = isInf_Z;
  assign io_rawOut_isZero = isZero_Z;
  assign io_rawOut_sign = sign_Z;
  assign io_rawOut_sExp = sExp_Z;
  assign io_rawOut_sig = _trialTerm_T_21 | _GEN_33;
  always @(posedge clock) begin
    if (reset) begin
      cycleNum <= 5'h0;
    end else if (~idle | entering) begin
      cycleNum <= _cycleNum_T_17;
    end
    inReady <= reset | _GEN_0;
    if (reset) begin
      rawOutValid <= 1'h0;
    end else if (~idle | entering) begin
      rawOutValid <= _rawOutValid_T_23;
    end
    if (entering) begin
      sqrtOp_Z <= io_sqrtOp;
    end
    if (entering) begin
      if (io_sqrtOp) begin
        majorExc_Z <= _majorExc_S_T_3;
      end else begin
        majorExc_Z <= _majorExc_S_T_16;
      end
    end
    if (entering) begin
      if (io_sqrtOp) begin
        isNaN_Z <= _isNaN_S_T;
      end else begin
        isNaN_Z <= _isNaN_S_T_2;
      end
    end
    if (entering) begin
      if (io_sqrtOp) begin
        isInf_Z <= io_a_isInf;
      end else begin
        isInf_Z <= io_a_isInf | io_b_isZero;
      end
    end
    if (entering) begin
      if (io_sqrtOp) begin
        isZero_Z <= io_a_isZero;
      end else begin
        isZero_Z <= io_a_isZero | io_b_isInf;
      end
    end
    if (entering) begin
      sign_Z <= sign_S;
    end
    if (entering) begin
      if (io_sqrtOp) begin
        sExp_Z <= _sExp_Z_T_1;
      end else begin
        sExp_Z <= sSatExpQuot_S_div;
      end
    end
    if (entering | ~inReady & sqrtOp_Z) begin
      fractB_Z <= _fractB_Z_T_26;
    end
    if (entering) begin
      roundingMode_Z <= io_roundingMode;
    end
    if (entering | _T_2) begin
      rem_Z <= nextRem_Z;
    end
    if (entering | _T_2) begin
      if (inReady | newBit) begin
        notZeroRem_Z <= $signed(trialRem) != 29'sh0;
      end
    end
    sigX_Z <= _GEN_14[25:0];
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
  cycleNum = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  inReady = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rawOutValid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  sqrtOp_Z = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  majorExc_Z = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  isNaN_Z = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  isInf_Z = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  isZero_Z = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sign_Z = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sExp_Z = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  fractB_Z = _RAND_10[23:0];
  _RAND_11 = {1{`RANDOM}};
  roundingMode_Z = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  rem_Z = _RAND_12[25:0];
  _RAND_13 = {1{`RANDOM}};
  notZeroRem_Z = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  sigX_Z = _RAND_14[25:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule