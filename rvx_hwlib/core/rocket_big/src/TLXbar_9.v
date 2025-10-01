`default_nettype wire
module TLXbar_9(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [8:0]  auto_in_a_bits_address,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [6:0]  auto_out_1_a_bits_address,
  output [31:0] auto_out_1_a_bits_data,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [31:0] auto_out_1_d_bits_data,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [8:0]  auto_out_0_a_bits_address,
  output [31:0] auto_out_0_a_bits_data,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [1:0]  auto_out_0_d_bits_size,
  input         auto_out_0_d_bits_sink,
  input         auto_out_0_d_bits_denied,
  input  [31:0] auto_out_0_d_bits_data,
  input         auto_out_0_d_bits_corrupt
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
  wire [8:0] monitor_io_in_a_bits_address;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [1:0] monitor_io_in_d_bits_size;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire [9:0] _requestAIO_T_1 = {1'b0,$signed(auto_in_a_bits_address)};
  wire [9:0] _requestAIO_T_3 = $signed(_requestAIO_T_1) & 10'sh1c0;
  wire  _requestAIO_T_4 = $signed(_requestAIO_T_3) == 10'sh0;
  wire [8:0] _requestAIO_T_5 = auto_in_a_bits_address ^ 9'h44;
  wire [9:0] _requestAIO_T_6 = {1'b0,$signed(_requestAIO_T_5)};
  wire [9:0] _requestAIO_T_8 = $signed(_requestAIO_T_6) & 10'sh1f4;
  wire  _requestAIO_T_9 = $signed(_requestAIO_T_8) == 10'sh0;
  wire [8:0] _requestAIO_T_10 = auto_in_a_bits_address ^ 9'h58;
  wire [9:0] _requestAIO_T_11 = {1'b0,$signed(_requestAIO_T_10)};
  wire [9:0] _requestAIO_T_13 = $signed(_requestAIO_T_11) & 10'sh1f8;
  wire  _requestAIO_T_14 = $signed(_requestAIO_T_13) == 10'sh0;
  wire [8:0] _requestAIO_T_15 = auto_in_a_bits_address ^ 9'h60;
  wire [9:0] _requestAIO_T_16 = {1'b0,$signed(_requestAIO_T_15)};
  wire [9:0] _requestAIO_T_18 = $signed(_requestAIO_T_16) & 10'sh1e0;
  wire  _requestAIO_T_19 = $signed(_requestAIO_T_18) == 10'sh0;
  wire [8:0] _requestAIO_T_20 = auto_in_a_bits_address ^ 9'h80;
  wire [9:0] _requestAIO_T_21 = {1'b0,$signed(_requestAIO_T_20)};
  wire [9:0] _requestAIO_T_23 = $signed(_requestAIO_T_21) & 10'sh180;
  wire  _requestAIO_T_24 = $signed(_requestAIO_T_23) == 10'sh0;
  wire [8:0] _requestAIO_T_25 = auto_in_a_bits_address ^ 9'h100;
  wire [9:0] _requestAIO_T_26 = {1'b0,$signed(_requestAIO_T_25)};
  wire [9:0] _requestAIO_T_28 = $signed(_requestAIO_T_26) & 10'sh100;
  wire  _requestAIO_T_29 = $signed(_requestAIO_T_28) == 10'sh0;
  wire  requestAIO_0_0 = _requestAIO_T_4 | _requestAIO_T_9 | _requestAIO_T_14 | _requestAIO_T_19 | _requestAIO_T_24 |
    _requestAIO_T_29;
  wire [8:0] _requestAIO_T_35 = auto_in_a_bits_address ^ 9'h40;
  wire [9:0] _requestAIO_T_36 = {1'b0,$signed(_requestAIO_T_35)};
  wire [9:0] _requestAIO_T_38 = $signed(_requestAIO_T_36) & 10'sh1f4;
  wire  _requestAIO_T_39 = $signed(_requestAIO_T_38) == 10'sh0;
  wire [8:0] _requestAIO_T_40 = auto_in_a_bits_address ^ 9'h50;
  wire [9:0] _requestAIO_T_41 = {1'b0,$signed(_requestAIO_T_40)};
  wire [9:0] _requestAIO_T_43 = $signed(_requestAIO_T_41) & 10'sh1f8;
  wire  _requestAIO_T_44 = $signed(_requestAIO_T_43) == 10'sh0;
  wire  requestAIO_0_1 = _requestAIO_T_39 | _requestAIO_T_44;
  reg  beatsLeft;
  wire  idle = ~beatsLeft;
  wire  latch = idle & auto_in_d_ready;
  wire [1:0] readys_valid = {auto_out_1_d_valid,auto_out_0_d_valid};
  wire  _readys_T_3 = ~reset;
  reg [1:0] readys_mask;
  wire [1:0] _readys_filter_T = ~readys_mask;
  wire [1:0] _readys_filter_T_1 = readys_valid & _readys_filter_T;
  wire [3:0] readys_filter = {_readys_filter_T_1,auto_out_1_d_valid,auto_out_0_d_valid};
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
  wire  earlyWinner_0 = readys_0 & auto_out_0_d_valid;
  wire  earlyWinner_1 = readys_1 & auto_out_1_d_valid;
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1;
  wire  _T_10 = auto_out_0_d_valid | auto_out_1_d_valid;
  wire  _T_11 = ~(auto_out_0_d_valid | auto_out_1_d_valid);
  reg  state_0;
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0;
  reg  state_1;
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1;
  wire  _sink_ACancel_earlyValid_T_3 = state_0 & auto_out_0_d_valid | state_1 & auto_out_1_d_valid;
  wire  sink_ACancel_5_earlyValid = idle ? _T_10 : _sink_ACancel_earlyValid_T_3;
  wire  _beatsLeft_T_2 = auto_in_d_ready & sink_ACancel_5_earlyValid;
  wire  allowed_0 = idle ? readys_0 : state_0;
  wire  allowed_1 = idle ? readys_1 : state_1;
  wire [31:0] _T_27 = muxStateEarly_0 ? auto_out_0_d_bits_data : 32'h0;
  wire [31:0] _T_28 = muxStateEarly_1 ? auto_out_1_d_bits_data : 32'h0;
  wire [1:0] _T_39 = muxStateEarly_0 ? auto_out_0_d_bits_size : 2'h0;
  wire [1:0] _T_40 = muxStateEarly_1 ? 2'h2 : 2'h0;
  wire [2:0] _T_45 = muxStateEarly_0 ? auto_out_0_d_bits_opcode : 3'h0;
  wire [2:0] _T_46 = muxStateEarly_1 ? auto_out_1_d_bits_opcode : 3'h0;
  
  assign auto_in_a_ready = requestAIO_0_0 & auto_out_0_a_ready | requestAIO_0_1 & auto_out_1_a_ready;
  assign auto_in_d_valid = idle ? _T_10 : _sink_ACancel_earlyValid_T_3;
  assign auto_in_d_bits_denied = muxStateEarly_0 & auto_out_0_d_bits_denied;
  assign auto_in_d_bits_data = _T_27 | _T_28;
  assign auto_in_d_bits_corrupt = muxStateEarly_0 & auto_out_0_d_bits_corrupt;
  assign auto_out_1_a_valid = auto_in_a_valid & requestAIO_0_1;
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address[6:0];
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_d_ready = auto_in_d_ready & allowed_1;
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0;
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_address = auto_in_a_bits_address;
  assign auto_out_0_a_bits_data = auto_in_a_bits_data;
  assign auto_out_0_d_ready = auto_in_d_ready & allowed_0;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = requestAIO_0_0 & auto_out_0_a_ready | requestAIO_0_1 & auto_out_1_a_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = idle ? _T_10 : _sink_ACancel_earlyValid_T_3;
  assign monitor_io_in_d_bits_opcode = _T_45 | _T_46;
  assign monitor_io_in_d_bits_param = muxStateEarly_0 ? auto_out_0_d_bits_param : 2'h0;
  assign monitor_io_in_d_bits_size = _T_39 | _T_40;
  assign monitor_io_in_d_bits_sink = muxStateEarly_0 & auto_out_0_d_bits_sink;
  assign monitor_io_in_d_bits_denied = muxStateEarly_0 & auto_out_0_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = muxStateEarly_0 & auto_out_0_d_bits_corrupt;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 1'h0;
    end else if (latch) begin
      beatsLeft <= 1'h0;
    end else begin
      beatsLeft <= beatsLeft - _beatsLeft_T_2;
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
        if (~(~(auto_out_0_d_valid | auto_out_1_d_valid) | _prefixOR_T) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(~(auto_out_0_d_valid | auto_out_1_d_valid) | _prefixOR_T)) begin
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
        if (~(_T_11 | _T_10) & _readys_T_3) begin
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
        if (_readys_T_3 & ~(_T_11 | _T_10)) begin
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
  beatsLeft = _RAND_0[0:0];
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