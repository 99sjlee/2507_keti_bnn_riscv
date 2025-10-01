`default_nettype wire
module FPToFP(
  input         clock,
  input         reset,
  input         io_in_valid,
  input         io_in_bits_wflags,
  input  [2:0]  io_in_bits_rm,
  input  [32:0] io_in_bits_in1,
  input  [32:0] io_in_bits_in2,
  output [32:0] io_out_bits_data,
  output [4:0]  io_out_bits_exc,
  input         io_lt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  inPipe_valid;
  reg  inPipe_bits_wflags;
  reg [2:0] inPipe_bits_rm;
  reg [32:0] inPipe_bits_in1;
  reg [32:0] inPipe_bits_in2;
  wire [32:0] _signNum_T_1 = inPipe_bits_in1 ^ inPipe_bits_in2;
  wire [32:0] _signNum_T_3 = ~inPipe_bits_in2;
  wire [32:0] _signNum_T_4 = inPipe_bits_rm[0] ? _signNum_T_3 : inPipe_bits_in2;
  wire [32:0] signNum = inPipe_bits_rm[1] ? _signNum_T_1 : _signNum_T_4;
  wire [32:0] fsgnj = {signNum[32],inPipe_bits_in1[31:0]};
  wire  isnan1 = &inPipe_bits_in1[31:29];
  wire  isnan2 = &inPipe_bits_in2[31:29];
  wire  _isInvalid_T_4 = isnan1 & ~inPipe_bits_in1[22];
  wire  _isInvalid_T_9 = isnan2 & ~inPipe_bits_in2[22];
  wire  isInvalid = _isInvalid_T_4 | _isInvalid_T_9;
  wire  isNaNOut = isnan1 & isnan2;
  wire  isLHS = isnan2 | inPipe_bits_rm[0] != io_lt & ~isnan1;
  wire [4:0] _fsgnjMux_exc_T = {isInvalid, 4'h0};
  reg [32:0] io_out_b_data;
  reg [4:0] io_out_b_exc;
  assign io_out_bits_data = io_out_b_data;
  assign io_out_bits_exc = io_out_b_exc;
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
      inPipe_bits_in1 <= io_in_bits_in1;
    end
    if (io_in_valid) begin
      inPipe_bits_in2 <= io_in_bits_in2;
    end
    if (inPipe_valid) begin
      if (inPipe_bits_wflags) begin
        if (isNaNOut) begin
          io_out_b_data <= 33'he0400000;
        end else if (isLHS) begin
          io_out_b_data <= inPipe_bits_in1;
        end else begin
          io_out_b_data <= inPipe_bits_in2;
        end
      end else begin
        io_out_b_data <= fsgnj;
      end
    end
    if (inPipe_valid) begin
      if (inPipe_bits_wflags) begin
        io_out_b_exc <= _fsgnjMux_exc_T;
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
  _RAND_3 = {2{`RANDOM}};
  inPipe_bits_in1 = _RAND_3[32:0];
  _RAND_4 = {2{`RANDOM}};
  inPipe_bits_in2 = _RAND_4[32:0];
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