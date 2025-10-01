`default_nettype wire
module MulDiv(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [3:0]  io_req_bits_fn,
  input  [31:0] io_req_bits_in1,
  input  [31:0] io_req_bits_in2,
  input  [4:0]  io_req_bits_tag,
  input         io_kill,
  input         io_resp_ready,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  output [4:0]  io_resp_bits_tag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [95:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state;
  reg [4:0] req_tag;
  reg [5:0] count;
  reg  neg_out;
  reg  isHi;
  reg  resHi;
  reg [32:0] divisor;
  reg [65:0] remainder;
  wire [2:0] decoded_plaInput = io_req_bits_fn[2:0];
  wire [2:0] decoded_invInputs = ~decoded_plaInput;
  wire  decoded_andMatrixInput_0 = decoded_invInputs[0];
  wire  _decoded_T = &decoded_andMatrixInput_0;
  wire  decoded_andMatrixInput_0_1 = decoded_invInputs[2];
  wire  _decoded_T_1 = &decoded_andMatrixInput_0_1;
  wire  decoded_andMatrixInput_0_2 = decoded_invInputs[1];
  wire [1:0] _decoded_T_2 = {decoded_andMatrixInput_0_2,decoded_andMatrixInput_0_1};
  wire  _decoded_T_3 = &_decoded_T_2;
  wire  decoded_andMatrixInput_0_3 = decoded_plaInput[0];
  wire [1:0] _decoded_T_4 = {decoded_andMatrixInput_0_3,decoded_andMatrixInput_0_1};
  wire  _decoded_T_5 = &_decoded_T_4;
  wire  decoded_andMatrixInput_0_4 = decoded_plaInput[1];
  wire  _decoded_T_6 = &decoded_andMatrixInput_0_4;
  wire  decoded_andMatrixInput_1_2 = decoded_plaInput[2];
  wire [1:0] _decoded_T_7 = {decoded_andMatrixInput_0,decoded_andMatrixInput_1_2};
  wire  _decoded_T_8 = &_decoded_T_7;
  wire [1:0] _decoded_orMatrixOutputs_T = {_decoded_T_3,_decoded_T_8};
  wire  _decoded_orMatrixOutputs_T_1 = |_decoded_orMatrixOutputs_T;
  wire [1:0] _decoded_orMatrixOutputs_T_2 = {_decoded_T,_decoded_T_3};
  wire  _decoded_orMatrixOutputs_T_3 = |_decoded_orMatrixOutputs_T_2;
  wire [1:0] _decoded_orMatrixOutputs_T_4 = {_decoded_T_5,_decoded_T_6};
  wire  _decoded_orMatrixOutputs_T_5 = |_decoded_orMatrixOutputs_T_4;
  wire  _decoded_orMatrixOutputs_T_6 = |_decoded_T_1;
  wire [3:0] decoded_orMatrixOutputs = {_decoded_orMatrixOutputs_T_6,_decoded_orMatrixOutputs_T_5,
    _decoded_orMatrixOutputs_T_3,_decoded_orMatrixOutputs_T_1};
  wire [3:0] decoded_invMatrixOutputs = {decoded_orMatrixOutputs[3],decoded_orMatrixOutputs[2],decoded_orMatrixOutputs[1
    ],decoded_orMatrixOutputs[0]};
  wire  cmdMul = decoded_invMatrixOutputs[3];
  wire  cmdHi = decoded_invMatrixOutputs[2];
  wire  lhsSigned = decoded_invMatrixOutputs[1];
  wire  rhsSigned = decoded_invMatrixOutputs[0];
  wire  lhs_sign = lhsSigned & io_req_bits_in1[31];
  wire [15:0] hi = io_req_bits_in1[31:16];
  wire [31:0] lhs_in = {hi,io_req_bits_in1[15:0]};
  wire  rhs_sign = rhsSigned & io_req_bits_in2[31];
  wire [15:0] hi_1 = io_req_bits_in2[31:16];
  wire [32:0] subtractor = remainder[64:32] - divisor;
  wire [31:0] result = resHi ? remainder[64:33] : remainder[31:0];
  wire [31:0] negated_remainder = 32'h0 - result;
  wire [65:0] _GEN_0 = remainder[31] ? {{34'd0}, negated_remainder} : remainder;
  wire [65:0] _GEN_2 = state == 3'h1 ? _GEN_0 : remainder;
  wire [2:0] _GEN_4 = state == 3'h1 ? 3'h3 : state;
  wire [2:0] _GEN_6 = state == 3'h5 ? 3'h7 : _GEN_4;
  wire  _GEN_7 = state == 3'h5 ? 1'h0 : resHi;
  wire [64:0] mulReg = {remainder[65:33],remainder[31:0]};
  wire  mplierSign = remainder[32];
  wire [31:0] mplier = mulReg[31:0];
  wire [32:0] accum = mulReg[64:32];
  wire [8:0] _prod_T_2 = {mplierSign,mplier[7:0]};
  wire [41:0] _prod_T_3 = $signed(_prod_T_2) * $signed(divisor);
  wire [41:0] _GEN_35 = {{9{accum[32]}},accum};
  wire [41:0] nextMulReg_hi = $signed(_prod_T_3) + $signed(_GEN_35);
  wire [65:0] nextMulReg = {nextMulReg_hi,mplier[31:8]};
  wire  nextMplierSign = count == 6'h2 & neg_out;
  wire  _eOut_T_4 = ~isHi;
  wire [64:0] nextMulReg1 = {nextMulReg[64:32],nextMulReg[31:0]};
  wire [65:0] _remainder_T_2 = {nextMulReg1[64:32],nextMplierSign,nextMulReg1[31:0]};
  wire [5:0] _count_T_1 = count + 6'h1;
  wire [2:0] _GEN_8 = count == 6'h3 ? 3'h6 : _GEN_6;
  wire  _GEN_9 = count == 6'h3 ? isHi : _GEN_7;
  wire [2:0] _GEN_12 = state == 3'h2 ? _GEN_8 : _GEN_6;
  wire  _GEN_13 = state == 3'h2 ? _GEN_9 : _GEN_7;
  wire  unrolls_less = subtractor[32];
  wire [31:0] _unrolls_T_2 = unrolls_less ? remainder[63:32] : subtractor[31:0];
  wire  _unrolls_T_4 = ~unrolls_less;
  wire [64:0] unrolls_0 = {_unrolls_T_2,remainder[31:0],_unrolls_T_4};
  wire [2:0] _state_T = neg_out ? 3'h5 : 3'h7;
  wire [2:0] _GEN_14 = count == 6'h20 ? _state_T : _GEN_12;
  wire  divby0 = count == 6'h0 & _unrolls_T_4;
  wire  _T_21 = io_resp_ready & io_resp_valid;
  wire  _T_23 = io_req_ready & io_req_valid;
  wire [32:0] _divisor_T = {rhs_sign,hi_1,io_req_bits_in2[15:0]};
  wire [15:0] loOut = result[15:0];
  assign io_req_ready = state == 3'h0;
  assign io_resp_valid = state == 3'h6 | state == 3'h7;
  assign io_resp_bits_data = {result[31:16],loOut};
  assign io_resp_bits_tag = req_tag;
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else if (_T_23) begin
      if (cmdMul) begin
        state <= 3'h2;
      end else if (lhs_sign | rhs_sign) begin
        state <= 3'h1;
      end else begin
        state <= 3'h3;
      end
    end else if (_T_21 | io_kill) begin
      state <= 3'h0;
    end else if (state == 3'h3) begin
      state <= _GEN_14;
    end else begin
      state <= _GEN_12;
    end
    if (_T_23) begin
      req_tag <= io_req_bits_tag;
    end
    if (_T_23) begin
      count <= 6'h0;
    end else if (state == 3'h3) begin
      count <= _count_T_1;
    end else if (state == 3'h2) begin
      count <= _count_T_1;
    end
    if (_T_23) begin
      if (cmdHi) begin
        neg_out <= lhs_sign;
      end else begin
        neg_out <= lhs_sign != rhs_sign;
      end
    end else if (state == 3'h3) begin
      if (divby0 & _eOut_T_4) begin
        neg_out <= 1'h0;
      end
    end
    if (_T_23) begin
      isHi <= cmdHi;
    end
    if (_T_23) begin
      resHi <= 1'h0;
    end else if (state == 3'h3) begin
      if (count == 6'h20) begin
        resHi <= isHi;
      end else begin
        resHi <= _GEN_13;
      end
    end else begin
      resHi <= _GEN_13;
    end
    if (_T_23) begin
      divisor <= _divisor_T;
    end else if (state == 3'h1) begin
      if (divisor[31]) begin
        divisor <= subtractor;
      end
    end
    if (_T_23) begin
      remainder <= {{34'd0}, lhs_in};
    end else if (state == 3'h3) begin
      remainder <= {{1'd0}, unrolls_0};
    end else if (state == 3'h2) begin
      remainder <= _remainder_T_2;
    end else if (state == 3'h5) begin
      remainder <= {{34'd0}, negated_remainder};
    end else begin
      remainder <= _GEN_2;
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
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  req_tag = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  count = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  neg_out = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  isHi = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  resHi = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  divisor = _RAND_6[32:0];
  _RAND_7 = {3{`RANDOM}};
  remainder = _RAND_7[65:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule