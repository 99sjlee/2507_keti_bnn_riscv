`default_nettype wire
module MulAddRecFNToRaw_postMul(
  input         io_fromPreMul_isSigNaNAny,
  input         io_fromPreMul_isNaNAOrB,
  input         io_fromPreMul_isInfA,
  input         io_fromPreMul_isZeroA,
  input         io_fromPreMul_isInfB,
  input         io_fromPreMul_isZeroB,
  input         io_fromPreMul_signProd,
  input         io_fromPreMul_isNaNC,
  input         io_fromPreMul_isInfC,
  input         io_fromPreMul_isZeroC,
  input  [9:0]  io_fromPreMul_sExpSum,
  input         io_fromPreMul_doSubMags,
  input         io_fromPreMul_CIsDominant,
  input  [4:0]  io_fromPreMul_CDom_CAlignDist,
  input  [25:0] io_fromPreMul_highAlignedSigC,
  input         io_fromPreMul_bit0AlignedSigC,
  input  [48:0] io_mulAddResult,
  input  [2:0]  io_roundingMode,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [26:0] io_rawOut_sig
);
  wire  roundingMode_min = io_roundingMode == 3'h2;
  wire  CDom_sign = io_fromPreMul_signProd ^ io_fromPreMul_doSubMags;
  wire [25:0] _sigSum_T_2 = io_fromPreMul_highAlignedSigC + 26'h1;
  wire [25:0] _sigSum_T_3 = io_mulAddResult[48] ? _sigSum_T_2 : io_fromPreMul_highAlignedSigC;
  wire [74:0] sigSum = {_sigSum_T_3,io_mulAddResult[47:0],io_fromPreMul_bit0AlignedSigC};
  wire [1:0] _CDom_sExp_T = {1'b0,$signed(io_fromPreMul_doSubMags)};
  wire [9:0] _GEN_0 = {{8{_CDom_sExp_T[1]}},_CDom_sExp_T};
  wire [9:0] CDom_sExp = $signed(io_fromPreMul_sExpSum) - $signed(_GEN_0);
  wire [49:0] _CDom_absSigSum_T_1 = ~sigSum[74:25];
  wire [49:0] _CDom_absSigSum_T_4 = {1'h0,io_fromPreMul_highAlignedSigC[25:24],sigSum[72:26]};
  wire [49:0] CDom_absSigSum = io_fromPreMul_doSubMags ? _CDom_absSigSum_T_1 : _CDom_absSigSum_T_4;
  wire [23:0] _CDom_absSigSumExtra_T_1 = ~sigSum[24:1];
  wire  _CDom_absSigSumExtra_T_2 = |_CDom_absSigSumExtra_T_1;
  wire  _CDom_absSigSumExtra_T_4 = |sigSum[25:1];
  wire  CDom_absSigSumExtra = io_fromPreMul_doSubMags ? _CDom_absSigSumExtra_T_2 : _CDom_absSigSumExtra_T_4;
  wire [80:0] _GEN_5 = {{31'd0}, CDom_absSigSum};
  wire [80:0] _CDom_mainSig_T = _GEN_5 << io_fromPreMul_CDom_CAlignDist;
  wire [28:0] CDom_mainSig = _CDom_mainSig_T[49:21];
  wire [26:0] _CDom_reduced4SigExtra_T_1 = {CDom_absSigSum[23:0], 3'h0};
  wire  CDom_reduced4SigExtra_reducedVec_0 = |_CDom_reduced4SigExtra_T_1[3:0];
  wire  CDom_reduced4SigExtra_reducedVec_1 = |_CDom_reduced4SigExtra_T_1[7:4];
  wire  CDom_reduced4SigExtra_reducedVec_2 = |_CDom_reduced4SigExtra_T_1[11:8];
  wire  CDom_reduced4SigExtra_reducedVec_3 = |_CDom_reduced4SigExtra_T_1[15:12];
  wire  CDom_reduced4SigExtra_reducedVec_4 = |_CDom_reduced4SigExtra_T_1[19:16];
  wire  CDom_reduced4SigExtra_reducedVec_5 = |_CDom_reduced4SigExtra_T_1[23:20];
  wire  CDom_reduced4SigExtra_reducedVec_6 = |_CDom_reduced4SigExtra_T_1[26:24];
  wire [6:0] _CDom_reduced4SigExtra_T_2 = {CDom_reduced4SigExtra_reducedVec_6,CDom_reduced4SigExtra_reducedVec_5,
    CDom_reduced4SigExtra_reducedVec_4,CDom_reduced4SigExtra_reducedVec_3,CDom_reduced4SigExtra_reducedVec_2,
    CDom_reduced4SigExtra_reducedVec_1,CDom_reduced4SigExtra_reducedVec_0};
  wire [2:0] _CDom_reduced4SigExtra_T_4 = ~io_fromPreMul_CDom_CAlignDist[4:2];
  wire [8:0] CDom_reduced4SigExtra_shift = 9'sh100 >>> _CDom_reduced4SigExtra_T_4;
  wire [5:0] _CDom_reduced4SigExtra_T_20 = {CDom_reduced4SigExtra_shift[1],CDom_reduced4SigExtra_shift[2],
    CDom_reduced4SigExtra_shift[3],CDom_reduced4SigExtra_shift[4],CDom_reduced4SigExtra_shift[5],
    CDom_reduced4SigExtra_shift[6]};
  wire [6:0] _GEN_1 = {{1'd0}, _CDom_reduced4SigExtra_T_20};
  wire [6:0] _CDom_reduced4SigExtra_T_21 = _CDom_reduced4SigExtra_T_2 & _GEN_1;
  wire  CDom_reduced4SigExtra = |_CDom_reduced4SigExtra_T_21;
  wire  _CDom_sig_T_4 = |CDom_mainSig[2:0] | CDom_reduced4SigExtra | CDom_absSigSumExtra;
  wire [26:0] CDom_sig = {CDom_mainSig[28:3],_CDom_sig_T_4};
  wire  notCDom_signSigSum = sigSum[51];
  wire [50:0] _notCDom_absSigSum_T_1 = ~sigSum[50:0];
  wire [50:0] _GEN_2 = {{50'd0}, io_fromPreMul_doSubMags};
  wire [50:0] _notCDom_absSigSum_T_4 = sigSum[50:0] + _GEN_2;
  wire [50:0] notCDom_absSigSum = notCDom_signSigSum ? _notCDom_absSigSum_T_1 : _notCDom_absSigSum_T_4;
  wire  notCDom_reduced2AbsSigSum_reducedVec_0 = |notCDom_absSigSum[1:0];
  wire  notCDom_reduced2AbsSigSum_reducedVec_1 = |notCDom_absSigSum[3:2];
  wire  notCDom_reduced2AbsSigSum_reducedVec_2 = |notCDom_absSigSum[5:4];
  wire  notCDom_reduced2AbsSigSum_reducedVec_3 = |notCDom_absSigSum[7:6];
  wire  notCDom_reduced2AbsSigSum_reducedVec_4 = |notCDom_absSigSum[9:8];
  wire  notCDom_reduced2AbsSigSum_reducedVec_5 = |notCDom_absSigSum[11:10];
  wire  notCDom_reduced2AbsSigSum_reducedVec_6 = |notCDom_absSigSum[13:12];
  wire  notCDom_reduced2AbsSigSum_reducedVec_7 = |notCDom_absSigSum[15:14];
  wire  notCDom_reduced2AbsSigSum_reducedVec_8 = |notCDom_absSigSum[17:16];
  wire  notCDom_reduced2AbsSigSum_reducedVec_9 = |notCDom_absSigSum[19:18];
  wire  notCDom_reduced2AbsSigSum_reducedVec_10 = |notCDom_absSigSum[21:20];
  wire  notCDom_reduced2AbsSigSum_reducedVec_11 = |notCDom_absSigSum[23:22];
  wire  notCDom_reduced2AbsSigSum_reducedVec_12 = |notCDom_absSigSum[25:24];
  wire  notCDom_reduced2AbsSigSum_reducedVec_13 = |notCDom_absSigSum[27:26];
  wire  notCDom_reduced2AbsSigSum_reducedVec_14 = |notCDom_absSigSum[29:28];
  wire  notCDom_reduced2AbsSigSum_reducedVec_15 = |notCDom_absSigSum[31:30];
  wire  notCDom_reduced2AbsSigSum_reducedVec_16 = |notCDom_absSigSum[33:32];
  wire  notCDom_reduced2AbsSigSum_reducedVec_17 = |notCDom_absSigSum[35:34];
  wire  notCDom_reduced2AbsSigSum_reducedVec_18 = |notCDom_absSigSum[37:36];
  wire  notCDom_reduced2AbsSigSum_reducedVec_19 = |notCDom_absSigSum[39:38];
  wire  notCDom_reduced2AbsSigSum_reducedVec_20 = |notCDom_absSigSum[41:40];
  wire  notCDom_reduced2AbsSigSum_reducedVec_21 = |notCDom_absSigSum[43:42];
  wire  notCDom_reduced2AbsSigSum_reducedVec_22 = |notCDom_absSigSum[45:44];
  wire  notCDom_reduced2AbsSigSum_reducedVec_23 = |notCDom_absSigSum[47:46];
  wire  notCDom_reduced2AbsSigSum_reducedVec_24 = |notCDom_absSigSum[49:48];
  wire  notCDom_reduced2AbsSigSum_reducedVec_25 = |notCDom_absSigSum[50];
  wire [5:0] notCDom_reduced2AbsSigSum_lo_lo = {notCDom_reduced2AbsSigSum_reducedVec_5,
    notCDom_reduced2AbsSigSum_reducedVec_4,notCDom_reduced2AbsSigSum_reducedVec_3,notCDom_reduced2AbsSigSum_reducedVec_2
    ,notCDom_reduced2AbsSigSum_reducedVec_1,notCDom_reduced2AbsSigSum_reducedVec_0};
  wire [12:0] notCDom_reduced2AbsSigSum_lo = {notCDom_reduced2AbsSigSum_reducedVec_12,
    notCDom_reduced2AbsSigSum_reducedVec_11,notCDom_reduced2AbsSigSum_reducedVec_10,
    notCDom_reduced2AbsSigSum_reducedVec_9,notCDom_reduced2AbsSigSum_reducedVec_8,notCDom_reduced2AbsSigSum_reducedVec_7
    ,notCDom_reduced2AbsSigSum_reducedVec_6,notCDom_reduced2AbsSigSum_lo_lo};
  wire [5:0] notCDom_reduced2AbsSigSum_hi_lo = {notCDom_reduced2AbsSigSum_reducedVec_18,
    notCDom_reduced2AbsSigSum_reducedVec_17,notCDom_reduced2AbsSigSum_reducedVec_16,
    notCDom_reduced2AbsSigSum_reducedVec_15,notCDom_reduced2AbsSigSum_reducedVec_14,
    notCDom_reduced2AbsSigSum_reducedVec_13};
  wire [25:0] notCDom_reduced2AbsSigSum = {notCDom_reduced2AbsSigSum_reducedVec_25,
    notCDom_reduced2AbsSigSum_reducedVec_24,notCDom_reduced2AbsSigSum_reducedVec_23,
    notCDom_reduced2AbsSigSum_reducedVec_22,notCDom_reduced2AbsSigSum_reducedVec_21,
    notCDom_reduced2AbsSigSum_reducedVec_20,notCDom_reduced2AbsSigSum_reducedVec_19,notCDom_reduced2AbsSigSum_hi_lo,
    notCDom_reduced2AbsSigSum_lo};
  wire [4:0] _notCDom_normDistReduced2_T_26 = notCDom_reduced2AbsSigSum[1] ? 5'h18 : 5'h19;
  wire [4:0] _notCDom_normDistReduced2_T_27 = notCDom_reduced2AbsSigSum[2] ? 5'h17 : _notCDom_normDistReduced2_T_26;
  wire [4:0] _notCDom_normDistReduced2_T_28 = notCDom_reduced2AbsSigSum[3] ? 5'h16 : _notCDom_normDistReduced2_T_27;
  wire [4:0] _notCDom_normDistReduced2_T_29 = notCDom_reduced2AbsSigSum[4] ? 5'h15 : _notCDom_normDistReduced2_T_28;
  wire [4:0] _notCDom_normDistReduced2_T_30 = notCDom_reduced2AbsSigSum[5] ? 5'h14 : _notCDom_normDistReduced2_T_29;
  wire [4:0] _notCDom_normDistReduced2_T_31 = notCDom_reduced2AbsSigSum[6] ? 5'h13 : _notCDom_normDistReduced2_T_30;
  wire [4:0] _notCDom_normDistReduced2_T_32 = notCDom_reduced2AbsSigSum[7] ? 5'h12 : _notCDom_normDistReduced2_T_31;
  wire [4:0] _notCDom_normDistReduced2_T_33 = notCDom_reduced2AbsSigSum[8] ? 5'h11 : _notCDom_normDistReduced2_T_32;
  wire [4:0] _notCDom_normDistReduced2_T_34 = notCDom_reduced2AbsSigSum[9] ? 5'h10 : _notCDom_normDistReduced2_T_33;
  wire [4:0] _notCDom_normDistReduced2_T_35 = notCDom_reduced2AbsSigSum[10] ? 5'hf : _notCDom_normDistReduced2_T_34;
  wire [4:0] _notCDom_normDistReduced2_T_36 = notCDom_reduced2AbsSigSum[11] ? 5'he : _notCDom_normDistReduced2_T_35;
  wire [4:0] _notCDom_normDistReduced2_T_37 = notCDom_reduced2AbsSigSum[12] ? 5'hd : _notCDom_normDistReduced2_T_36;
  wire [4:0] _notCDom_normDistReduced2_T_38 = notCDom_reduced2AbsSigSum[13] ? 5'hc : _notCDom_normDistReduced2_T_37;
  wire [4:0] _notCDom_normDistReduced2_T_39 = notCDom_reduced2AbsSigSum[14] ? 5'hb : _notCDom_normDistReduced2_T_38;
  wire [4:0] _notCDom_normDistReduced2_T_40 = notCDom_reduced2AbsSigSum[15] ? 5'ha : _notCDom_normDistReduced2_T_39;
  wire [4:0] _notCDom_normDistReduced2_T_41 = notCDom_reduced2AbsSigSum[16] ? 5'h9 : _notCDom_normDistReduced2_T_40;
  wire [4:0] _notCDom_normDistReduced2_T_42 = notCDom_reduced2AbsSigSum[17] ? 5'h8 : _notCDom_normDistReduced2_T_41;
  wire [4:0] _notCDom_normDistReduced2_T_43 = notCDom_reduced2AbsSigSum[18] ? 5'h7 : _notCDom_normDistReduced2_T_42;
  wire [4:0] _notCDom_normDistReduced2_T_44 = notCDom_reduced2AbsSigSum[19] ? 5'h6 : _notCDom_normDistReduced2_T_43;
  wire [4:0] _notCDom_normDistReduced2_T_45 = notCDom_reduced2AbsSigSum[20] ? 5'h5 : _notCDom_normDistReduced2_T_44;
  wire [4:0] _notCDom_normDistReduced2_T_46 = notCDom_reduced2AbsSigSum[21] ? 5'h4 : _notCDom_normDistReduced2_T_45;
  wire [4:0] _notCDom_normDistReduced2_T_47 = notCDom_reduced2AbsSigSum[22] ? 5'h3 : _notCDom_normDistReduced2_T_46;
  wire [4:0] _notCDom_normDistReduced2_T_48 = notCDom_reduced2AbsSigSum[23] ? 5'h2 : _notCDom_normDistReduced2_T_47;
  wire [4:0] _notCDom_normDistReduced2_T_49 = notCDom_reduced2AbsSigSum[24] ? 5'h1 : _notCDom_normDistReduced2_T_48;
  wire [4:0] notCDom_normDistReduced2 = notCDom_reduced2AbsSigSum[25] ? 5'h0 : _notCDom_normDistReduced2_T_49;
  wire [5:0] notCDom_nearNormDist = {notCDom_normDistReduced2, 1'h0};
  wire [6:0] _notCDom_sExp_T = {1'b0,$signed(notCDom_nearNormDist)};
  wire [9:0] _GEN_3 = {{3{_notCDom_sExp_T[6]}},_notCDom_sExp_T};
  wire [9:0] notCDom_sExp = $signed(io_fromPreMul_sExpSum) - $signed(_GEN_3);
  wire [113:0] _GEN_6 = {{63'd0}, notCDom_absSigSum};
  wire [113:0] _notCDom_mainSig_T = _GEN_6 << notCDom_nearNormDist;
  wire [28:0] notCDom_mainSig = _notCDom_mainSig_T[51:23];
  wire  notCDom_reduced4SigExtra_reducedVec_0 = |notCDom_reduced2AbsSigSum[1:0];
  wire  notCDom_reduced4SigExtra_reducedVec_1 = |notCDom_reduced2AbsSigSum[3:2];
  wire  notCDom_reduced4SigExtra_reducedVec_2 = |notCDom_reduced2AbsSigSum[5:4];
  wire  notCDom_reduced4SigExtra_reducedVec_3 = |notCDom_reduced2AbsSigSum[7:6];
  wire  notCDom_reduced4SigExtra_reducedVec_4 = |notCDom_reduced2AbsSigSum[9:8];
  wire  notCDom_reduced4SigExtra_reducedVec_5 = |notCDom_reduced2AbsSigSum[11:10];
  wire  notCDom_reduced4SigExtra_reducedVec_6 = |notCDom_reduced2AbsSigSum[12];
  wire [6:0] _notCDom_reduced4SigExtra_T_2 = {notCDom_reduced4SigExtra_reducedVec_6,
    notCDom_reduced4SigExtra_reducedVec_5,notCDom_reduced4SigExtra_reducedVec_4,notCDom_reduced4SigExtra_reducedVec_3,
    notCDom_reduced4SigExtra_reducedVec_2,notCDom_reduced4SigExtra_reducedVec_1,notCDom_reduced4SigExtra_reducedVec_0};
  wire [3:0] _notCDom_reduced4SigExtra_T_4 = ~notCDom_normDistReduced2[4:1];
  wire [16:0] notCDom_reduced4SigExtra_shift = 17'sh10000 >>> _notCDom_reduced4SigExtra_T_4;
  wire [5:0] _notCDom_reduced4SigExtra_T_20 = {notCDom_reduced4SigExtra_shift[1],notCDom_reduced4SigExtra_shift[2],
    notCDom_reduced4SigExtra_shift[3],notCDom_reduced4SigExtra_shift[4],notCDom_reduced4SigExtra_shift[5],
    notCDom_reduced4SigExtra_shift[6]};
  wire [6:0] _GEN_4 = {{1'd0}, _notCDom_reduced4SigExtra_T_20};
  wire [6:0] _notCDom_reduced4SigExtra_T_21 = _notCDom_reduced4SigExtra_T_2 & _GEN_4;
  wire  notCDom_reduced4SigExtra = |_notCDom_reduced4SigExtra_T_21;
  wire  _notCDom_sig_T_3 = |notCDom_mainSig[2:0] | notCDom_reduced4SigExtra;
  wire [26:0] notCDom_sig = {notCDom_mainSig[28:3],_notCDom_sig_T_3};
  wire  notCDom_completeCancellation = notCDom_sig[26:25] == 2'h0;
  wire  _notCDom_sign_T = io_fromPreMul_signProd ^ notCDom_signSigSum;
  wire  notCDom_sign = notCDom_completeCancellation ? roundingMode_min : _notCDom_sign_T;
  wire  notNaN_isInfProd = io_fromPreMul_isInfA | io_fromPreMul_isInfB;
  wire  notNaN_isInfOut = notNaN_isInfProd | io_fromPreMul_isInfC;
  wire  notNaN_addZeros = (io_fromPreMul_isZeroA | io_fromPreMul_isZeroB) & io_fromPreMul_isZeroC;
  wire  _io_invalidExc_T = io_fromPreMul_isInfA & io_fromPreMul_isZeroB;
  wire  _io_invalidExc_T_1 = io_fromPreMul_isSigNaNAny | _io_invalidExc_T;
  wire  _io_invalidExc_T_2 = io_fromPreMul_isZeroA & io_fromPreMul_isInfB;
  wire  _io_invalidExc_T_3 = _io_invalidExc_T_1 | _io_invalidExc_T_2;
  wire  _io_invalidExc_T_6 = ~io_fromPreMul_isNaNAOrB & notNaN_isInfProd;
  wire  _io_invalidExc_T_7 = _io_invalidExc_T_6 & io_fromPreMul_isInfC;
  wire  _io_invalidExc_T_8 = _io_invalidExc_T_7 & io_fromPreMul_doSubMags;
  wire  _io_rawOut_isZero_T_1 = ~io_fromPreMul_CIsDominant & notCDom_completeCancellation;
  wire  _io_rawOut_sign_T_1 = io_fromPreMul_isInfC & CDom_sign;
  wire  _io_rawOut_sign_T_2 = notNaN_isInfProd & io_fromPreMul_signProd | _io_rawOut_sign_T_1;
  wire  _io_rawOut_sign_T_5 = notNaN_addZeros & ~roundingMode_min & io_fromPreMul_signProd;
  wire  _io_rawOut_sign_T_6 = _io_rawOut_sign_T_5 & CDom_sign;
  wire  _io_rawOut_sign_T_7 = _io_rawOut_sign_T_2 | _io_rawOut_sign_T_6;
  wire  _io_rawOut_sign_T_9 = io_fromPreMul_signProd | CDom_sign;
  wire  _io_rawOut_sign_T_10 = notNaN_addZeros & roundingMode_min & _io_rawOut_sign_T_9;
  wire  _io_rawOut_sign_T_11 = _io_rawOut_sign_T_7 | _io_rawOut_sign_T_10;
  wire  _io_rawOut_sign_T_15 = io_fromPreMul_CIsDominant ? CDom_sign : notCDom_sign;
  wire  _io_rawOut_sign_T_16 = ~notNaN_isInfOut & ~notNaN_addZeros & _io_rawOut_sign_T_15;
  assign io_invalidExc = _io_invalidExc_T_3 | _io_invalidExc_T_8;
  assign io_rawOut_isNaN = io_fromPreMul_isNaNAOrB | io_fromPreMul_isNaNC;
  assign io_rawOut_isInf = notNaN_isInfProd | io_fromPreMul_isInfC;
  assign io_rawOut_isZero = notNaN_addZeros | _io_rawOut_isZero_T_1;
  assign io_rawOut_sign = _io_rawOut_sign_T_11 | _io_rawOut_sign_T_16;
  assign io_rawOut_sExp = io_fromPreMul_CIsDominant ? $signed(CDom_sExp) : $signed(notCDom_sExp);
  assign io_rawOut_sig = io_fromPreMul_CIsDominant ? CDom_sig : notCDom_sig;
endmodule