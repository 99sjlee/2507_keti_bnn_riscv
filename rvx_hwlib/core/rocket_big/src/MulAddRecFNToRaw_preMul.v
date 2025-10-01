`default_nettype wire
module MulAddRecFNToRaw_preMul(
  input  [1:0]  io_op,
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [32:0] io_c,
  output [23:0] io_mulAddA,
  output [23:0] io_mulAddB,
  output [47:0] io_mulAddC,
  output        io_toPostMul_isSigNaNAny,
  output        io_toPostMul_isNaNAOrB,
  output        io_toPostMul_isInfA,
  output        io_toPostMul_isZeroA,
  output        io_toPostMul_isInfB,
  output        io_toPostMul_isZeroB,
  output        io_toPostMul_signProd,
  output        io_toPostMul_isNaNC,
  output        io_toPostMul_isInfC,
  output        io_toPostMul_isZeroC,
  output [9:0]  io_toPostMul_sExpSum,
  output        io_toPostMul_doSubMags,
  output        io_toPostMul_CIsDominant,
  output [4:0]  io_toPostMul_CDom_CAlignDist,
  output [25:0] io_toPostMul_highAlignedSigC,
  output        io_toPostMul_bit0AlignedSigC
);
  wire [8:0] rawA_exp = io_a[31:23];
  wire  rawA_isZero = rawA_exp[8:6] == 3'h0;
  wire  rawA_isSpecial = rawA_exp[8:7] == 2'h3;
  wire  rawA__isNaN = rawA_isSpecial & rawA_exp[6];
  wire  rawA__sign = io_a[32];
  wire [9:0] rawA__sExp = {1'b0,$signed(rawA_exp)};
  wire  _rawA_out_sig_T = ~rawA_isZero;
  wire [24:0] rawA__sig = {1'h0,_rawA_out_sig_T,io_a[22:0]};
  wire [8:0] rawB_exp = io_b[31:23];
  wire  rawB_isZero = rawB_exp[8:6] == 3'h0;
  wire  rawB_isSpecial = rawB_exp[8:7] == 2'h3;
  wire  rawB__isNaN = rawB_isSpecial & rawB_exp[6];
  wire  rawB__sign = io_b[32];
  wire [9:0] rawB__sExp = {1'b0,$signed(rawB_exp)};
  wire  _rawB_out_sig_T = ~rawB_isZero;
  wire [24:0] rawB__sig = {1'h0,_rawB_out_sig_T,io_b[22:0]};
  wire [8:0] rawC_exp = io_c[31:23];
  wire  rawC_isZero = rawC_exp[8:6] == 3'h0;
  wire  rawC_isSpecial = rawC_exp[8:7] == 2'h3;
  wire  rawC__isNaN = rawC_isSpecial & rawC_exp[6];
  wire  rawC__sign = io_c[32];
  wire [9:0] rawC__sExp = {1'b0,$signed(rawC_exp)};
  wire  _rawC_out_sig_T = ~rawC_isZero;
  wire [24:0] rawC__sig = {1'h0,_rawC_out_sig_T,io_c[22:0]};
  wire  signProd = rawA__sign ^ rawB__sign ^ io_op[1];
  wire [10:0] _sExpAlignedProd_T = $signed(rawA__sExp) + $signed(rawB__sExp);
  wire [10:0] sExpAlignedProd = $signed(_sExpAlignedProd_T) - 11'she5;
  wire  doSubMags = signProd ^ rawC__sign ^ io_op[0];
  wire [10:0] _GEN_0 = {{1{rawC__sExp[9]}},rawC__sExp};
  wire [10:0] sNatCAlignDist = $signed(sExpAlignedProd) - $signed(_GEN_0);
  wire [9:0] posNatCAlignDist = sNatCAlignDist[9:0];
  wire  isMinCAlign = rawA_isZero | rawB_isZero | $signed(sNatCAlignDist) < 11'sh0;
  wire  CIsDominant = _rawC_out_sig_T & (isMinCAlign | posNatCAlignDist <= 10'h18);
  wire [6:0] _CAlignDist_T_2 = posNatCAlignDist < 10'h4a ? posNatCAlignDist[6:0] : 7'h4a;
  wire [6:0] CAlignDist = isMinCAlign ? 7'h0 : _CAlignDist_T_2;
  wire [24:0] _mainAlignedSigC_T = ~rawC__sig;
  wire [24:0] _mainAlignedSigC_T_1 = doSubMags ? _mainAlignedSigC_T : rawC__sig;
  wire [52:0] _mainAlignedSigC_T_3 = doSubMags ? 53'h1fffffffffffff : 53'h0;
  wire [77:0] _mainAlignedSigC_T_5 = {_mainAlignedSigC_T_1,_mainAlignedSigC_T_3};
  wire [77:0] mainAlignedSigC = $signed(_mainAlignedSigC_T_5) >>> CAlignDist;
  wire [26:0] _reduced4CExtra_T = {rawC__sig, 2'h0};
  wire  reduced4CExtra_reducedVec_0 = |_reduced4CExtra_T[3:0];
  wire  reduced4CExtra_reducedVec_1 = |_reduced4CExtra_T[7:4];
  wire  reduced4CExtra_reducedVec_2 = |_reduced4CExtra_T[11:8];
  wire  reduced4CExtra_reducedVec_3 = |_reduced4CExtra_T[15:12];
  wire  reduced4CExtra_reducedVec_4 = |_reduced4CExtra_T[19:16];
  wire  reduced4CExtra_reducedVec_5 = |_reduced4CExtra_T[23:20];
  wire  reduced4CExtra_reducedVec_6 = |_reduced4CExtra_T[26:24];
  wire [6:0] _reduced4CExtra_T_1 = {reduced4CExtra_reducedVec_6,reduced4CExtra_reducedVec_5,reduced4CExtra_reducedVec_4,
    reduced4CExtra_reducedVec_3,reduced4CExtra_reducedVec_2,reduced4CExtra_reducedVec_1,reduced4CExtra_reducedVec_0};
  wire [32:0] reduced4CExtra_shift = 33'sh100000000 >>> CAlignDist[6:2];
  wire [5:0] _reduced4CExtra_T_18 = {reduced4CExtra_shift[14],reduced4CExtra_shift[15],reduced4CExtra_shift[16],
    reduced4CExtra_shift[17],reduced4CExtra_shift[18],reduced4CExtra_shift[19]};
  wire [6:0] _GEN_1 = {{1'd0}, _reduced4CExtra_T_18};
  wire [6:0] _reduced4CExtra_T_19 = _reduced4CExtra_T_1 & _GEN_1;
  wire  reduced4CExtra = |_reduced4CExtra_T_19;
  wire  _alignedSigC_T_4 = &mainAlignedSigC[2:0] & ~reduced4CExtra;
  wire  _alignedSigC_T_7 = |mainAlignedSigC[2:0] | reduced4CExtra;
  wire  _alignedSigC_T_8 = doSubMags ? _alignedSigC_T_4 : _alignedSigC_T_7;
  wire [74:0] alignedSigC_hi = mainAlignedSigC[77:3];
  wire [75:0] alignedSigC = {alignedSigC_hi,_alignedSigC_T_8};
  wire  _io_toPostMul_isSigNaNAny_T_2 = rawA__isNaN & ~rawA__sig[22];
  wire  _io_toPostMul_isSigNaNAny_T_5 = rawB__isNaN & ~rawB__sig[22];
  wire  _io_toPostMul_isSigNaNAny_T_9 = rawC__isNaN & ~rawC__sig[22];
  wire [10:0] _io_toPostMul_sExpSum_T_2 = $signed(sExpAlignedProd) - 11'sh18;
  wire [10:0] _io_toPostMul_sExpSum_T_3 = CIsDominant ? $signed({{1{rawC__sExp[9]}},rawC__sExp}) : $signed(
    _io_toPostMul_sExpSum_T_2);
  assign io_mulAddA = rawA__sig[23:0];
  assign io_mulAddB = rawB__sig[23:0];
  assign io_mulAddC = alignedSigC[48:1];
  assign io_toPostMul_isSigNaNAny = _io_toPostMul_isSigNaNAny_T_2 | _io_toPostMul_isSigNaNAny_T_5 |
    _io_toPostMul_isSigNaNAny_T_9;
  assign io_toPostMul_isNaNAOrB = rawA__isNaN | rawB__isNaN;
  assign io_toPostMul_isInfA = rawA_isSpecial & ~rawA_exp[6];
  assign io_toPostMul_isZeroA = rawA_exp[8:6] == 3'h0;
  assign io_toPostMul_isInfB = rawB_isSpecial & ~rawB_exp[6];
  assign io_toPostMul_isZeroB = rawB_exp[8:6] == 3'h0;
  assign io_toPostMul_signProd = rawA__sign ^ rawB__sign ^ io_op[1];
  assign io_toPostMul_isNaNC = rawC_isSpecial & rawC_exp[6];
  assign io_toPostMul_isInfC = rawC_isSpecial & ~rawC_exp[6];
  assign io_toPostMul_isZeroC = rawC_exp[8:6] == 3'h0;
  assign io_toPostMul_sExpSum = _io_toPostMul_sExpSum_T_3[9:0];
  assign io_toPostMul_doSubMags = signProd ^ rawC__sign ^ io_op[0];
  assign io_toPostMul_CIsDominant = _rawC_out_sig_T & (isMinCAlign | posNatCAlignDist <= 10'h18);
  assign io_toPostMul_CDom_CAlignDist = CAlignDist[4:0];
  assign io_toPostMul_highAlignedSigC = alignedSigC[74:49];
  assign io_toPostMul_bit0AlignedSigC = alignedSigC[0];
endmodule