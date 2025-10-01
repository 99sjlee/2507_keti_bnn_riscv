`default_nettype wire
module TLXbar_7(
  input         clock,
  input         reset,
  output        auto_in_1_a_ready,
  input         auto_in_1_a_valid,
  input  [31:0] auto_in_1_a_bits_address,
  output        auto_in_1_d_valid,
  output [2:0]  auto_in_1_d_bits_opcode,
  output [3:0]  auto_in_1_d_bits_size,
  output [31:0] auto_in_1_d_bits_data,
  output        auto_in_1_d_bits_corrupt,
  output        auto_in_0_a_ready,
  input         auto_in_0_a_valid,
  input  [2:0]  auto_in_0_a_bits_opcode,
  input  [2:0]  auto_in_0_a_bits_param,
  input  [3:0]  auto_in_0_a_bits_size,
  input         auto_in_0_a_bits_source,
  input  [31:0] auto_in_0_a_bits_address,
  input  [3:0]  auto_in_0_a_bits_mask,
  input  [31:0] auto_in_0_a_bits_data,
  output        auto_in_0_c_ready,
  input         auto_in_0_c_valid,
  input  [2:0]  auto_in_0_c_bits_opcode,
  input  [2:0]  auto_in_0_c_bits_param,
  input  [3:0]  auto_in_0_c_bits_size,
  input  [31:0] auto_in_0_c_bits_address,
  input  [31:0] auto_in_0_c_bits_data,
  input         auto_in_0_d_ready,
  output        auto_in_0_d_valid,
  output [2:0]  auto_in_0_d_bits_opcode,
  output [1:0]  auto_in_0_d_bits_param,
  output [3:0]  auto_in_0_d_bits_size,
  output        auto_in_0_d_bits_source,
  output [2:0]  auto_in_0_d_bits_sink,
  output        auto_in_0_d_bits_denied,
  output [31:0] auto_in_0_d_bits_data,
  output        auto_in_0_e_ready,
  input         auto_in_0_e_valid,
  input  [2:0]  auto_in_0_e_bits_sink,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [1:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  input         auto_out_c_ready,
  output        auto_out_c_valid,
  output [2:0]  auto_out_c_bits_opcode,
  output [2:0]  auto_out_c_bits_param,
  output [3:0]  auto_out_c_bits_size,
  output [31:0] auto_out_c_bits_address,
  output [31:0] auto_out_c_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [1:0]  auto_out_d_bits_source,
  input  [2:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [31:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  input         auto_out_e_ready,
  output        auto_out_e_valid,
  output [2:0]  auto_out_e_bits_sink
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [3:0] monitor_io_in_a_bits_size;
  wire  monitor_io_in_a_bits_source;
  wire [31:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_c_ready;
  wire  monitor_io_in_c_valid;
  wire [2:0] monitor_io_in_c_bits_opcode;
  wire [2:0] monitor_io_in_c_bits_param;
  wire [3:0] monitor_io_in_c_bits_size;
  wire [31:0] monitor_io_in_c_bits_address;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire  monitor_io_in_d_bits_source;
  wire [2:0] monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  monitor_io_in_e_ready;
  wire  monitor_io_in_e_valid;
  wire [2:0] monitor_io_in_e_bits_sink;
  wire  monitor_1_clock;
  wire  monitor_1_reset;
  wire  monitor_1_io_in_a_ready;
  wire  monitor_1_io_in_a_valid;
  wire [31:0] monitor_1_io_in_a_bits_address;
  wire  monitor_1_io_in_d_valid;
  wire [2:0] monitor_1_io_in_d_bits_opcode;
  wire [1:0] monitor_1_io_in_d_bits_param;
  wire [3:0] monitor_1_io_in_d_bits_size;
  wire [2:0] monitor_1_io_in_d_bits_sink;
  wire  monitor_1_io_in_d_bits_denied;
  wire  monitor_1_io_in_d_bits_corrupt;
  wire  requestDOI_0_0 = ~auto_out_d_bits_source[1];
  wire  requestDOI_0_1 = auto_out_d_bits_source == 2'h2;
  wire [26:0] _beatsAI_decode_T_1 = 27'hfff << auto_in_0_a_bits_size;
  wire [11:0] _beatsAI_decode_T_3 = ~_beatsAI_decode_T_1[11:0];
  wire [9:0] beatsAI_decode = _beatsAI_decode_T_3[11:2];
  wire  beatsAI_opdata = ~auto_in_0_a_bits_opcode[2];
  reg [9:0] beatsLeft;
  wire  idle = beatsLeft == 10'h0;
  wire  latch = idle & auto_out_a_ready;
  wire [1:0] readys_valid = {auto_in_1_a_valid,auto_in_0_a_valid};
  wire  _readys_T_3 = ~reset;
  reg [1:0] readys_mask;
  wire [1:0] _readys_filter_T = ~readys_mask;
  wire [1:0] _readys_filter_T_1 = readys_valid & _readys_filter_T;
  wire [3:0] readys_filter = {_readys_filter_T_1,auto_in_1_a_valid,auto_in_0_a_valid};
  wire [3:0] _GEN_1 = {{1'd0}, readys_filter[3:1]};
  wire [3:0] _readys_unready_T_1 = readys_filter | _GEN_1;
  wire [3:0] _readys_unready_T_4 = {readys_mask, 2'h0};
  wire [3:0] _GEN_2 = {{1'd0}, _readys_unready_T_1[3:1]};
  wire [3:0] readys_unready = _GEN_2 | _readys_unready_T_4;
  wire [1:0] _readys_readys_T_2 = readys_unready[3:2] & readys_unready[1:0];
  wire [1:0] readys_readys = ~_readys_readys_T_2;
  wire [1:0] _readys_mask_T = readys_readys & readys_valid;
  wire [2:0] _readys_mask_T_1 = {_readys_mask_T, 1'h0};
  wire [1:0] _readys_mask_T_3 = _readys_mask_T | _readys_mask_T_1[1:0];
  wire  readys_0 = readys_readys[0];
  wire  readys_1 = readys_readys[1];
  wire  earlyWinner_0 = readys_0 & auto_in_0_a_valid;
  wire  earlyWinner_1 = readys_1 & auto_in_1_a_valid;
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1;
  wire  _T_11 = auto_in_0_a_valid | auto_in_1_a_valid;
  wire  _T_12 = ~(auto_in_0_a_valid | auto_in_1_a_valid);
  reg  state_0;
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0;
  reg  state_1;
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1;
  wire  _out_0_a_earlyValid_T_3 = state_0 & auto_in_0_a_valid | state_1 & auto_in_1_a_valid;
  wire  out_2_0_a_earlyValid = idle ? _T_11 : _out_0_a_earlyValid_T_3;
  wire  _beatsLeft_T_2 = auto_out_a_ready & out_2_0_a_earlyValid;
  wire [9:0] _GEN_3 = {{9'd0}, _beatsLeft_T_2};
  wire [9:0] _beatsLeft_T_4 = beatsLeft - _GEN_3;
  wire  allowed_0 = idle ? readys_0 : state_0;
  wire  allowed_1 = idle ? readys_1 : state_1;
  wire [3:0] _T_31 = muxStateEarly_0 ? auto_in_0_a_bits_mask : 4'h0;
  wire [3:0] _T_32 = muxStateEarly_1 ? 4'hf : 4'h0;
  wire [31:0] _T_34 = muxStateEarly_0 ? auto_in_0_a_bits_address : 32'h0;
  wire [31:0] _T_35 = muxStateEarly_1 ? auto_in_1_a_bits_address : 32'h0;
  wire [1:0] in_0_a_bits_source = {{1'd0}, auto_in_0_a_bits_source};
  wire [1:0] _T_37 = muxStateEarly_0 ? in_0_a_bits_source : 2'h0;
  wire [1:0] _T_38 = muxStateEarly_1 ? 2'h2 : 2'h0;
  wire [3:0] _T_40 = muxStateEarly_0 ? auto_in_0_a_bits_size : 4'h0;
  wire [3:0] _T_41 = muxStateEarly_1 ? 4'h6 : 4'h0;
  wire [2:0] _T_46 = muxStateEarly_0 ? auto_in_0_a_bits_opcode : 3'h0;
  wire [2:0] _T_47 = muxStateEarly_1 ? 3'h4 : 3'h0;
  
  
  assign auto_in_1_a_ready = auto_out_a_ready & allowed_1;
  assign auto_in_1_d_valid = auto_out_d_valid & requestDOI_0_1;
  assign auto_in_1_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_1_d_bits_size = auto_out_d_bits_size;
  assign auto_in_1_d_bits_data = auto_out_d_bits_data;
  assign auto_in_1_d_bits_corrupt = auto_out_d_bits_corrupt;
  assign auto_in_0_a_ready = auto_out_a_ready & allowed_0;
  assign auto_in_0_c_ready = auto_out_c_ready;
  assign auto_in_0_d_valid = auto_out_d_valid & requestDOI_0_0;
  assign auto_in_0_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_0_d_bits_param = auto_out_d_bits_param;
  assign auto_in_0_d_bits_size = auto_out_d_bits_size;
  assign auto_in_0_d_bits_source = auto_out_d_bits_source[0];
  assign auto_in_0_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_0_d_bits_denied = auto_out_d_bits_denied;
  assign auto_in_0_d_bits_data = auto_out_d_bits_data;
  assign auto_in_0_e_ready = auto_out_e_ready;
  assign auto_out_a_valid = idle ? _T_11 : _out_0_a_earlyValid_T_3;
  assign auto_out_a_bits_opcode = _T_46 | _T_47;
  assign auto_out_a_bits_param = muxStateEarly_0 ? auto_in_0_a_bits_param : 3'h0;
  assign auto_out_a_bits_size = _T_40 | _T_41;
  assign auto_out_a_bits_source = _T_37 | _T_38;
  assign auto_out_a_bits_address = _T_34 | _T_35;
  assign auto_out_a_bits_mask = _T_31 | _T_32;
  assign auto_out_a_bits_data = muxStateEarly_0 ? auto_in_0_a_bits_data : 32'h0;
  assign auto_out_c_valid = auto_in_0_c_valid;
  assign auto_out_c_bits_opcode = auto_in_0_c_bits_opcode;
  assign auto_out_c_bits_param = auto_in_0_c_bits_param;
  assign auto_out_c_bits_size = auto_in_0_c_bits_size;
  assign auto_out_c_bits_address = auto_in_0_c_bits_address;
  assign auto_out_c_bits_data = auto_in_0_c_bits_data;
  assign auto_out_d_ready = requestDOI_0_0 & auto_in_0_d_ready | requestDOI_0_1;
  assign auto_out_e_valid = auto_in_0_e_valid;
  assign auto_out_e_bits_sink = auto_in_0_e_bits_sink;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_a_ready & allowed_0;
  assign monitor_io_in_a_valid = auto_in_0_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_0_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_0_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_0_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_0_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_0_a_bits_mask;
  assign monitor_io_in_c_ready = auto_out_c_ready;
  assign monitor_io_in_c_valid = auto_in_0_c_valid;
  assign monitor_io_in_c_bits_opcode = auto_in_0_c_bits_opcode;
  assign monitor_io_in_c_bits_param = auto_in_0_c_bits_param;
  assign monitor_io_in_c_bits_size = auto_in_0_c_bits_size;
  assign monitor_io_in_c_bits_address = auto_in_0_c_bits_address;
  assign monitor_io_in_d_ready = auto_in_0_d_ready;
  assign monitor_io_in_d_valid = auto_out_d_valid & requestDOI_0_0;
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param;
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size;
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source[0];
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink;
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt;
  assign monitor_io_in_e_ready = auto_out_e_ready;
  assign monitor_io_in_e_valid = auto_in_0_e_valid;
  assign monitor_io_in_e_bits_sink = auto_in_0_e_bits_sink;
  assign monitor_1_clock = clock;
  assign monitor_1_reset = reset;
  assign monitor_1_io_in_a_ready = auto_out_a_ready & allowed_1;
  assign monitor_1_io_in_a_valid = auto_in_1_a_valid;
  assign monitor_1_io_in_a_bits_address = auto_in_1_a_bits_address;
  assign monitor_1_io_in_d_valid = auto_out_d_valid & requestDOI_0_1;
  assign monitor_1_io_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign monitor_1_io_in_d_bits_param = auto_out_d_bits_param;
  assign monitor_1_io_in_d_bits_size = auto_out_d_bits_size;
  assign monitor_1_io_in_d_bits_sink = auto_out_d_bits_sink;
  assign monitor_1_io_in_d_bits_denied = auto_out_d_bits_denied;
  assign monitor_1_io_in_d_bits_corrupt = auto_out_d_bits_corrupt;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 10'h0;
    end else if (latch) begin
      if (earlyWinner_0) begin
        if (beatsAI_opdata) begin
          beatsLeft <= beatsAI_decode;
        end else begin
          beatsLeft <= 10'h0;
        end
      end else begin
        beatsLeft <= 10'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin
      readys_mask <= 2'h3;
    end else if (latch & |readys_valid) begin
      readys_mask <= _readys_mask_T_3;
    end
    if (reset) begin
      state_0 <= 1'h0;
    end else if (idle) begin
      state_0 <= earlyWinner_0;
    end
    if (reset) begin
      state_1 <= 1'h0;
    end else if (idle) begin
      state_1 <= earlyWinner_1;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1) & _readys_T_3) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_readys_T_3 & ~(~earlyWinner_0 | ~earlyWinner_1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(auto_in_0_a_valid | auto_in_1_a_valid) | _prefixOR_T) & _readys_T_3) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_readys_T_3 & ~(~(auto_in_0_a_valid | auto_in_1_a_valid) | _prefixOR_T)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_12 | _T_11) & _readys_T_3) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_readys_T_3 & ~(_T_12 | _T_11)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  beatsLeft = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  readys_mask = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  state_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_1 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule