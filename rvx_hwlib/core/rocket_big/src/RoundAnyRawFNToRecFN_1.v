`default_nettype wire
module RoundAnyRawFNToRecFN_1(
  input         io_in_isZero,
  input         io_in_sign,
  input  [7:0]  io_in_sExp,
  input  [32:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out,
  output [4:0]  io_exceptionFlags
);
  wire  roundingMode_near_even = io_roundingMode == 3'h0;
  wire  roundingMode_min = io_roundingMode == 3'h2;
  wire  roundingMode_max = io_roundingMode == 3'h3;
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4;
  wire  roundingMode_odd = io_roundingMode == 3'h6;
  wire  roundMagUp = roundingMode_min & io_in_sign | roundingMode_max & ~io_in_sign;
  wire [8:0] _GEN_0 = {{1{io_in_sExp[7]}},io_in_sExp};
  wire [9:0] _sAdjustedExp_T = $signed(_GEN_0) + 9'shc0;
  wire [9:0] sAdjustedExp = {1'b0,$signed(_sAdjustedExp_T[8:0])};
  wire  _adjustedSig_T_2 = |io_in_sig[6:0];
  wire [26:0] adjustedSig = {io_in_sig[32:7],_adjustedSig_T_2};
  wire [26:0] _roundPosBit_T = adjustedSig & 27'h2;
  wire  roundPosBit = |_roundPosBit_T;
  wire [26:0] _anyRoundExtra_T = adjustedSig & 27'h1;
  wire  anyRoundExtra = |_anyRoundExtra_T;
  wire  anyRound = roundPosBit | anyRoundExtra;
  wire  _roundIncr_T_1 = (roundingMode_near_even | roundingMode_near_maxMag) & roundPosBit;
  wire  _roundIncr_T_2 = roundMagUp & anyRound;
  wire  roundIncr = _roundIncr_T_1 | _roundIncr_T_2;
  wire [26:0] _roundedSig_T = adjustedSig | 27'h3;
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1;
  wire  _roundedSig_T_4 = ~anyRoundExtra;
  wire [25:0] _roundedSig_T_7 = roundingMode_near_even & roundPosBit & _roundedSig_T_4 ? 26'h1 : 26'h0;
  wire [25:0] _roundedSig_T_8 = ~_roundedSig_T_7;
  wire [25:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8;
  wire [26:0] _roundedSig_T_11 = adjustedSig & 27'h7fffffc;
  wire [25:0] _roundedSig_T_15 = roundingMode_odd & anyRound ? 26'h1 : 26'h0;
  wire [25:0] _GEN_1 = {{1'd0}, _roundedSig_T_11[26:2]};
  wire [25:0] _roundedSig_T_16 = _GEN_1 | _roundedSig_T_15;
  wire [25:0] roundedSig = roundIncr ? _roundedSig_T_9 : _roundedSig_T_16;
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])};
  wire [9:0] _GEN_2 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1};
  wire [10:0] sRoundedExp = $signed(sAdjustedExp) + $signed(_GEN_2);
  wire [8:0] common_expOut = sRoundedExp[8:0];
  wire [22:0] common_fractOut = roundedSig[22:0];
  wire  commonCase = ~io_in_isZero;
  wire  inexact = commonCase & anyRound;
  wire [8:0] _expOut_T_1 = io_in_isZero ? 9'h1c0 : 9'h0;
  wire [8:0] _expOut_T_2 = ~_expOut_T_1;
  wire [8:0] expOut = common_expOut & _expOut_T_2;
  wire [22:0] fractOut = io_in_isZero ? 23'h0 : common_fractOut;
  wire [9:0] io_out_hi = {io_in_sign,expOut};
  wire [1:0] io_exceptionFlags_lo = {1'h0,inexact};
  assign io_out = {io_out_hi,fractOut};
  assign io_exceptionFlags = {3'h0,io_exceptionFlags_lo};
endmodule