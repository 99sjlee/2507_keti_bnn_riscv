`default_nettype wire
module TLError(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [13:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [3:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [3:0] monitor_io_in_a_bits_size;
  wire [4:0] monitor_io_in_a_bits_source;
  wire [13:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [3:0] monitor_io_in_d_bits_size;
  wire [4:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_corrupt;
  wire  a_clock;
  wire  a_reset;
  wire  a_io_enq_ready;
  wire  a_io_enq_valid;
  wire [2:0] a_io_enq_bits_opcode;
  wire [3:0] a_io_enq_bits_size;
  wire [4:0] a_io_enq_bits_source;
  wire  a_io_deq_ready;
  wire  a_io_deq_valid;
  wire [2:0] a_io_deq_bits_opcode;
  wire [3:0] a_io_deq_bits_size;
  wire [4:0] a_io_deq_bits_source;
  wire  _a_last_T = a_io_deq_ready & a_io_deq_valid;
  wire [26:0] _a_last_beats1_decode_T_1 = 27'hfff << a_io_deq_bits_size;
  wire [11:0] _a_last_beats1_decode_T_3 = ~_a_last_beats1_decode_T_1[11:0];
  wire [9:0] a_last_beats1_decode = _a_last_beats1_decode_T_3[11:2];
  wire  a_last_beats1_opdata = ~a_io_deq_bits_opcode[2];
  wire [9:0] a_last_beats1 = a_last_beats1_opdata ? a_last_beats1_decode : 10'h0;
  reg [9:0] a_last_counter;
  wire [9:0] a_last_counter1 = a_last_counter - 10'h1;
  wire  a_last_first = a_last_counter == 10'h0;
  wire  a_last = a_last_counter == 10'h1 | a_last_beats1 == 10'h0;
  wire  da_valid = a_io_deq_valid & a_last;
  wire  _T = auto_in_d_ready & da_valid;
  wire [3:0] da_bits_size = a_io_deq_bits_size;
  wire [26:0] _beats1_decode_T_1 = 27'hfff << da_bits_size;
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0];
  wire [9:0] beats1_decode = _beats1_decode_T_3[11:2];
  wire [2:0] _GEN_4 = 3'h2 == a_io_deq_bits_opcode ? 3'h1 : 3'h0;
  wire [2:0] _GEN_5 = 3'h3 == a_io_deq_bits_opcode ? 3'h1 : _GEN_4;
  wire [2:0] _GEN_6 = 3'h4 == a_io_deq_bits_opcode ? 3'h1 : _GEN_5;
  wire [2:0] _GEN_7 = 3'h5 == a_io_deq_bits_opcode ? 3'h2 : _GEN_6;
  wire [2:0] _GEN_8 = 3'h6 == a_io_deq_bits_opcode ? 3'h4 : _GEN_7;
  wire [2:0] da_bits_opcode = 3'h7 == a_io_deq_bits_opcode ? 3'h4 : _GEN_8;
  wire  beats1_opdata = da_bits_opcode[0];
  wire [9:0] beats1 = beats1_opdata ? beats1_decode : 10'h0;
  reg [9:0] counter;
  wire [9:0] counter1 = counter - 10'h1;
  wire  da_first = counter == 10'h0;
  wire  da_last = counter == 10'h1 | beats1 == 10'h0;
  
  Queue_29 a (
    .clock(a_clock),
    .reset(a_reset),
    .io_enq_ready(a_io_enq_ready),
    .io_enq_valid(a_io_enq_valid),
    .io_enq_bits_opcode(a_io_enq_bits_opcode),
    .io_enq_bits_size(a_io_enq_bits_size),
    .io_enq_bits_source(a_io_enq_bits_source),
    .io_deq_ready(a_io_deq_ready),
    .io_deq_valid(a_io_deq_valid),
    .io_deq_bits_opcode(a_io_deq_bits_opcode),
    .io_deq_bits_size(a_io_deq_bits_size),
    .io_deq_bits_source(a_io_deq_bits_source)
  );
  assign auto_in_a_ready = a_io_enq_ready;
  assign auto_in_d_valid = a_io_deq_valid & a_last;
  assign auto_in_d_bits_opcode = 3'h7 == a_io_deq_bits_opcode ? 3'h4 : _GEN_8;
  assign auto_in_d_bits_size = a_io_deq_bits_size;
  assign auto_in_d_bits_source = a_io_deq_bits_source;
  assign auto_in_d_bits_corrupt = da_bits_opcode[0];
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = a_io_enq_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = a_io_deq_valid & a_last;
  assign monitor_io_in_d_bits_opcode = 3'h7 == a_io_deq_bits_opcode ? 3'h4 : _GEN_8;
  assign monitor_io_in_d_bits_size = a_io_deq_bits_size;
  assign monitor_io_in_d_bits_source = a_io_deq_bits_source;
  assign monitor_io_in_d_bits_corrupt = da_bits_opcode[0];
  assign a_clock = clock;
  assign a_reset = reset;
  assign a_io_enq_valid = auto_in_a_valid;
  assign a_io_enq_bits_opcode = auto_in_a_bits_opcode;
  assign a_io_enq_bits_size = auto_in_a_bits_size;
  assign a_io_enq_bits_source = auto_in_a_bits_source;
  assign a_io_deq_ready = auto_in_d_ready & da_last | ~a_last;
  always @(posedge clock) begin
    if (reset) begin
      a_last_counter <= 10'h0;
    end else if (_a_last_T) begin
      if (a_last_first) begin
        if (a_last_beats1_opdata) begin
          a_last_counter <= a_last_beats1_decode;
        end else begin
          a_last_counter <= 10'h0;
        end
      end else begin
        a_last_counter <= a_last_counter1;
      end
    end
    if (reset) begin
      counter <= 10'h0;
    end else if (_T) begin
      if (da_first) begin
        if (beats1_opdata) begin
          counter <= beats1_decode;
        end else begin
          counter <= 10'h0;
        end
      end else begin
        counter <= counter1;
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
  a_last_counter = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  counter = _RAND_1[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule