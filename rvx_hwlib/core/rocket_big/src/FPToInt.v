`default_nettype wire
module FPToInt(
  input         clock,
  input         io_in_valid,
  input         io_in_bits_ren2,
  input         io_in_bits_wflags,
  input  [2:0]  io_in_bits_rm,
  input  [1:0]  io_in_bits_typ,
  input  [32:0] io_in_bits_in1,
  input  [32:0] io_in_bits_in2,
  output [2:0]  io_out_bits_in_rm,
  output [32:0] io_out_bits_in_in1,
  output [32:0] io_out_bits_in_in2,
  output        io_out_bits_lt,
  output [31:0] io_out_bits_store,
  output [31:0] io_out_bits_toint,
  output [4:0]  io_out_bits_exc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] dcmp_io_a;
  wire [32:0] dcmp_io_b;
  wire  dcmp_io_signaling;
  wire  dcmp_io_lt;
  wire  dcmp_io_eq;
  wire [4:0] dcmp_io_exceptionFlags;
  wire [32:0] conv_io_in;
  wire [2:0] conv_io_roundingMode;
  wire  conv_io_signedOut;
  wire [31:0] conv_io_out;
  wire [2:0] conv_io_intExceptionFlags;
  reg  in_ren2;
  reg  in_wflags;
  reg [2:0] in_rm;
  reg [1:0] in_typ;
  reg [32:0] in_in1;
  reg [32:0] in_in2;
  wire [8:0] store_rawIn_exp = in_in1[31:23];
  wire  store_rawIn_isZero = store_rawIn_exp[8:6] == 3'h0;
  wire  store_rawIn_isSpecial = store_rawIn_exp[8:7] == 2'h3;
  wire  store_rawIn__isNaN = store_rawIn_isSpecial & store_rawIn_exp[6];
  wire  store_rawIn__isInf = store_rawIn_isSpecial & ~store_rawIn_exp[6];
  wire  store_rawIn__sign = in_in1[32];
  wire [9:0] store_rawIn__sExp = {1'b0,$signed(store_rawIn_exp)};
  wire  _store_rawIn_out_sig_T = ~store_rawIn_isZero;
  wire [24:0] store_rawIn__sig = {1'h0,_store_rawIn_out_sig_T,in_in1[22:0]};
  wire  store_isSubnormal = $signed(store_rawIn__sExp) < 10'sh82;
  wire [4:0] store_denormShiftDist = 5'h1 - store_rawIn__sExp[4:0];
  wire [23:0] _store_denormFract_T_1 = store_rawIn__sig[24:1] >> store_denormShiftDist;
  wire [22:0] store_denormFract = _store_denormFract_T_1[22:0];
  wire [7:0] _store_expOut_T_2 = store_rawIn__sExp[7:0] - 8'h81;
  wire [7:0] _store_expOut_T_3 = store_isSubnormal ? 8'h0 : _store_expOut_T_2;
  wire  _store_expOut_T_4 = store_rawIn__isNaN | store_rawIn__isInf;
  wire [7:0] _store_expOut_T_6 = _store_expOut_T_4 ? 8'hff : 8'h0;
  wire [7:0] store_expOut = _store_expOut_T_3 | _store_expOut_T_6;
  wire [22:0] _store_fractOut_T_1 = store_rawIn__isInf ? 23'h0 : store_rawIn__sig[22:0];
  wire [22:0] store_fractOut = store_isSubnormal ? store_denormFract : _store_fractOut_T_1;
  wire [8:0] store_hi = {store_rawIn__sign,store_expOut};
  wire [31:0] store = {store_rawIn__sign,store_expOut,store_fractOut};
  wire [2:0] _toint_T_3 = ~in_rm;
  wire [1:0] _toint_T_4 = {dcmp_io_lt,dcmp_io_eq};
  wire [2:0] _GEN_31 = {{1'd0}, _toint_T_4};
  wire [2:0] _toint_T_5 = _toint_T_3 & _GEN_31;
  wire [32:0] _toint_T_9 = {{32'd0}, |_toint_T_5};
  wire [32:0] _GEN_26 = ~in_ren2 ? {{1'd0}, conv_io_out} : _toint_T_9;
  wire [2:0] classify_out_code = in_in1[31:29];
  wire  classify_out_isNaN = &classify_out_code;
  wire  classify_out_isQNaN = classify_out_isNaN & in_in1[22];
  wire  classify_out_isSNaN = classify_out_isNaN & ~in_in1[22];
  wire [1:0] classify_out_codeHi = classify_out_code[2:1];
  wire  classify_out_isSpecial = classify_out_codeHi == 2'h3;
  wire  classify_out_isInf = classify_out_isSpecial & ~classify_out_code[0];
  wire  _classify_out_T = ~store_rawIn__sign;
  wire  _classify_out_T_1 = classify_out_isInf & ~store_rawIn__sign;
  wire  _classify_out_isNormal_T = classify_out_codeHi == 2'h1;
  wire  classify_out_isHighSubnormalIn = in_in1[29:23] < 7'h2;
  wire  classify_out_isNormal = classify_out_codeHi == 2'h1 & ~classify_out_isHighSubnormalIn | classify_out_codeHi == 2'h2
    ;
  wire  _classify_out_T_3 = classify_out_isNormal & ~store_rawIn__sign;
  wire  classify_out_isSubnormal = classify_out_code == 3'h1 | _classify_out_isNormal_T & classify_out_isHighSubnormalIn
    ;
  wire  _classify_out_T_5 = classify_out_isSubnormal & _classify_out_T;
  wire  classify_out_isZero = classify_out_code == 3'h0;
  wire  _classify_out_T_7 = classify_out_isZero & _classify_out_T;
  wire  _classify_out_T_8 = classify_out_isZero & store_rawIn__sign;
  wire  _classify_out_T_9 = classify_out_isSubnormal & store_rawIn__sign;
  wire  _classify_out_T_10 = classify_out_isNormal & store_rawIn__sign;
  wire  _classify_out_T_11 = classify_out_isInf & store_rawIn__sign;
  wire [9:0] classify_out = {classify_out_isQNaN,classify_out_isSNaN,_classify_out_T_1,_classify_out_T_3,
    _classify_out_T_5,_classify_out_T_7,_classify_out_T_8,_classify_out_T_9,_classify_out_T_10,_classify_out_T_11};
  wire [32:0] _toint_T_2 = {{23'd0}, classify_out};
  wire [32:0] _GEN_23 = in_rm[0] ? _toint_T_2 : {{1'd0}, store};
  wire [32:0] toint = in_wflags ? _GEN_26 : _GEN_23;
  wire  _io_out_bits_exc_T_1 = |conv_io_intExceptionFlags[2:1];
  wire [4:0] _io_out_bits_exc_T_3 = {_io_out_bits_exc_T_1,3'h0,conv_io_intExceptionFlags[0]};
  wire [4:0] _GEN_27 = ~in_ren2 ? _io_out_bits_exc_T_3 : dcmp_io_exceptionFlags;
  CompareRecFN dcmp (
    .io_a(dcmp_io_a),
    .io_b(dcmp_io_b),
    .io_signaling(dcmp_io_signaling),
    .io_lt(dcmp_io_lt),
    .io_eq(dcmp_io_eq),
    .io_exceptionFlags(dcmp_io_exceptionFlags)
  );
  RecFNToIN conv (
    .io_in(conv_io_in),
    .io_roundingMode(conv_io_roundingMode),
    .io_signedOut(conv_io_signedOut),
    .io_out(conv_io_out),
    .io_intExceptionFlags(conv_io_intExceptionFlags)
  );
  assign io_out_bits_in_rm = in_rm;
  assign io_out_bits_in_in1 = in_in1;
  assign io_out_bits_in_in2 = in_in2;
  assign io_out_bits_lt = dcmp_io_lt | $signed(dcmp_io_a) < 33'sh0 & $signed(dcmp_io_b) >= 33'sh0;
  assign io_out_bits_store = {store_hi,store_fractOut};
  assign io_out_bits_toint = toint[31:0];
  assign io_out_bits_exc = in_wflags ? _GEN_27 : 5'h0;
  assign dcmp_io_a = in_in1;
  assign dcmp_io_b = in_in2;
  assign dcmp_io_signaling = ~in_rm[1];
  assign conv_io_in = in_in1;
  assign conv_io_roundingMode = in_rm;
  assign conv_io_signedOut = ~in_typ[0];
  always @(posedge clock) begin
    if (io_in_valid) begin
      in_ren2 <= io_in_bits_ren2;
    end
    if (io_in_valid) begin
      in_wflags <= io_in_bits_wflags;
    end
    if (io_in_valid) begin
      in_rm <= io_in_bits_rm;
    end
    if (io_in_valid) begin
      in_typ <= io_in_bits_typ;
    end
    if (io_in_valid) begin
      in_in1 <= io_in_bits_in1;
    end
    if (io_in_valid) begin
      in_in2 <= io_in_bits_in2;
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
  in_ren2 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  in_wflags = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_rm = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  in_typ = _RAND_3[1:0];
  _RAND_4 = {2{`RANDOM}};
  in_in1 = _RAND_4[32:0];
  _RAND_5 = {2{`RANDOM}};
  in_in2 = _RAND_5[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule