`default_nettype wire
module DivSqrtRecFNToRaw_small(
  input         clock,
  input         reset,
  output        io_inReady,
  input         io_inValid,
  input         io_sqrtOp,
  input  [32:0] io_a,
  input  [32:0] io_b,
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
  wire  divSqrtRawFN__clock;
  wire  divSqrtRawFN__reset;
  wire  divSqrtRawFN__io_inReady;
  wire  divSqrtRawFN__io_inValid;
  wire  divSqrtRawFN__io_sqrtOp;
  wire  divSqrtRawFN__io_a_isNaN;
  wire  divSqrtRawFN__io_a_isInf;
  wire  divSqrtRawFN__io_a_isZero;
  wire  divSqrtRawFN__io_a_sign;
  wire [9:0] divSqrtRawFN__io_a_sExp;
  wire [24:0] divSqrtRawFN__io_a_sig;
  wire  divSqrtRawFN__io_b_isNaN;
  wire  divSqrtRawFN__io_b_isInf;
  wire  divSqrtRawFN__io_b_isZero;
  wire  divSqrtRawFN__io_b_sign;
  wire [9:0] divSqrtRawFN__io_b_sExp;
  wire [24:0] divSqrtRawFN__io_b_sig;
  wire [2:0] divSqrtRawFN__io_roundingMode;
  wire  divSqrtRawFN__io_rawOutValid_div;
  wire  divSqrtRawFN__io_rawOutValid_sqrt;
  wire [2:0] divSqrtRawFN__io_roundingModeOut;
  wire  divSqrtRawFN__io_invalidExc;
  wire  divSqrtRawFN__io_infiniteExc;
  wire  divSqrtRawFN__io_rawOut_isNaN;
  wire  divSqrtRawFN__io_rawOut_isInf;
  wire  divSqrtRawFN__io_rawOut_isZero;
  wire  divSqrtRawFN__io_rawOut_sign;
  wire [9:0] divSqrtRawFN__io_rawOut_sExp;
  wire [26:0] divSqrtRawFN__io_rawOut_sig;
  wire [8:0] divSqrtRawFN_io_a_exp = io_a[31:23];
  wire  divSqrtRawFN_io_a_isZero = divSqrtRawFN_io_a_exp[8:6] == 3'h0;
  wire  divSqrtRawFN_io_a_isSpecial = divSqrtRawFN_io_a_exp[8:7] == 2'h3;
  wire  _divSqrtRawFN_io_a_out_sig_T = ~divSqrtRawFN_io_a_isZero;
  wire [1:0] divSqrtRawFN_io_a_out_sig_hi = {1'h0,_divSqrtRawFN_io_a_out_sig_T};
  wire [8:0] divSqrtRawFN_io_b_exp = io_b[31:23];
  wire  divSqrtRawFN_io_b_isZero = divSqrtRawFN_io_b_exp[8:6] == 3'h0;
  wire  divSqrtRawFN_io_b_isSpecial = divSqrtRawFN_io_b_exp[8:7] == 2'h3;
  wire  _divSqrtRawFN_io_b_out_sig_T = ~divSqrtRawFN_io_b_isZero;
  wire [1:0] divSqrtRawFN_io_b_out_sig_hi = {1'h0,_divSqrtRawFN_io_b_out_sig_T};
  DivSqrtRawFN_small divSqrtRawFN_ (
    .clock(divSqrtRawFN__clock),
    .reset(divSqrtRawFN__reset),
    .io_inReady(divSqrtRawFN__io_inReady),
    .io_inValid(divSqrtRawFN__io_inValid),
    .io_sqrtOp(divSqrtRawFN__io_sqrtOp),
    .io_a_isNaN(divSqrtRawFN__io_a_isNaN),
    .io_a_isInf(divSqrtRawFN__io_a_isInf),
    .io_a_isZero(divSqrtRawFN__io_a_isZero),
    .io_a_sign(divSqrtRawFN__io_a_sign),
    .io_a_sExp(divSqrtRawFN__io_a_sExp),
    .io_a_sig(divSqrtRawFN__io_a_sig),
    .io_b_isNaN(divSqrtRawFN__io_b_isNaN),
    .io_b_isInf(divSqrtRawFN__io_b_isInf),
    .io_b_isZero(divSqrtRawFN__io_b_isZero),
    .io_b_sign(divSqrtRawFN__io_b_sign),
    .io_b_sExp(divSqrtRawFN__io_b_sExp),
    .io_b_sig(divSqrtRawFN__io_b_sig),
    .io_roundingMode(divSqrtRawFN__io_roundingMode),
    .io_rawOutValid_div(divSqrtRawFN__io_rawOutValid_div),
    .io_rawOutValid_sqrt(divSqrtRawFN__io_rawOutValid_sqrt),
    .io_roundingModeOut(divSqrtRawFN__io_roundingModeOut),
    .io_invalidExc(divSqrtRawFN__io_invalidExc),
    .io_infiniteExc(divSqrtRawFN__io_infiniteExc),
    .io_rawOut_isNaN(divSqrtRawFN__io_rawOut_isNaN),
    .io_rawOut_isInf(divSqrtRawFN__io_rawOut_isInf),
    .io_rawOut_isZero(divSqrtRawFN__io_rawOut_isZero),
    .io_rawOut_sign(divSqrtRawFN__io_rawOut_sign),
    .io_rawOut_sExp(divSqrtRawFN__io_rawOut_sExp),
    .io_rawOut_sig(divSqrtRawFN__io_rawOut_sig)
  );
  assign io_inReady = divSqrtRawFN__io_inReady;
  assign io_rawOutValid_div = divSqrtRawFN__io_rawOutValid_div;
  assign io_rawOutValid_sqrt = divSqrtRawFN__io_rawOutValid_sqrt;
  assign io_roundingModeOut = divSqrtRawFN__io_roundingModeOut;
  assign io_invalidExc = divSqrtRawFN__io_invalidExc;
  assign io_infiniteExc = divSqrtRawFN__io_infiniteExc;
  assign io_rawOut_isNaN = divSqrtRawFN__io_rawOut_isNaN;
  assign io_rawOut_isInf = divSqrtRawFN__io_rawOut_isInf;
  assign io_rawOut_isZero = divSqrtRawFN__io_rawOut_isZero;
  assign io_rawOut_sign = divSqrtRawFN__io_rawOut_sign;
  assign io_rawOut_sExp = divSqrtRawFN__io_rawOut_sExp;
  assign io_rawOut_sig = divSqrtRawFN__io_rawOut_sig;
  assign divSqrtRawFN__clock = clock;
  assign divSqrtRawFN__reset = reset;
  assign divSqrtRawFN__io_inValid = io_inValid;
  assign divSqrtRawFN__io_sqrtOp = io_sqrtOp;
  assign divSqrtRawFN__io_a_isNaN = divSqrtRawFN_io_a_isSpecial & divSqrtRawFN_io_a_exp[6];
  assign divSqrtRawFN__io_a_isInf = divSqrtRawFN_io_a_isSpecial & ~divSqrtRawFN_io_a_exp[6];
  assign divSqrtRawFN__io_a_isZero = divSqrtRawFN_io_a_exp[8:6] == 3'h0;
  assign divSqrtRawFN__io_a_sign = io_a[32];
  assign divSqrtRawFN__io_a_sExp = {1'b0,$signed(divSqrtRawFN_io_a_exp)};
  assign divSqrtRawFN__io_a_sig = {divSqrtRawFN_io_a_out_sig_hi,io_a[22:0]};
  assign divSqrtRawFN__io_b_isNaN = divSqrtRawFN_io_b_isSpecial & divSqrtRawFN_io_b_exp[6];
  assign divSqrtRawFN__io_b_isInf = divSqrtRawFN_io_b_isSpecial & ~divSqrtRawFN_io_b_exp[6];
  assign divSqrtRawFN__io_b_isZero = divSqrtRawFN_io_b_exp[8:6] == 3'h0;
  assign divSqrtRawFN__io_b_sign = io_b[32];
  assign divSqrtRawFN__io_b_sExp = {1'b0,$signed(divSqrtRawFN_io_b_exp)};
  assign divSqrtRawFN__io_b_sig = {divSqrtRawFN_io_b_out_sig_hi,io_b[22:0]};
  assign divSqrtRawFN__io_roundingMode = io_roundingMode;
endmodule