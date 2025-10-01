`default_nettype wire
module INToRecFN(
  input         io_signedIn,
  input  [31:0] io_in,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out,
  output [4:0]  io_exceptionFlags
);
  wire  roundAnyRawFNToRecFN_io_in_isZero;
  wire  roundAnyRawFNToRecFN_io_in_sign;
  wire [7:0] roundAnyRawFNToRecFN_io_in_sExp;
  wire [32:0] roundAnyRawFNToRecFN_io_in_sig;
  wire [2:0] roundAnyRawFNToRecFN_io_roundingMode;
  wire [32:0] roundAnyRawFNToRecFN_io_out;
  wire [4:0] roundAnyRawFNToRecFN_io_exceptionFlags;
  wire  intAsRawFloat_sign = io_signedIn & io_in[31];
  wire [31:0] _intAsRawFloat_absIn_T_1 = 32'h0 - io_in;
  wire [31:0] intAsRawFloat_absIn = intAsRawFloat_sign ? _intAsRawFloat_absIn_T_1 : io_in;
  wire [63:0] _intAsRawFloat_extAbsIn_T = {32'h0,intAsRawFloat_absIn};
  wire [31:0] intAsRawFloat_extAbsIn = _intAsRawFloat_extAbsIn_T[31:0];
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_32 = intAsRawFloat_extAbsIn[1] ? 5'h1e : 5'h1f;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_33 = intAsRawFloat_extAbsIn[2] ? 5'h1d :
    _intAsRawFloat_adjustedNormDist_T_32;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_34 = intAsRawFloat_extAbsIn[3] ? 5'h1c :
    _intAsRawFloat_adjustedNormDist_T_33;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_35 = intAsRawFloat_extAbsIn[4] ? 5'h1b :
    _intAsRawFloat_adjustedNormDist_T_34;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_36 = intAsRawFloat_extAbsIn[5] ? 5'h1a :
    _intAsRawFloat_adjustedNormDist_T_35;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_37 = intAsRawFloat_extAbsIn[6] ? 5'h19 :
    _intAsRawFloat_adjustedNormDist_T_36;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_38 = intAsRawFloat_extAbsIn[7] ? 5'h18 :
    _intAsRawFloat_adjustedNormDist_T_37;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_39 = intAsRawFloat_extAbsIn[8] ? 5'h17 :
    _intAsRawFloat_adjustedNormDist_T_38;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_40 = intAsRawFloat_extAbsIn[9] ? 5'h16 :
    _intAsRawFloat_adjustedNormDist_T_39;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_41 = intAsRawFloat_extAbsIn[10] ? 5'h15 :
    _intAsRawFloat_adjustedNormDist_T_40;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_42 = intAsRawFloat_extAbsIn[11] ? 5'h14 :
    _intAsRawFloat_adjustedNormDist_T_41;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_43 = intAsRawFloat_extAbsIn[12] ? 5'h13 :
    _intAsRawFloat_adjustedNormDist_T_42;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_44 = intAsRawFloat_extAbsIn[13] ? 5'h12 :
    _intAsRawFloat_adjustedNormDist_T_43;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_45 = intAsRawFloat_extAbsIn[14] ? 5'h11 :
    _intAsRawFloat_adjustedNormDist_T_44;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_46 = intAsRawFloat_extAbsIn[15] ? 5'h10 :
    _intAsRawFloat_adjustedNormDist_T_45;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_47 = intAsRawFloat_extAbsIn[16] ? 5'hf :
    _intAsRawFloat_adjustedNormDist_T_46;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_48 = intAsRawFloat_extAbsIn[17] ? 5'he :
    _intAsRawFloat_adjustedNormDist_T_47;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_49 = intAsRawFloat_extAbsIn[18] ? 5'hd :
    _intAsRawFloat_adjustedNormDist_T_48;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_50 = intAsRawFloat_extAbsIn[19] ? 5'hc :
    _intAsRawFloat_adjustedNormDist_T_49;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_51 = intAsRawFloat_extAbsIn[20] ? 5'hb :
    _intAsRawFloat_adjustedNormDist_T_50;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_52 = intAsRawFloat_extAbsIn[21] ? 5'ha :
    _intAsRawFloat_adjustedNormDist_T_51;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_53 = intAsRawFloat_extAbsIn[22] ? 5'h9 :
    _intAsRawFloat_adjustedNormDist_T_52;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_54 = intAsRawFloat_extAbsIn[23] ? 5'h8 :
    _intAsRawFloat_adjustedNormDist_T_53;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_55 = intAsRawFloat_extAbsIn[24] ? 5'h7 :
    _intAsRawFloat_adjustedNormDist_T_54;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_56 = intAsRawFloat_extAbsIn[25] ? 5'h6 :
    _intAsRawFloat_adjustedNormDist_T_55;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_57 = intAsRawFloat_extAbsIn[26] ? 5'h5 :
    _intAsRawFloat_adjustedNormDist_T_56;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_58 = intAsRawFloat_extAbsIn[27] ? 5'h4 :
    _intAsRawFloat_adjustedNormDist_T_57;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_59 = intAsRawFloat_extAbsIn[28] ? 5'h3 :
    _intAsRawFloat_adjustedNormDist_T_58;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_60 = intAsRawFloat_extAbsIn[29] ? 5'h2 :
    _intAsRawFloat_adjustedNormDist_T_59;
  wire [4:0] _intAsRawFloat_adjustedNormDist_T_61 = intAsRawFloat_extAbsIn[30] ? 5'h1 :
    _intAsRawFloat_adjustedNormDist_T_60;
  wire [4:0] intAsRawFloat_adjustedNormDist = intAsRawFloat_extAbsIn[31] ? 5'h0 : _intAsRawFloat_adjustedNormDist_T_61;
  wire [62:0] _GEN_0 = {{31'd0}, intAsRawFloat_extAbsIn};
  wire [62:0] _intAsRawFloat_sig_T = _GEN_0 << intAsRawFloat_adjustedNormDist;
  wire [31:0] intAsRawFloat_sig = _intAsRawFloat_sig_T[31:0];
  wire [4:0] _intAsRawFloat_out_sExp_T_1 = ~intAsRawFloat_adjustedNormDist;
  wire [6:0] _intAsRawFloat_out_sExp_T_2 = {2'h2,_intAsRawFloat_out_sExp_T_1};
  RoundAnyRawFNToRecFN_1 roundAnyRawFNToRecFN (
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundAnyRawFNToRecFN_io_roundingMode),
    .io_out(roundAnyRawFNToRecFN_io_out),
    .io_exceptionFlags(roundAnyRawFNToRecFN_io_exceptionFlags)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out;
  assign io_exceptionFlags = roundAnyRawFNToRecFN_io_exceptionFlags;
  assign roundAnyRawFNToRecFN_io_in_isZero = ~intAsRawFloat_sig[31];
  assign roundAnyRawFNToRecFN_io_in_sign = io_signedIn & io_in[31];
  assign roundAnyRawFNToRecFN_io_in_sExp = {1'b0,$signed(_intAsRawFloat_out_sExp_T_2)};
  assign roundAnyRawFNToRecFN_io_in_sig = {{1'd0}, intAsRawFloat_sig};
  assign roundAnyRawFNToRecFN_io_roundingMode = io_roundingMode;
endmodule