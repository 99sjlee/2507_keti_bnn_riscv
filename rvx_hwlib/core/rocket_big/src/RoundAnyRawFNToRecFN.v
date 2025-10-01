`default_nettype wire
module RoundAnyRawFNToRecFN(
  input         io_invalidExc,
  input         io_infiniteExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [26:0] io_in_sig,
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
  wire  doShiftSigDown1 = io_in_sig[26];
  wire [8:0] _roundMask_T_1 = ~io_in_sExp[8:0];
  wire  roundMask_msb = _roundMask_T_1[8];
  wire [7:0] roundMask_lsbs = _roundMask_T_1[7:0];
  wire  roundMask_msb_1 = roundMask_lsbs[7];
  wire [6:0] roundMask_lsbs_1 = roundMask_lsbs[6:0];
  wire  roundMask_msb_2 = roundMask_lsbs_1[6];
  wire [5:0] roundMask_lsbs_2 = roundMask_lsbs_1[5:0];
  wire [64:0] roundMask_shift = 65'sh10000000000000000 >>> roundMask_lsbs_2;
  wire [15:0] _GEN_0 = {{8'd0}, roundMask_shift[57:50]};
  wire [15:0] _roundMask_T_7 = _GEN_0 & 16'hff;
  wire [15:0] _roundMask_T_9 = {roundMask_shift[49:42], 8'h0};
  wire [15:0] _roundMask_T_11 = _roundMask_T_9 & 16'hff00;
  wire [15:0] _roundMask_T_12 = _roundMask_T_7 | _roundMask_T_11;
  wire [15:0] _GEN_1 = {{4'd0}, _roundMask_T_12[15:4]};
  wire [15:0] _roundMask_T_17 = _GEN_1 & 16'hf0f;
  wire [15:0] _roundMask_T_19 = {_roundMask_T_12[11:0], 4'h0};
  wire [15:0] _roundMask_T_21 = _roundMask_T_19 & 16'hf0f0;
  wire [15:0] _roundMask_T_22 = _roundMask_T_17 | _roundMask_T_21;
  wire [15:0] _GEN_2 = {{2'd0}, _roundMask_T_22[15:2]};
  wire [15:0] _roundMask_T_27 = _GEN_2 & 16'h3333;
  wire [15:0] _roundMask_T_29 = {_roundMask_T_22[13:0], 2'h0};
  wire [15:0] _roundMask_T_31 = _roundMask_T_29 & 16'hcccc;
  wire [15:0] _roundMask_T_32 = _roundMask_T_27 | _roundMask_T_31;
  wire [15:0] _GEN_3 = {{1'd0}, _roundMask_T_32[15:1]};
  wire [15:0] _roundMask_T_37 = _GEN_3 & 16'h5555;
  wire [15:0] _roundMask_T_39 = {_roundMask_T_32[14:0], 1'h0};
  wire [15:0] _roundMask_T_41 = _roundMask_T_39 & 16'haaaa;
  wire [15:0] _roundMask_T_42 = _roundMask_T_37 | _roundMask_T_41;
  wire [21:0] _roundMask_T_59 = {_roundMask_T_42,roundMask_shift[58],roundMask_shift[59],roundMask_shift[60],
    roundMask_shift[61],roundMask_shift[62],roundMask_shift[63]};
  wire [21:0] _roundMask_T_60 = ~_roundMask_T_59;
  wire [21:0] _roundMask_T_61 = roundMask_msb_2 ? 22'h0 : _roundMask_T_60;
  wire [21:0] _roundMask_T_62 = ~_roundMask_T_61;
  wire [24:0] _roundMask_T_63 = {_roundMask_T_62,3'h7};
  wire [2:0] _roundMask_T_70 = {roundMask_shift[0],roundMask_shift[1],roundMask_shift[2]};
  wire [2:0] _roundMask_T_71 = roundMask_msb_2 ? _roundMask_T_70 : 3'h0;
  wire [24:0] _roundMask_T_72 = roundMask_msb_1 ? _roundMask_T_63 : {{22'd0}, _roundMask_T_71};
  wire [24:0] _roundMask_T_73 = roundMask_msb ? _roundMask_T_72 : 25'h0;
  wire [24:0] _GEN_4 = {{24'd0}, doShiftSigDown1};
  wire [24:0] _roundMask_T_74 = _roundMask_T_73 | _GEN_4;
  wire [26:0] roundMask = {_roundMask_T_74,2'h3};
  wire [26:0] shiftedRoundMask = {1'h0,roundMask[26:1]};
  wire [26:0] _roundPosMask_T = ~shiftedRoundMask;
  wire [26:0] roundPosMask = _roundPosMask_T & roundMask;
  wire [26:0] _roundPosBit_T = io_in_sig & roundPosMask;
  wire  roundPosBit = |_roundPosBit_T;
  wire [26:0] _anyRoundExtra_T = io_in_sig & shiftedRoundMask;
  wire  anyRoundExtra = |_anyRoundExtra_T;
  wire  anyRound = roundPosBit | anyRoundExtra;
  wire  _roundIncr_T = roundingMode_near_even | roundingMode_near_maxMag;
  wire  _roundIncr_T_1 = (roundingMode_near_even | roundingMode_near_maxMag) & roundPosBit;
  wire  _roundIncr_T_2 = roundMagUp & anyRound;
  wire  roundIncr = _roundIncr_T_1 | _roundIncr_T_2;
  wire [26:0] _roundedSig_T = io_in_sig | roundMask;
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1;
  wire  _roundedSig_T_4 = ~anyRoundExtra;
  wire [25:0] _roundedSig_T_7 = roundingMode_near_even & roundPosBit & _roundedSig_T_4 ? roundMask[26:1] : 26'h0;
  wire [25:0] _roundedSig_T_8 = ~_roundedSig_T_7;
  wire [25:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8;
  wire [26:0] _roundedSig_T_10 = ~roundMask;
  wire [26:0] _roundedSig_T_11 = io_in_sig & _roundedSig_T_10;
  wire [25:0] _roundedSig_T_15 = roundingMode_odd & anyRound ? roundPosMask[26:1] : 26'h0;
  wire [25:0] _GEN_5 = {{1'd0}, _roundedSig_T_11[26:2]};
  wire [25:0] _roundedSig_T_16 = _GEN_5 | _roundedSig_T_15;
  wire [25:0] roundedSig = roundIncr ? _roundedSig_T_9 : _roundedSig_T_16;
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])};
  wire [9:0] _GEN_6 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1};
  wire [10:0] sRoundedExp = $signed(io_in_sExp) + $signed(_GEN_6);
  wire [8:0] common_expOut = sRoundedExp[8:0];
  wire [22:0] common_fractOut = doShiftSigDown1 ? roundedSig[23:1] : roundedSig[22:0];
  wire [3:0] _common_overflow_T = sRoundedExp[10:7];
  wire  common_overflow = $signed(_common_overflow_T) >= 4'sh3;
  wire  common_totalUnderflow = $signed(sRoundedExp) < 11'sh6b;
  wire  unboundedRange_roundPosBit = doShiftSigDown1 ? io_in_sig[2] : io_in_sig[1];
  wire  unboundedRange_anyRound = doShiftSigDown1 & io_in_sig[2] | io_in_sig[1:0];
  wire  _unboundedRange_roundIncr_T_1 = _roundIncr_T & unboundedRange_roundPosBit;
  wire  _unboundedRange_roundIncr_T_2 = roundMagUp & unboundedRange_anyRound;
  wire  unboundedRange_roundIncr = _unboundedRange_roundIncr_T_1 | _unboundedRange_roundIncr_T_2;
  wire  roundCarry = doShiftSigDown1 ? roundedSig[25] : roundedSig[24];
  wire [1:0] _common_underflow_T = io_in_sExp[9:8];
  wire  _common_underflow_T_5 = doShiftSigDown1 ? roundMask[3] : roundMask[2];
  wire  _common_underflow_T_6 = anyRound & $signed(_common_underflow_T) <= 2'sh0 & _common_underflow_T_5;
  wire  _common_underflow_T_10 = doShiftSigDown1 ? roundMask[4] : roundMask[3];
  wire  _common_underflow_T_11 = ~_common_underflow_T_10;
  wire  _common_underflow_T_13 = _common_underflow_T_11 & roundCarry;
  wire  _common_underflow_T_15 = _common_underflow_T_13 & roundPosBit & unboundedRange_roundIncr;
  wire  _common_underflow_T_16 = ~_common_underflow_T_15;
  wire  _common_underflow_T_17 = _common_underflow_T_6 & _common_underflow_T_16;
  wire  common_underflow = common_totalUnderflow | _common_underflow_T_17;
  wire  common_inexact = common_totalUnderflow | anyRound;
  wire  isNaNOut = io_invalidExc | io_in_isNaN;
  wire  notNaN_isSpecialInfOut = io_infiniteExc | io_in_isInf;
  wire  commonCase = ~isNaNOut & ~notNaN_isSpecialInfOut & ~io_in_isZero;
  wire  overflow = commonCase & common_overflow;
  wire  underflow = commonCase & common_underflow;
  wire  inexact = overflow | commonCase & common_inexact;
  wire  overflow_roundMagUp = _roundIncr_T | roundMagUp;
  wire  pegMinNonzeroMagOut = commonCase & common_totalUnderflow & (roundMagUp | roundingMode_odd);
  wire  pegMaxFiniteMagOut = overflow & ~overflow_roundMagUp;
  wire  notNaN_isInfOut = notNaN_isSpecialInfOut | overflow & overflow_roundMagUp;
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign;
  wire [8:0] _expOut_T_1 = io_in_isZero | common_totalUnderflow ? 9'h1c0 : 9'h0;
  wire [8:0] _expOut_T_2 = ~_expOut_T_1;
  wire [8:0] _expOut_T_3 = common_expOut & _expOut_T_2;
  wire [8:0] _expOut_T_5 = pegMinNonzeroMagOut ? 9'h194 : 9'h0;
  wire [8:0] _expOut_T_6 = ~_expOut_T_5;
  wire [8:0] _expOut_T_7 = _expOut_T_3 & _expOut_T_6;
  wire [8:0] _expOut_T_8 = pegMaxFiniteMagOut ? 9'h80 : 9'h0;
  wire [8:0] _expOut_T_9 = ~_expOut_T_8;
  wire [8:0] _expOut_T_10 = _expOut_T_7 & _expOut_T_9;
  wire [8:0] _expOut_T_11 = notNaN_isInfOut ? 9'h40 : 9'h0;
  wire [8:0] _expOut_T_12 = ~_expOut_T_11;
  wire [8:0] _expOut_T_13 = _expOut_T_10 & _expOut_T_12;
  wire [8:0] _expOut_T_14 = pegMinNonzeroMagOut ? 9'h6b : 9'h0;
  wire [8:0] _expOut_T_15 = _expOut_T_13 | _expOut_T_14;
  wire [8:0] _expOut_T_16 = pegMaxFiniteMagOut ? 9'h17f : 9'h0;
  wire [8:0] _expOut_T_17 = _expOut_T_15 | _expOut_T_16;
  wire [8:0] _expOut_T_18 = notNaN_isInfOut ? 9'h180 : 9'h0;
  wire [8:0] _expOut_T_19 = _expOut_T_17 | _expOut_T_18;
  wire [8:0] _expOut_T_20 = isNaNOut ? 9'h1c0 : 9'h0;
  wire [8:0] expOut = _expOut_T_19 | _expOut_T_20;
  wire [22:0] _fractOut_T_2 = isNaNOut ? 23'h400000 : 23'h0;
  wire [22:0] _fractOut_T_3 = isNaNOut | io_in_isZero | common_totalUnderflow ? _fractOut_T_2 : common_fractOut;
  wire [22:0] _fractOut_T_5 = pegMaxFiniteMagOut ? 23'h7fffff : 23'h0;
  wire [22:0] fractOut = _fractOut_T_3 | _fractOut_T_5;
  wire [9:0] io_out_hi = {signOut,expOut};
  wire [1:0] io_exceptionFlags_lo = {underflow,inexact};
  wire [2:0] io_exceptionFlags_hi = {io_invalidExc,io_infiniteExc,overflow};
  assign io_out = {io_out_hi,fractOut};
  assign io_exceptionFlags = {io_exceptionFlags_hi,io_exceptionFlags_lo};
endmodule