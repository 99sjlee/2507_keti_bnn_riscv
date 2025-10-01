`default_nettype wire
module MulAddRecFNPipe(
  input         clock,
  input         reset,
  input         io_validin,
  input  [1:0]  io_op,
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [32:0] io_c,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out,
  output [4:0]  io_exceptionFlags
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
  reg [31:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
`endif // RANDOMIZE_REG_INIT
  wire [1:0] mulAddRecFNToRaw_preMul_io_op;
  wire [32:0] mulAddRecFNToRaw_preMul_io_a;
  wire [32:0] mulAddRecFNToRaw_preMul_io_b;
  wire [32:0] mulAddRecFNToRaw_preMul_io_c;
  wire [23:0] mulAddRecFNToRaw_preMul_io_mulAddA;
  wire [23:0] mulAddRecFNToRaw_preMul_io_mulAddB;
  wire [47:0] mulAddRecFNToRaw_preMul_io_mulAddC;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfA;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfB;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_signProd;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfC;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC;
  wire [9:0] mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant;
  wire [4:0] mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist;
  wire [25:0] mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC;
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_signProd;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC;
  wire [9:0] mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant;
  wire [4:0] mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist;
  wire [25:0] mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC;
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC;
  wire [48:0] mulAddRecFNToRaw_postMul_io_mulAddResult;
  wire [2:0] mulAddRecFNToRaw_postMul_io_roundingMode;
  wire  mulAddRecFNToRaw_postMul_io_invalidExc;
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isNaN;
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isInf;
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isZero;
  wire  mulAddRecFNToRaw_postMul_io_rawOut_sign;
  wire [9:0] mulAddRecFNToRaw_postMul_io_rawOut_sExp;
  wire [26:0] mulAddRecFNToRaw_postMul_io_rawOut_sig;
  wire  roundRawFNToRecFN_io_invalidExc;
  wire  roundRawFNToRecFN_io_in_isNaN;
  wire  roundRawFNToRecFN_io_in_isInf;
  wire  roundRawFNToRecFN_io_in_isZero;
  wire  roundRawFNToRecFN_io_in_sign;
  wire [9:0] roundRawFNToRecFN_io_in_sExp;
  wire [26:0] roundRawFNToRecFN_io_in_sig;
  wire [2:0] roundRawFNToRecFN_io_roundingMode;
  wire [32:0] roundRawFNToRecFN_io_out;
  wire [4:0] roundRawFNToRecFN_io_exceptionFlags;
  wire [47:0] _mulAddResult_T = mulAddRecFNToRaw_preMul_io_mulAddA * mulAddRecFNToRaw_preMul_io_mulAddB;
  wire [48:0] mulAddResult = _mulAddResult_T + mulAddRecFNToRaw_preMul_io_mulAddC;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isSigNaNAny;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNAOrB;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfA;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroA;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfB;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroB;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_signProd;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNC;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfC;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroC;
  reg [9:0] mulAddRecFNToRaw_postMul_io_fromPreMul_b_sExpSum;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_doSubMags;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_CIsDominant;
  reg [4:0] mulAddRecFNToRaw_postMul_io_fromPreMul_b_CDom_CAlignDist;
  reg [25:0] mulAddRecFNToRaw_postMul_io_fromPreMul_b_highAlignedSigC;
  reg  mulAddRecFNToRaw_postMul_io_fromPreMul_b_bit0AlignedSigC;
  reg [48:0] mulAddRecFNToRaw_postMul_io_mulAddResult_b;
  reg [2:0] mulAddRecFNToRaw_postMul_io_roundingMode_b;
  reg [2:0] roundingMode_stage0_b;
  reg  valid_stage0_v;
  reg  roundRawFNToRecFN_io_invalidExc_b;
  reg  roundRawFNToRecFN_io_in_b_isNaN;
  reg  roundRawFNToRecFN_io_in_b_isInf;
  reg  roundRawFNToRecFN_io_in_b_isZero;
  reg  roundRawFNToRecFN_io_in_b_sign;
  reg [9:0] roundRawFNToRecFN_io_in_b_sExp;
  reg [26:0] roundRawFNToRecFN_io_in_b_sig;
  reg [2:0] roundRawFNToRecFN_io_roundingMode_b;
  MulAddRecFNToRaw_preMul mulAddRecFNToRaw_preMul (
    .io_op(mulAddRecFNToRaw_preMul_io_op),
    .io_a(mulAddRecFNToRaw_preMul_io_a),
    .io_b(mulAddRecFNToRaw_preMul_io_b),
    .io_c(mulAddRecFNToRaw_preMul_io_c),
    .io_mulAddA(mulAddRecFNToRaw_preMul_io_mulAddA),
    .io_mulAddB(mulAddRecFNToRaw_preMul_io_mulAddB),
    .io_mulAddC(mulAddRecFNToRaw_preMul_io_mulAddC),
    .io_toPostMul_isSigNaNAny(mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny),
    .io_toPostMul_isNaNAOrB(mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB),
    .io_toPostMul_isInfA(mulAddRecFNToRaw_preMul_io_toPostMul_isInfA),
    .io_toPostMul_isZeroA(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA),
    .io_toPostMul_isInfB(mulAddRecFNToRaw_preMul_io_toPostMul_isInfB),
    .io_toPostMul_isZeroB(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB),
    .io_toPostMul_signProd(mulAddRecFNToRaw_preMul_io_toPostMul_signProd),
    .io_toPostMul_isNaNC(mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC),
    .io_toPostMul_isInfC(mulAddRecFNToRaw_preMul_io_toPostMul_isInfC),
    .io_toPostMul_isZeroC(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC),
    .io_toPostMul_sExpSum(mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum),
    .io_toPostMul_doSubMags(mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags),
    .io_toPostMul_CIsDominant(mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant),
    .io_toPostMul_CDom_CAlignDist(mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist),
    .io_toPostMul_highAlignedSigC(mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC),
    .io_toPostMul_bit0AlignedSigC(mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC)
  );
  MulAddRecFNToRaw_postMul mulAddRecFNToRaw_postMul (
    .io_fromPreMul_isSigNaNAny(mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny),
    .io_fromPreMul_isNaNAOrB(mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB),
    .io_fromPreMul_isInfA(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA),
    .io_fromPreMul_isZeroA(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA),
    .io_fromPreMul_isInfB(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB),
    .io_fromPreMul_isZeroB(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB),
    .io_fromPreMul_signProd(mulAddRecFNToRaw_postMul_io_fromPreMul_signProd),
    .io_fromPreMul_isNaNC(mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC),
    .io_fromPreMul_isInfC(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC),
    .io_fromPreMul_isZeroC(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC),
    .io_fromPreMul_sExpSum(mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum),
    .io_fromPreMul_doSubMags(mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags),
    .io_fromPreMul_CIsDominant(mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant),
    .io_fromPreMul_CDom_CAlignDist(mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist),
    .io_fromPreMul_highAlignedSigC(mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC),
    .io_fromPreMul_bit0AlignedSigC(mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC),
    .io_mulAddResult(mulAddRecFNToRaw_postMul_io_mulAddResult),
    .io_roundingMode(mulAddRecFNToRaw_postMul_io_roundingMode),
    .io_invalidExc(mulAddRecFNToRaw_postMul_io_invalidExc),
    .io_rawOut_isNaN(mulAddRecFNToRaw_postMul_io_rawOut_isNaN),
    .io_rawOut_isInf(mulAddRecFNToRaw_postMul_io_rawOut_isInf),
    .io_rawOut_isZero(mulAddRecFNToRaw_postMul_io_rawOut_isZero),
    .io_rawOut_sign(mulAddRecFNToRaw_postMul_io_rawOut_sign),
    .io_rawOut_sExp(mulAddRecFNToRaw_postMul_io_rawOut_sExp),
    .io_rawOut_sig(mulAddRecFNToRaw_postMul_io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN (
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundRawFNToRecFN_io_roundingMode),
    .io_out(roundRawFNToRecFN_io_out),
    .io_exceptionFlags(roundRawFNToRecFN_io_exceptionFlags)
  );
  assign io_out = roundRawFNToRecFN_io_out;
  assign io_exceptionFlags = roundRawFNToRecFN_io_exceptionFlags;
  assign mulAddRecFNToRaw_preMul_io_op = io_op;
  assign mulAddRecFNToRaw_preMul_io_a = io_a;
  assign mulAddRecFNToRaw_preMul_io_b = io_b;
  assign mulAddRecFNToRaw_preMul_io_c = io_c;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isSigNaNAny;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNAOrB;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfA;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroA;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfB;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroB;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_signProd = mulAddRecFNToRaw_postMul_io_fromPreMul_b_signProd;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNC;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfC;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC = mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroC;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum = mulAddRecFNToRaw_postMul_io_fromPreMul_b_sExpSum;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags = mulAddRecFNToRaw_postMul_io_fromPreMul_b_doSubMags;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant = mulAddRecFNToRaw_postMul_io_fromPreMul_b_CIsDominant;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist =
    mulAddRecFNToRaw_postMul_io_fromPreMul_b_CDom_CAlignDist;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC =
    mulAddRecFNToRaw_postMul_io_fromPreMul_b_highAlignedSigC;
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC =
    mulAddRecFNToRaw_postMul_io_fromPreMul_b_bit0AlignedSigC;
  assign mulAddRecFNToRaw_postMul_io_mulAddResult = mulAddRecFNToRaw_postMul_io_mulAddResult_b;
  assign mulAddRecFNToRaw_postMul_io_roundingMode = mulAddRecFNToRaw_postMul_io_roundingMode_b;
  assign roundRawFNToRecFN_io_invalidExc = roundRawFNToRecFN_io_invalidExc_b;
  assign roundRawFNToRecFN_io_in_isNaN = roundRawFNToRecFN_io_in_b_isNaN;
  assign roundRawFNToRecFN_io_in_isInf = roundRawFNToRecFN_io_in_b_isInf;
  assign roundRawFNToRecFN_io_in_isZero = roundRawFNToRecFN_io_in_b_isZero;
  assign roundRawFNToRecFN_io_in_sign = roundRawFNToRecFN_io_in_b_sign;
  assign roundRawFNToRecFN_io_in_sExp = roundRawFNToRecFN_io_in_b_sExp;
  assign roundRawFNToRecFN_io_in_sig = roundRawFNToRecFN_io_in_b_sig;
  assign roundRawFNToRecFN_io_roundingMode = roundRawFNToRecFN_io_roundingMode_b;
  always @(posedge clock) begin
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isSigNaNAny <= mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNAOrB <= mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfA <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfA;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroA <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfB <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfB;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroB <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_signProd <= mulAddRecFNToRaw_preMul_io_toPostMul_signProd;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNC <= mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfC <= mulAddRecFNToRaw_preMul_io_toPostMul_isInfC;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroC <= mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_sExpSum <= mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_doSubMags <= mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_CIsDominant <= mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_CDom_CAlignDist <= mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_highAlignedSigC <= mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_fromPreMul_b_bit0AlignedSigC <= mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_mulAddResult_b <= mulAddResult;
    end
    if (io_validin) begin
      mulAddRecFNToRaw_postMul_io_roundingMode_b <= io_roundingMode;
    end
    if (io_validin) begin
      roundingMode_stage0_b <= io_roundingMode;
    end
    if (reset) begin
      valid_stage0_v <= 1'h0;
    end else begin
      valid_stage0_v <= io_validin;
    end
    if (valid_stage0_v) begin
      roundRawFNToRecFN_io_invalidExc_b <= mulAddRecFNToRaw_postMul_io_invalidExc;
    end
    if (valid_stage0_v) begin
      roundRawFNToRecFN_io_in_b_isNaN <= mulAddRecFNToRaw_postMul_io_rawOut_isNaN;
    end
    if (valid_stage0_v) begin
      roundRawFNToRecFN_io_in_b_isInf <= mulAddRecFNToRaw_postMul_io_rawOut_isInf;
    end
    if (valid_stage0_v) begin
      roundRawFNToRecFN_io_in_b_isZero <= mulAddRecFNToRaw_postMul_io_rawOut_isZero;
    end
    if (valid_stage0_v) begin
      roundRawFNToRecFN_io_in_b_sign <= mulAddRecFNToRaw_postMul_io_rawOut_sign;
    end
    if (valid_stage0_v) begin
      roundRawFNToRecFN_io_in_b_sExp <= mulAddRecFNToRaw_postMul_io_rawOut_sExp;
    end
    if (valid_stage0_v) begin
      roundRawFNToRecFN_io_in_b_sig <= mulAddRecFNToRaw_postMul_io_rawOut_sig;
    end
    if (valid_stage0_v) begin
      roundRawFNToRecFN_io_roundingMode_b <= roundingMode_stage0_b;
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
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isSigNaNAny = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNAOrB = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfA = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroA = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfB = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroB = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_signProd = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isNaNC = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isInfC = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_isZeroC = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_sExpSum = _RAND_10[9:0];
  _RAND_11 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_doSubMags = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_CIsDominant = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_CDom_CAlignDist = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_highAlignedSigC = _RAND_14[25:0];
  _RAND_15 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_fromPreMul_b_bit0AlignedSigC = _RAND_15[0:0];
  _RAND_16 = {2{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_mulAddResult_b = _RAND_16[48:0];
  _RAND_17 = {1{`RANDOM}};
  mulAddRecFNToRaw_postMul_io_roundingMode_b = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  roundingMode_stage0_b = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  valid_stage0_v = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  roundRawFNToRecFN_io_invalidExc_b = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_isNaN = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_isInf = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_isZero = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_sign = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_sExp = _RAND_25[9:0];
  _RAND_26 = {1{`RANDOM}};
  roundRawFNToRecFN_io_in_b_sig = _RAND_26[26:0];
  _RAND_27 = {1{`RANDOM}};
  roundRawFNToRecFN_io_roundingMode_b = _RAND_27[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule