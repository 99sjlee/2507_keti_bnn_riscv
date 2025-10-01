`default_nettype wire
module TLError_1(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [127:0] auto_in_a_bits_address,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_size,
  output         auto_in_d_bits_denied,
  output         auto_in_d_bits_corrupt
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
  wire [127:0] monitor_io_in_a_bits_address;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_size;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  reg  idle;
  reg  beatsLeft;
  wire  idle_1 = ~beatsLeft;
  wire  da_valid = auto_in_a_valid & idle;
  wire [1:0] _readys_T = {da_valid,1'h0};
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0};
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0];
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0};
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0];
  wire  readys_1 = _readys_T_7[1];
  reg  state_1;
  wire  allowed_1 = idle_1 ? readys_1 : state_1;
  wire  out_1_ready = auto_in_d_ready & allowed_1;
  reg  counter;
  wire [2:0] _GEN_4 = 3'h2 == auto_in_a_bits_opcode ? 3'h1 : 3'h0;
  wire [2:0] _GEN_5 = 3'h3 == auto_in_a_bits_opcode ? 3'h1 : _GEN_4;
  wire [2:0] _GEN_6 = 3'h4 == auto_in_a_bits_opcode ? 3'h1 : _GEN_5;
  wire [2:0] _GEN_7 = 3'h5 == auto_in_a_bits_opcode ? 3'h2 : _GEN_6;
  wire [2:0] _GEN_8 = 3'h6 == auto_in_a_bits_opcode ? 3'h4 : _GEN_7;
  wire [2:0] da_bits_opcode = 3'h7 == auto_in_a_bits_opcode ? 3'h4 : _GEN_8;
  wire  beats1_opdata = da_bits_opcode[0];
  wire  done = out_1_ready & da_valid;
  wire  counter1 = counter - 1'h1;
  wire  da_first = ~counter;
  wire  _T_3 = ~reset;
  wire  _GEN_12 = done & da_bits_opcode == 3'h4 ? 1'h0 : idle;
  wire  latch = idle_1 & auto_in_d_ready;
  wire  earlyWinner_1 = readys_1 & da_valid;
  wire  _T_22 = ~da_valid;
  wire  muxStateEarly_1 = idle_1 ? earlyWinner_1 : state_1;
  wire  _sink_ACancel_earlyValid_T_2 = state_1 & da_valid;
  wire  sink_ACancel_earlyValid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2;
  wire  _beatsLeft_T_2 = auto_in_d_ready & sink_ACancel_earlyValid;
  
  assign auto_in_a_ready = out_1_ready & idle;
  assign auto_in_d_valid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2;
  assign auto_in_d_bits_opcode = muxStateEarly_1 ? da_bits_opcode : 3'h0;
  assign auto_in_d_bits_size = muxStateEarly_1 ? 2'h2 : 2'h0;
  assign auto_in_d_bits_denied = idle_1 ? earlyWinner_1 : state_1;
  assign auto_in_d_bits_corrupt = muxStateEarly_1 & beats1_opdata;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = out_1_ready & idle;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2;
  assign monitor_io_in_d_bits_opcode = muxStateEarly_1 ? da_bits_opcode : 3'h0;
  assign monitor_io_in_d_bits_size = muxStateEarly_1 ? 2'h2 : 2'h0;
  assign monitor_io_in_d_bits_denied = idle_1 ? earlyWinner_1 : state_1;
  assign monitor_io_in_d_bits_corrupt = muxStateEarly_1 & beats1_opdata;
  always @(posedge clock) begin
    idle <= reset | _GEN_12;
    if (reset) begin
      beatsLeft <= 1'h0;
    end else if (latch) begin
      beatsLeft <= 1'h0;
    end else begin
      beatsLeft <= beatsLeft - _beatsLeft_T_2;
    end
    if (reset) begin
      state_1 <= 1'h0;
    end else if (idle_1) begin
      state_1 <= earlyWinner_1;
    end
    if (reset) begin
      counter <= 1'h0;
    end else if (done) begin
      if (da_first) begin
        counter <= 1'h0;
      end else begin
        counter <= counter1;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(idle | da_first) & ~reset) begin
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
        if (~reset & ~(idle | da_first)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Error.scala:29 assert (idle || da_first) // we only send Grant, never GrantData => simplified flow control below\n"
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
        if (~(~da_valid | earlyWinner_1) & _T_3) begin
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
        if (_T_3 & ~(~da_valid | earlyWinner_1)) begin
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
        if (~(_T_22 | da_valid) & _T_3) begin
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
        if (_T_3 & ~(_T_22 | da_valid)) begin
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
  idle = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  beatsLeft = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  counter = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule