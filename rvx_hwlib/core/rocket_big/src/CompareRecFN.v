`default_nettype wire
module CompareRecFN(
  input  [32:0] io_a,
  input  [32:0] io_b,
  input         io_signaling,
  output        io_lt,
  output        io_eq,
  output [4:0]  io_exceptionFlags
);
  wire [8:0] rawA_exp = io_a[31:23];
  wire  rawA_isZero = rawA_exp[8:6] == 3'h0;
  wire  rawA_isSpecial = rawA_exp[8:7] == 2'h3;
  wire  rawA__isNaN = rawA_isSpecial & rawA_exp[6];
  wire  rawA__isInf = rawA_isSpecial & ~rawA_exp[6];
  wire  rawA__sign = io_a[32];
  wire [9:0] rawA__sExp = {1'b0,$signed(rawA_exp)};
  wire  _rawA_out_sig_T = ~rawA_isZero;
  wire [24:0] rawA__sig = {1'h0,_rawA_out_sig_T,io_a[22:0]};
  wire [8:0] rawB_exp = io_b[31:23];
  wire  rawB_isZero = rawB_exp[8:6] == 3'h0;
  wire  rawB_isSpecial = rawB_exp[8:7] == 2'h3;
  wire  rawB__isNaN = rawB_isSpecial & rawB_exp[6];
  wire  rawB__isInf = rawB_isSpecial & ~rawB_exp[6];
  wire  rawB__sign = io_b[32];
  wire [9:0] rawB__sExp = {1'b0,$signed(rawB_exp)};
  wire  _rawB_out_sig_T = ~rawB_isZero;
  wire [24:0] rawB__sig = {1'h0,_rawB_out_sig_T,io_b[22:0]};
  wire  ordered = ~rawA__isNaN & ~rawB__isNaN;
  wire  bothInfs = rawA__isInf & rawB__isInf;
  wire  bothZeros = rawA_isZero & rawB_isZero;
  wire  eqExps = $signed(rawA__sExp) == $signed(rawB__sExp);
  wire  common_ltMags = $signed(rawA__sExp) < $signed(rawB__sExp) | eqExps & rawA__sig < rawB__sig;
  wire  common_eqMags = eqExps & rawA__sig == rawB__sig;
  wire  _ordered_lt_T_1 = ~rawB__sign;
  wire  _ordered_lt_T_9 = _ordered_lt_T_1 & common_ltMags;
  wire  _ordered_lt_T_10 = rawA__sign & ~common_ltMags & ~common_eqMags | _ordered_lt_T_9;
  wire  _ordered_lt_T_11 = ~bothInfs & _ordered_lt_T_10;
  wire  _ordered_lt_T_12 = rawA__sign & ~rawB__sign | _ordered_lt_T_11;
  wire  ordered_lt = ~bothZeros & _ordered_lt_T_12;
  wire  ordered_eq = bothZeros | rawA__sign == rawB__sign & (bothInfs | common_eqMags);
  wire  _invalid_T_2 = rawA__isNaN & ~rawA__sig[22];
  wire  _invalid_T_5 = rawB__isNaN & ~rawB__sig[22];
  wire  _invalid_T_8 = io_signaling & ~ordered;
  wire  invalid = _invalid_T_2 | _invalid_T_5 | _invalid_T_8;
  assign io_lt = ordered & ordered_lt;
  assign io_eq = ordered & ordered_eq;
  assign io_exceptionFlags = {invalid,4'h0};
endmodule