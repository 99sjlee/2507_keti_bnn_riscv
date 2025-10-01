`default_nettype wire
module TLFIFOFixer_3(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [4:0]  auto_out_a_bits_source,
  output [27:0] auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [4:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [31:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [3:0] monitor_io_in_a_bits_size;
  wire [4:0] monitor_io_in_a_bits_source;
  wire [27:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [4:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire [28:0] _a_notFIFO_T_1 = {1'b0,$signed(auto_in_a_bits_address)};
  wire [27:0] _a_id_T = auto_in_a_bits_address ^ 28'h2000;
  wire [28:0] _a_id_T_1 = {1'b0,$signed(_a_id_T)};
  wire [28:0] _a_id_T_3 = $signed(_a_id_T_1) & 29'sha012000;
  wire  _a_id_T_4 = $signed(_a_id_T_3) == 29'sh0;
  wire [27:0] _a_id_T_5 = auto_in_a_bits_address ^ 28'h8000000;
  wire [28:0] _a_id_T_6 = {1'b0,$signed(_a_id_T_5)};
  wire [28:0] _a_id_T_8 = $signed(_a_id_T_6) & 29'sh8000000;
  wire  _a_id_T_9 = $signed(_a_id_T_8) == 29'sh0;
  wire [27:0] _a_id_T_10 = auto_in_a_bits_address ^ 28'h2000000;
  wire [28:0] _a_id_T_11 = {1'b0,$signed(_a_id_T_10)};
  wire [28:0] _a_id_T_13 = $signed(_a_id_T_11) & 29'sha010000;
  wire  _a_id_T_14 = $signed(_a_id_T_13) == 29'sh0;
  wire [28:0] _a_id_T_18 = $signed(_a_notFIFO_T_1) & 29'sha012000;
  wire  _a_id_T_19 = $signed(_a_id_T_18) == 29'sh0;
  wire [27:0] _a_id_T_20 = auto_in_a_bits_address ^ 28'h10000;
  wire [28:0] _a_id_T_21 = {1'b0,$signed(_a_id_T_20)};
  wire [28:0] _a_id_T_23 = $signed(_a_id_T_21) & 29'sha010000;
  wire  _a_id_T_24 = $signed(_a_id_T_23) == 29'sh0;
  wire [1:0] _a_id_T_26 = _a_id_T_9 ? 2'h2 : 2'h0;
  wire [1:0] _a_id_T_27 = _a_id_T_14 ? 2'h3 : 2'h0;
  wire [2:0] _a_id_T_28 = _a_id_T_19 ? 3'h4 : 3'h0;
  wire [2:0] _a_id_T_29 = _a_id_T_24 ? 3'h5 : 3'h0;
  wire [1:0] _GEN_95 = {{1'd0}, _a_id_T_4};
  wire [1:0] _a_id_T_30 = _GEN_95 | _a_id_T_26;
  wire [1:0] _a_id_T_31 = _a_id_T_30 | _a_id_T_27;
  wire [2:0] _GEN_96 = {{1'd0}, _a_id_T_31};
  wire [2:0] _a_id_T_32 = _GEN_96 | _a_id_T_28;
  wire [2:0] a_id = _a_id_T_32 | _a_id_T_29;
  wire  a_noDomain = a_id == 3'h0;
  wire  stalls_a_sel = auto_in_a_bits_source[4:3] == 2'h0;
  reg [9:0] a_first_counter;
  wire  a_first = a_first_counter == 10'h0;
  reg  flight_0;
  reg  flight_1;
  reg  flight_2;
  reg  flight_3;
  reg  flight_4;
  reg  flight_5;
  reg  flight_6;
  reg  flight_7;
  reg [2:0] stalls_id;
  wire  stalls_0 = stalls_a_sel & a_first & (flight_0 | flight_1 | flight_2 | flight_3 | flight_4 | flight_5 | flight_6
     | flight_7) & (a_noDomain | stalls_id != a_id);
  wire  stalls_a_sel_1 = auto_in_a_bits_source[4:3] == 2'h1;
  reg  flight_8;
  reg  flight_9;
  reg  flight_10;
  reg  flight_11;
  reg  flight_12;
  reg  flight_13;
  reg  flight_14;
  reg  flight_15;
  reg [2:0] stalls_id_1;
  wire  stalls_1 = stalls_a_sel_1 & a_first & (flight_8 | flight_9 | flight_10 | flight_11 | flight_12 | flight_13 |
    flight_14 | flight_15) & (a_noDomain | stalls_id_1 != a_id);
  wire  stalls_a_sel_2 = auto_in_a_bits_source[4:1] == 4'h9;
  reg  flight_18;
  reg  flight_19;
  reg [2:0] stalls_id_2;
  wire  stalls_2 = stalls_a_sel_2 & a_first & (flight_18 | flight_19) & (a_noDomain | stalls_id_2 != a_id);
  wire  stall = stalls_0 | stalls_1 | stalls_2;
  wire  _bundleIn_0_a_ready_T = ~stall;
  wire  bundleIn_0_a_ready = auto_out_a_ready & ~stall;
  wire  _a_first_T = bundleIn_0_a_ready & auto_in_a_valid;
  wire [26:0] _a_first_beats1_decode_T_1 = 27'hfff << auto_in_a_bits_size;
  wire [11:0] _a_first_beats1_decode_T_3 = ~_a_first_beats1_decode_T_1[11:0];
  wire [9:0] a_first_beats1_decode = _a_first_beats1_decode_T_3[11:2];
  wire  a_first_beats1_opdata = ~auto_in_a_bits_opcode[2];
  wire [9:0] a_first_counter1 = a_first_counter - 10'h1;
  wire  _d_first_T = auto_in_d_ready & auto_out_d_valid;
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hfff << auto_out_d_bits_size;
  wire [11:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[11:0];
  wire [9:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[11:2];
  wire  d_first_beats1_opdata = auto_out_d_bits_opcode[0];
  reg [9:0] d_first_counter;
  wire [9:0] d_first_counter1 = d_first_counter - 10'h1;
  wire  d_first_first = d_first_counter == 10'h0;
  wire  d_first = d_first_first & auto_out_d_bits_opcode != 3'h6;
  wire  _GEN_24 = a_first & _a_first_T ? 5'h0 == auto_in_a_bits_source | flight_0 : flight_0;
  wire  _GEN_25 = a_first & _a_first_T ? 5'h1 == auto_in_a_bits_source | flight_1 : flight_1;
  wire  _GEN_26 = a_first & _a_first_T ? 5'h2 == auto_in_a_bits_source | flight_2 : flight_2;
  wire  _GEN_27 = a_first & _a_first_T ? 5'h3 == auto_in_a_bits_source | flight_3 : flight_3;
  wire  _GEN_28 = a_first & _a_first_T ? 5'h4 == auto_in_a_bits_source | flight_4 : flight_4;
  wire  _GEN_29 = a_first & _a_first_T ? 5'h5 == auto_in_a_bits_source | flight_5 : flight_5;
  wire  _GEN_30 = a_first & _a_first_T ? 5'h6 == auto_in_a_bits_source | flight_6 : flight_6;
  wire  _GEN_31 = a_first & _a_first_T ? 5'h7 == auto_in_a_bits_source | flight_7 : flight_7;
  wire  _GEN_32 = a_first & _a_first_T ? 5'h8 == auto_in_a_bits_source | flight_8 : flight_8;
  wire  _GEN_33 = a_first & _a_first_T ? 5'h9 == auto_in_a_bits_source | flight_9 : flight_9;
  wire  _GEN_34 = a_first & _a_first_T ? 5'ha == auto_in_a_bits_source | flight_10 : flight_10;
  wire  _GEN_35 = a_first & _a_first_T ? 5'hb == auto_in_a_bits_source | flight_11 : flight_11;
  wire  _GEN_36 = a_first & _a_first_T ? 5'hc == auto_in_a_bits_source | flight_12 : flight_12;
  wire  _GEN_37 = a_first & _a_first_T ? 5'hd == auto_in_a_bits_source | flight_13 : flight_13;
  wire  _GEN_38 = a_first & _a_first_T ? 5'he == auto_in_a_bits_source | flight_14 : flight_14;
  wire  _GEN_39 = a_first & _a_first_T ? 5'hf == auto_in_a_bits_source | flight_15 : flight_15;
  wire  _GEN_42 = a_first & _a_first_T ? 5'h12 == auto_in_a_bits_source | flight_18 : flight_18;
  wire  _GEN_43 = a_first & _a_first_T ? 5'h13 == auto_in_a_bits_source | flight_19 : flight_19;
  wire  _stalls_id_T_1 = _a_first_T & stalls_a_sel;
  wire  _stalls_id_T_5 = _a_first_T & stalls_a_sel_1;
  wire  _stalls_id_T_9 = _a_first_T & stalls_a_sel_2;
  
  assign auto_in_a_ready = auto_out_a_ready & ~stall;
  assign auto_in_d_valid = auto_out_d_valid;
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_param = auto_out_d_bits_param;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_source = auto_out_d_bits_source;
  assign auto_in_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_d_bits_denied = auto_out_d_bits_denied;
  assign auto_in_d_bits_data = auto_out_d_bits_data;
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt;
  assign auto_out_a_valid = auto_in_a_valid & _bundleIn_0_a_ready_T;
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_a_bits_param = auto_in_a_bits_param;
  assign auto_out_a_bits_size = auto_in_a_bits_size;
  assign auto_out_a_bits_source = auto_in_a_bits_source;
  assign auto_out_a_bits_address = auto_in_a_bits_address;
  assign auto_out_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_a_bits_data = auto_in_a_bits_data;
  assign auto_out_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_d_ready = auto_in_d_ready;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_a_ready & ~stall;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = auto_out_d_valid;
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param;
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size;
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source;
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink;
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt;
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 10'h0;
    end else if (_a_first_T) begin
      if (a_first) begin
        if (a_first_beats1_opdata) begin
          a_first_counter <= a_first_beats1_decode;
        end else begin
          a_first_counter <= 10'h0;
        end
      end else begin
        a_first_counter <= a_first_counter1;
      end
    end
    if (reset) begin
      flight_0 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h0 == auto_out_d_bits_source) begin
        flight_0 <= 1'h0;
      end else begin
        flight_0 <= _GEN_24;
      end
    end else begin
      flight_0 <= _GEN_24;
    end
    if (reset) begin
      flight_1 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h1 == auto_out_d_bits_source) begin
        flight_1 <= 1'h0;
      end else begin
        flight_1 <= _GEN_25;
      end
    end else begin
      flight_1 <= _GEN_25;
    end
    if (reset) begin
      flight_2 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h2 == auto_out_d_bits_source) begin
        flight_2 <= 1'h0;
      end else begin
        flight_2 <= _GEN_26;
      end
    end else begin
      flight_2 <= _GEN_26;
    end
    if (reset) begin
      flight_3 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h3 == auto_out_d_bits_source) begin
        flight_3 <= 1'h0;
      end else begin
        flight_3 <= _GEN_27;
      end
    end else begin
      flight_3 <= _GEN_27;
    end
    if (reset) begin
      flight_4 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h4 == auto_out_d_bits_source) begin
        flight_4 <= 1'h0;
      end else begin
        flight_4 <= _GEN_28;
      end
    end else begin
      flight_4 <= _GEN_28;
    end
    if (reset) begin
      flight_5 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h5 == auto_out_d_bits_source) begin
        flight_5 <= 1'h0;
      end else begin
        flight_5 <= _GEN_29;
      end
    end else begin
      flight_5 <= _GEN_29;
    end
    if (reset) begin
      flight_6 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h6 == auto_out_d_bits_source) begin
        flight_6 <= 1'h0;
      end else begin
        flight_6 <= _GEN_30;
      end
    end else begin
      flight_6 <= _GEN_30;
    end
    if (reset) begin
      flight_7 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h7 == auto_out_d_bits_source) begin
        flight_7 <= 1'h0;
      end else begin
        flight_7 <= _GEN_31;
      end
    end else begin
      flight_7 <= _GEN_31;
    end
    if (_stalls_id_T_1) begin
      stalls_id <= a_id;
    end
    if (reset) begin
      flight_8 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h8 == auto_out_d_bits_source) begin
        flight_8 <= 1'h0;
      end else begin
        flight_8 <= _GEN_32;
      end
    end else begin
      flight_8 <= _GEN_32;
    end
    if (reset) begin
      flight_9 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h9 == auto_out_d_bits_source) begin
        flight_9 <= 1'h0;
      end else begin
        flight_9 <= _GEN_33;
      end
    end else begin
      flight_9 <= _GEN_33;
    end
    if (reset) begin
      flight_10 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'ha == auto_out_d_bits_source) begin
        flight_10 <= 1'h0;
      end else begin
        flight_10 <= _GEN_34;
      end
    end else begin
      flight_10 <= _GEN_34;
    end
    if (reset) begin
      flight_11 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'hb == auto_out_d_bits_source) begin
        flight_11 <= 1'h0;
      end else begin
        flight_11 <= _GEN_35;
      end
    end else begin
      flight_11 <= _GEN_35;
    end
    if (reset) begin
      flight_12 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'hc == auto_out_d_bits_source) begin
        flight_12 <= 1'h0;
      end else begin
        flight_12 <= _GEN_36;
      end
    end else begin
      flight_12 <= _GEN_36;
    end
    if (reset) begin
      flight_13 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'hd == auto_out_d_bits_source) begin
        flight_13 <= 1'h0;
      end else begin
        flight_13 <= _GEN_37;
      end
    end else begin
      flight_13 <= _GEN_37;
    end
    if (reset) begin
      flight_14 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'he == auto_out_d_bits_source) begin
        flight_14 <= 1'h0;
      end else begin
        flight_14 <= _GEN_38;
      end
    end else begin
      flight_14 <= _GEN_38;
    end
    if (reset) begin
      flight_15 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'hf == auto_out_d_bits_source) begin
        flight_15 <= 1'h0;
      end else begin
        flight_15 <= _GEN_39;
      end
    end else begin
      flight_15 <= _GEN_39;
    end
    if (_stalls_id_T_5) begin
      stalls_id_1 <= a_id;
    end
    if (reset) begin
      flight_18 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h12 == auto_out_d_bits_source) begin
        flight_18 <= 1'h0;
      end else begin
        flight_18 <= _GEN_42;
      end
    end else begin
      flight_18 <= _GEN_42;
    end
    if (reset) begin
      flight_19 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (5'h13 == auto_out_d_bits_source) begin
        flight_19 <= 1'h0;
      end else begin
        flight_19 <= _GEN_43;
      end
    end else begin
      flight_19 <= _GEN_43;
    end
    if (_stalls_id_T_9) begin
      stalls_id_2 <= a_id;
    end
    if (reset) begin
      d_first_counter <= 10'h0;
    end else if (_d_first_T) begin
      if (d_first_first) begin
        if (d_first_beats1_opdata) begin
          d_first_counter <= d_first_beats1_decode;
        end else begin
          d_first_counter <= 10'h0;
        end
      end else begin
        d_first_counter <= d_first_counter1;
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
  a_first_counter = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  flight_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  flight_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  flight_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  flight_3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  flight_4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  flight_5 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  flight_6 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  flight_7 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stalls_id = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  flight_8 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  flight_9 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  flight_10 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  flight_11 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  flight_12 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  flight_13 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  flight_14 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  flight_15 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stalls_id_1 = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  flight_18 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  flight_19 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  stalls_id_2 = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  d_first_counter = _RAND_22[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule