`default_nettype wire
module AMOALU(
  input  [3:0]  io_mask,
  input  [4:0]  io_cmd,
  input  [31:0] io_lhs,
  input  [31:0] io_rhs,
  output [31:0] io_out
);
  wire  max = io_cmd == 5'hd | io_cmd == 5'hf;
  wire  min = io_cmd == 5'hc | io_cmd == 5'he;
  wire  add = io_cmd == 5'h8;
  wire  _logic_and_T = io_cmd == 5'ha;
  wire  logic_and = io_cmd == 5'ha | io_cmd == 5'hb;
  wire  logic_xor = io_cmd == 5'h9 | _logic_and_T;
  wire [31:0] adder_out = io_lhs + io_rhs;
  wire [4:0] _less_signed_T = io_cmd & 5'h2;
  wire  less_signed = _less_signed_T == 5'h0;
  wire  _less_T_6 = io_lhs < io_rhs;
  wire  _less_T_9 = less_signed ? io_lhs[31] : io_rhs[31];
  wire  less = io_lhs[31] == io_rhs[31] ? _less_T_6 : _less_T_9;
  wire  _minmax_T = less ? min : max;
  wire [31:0] minmax = _minmax_T ? io_lhs : io_rhs;
  wire [31:0] _logic_T = io_lhs & io_rhs;
  wire [31:0] _logic_T_1 = logic_and ? _logic_T : 32'h0;
  wire [31:0] _logic_T_2 = io_lhs ^ io_rhs;
  wire [31:0] _logic_T_3 = logic_xor ? _logic_T_2 : 32'h0;
  wire [31:0] logic_ = _logic_T_1 | _logic_T_3;
  wire [31:0] _out_T_1 = logic_and | logic_xor ? logic_ : minmax;
  wire [31:0] out = add ? adder_out : _out_T_1;
  wire [7:0] _wmask_T_5 = io_mask[0] ? 8'hff : 8'h0;
  wire [7:0] _wmask_T_7 = io_mask[1] ? 8'hff : 8'h0;
  wire [7:0] _wmask_T_9 = io_mask[2] ? 8'hff : 8'h0;
  wire [7:0] _wmask_T_11 = io_mask[3] ? 8'hff : 8'h0;
  wire [31:0] wmask = {_wmask_T_11,_wmask_T_9,_wmask_T_7,_wmask_T_5};
  wire [31:0] _io_out_T = wmask & out;
  wire [31:0] _io_out_T_1 = ~wmask;
  wire [31:0] _io_out_T_2 = _io_out_T_1 & io_lhs;
  assign io_out = _io_out_T | _io_out_T_2;
endmodule