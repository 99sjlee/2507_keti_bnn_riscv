`default_nettype wire
module RecFNToIN(
  input  [32:0] io_in,
  input  [2:0]  io_roundingMode,
  input         io_signedOut,
  output [31:0] io_out,
  output [2:0]  io_intExceptionFlags
);
  wire [8:0] rawIn_exp = io_in[31:23];
  wire  rawIn_isZero = rawIn_exp[8:6] == 3'h0;
  wire  rawIn_isSpecial = rawIn_exp[8:7] == 2'h3;
  wire  rawIn__isNaN = rawIn_isSpecial & rawIn_exp[6];
  wire  rawIn__isInf = rawIn_isSpecial & ~rawIn_exp[6];
  wire  rawIn__sign = io_in[32];
  wire [9:0] rawIn__sExp = {1'b0,$signed(rawIn_exp)};
  wire  _rawIn_out_sig_T = ~rawIn_isZero;
  wire [24:0] rawIn__sig = {1'h0,_rawIn_out_sig_T,io_in[22:0]};
  wire  magGeOne = rawIn__sExp[8];
  wire [7:0] posExp = rawIn__sExp[7:0];
  wire  magJustBelowOne = ~magGeOne & posExp;
  wire  roundingMode_near_even = io_roundingMode == 3'h0;
  wire  roundingMode_min = io_roundingMode == 3'h2;
  wire  roundingMode_max = io_roundingMode == 3'h3;
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4;
  wire  roundingMode_odd = io_roundingMode == 3'h6;
  wire [23:0] _shiftedSig_T_1 = {magGeOne,rawIn__sig[22:0]};
  wire [4:0] _shiftedSig_T_3 = magGeOne ? rawIn__sExp[4:0] : 5'h0;
  wire [54:0] _GEN_2 = {{31'd0}, _shiftedSig_T_1};
  wire [54:0] shiftedSig = _GEN_2 << _shiftedSig_T_3;
  wire  _alignedSig_T_2 = |shiftedSig[21:0];
  wire [33:0] alignedSig = {shiftedSig[54:22],_alignedSig_T_2};
  wire [31:0] unroundedInt = alignedSig[33:2];
  wire  _common_inexact_T_1 = |alignedSig[1:0];
  wire  common_inexact = magGeOne ? |alignedSig[1:0] : _rawIn_out_sig_T;
  wire  _roundIncr_near_even_T_8 = magJustBelowOne & _common_inexact_T_1;
  wire  roundIncr_near_even = magGeOne & (&alignedSig[2:1] | &alignedSig[1:0]) | _roundIncr_near_even_T_8;
  wire  roundIncr_near_maxMag = magGeOne & alignedSig[1] | magJustBelowOne;
  wire  _roundIncr_T_1 = roundingMode_near_maxMag & roundIncr_near_maxMag;
  wire  _roundIncr_T_2 = roundingMode_near_even & roundIncr_near_even | _roundIncr_T_1;
  wire  _roundIncr_T_4 = rawIn__sign & common_inexact;
  wire  _roundIncr_T_5 = (roundingMode_min | roundingMode_odd) & _roundIncr_T_4;
  wire  _roundIncr_T_6 = _roundIncr_T_2 | _roundIncr_T_5;
  wire  _roundIncr_T_9 = roundingMode_max & (~rawIn__sign & common_inexact);
  wire  roundIncr = _roundIncr_T_6 | _roundIncr_T_9;
  wire [31:0] _complUnroundedInt_T = ~unroundedInt;
  wire [31:0] complUnroundedInt = rawIn__sign ? _complUnroundedInt_T : unroundedInt;
  wire [31:0] _roundedInt_T_2 = complUnroundedInt + 32'h1;
  wire [31:0] _roundedInt_T_3 = roundIncr ^ rawIn__sign ? _roundedInt_T_2 : complUnroundedInt;
  wire  _roundedInt_T_4 = roundingMode_odd & common_inexact;
  wire [31:0] _GEN_0 = {{31'd0}, _roundedInt_T_4};
  wire [31:0] roundedInt = _roundedInt_T_3 | _GEN_0;
  wire  magGeOne_atOverflowEdge = posExp == 8'h1f;
  wire  roundCarryBut2 = &unroundedInt[29:0] & roundIncr;
  wire  _common_overflow_T_3 = |unroundedInt[30:0] | roundIncr;
  wire  _common_overflow_T_4 = magGeOne_atOverflowEdge & _common_overflow_T_3;
  wire  _common_overflow_T_6 = posExp == 8'h1e & roundCarryBut2;
  wire  _common_overflow_T_7 = magGeOne_atOverflowEdge | _common_overflow_T_6;
  wire  _common_overflow_T_8 = rawIn__sign ? _common_overflow_T_4 : _common_overflow_T_7;
  wire  _common_overflow_T_10 = magGeOne_atOverflowEdge & unroundedInt[30];
  wire  _common_overflow_T_11 = _common_overflow_T_10 & roundCarryBut2;
  wire  _common_overflow_T_12 = rawIn__sign | _common_overflow_T_11;
  wire  _common_overflow_T_13 = io_signedOut ? _common_overflow_T_8 : _common_overflow_T_12;
  wire  _common_overflow_T_14 = posExp >= 8'h20 | _common_overflow_T_13;
  wire  _common_overflow_T_17 = ~io_signedOut & rawIn__sign & roundIncr;
  wire  common_overflow = magGeOne ? _common_overflow_T_14 : _common_overflow_T_17;
  wire  invalidExc = rawIn__isNaN | rawIn__isInf;
  wire  _overflow_T = ~invalidExc;
  wire  overflow = ~invalidExc & common_overflow;
  wire  inexact = _overflow_T & ~common_overflow & common_inexact;
  wire  excSign = ~rawIn__isNaN & rawIn__sign;
  wire [31:0] _excOut_T_1 = io_signedOut == excSign ? 32'h80000000 : 32'h0;
  wire [30:0] _excOut_T_3 = ~excSign ? 31'h7fffffff : 31'h0;
  wire [31:0] _GEN_1 = {{1'd0}, _excOut_T_3};
  wire [31:0] excOut = _excOut_T_1 | _GEN_1;
  wire [1:0] io_intExceptionFlags_hi = {invalidExc,overflow};
  assign io_out = invalidExc | common_overflow ? excOut : roundedInt;
  assign io_intExceptionFlags = {io_intExceptionFlags_hi,inexact};
endmodule