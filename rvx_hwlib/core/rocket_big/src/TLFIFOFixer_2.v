`default_nettype wire
module TLFIFOFixer_2(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [3:0]  auto_in_a_bits_size,
  input  [3:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input         auto_in_a_bits_user_amba_prot_bufferable,
  input         auto_in_a_bits_user_amba_prot_modifiable,
  input         auto_in_a_bits_user_amba_prot_readalloc,
  input         auto_in_a_bits_user_amba_prot_writealloc,
  input         auto_in_a_bits_user_amba_prot_privileged,
  input         auto_in_a_bits_user_amba_prot_secure,
  input         auto_in_a_bits_user_amba_prot_fetch,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [3:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [3:0]  auto_out_a_bits_size,
  output [3:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output        auto_out_a_bits_user_amba_prot_bufferable,
  output        auto_out_a_bits_user_amba_prot_modifiable,
  output        auto_out_a_bits_user_amba_prot_readalloc,
  output        auto_out_a_bits_user_amba_prot_writealloc,
  output        auto_out_a_bits_user_amba_prot_privileged,
  output        auto_out_a_bits_user_amba_prot_secure,
  output        auto_out_a_bits_user_amba_prot_fetch,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [3:0]  auto_out_d_bits_source,
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
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [3:0] monitor_io_in_a_bits_size;
  wire [3:0] monitor_io_in_a_bits_source;
  wire [31:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [3:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire [32:0] _a_notFIFO_T_1 = {1'b0,$signed(auto_in_a_bits_address)};
  wire [32:0] _a_id_T_3 = $signed(_a_notFIFO_T_1) & 33'shf0000000;
  wire  _a_id_T_4 = $signed(_a_id_T_3) == 33'sh0;
  wire [31:0] _a_id_T_5 = auto_in_a_bits_address ^ 32'hc0000000;
  wire [32:0] _a_id_T_6 = {1'b0,$signed(_a_id_T_5)};
  wire [32:0] _a_id_T_8 = $signed(_a_id_T_6) & 33'shc0000000;
  wire  _a_id_T_9 = $signed(_a_id_T_8) == 33'sh0;
  wire  _a_id_T_10 = _a_id_T_4 | _a_id_T_9;
  wire [31:0] _a_id_T_11 = auto_in_a_bits_address ^ 32'h10000000;
  wire [32:0] _a_id_T_12 = {1'b0,$signed(_a_id_T_11)};
  wire [32:0] _a_id_T_14 = $signed(_a_id_T_12) & 33'shf0000000;
  wire  _a_id_T_15 = $signed(_a_id_T_14) == 33'sh0;
  wire [31:0] _a_id_T_16 = auto_in_a_bits_address ^ 32'h20000000;
  wire [32:0] _a_id_T_17 = {1'b0,$signed(_a_id_T_16)};
  wire [32:0] _a_id_T_19 = $signed(_a_id_T_17) & 33'she0000000;
  wire  _a_id_T_20 = $signed(_a_id_T_19) == 33'sh0;
  wire [31:0] _a_id_T_21 = auto_in_a_bits_address ^ 32'h40000000;
  wire [32:0] _a_id_T_22 = {1'b0,$signed(_a_id_T_21)};
  wire [32:0] _a_id_T_24 = $signed(_a_id_T_22) & 33'shc0000000;
  wire  _a_id_T_25 = $signed(_a_id_T_24) == 33'sh0;
  wire [31:0] _a_id_T_26 = auto_in_a_bits_address ^ 32'h80000000;
  wire [32:0] _a_id_T_27 = {1'b0,$signed(_a_id_T_26)};
  wire [32:0] _a_id_T_29 = $signed(_a_id_T_27) & 33'shc0000000;
  wire  _a_id_T_30 = $signed(_a_id_T_29) == 33'sh0;
  wire  _a_id_T_33 = _a_id_T_15 | _a_id_T_20 | _a_id_T_25 | _a_id_T_30;
  wire [1:0] _a_id_T_35 = _a_id_T_33 ? 2'h2 : 2'h0;
  wire [1:0] _GEN_70 = {{1'd0}, _a_id_T_10};
  wire [1:0] a_id = _GEN_70 | _a_id_T_35;
  wire  a_noDomain = a_id == 2'h0;
  wire  stalls_a_sel = ~auto_in_a_bits_source[3];
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
  reg [1:0] stalls_id;
  wire  stalls_0 = stalls_a_sel & a_first & (flight_0 | flight_1 | flight_2 | flight_3 | flight_4 | flight_5 | flight_6
     | flight_7) & (a_noDomain | stalls_id != a_id);
  reg  flight_8;
  reg  flight_9;
  reg  flight_10;
  reg  flight_11;
  reg  flight_12;
  reg  flight_13;
  reg  flight_14;
  reg  flight_15;
  reg [1:0] stalls_id_1;
  wire  stalls_1 = auto_in_a_bits_source[3] & a_first & (flight_8 | flight_9 | flight_10 | flight_11 | flight_12 |
    flight_13 | flight_14 | flight_15) & (a_noDomain | stalls_id_1 != a_id);
  wire  stall = stalls_0 | stalls_1;
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
  wire  _GEN_18 = a_first & _a_first_T ? 4'h0 == auto_in_a_bits_source | flight_0 : flight_0;
  wire  _GEN_19 = a_first & _a_first_T ? 4'h1 == auto_in_a_bits_source | flight_1 : flight_1;
  wire  _GEN_20 = a_first & _a_first_T ? 4'h2 == auto_in_a_bits_source | flight_2 : flight_2;
  wire  _GEN_21 = a_first & _a_first_T ? 4'h3 == auto_in_a_bits_source | flight_3 : flight_3;
  wire  _GEN_22 = a_first & _a_first_T ? 4'h4 == auto_in_a_bits_source | flight_4 : flight_4;
  wire  _GEN_23 = a_first & _a_first_T ? 4'h5 == auto_in_a_bits_source | flight_5 : flight_5;
  wire  _GEN_24 = a_first & _a_first_T ? 4'h6 == auto_in_a_bits_source | flight_6 : flight_6;
  wire  _GEN_25 = a_first & _a_first_T ? 4'h7 == auto_in_a_bits_source | flight_7 : flight_7;
  wire  _GEN_26 = a_first & _a_first_T ? 4'h8 == auto_in_a_bits_source | flight_8 : flight_8;
  wire  _GEN_27 = a_first & _a_first_T ? 4'h9 == auto_in_a_bits_source | flight_9 : flight_9;
  wire  _GEN_28 = a_first & _a_first_T ? 4'ha == auto_in_a_bits_source | flight_10 : flight_10;
  wire  _GEN_29 = a_first & _a_first_T ? 4'hb == auto_in_a_bits_source | flight_11 : flight_11;
  wire  _GEN_30 = a_first & _a_first_T ? 4'hc == auto_in_a_bits_source | flight_12 : flight_12;
  wire  _GEN_31 = a_first & _a_first_T ? 4'hd == auto_in_a_bits_source | flight_13 : flight_13;
  wire  _GEN_32 = a_first & _a_first_T ? 4'he == auto_in_a_bits_source | flight_14 : flight_14;
  wire  _GEN_33 = a_first & _a_first_T ? 4'hf == auto_in_a_bits_source | flight_15 : flight_15;
  wire  _stalls_id_T_1 = _a_first_T & stalls_a_sel;
  wire  _stalls_id_T_5 = _a_first_T & auto_in_a_bits_source[3];
  
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
  assign auto_out_a_bits_size = auto_in_a_bits_size;
  assign auto_out_a_bits_source = auto_in_a_bits_source;
  assign auto_out_a_bits_address = auto_in_a_bits_address;
  assign auto_out_a_bits_user_amba_prot_bufferable = auto_in_a_bits_user_amba_prot_bufferable;
  assign auto_out_a_bits_user_amba_prot_modifiable = auto_in_a_bits_user_amba_prot_modifiable;
  assign auto_out_a_bits_user_amba_prot_readalloc = auto_in_a_bits_user_amba_prot_readalloc;
  assign auto_out_a_bits_user_amba_prot_writealloc = auto_in_a_bits_user_amba_prot_writealloc;
  assign auto_out_a_bits_user_amba_prot_privileged = auto_in_a_bits_user_amba_prot_privileged;
  assign auto_out_a_bits_user_amba_prot_secure = auto_in_a_bits_user_amba_prot_secure;
  assign auto_out_a_bits_user_amba_prot_fetch = auto_in_a_bits_user_amba_prot_fetch;
  assign auto_out_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_a_bits_data = auto_in_a_bits_data;
  assign auto_out_d_ready = auto_in_d_ready;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_a_ready & ~stall;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
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
      if (4'h0 == auto_out_d_bits_source) begin
        flight_0 <= 1'h0;
      end else begin
        flight_0 <= _GEN_18;
      end
    end else begin
      flight_0 <= _GEN_18;
    end
    if (reset) begin
      flight_1 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h1 == auto_out_d_bits_source) begin
        flight_1 <= 1'h0;
      end else begin
        flight_1 <= _GEN_19;
      end
    end else begin
      flight_1 <= _GEN_19;
    end
    if (reset) begin
      flight_2 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h2 == auto_out_d_bits_source) begin
        flight_2 <= 1'h0;
      end else begin
        flight_2 <= _GEN_20;
      end
    end else begin
      flight_2 <= _GEN_20;
    end
    if (reset) begin
      flight_3 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h3 == auto_out_d_bits_source) begin
        flight_3 <= 1'h0;
      end else begin
        flight_3 <= _GEN_21;
      end
    end else begin
      flight_3 <= _GEN_21;
    end
    if (reset) begin
      flight_4 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h4 == auto_out_d_bits_source) begin
        flight_4 <= 1'h0;
      end else begin
        flight_4 <= _GEN_22;
      end
    end else begin
      flight_4 <= _GEN_22;
    end
    if (reset) begin
      flight_5 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h5 == auto_out_d_bits_source) begin
        flight_5 <= 1'h0;
      end else begin
        flight_5 <= _GEN_23;
      end
    end else begin
      flight_5 <= _GEN_23;
    end
    if (reset) begin
      flight_6 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h6 == auto_out_d_bits_source) begin
        flight_6 <= 1'h0;
      end else begin
        flight_6 <= _GEN_24;
      end
    end else begin
      flight_6 <= _GEN_24;
    end
    if (reset) begin
      flight_7 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h7 == auto_out_d_bits_source) begin
        flight_7 <= 1'h0;
      end else begin
        flight_7 <= _GEN_25;
      end
    end else begin
      flight_7 <= _GEN_25;
    end
    if (_stalls_id_T_1) begin
      stalls_id <= a_id;
    end
    if (reset) begin
      flight_8 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h8 == auto_out_d_bits_source) begin
        flight_8 <= 1'h0;
      end else begin
        flight_8 <= _GEN_26;
      end
    end else begin
      flight_8 <= _GEN_26;
    end
    if (reset) begin
      flight_9 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'h9 == auto_out_d_bits_source) begin
        flight_9 <= 1'h0;
      end else begin
        flight_9 <= _GEN_27;
      end
    end else begin
      flight_9 <= _GEN_27;
    end
    if (reset) begin
      flight_10 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'ha == auto_out_d_bits_source) begin
        flight_10 <= 1'h0;
      end else begin
        flight_10 <= _GEN_28;
      end
    end else begin
      flight_10 <= _GEN_28;
    end
    if (reset) begin
      flight_11 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'hb == auto_out_d_bits_source) begin
        flight_11 <= 1'h0;
      end else begin
        flight_11 <= _GEN_29;
      end
    end else begin
      flight_11 <= _GEN_29;
    end
    if (reset) begin
      flight_12 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'hc == auto_out_d_bits_source) begin
        flight_12 <= 1'h0;
      end else begin
        flight_12 <= _GEN_30;
      end
    end else begin
      flight_12 <= _GEN_30;
    end
    if (reset) begin
      flight_13 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'hd == auto_out_d_bits_source) begin
        flight_13 <= 1'h0;
      end else begin
        flight_13 <= _GEN_31;
      end
    end else begin
      flight_13 <= _GEN_31;
    end
    if (reset) begin
      flight_14 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'he == auto_out_d_bits_source) begin
        flight_14 <= 1'h0;
      end else begin
        flight_14 <= _GEN_32;
      end
    end else begin
      flight_14 <= _GEN_32;
    end
    if (reset) begin
      flight_15 <= 1'h0;
    end else if (d_first & _d_first_T) begin
      if (4'hf == auto_out_d_bits_source) begin
        flight_15 <= 1'h0;
      end else begin
        flight_15 <= _GEN_33;
      end
    end else begin
      flight_15 <= _GEN_33;
    end
    if (_stalls_id_T_5) begin
      stalls_id_1 <= a_id;
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
  stalls_id = _RAND_9[1:0];
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
  stalls_id_1 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  d_first_counter = _RAND_19[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule