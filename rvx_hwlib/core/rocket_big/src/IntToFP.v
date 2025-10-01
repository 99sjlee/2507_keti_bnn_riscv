`default_nettype wire
module IntToFP(
  input         clock,
  input         reset,
  input         io_in_valid,
  input         io_in_bits_wflags,
  input  [2:0]  io_in_bits_rm,
  input  [1:0]  io_in_bits_typ,
  input  [31:0] io_in_bits_in1,
  output [32:0] io_out_bits_data,
  output [4:0]  io_out_bits_exc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  i2f_io_signedIn;
  wire [31:0] i2f_io_in;
  wire [2:0] i2f_io_roundingMode;
  wire [32:0] i2f_io_out;
  wire [4:0] i2f_io_exceptionFlags;
  reg  inPipe_valid;
  reg  inPipe_bits_wflags;
  reg [2:0] inPipe_bits_rm;
  reg [1:0] inPipe_bits_typ;
  reg [31:0] inPipe_bits_in1;
  wire  mux_data_rawIn_sign = inPipe_bits_in1[31];
  wire [7:0] mux_data_rawIn_expIn = inPipe_bits_in1[30:23];
  wire [22:0] mux_data_rawIn_fractIn = inPipe_bits_in1[22:0];
  wire  mux_data_rawIn_isZeroExpIn = mux_data_rawIn_expIn == 8'h0;
  wire  mux_data_rawIn_isZeroFractIn = mux_data_rawIn_fractIn == 23'h0;
  wire [4:0] _mux_data_rawIn_normDist_T_23 = mux_data_rawIn_fractIn[1] ? 5'h15 : 5'h16;
  wire [4:0] _mux_data_rawIn_normDist_T_24 = mux_data_rawIn_fractIn[2] ? 5'h14 : _mux_data_rawIn_normDist_T_23;
  wire [4:0] _mux_data_rawIn_normDist_T_25 = mux_data_rawIn_fractIn[3] ? 5'h13 : _mux_data_rawIn_normDist_T_24;
  wire [4:0] _mux_data_rawIn_normDist_T_26 = mux_data_rawIn_fractIn[4] ? 5'h12 : _mux_data_rawIn_normDist_T_25;
  wire [4:0] _mux_data_rawIn_normDist_T_27 = mux_data_rawIn_fractIn[5] ? 5'h11 : _mux_data_rawIn_normDist_T_26;
  wire [4:0] _mux_data_rawIn_normDist_T_28 = mux_data_rawIn_fractIn[6] ? 5'h10 : _mux_data_rawIn_normDist_T_27;
  wire [4:0] _mux_data_rawIn_normDist_T_29 = mux_data_rawIn_fractIn[7] ? 5'hf : _mux_data_rawIn_normDist_T_28;
  wire [4:0] _mux_data_rawIn_normDist_T_30 = mux_data_rawIn_fractIn[8] ? 5'he : _mux_data_rawIn_normDist_T_29;
  wire [4:0] _mux_data_rawIn_normDist_T_31 = mux_data_rawIn_fractIn[9] ? 5'hd : _mux_data_rawIn_normDist_T_30;
  wire [4:0] _mux_data_rawIn_normDist_T_32 = mux_data_rawIn_fractIn[10] ? 5'hc : _mux_data_rawIn_normDist_T_31;
  wire [4:0] _mux_data_rawIn_normDist_T_33 = mux_data_rawIn_fractIn[11] ? 5'hb : _mux_data_rawIn_normDist_T_32;
  wire [4:0] _mux_data_rawIn_normDist_T_34 = mux_data_rawIn_fractIn[12] ? 5'ha : _mux_data_rawIn_normDist_T_33;
  wire [4:0] _mux_data_rawIn_normDist_T_35 = mux_data_rawIn_fractIn[13] ? 5'h9 : _mux_data_rawIn_normDist_T_34;
  wire [4:0] _mux_data_rawIn_normDist_T_36 = mux_data_rawIn_fractIn[14] ? 5'h8 : _mux_data_rawIn_normDist_T_35;
  wire [4:0] _mux_data_rawIn_normDist_T_37 = mux_data_rawIn_fractIn[15] ? 5'h7 : _mux_data_rawIn_normDist_T_36;
  wire [4:0] _mux_data_rawIn_normDist_T_38 = mux_data_rawIn_fractIn[16] ? 5'h6 : _mux_data_rawIn_normDist_T_37;
  wire [4:0] _mux_data_rawIn_normDist_T_39 = mux_data_rawIn_fractIn[17] ? 5'h5 : _mux_data_rawIn_normDist_T_38;
  wire [4:0] _mux_data_rawIn_normDist_T_40 = mux_data_rawIn_fractIn[18] ? 5'h4 : _mux_data_rawIn_normDist_T_39;
  wire [4:0] _mux_data_rawIn_normDist_T_41 = mux_data_rawIn_fractIn[19] ? 5'h3 : _mux_data_rawIn_normDist_T_40;
  wire [4:0] _mux_data_rawIn_normDist_T_42 = mux_data_rawIn_fractIn[20] ? 5'h2 : _mux_data_rawIn_normDist_T_41;
  wire [4:0] _mux_data_rawIn_normDist_T_43 = mux_data_rawIn_fractIn[21] ? 5'h1 : _mux_data_rawIn_normDist_T_42;
  wire [4:0] mux_data_rawIn_normDist = mux_data_rawIn_fractIn[22] ? 5'h0 : _mux_data_rawIn_normDist_T_43;
  wire [53:0] _GEN_0 = {{31'd0}, mux_data_rawIn_fractIn};
  wire [53:0] _mux_data_rawIn_subnormFract_T = _GEN_0 << mux_data_rawIn_normDist;
  wire [22:0] mux_data_rawIn_subnormFract = {_mux_data_rawIn_subnormFract_T[21:0], 1'h0};
  wire [8:0] _GEN_23 = {{4'd0}, mux_data_rawIn_normDist};
  wire [8:0] _mux_data_rawIn_adjustedExp_T = _GEN_23 ^ 9'h1ff;
  wire [8:0] _mux_data_rawIn_adjustedExp_T_1 = mux_data_rawIn_isZeroExpIn ? _mux_data_rawIn_adjustedExp_T : {{1'd0},
    mux_data_rawIn_expIn};
  wire [1:0] _mux_data_rawIn_adjustedExp_T_2 = mux_data_rawIn_isZeroExpIn ? 2'h2 : 2'h1;
  wire [7:0] _GEN_24 = {{6'd0}, _mux_data_rawIn_adjustedExp_T_2};
  wire [7:0] _mux_data_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_24;
  wire [8:0] _GEN_25 = {{1'd0}, _mux_data_rawIn_adjustedExp_T_3};
  wire [8:0] mux_data_rawIn_adjustedExp = _mux_data_rawIn_adjustedExp_T_1 + _GEN_25;
  wire  mux_data_rawIn_isZero = mux_data_rawIn_isZeroExpIn & mux_data_rawIn_isZeroFractIn;
  wire  mux_data_rawIn_isSpecial = mux_data_rawIn_adjustedExp[8:7] == 2'h3;
  wire  mux_data_rawIn__isNaN = mux_data_rawIn_isSpecial & ~mux_data_rawIn_isZeroFractIn;
  wire [9:0] mux_data_rawIn__sExp = {1'b0,$signed(mux_data_rawIn_adjustedExp)};
  wire  _mux_data_rawIn_out_sig_T = ~mux_data_rawIn_isZero;
  wire [22:0] _mux_data_rawIn_out_sig_T_1 = mux_data_rawIn_isZeroExpIn ? mux_data_rawIn_subnormFract :
    mux_data_rawIn_fractIn;
  wire [24:0] mux_data_rawIn__sig = {1'h0,_mux_data_rawIn_out_sig_T,_mux_data_rawIn_out_sig_T_1};
  wire [2:0] _mux_data_T_2 = mux_data_rawIn_isZero ? 3'h0 : mux_data_rawIn__sExp[8:6];
  wire [2:0] _GEN_26 = {{2'd0}, mux_data_rawIn__isNaN};
  wire [2:0] _mux_data_T_4 = _mux_data_T_2 | _GEN_26;
  wire [32:0] _mux_data_T_7 = {mux_data_rawIn_sign,_mux_data_T_4,mux_data_rawIn__sExp[5:0],mux_data_rawIn__sig[22:0]};
  reg [32:0] io_out_b_data;
  reg [4:0] io_out_b_exc;
  INToRecFN i2f (
    .io_signedIn(i2f_io_signedIn),
    .io_in(i2f_io_in),
    .io_roundingMode(i2f_io_roundingMode),
    .io_out(i2f_io_out),
    .io_exceptionFlags(i2f_io_exceptionFlags)
  );
  assign io_out_bits_data = io_out_b_data;
  assign io_out_bits_exc = io_out_b_exc;
  assign i2f_io_signedIn = ~inPipe_bits_typ[0];
  assign i2f_io_in = inPipe_bits_in1;
  assign i2f_io_roundingMode = inPipe_bits_rm;
  always @(posedge clock) begin
    if (reset) begin
      inPipe_valid <= 1'h0;
    end else begin
      inPipe_valid <= io_in_valid;
    end
    if (io_in_valid) begin
      inPipe_bits_wflags <= io_in_bits_wflags;
    end
    if (io_in_valid) begin
      inPipe_bits_rm <= io_in_bits_rm;
    end
    if (io_in_valid) begin
      inPipe_bits_typ <= io_in_bits_typ;
    end
    if (io_in_valid) begin
      inPipe_bits_in1 <= io_in_bits_in1;
    end
    if (inPipe_valid) begin
      if (inPipe_bits_wflags) begin
        io_out_b_data <= i2f_io_out;
      end else begin
        io_out_b_data <= _mux_data_T_7;
      end
    end
    if (inPipe_valid) begin
      if (inPipe_bits_wflags) begin
        io_out_b_exc <= i2f_io_exceptionFlags;
      end else begin
        io_out_b_exc <= 5'h0;
      end
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
  inPipe_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  inPipe_bits_wflags = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  inPipe_bits_rm = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  inPipe_bits_typ = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  inPipe_bits_in1 = _RAND_4[31:0];
  _RAND_5 = {2{`RANDOM}};
  io_out_b_data = _RAND_5[32:0];
  _RAND_6 = {1{`RANDOM}};
  io_out_b_exc = _RAND_6[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule