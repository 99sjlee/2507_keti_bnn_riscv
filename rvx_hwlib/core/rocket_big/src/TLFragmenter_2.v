`default_nettype wire
module TLFragmenter_2(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [11:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [2:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output [31:0] auto_in_d_bits_data,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [1:0]  auto_out_a_bits_size,
  output [9:0]  auto_out_a_bits_source,
  output [11:0] auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_size,
  input  [9:0]  auto_out_d_bits_source,
  input  [31:0] auto_out_d_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [2:0] monitor_io_in_a_bits_size;
  wire [4:0] monitor_io_in_a_bits_source;
  wire [11:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [2:0] monitor_io_in_d_bits_size;
  wire [4:0] monitor_io_in_d_bits_source;
  wire  repeater_clock;
  wire  repeater_reset;
  wire  repeater_io_repeat;
  wire  repeater_io_full;
  wire  repeater_io_enq_ready;
  wire  repeater_io_enq_valid;
  wire [2:0] repeater_io_enq_bits_opcode;
  wire [2:0] repeater_io_enq_bits_param;
  wire [2:0] repeater_io_enq_bits_size;
  wire [4:0] repeater_io_enq_bits_source;
  wire [11:0] repeater_io_enq_bits_address;
  wire [3:0] repeater_io_enq_bits_mask;
  wire  repeater_io_enq_bits_corrupt;
  wire  repeater_io_deq_ready;
  wire  repeater_io_deq_valid;
  wire [2:0] repeater_io_deq_bits_opcode;
  wire [2:0] repeater_io_deq_bits_param;
  wire [2:0] repeater_io_deq_bits_size;
  wire [4:0] repeater_io_deq_bits_source;
  wire [11:0] repeater_io_deq_bits_address;
  wire [3:0] repeater_io_deq_bits_mask;
  wire  repeater_io_deq_bits_corrupt;
  reg [3:0] acknum;
  reg [2:0] dOrig;
  reg  dToggle;
  wire [3:0] dFragnum = auto_out_d_bits_source[3:0];
  wire  dFirst = acknum == 4'h0;
  wire  dLast = dFragnum == 4'h0;
  wire [3:0] _dsizeOH_T = 4'h1 << auto_out_d_bits_size;
  wire [2:0] dsizeOH = _dsizeOH_T[2:0];
  wire [4:0] _dsizeOH1_T_1 = 5'h3 << auto_out_d_bits_size;
  wire [1:0] dsizeOH1 = ~_dsizeOH1_T_1[1:0];
  wire  dHasData = auto_out_d_bits_opcode[0];
  wire  _T_5 = ~reset;
  wire  ack_decrement = dHasData | dsizeOH[2];
  wire [5:0] _dFirst_size_T = {dFragnum, 2'h0};
  wire [5:0] _GEN_7 = {{4'd0}, dsizeOH1};
  wire [5:0] _dFirst_size_T_1 = _dFirst_size_T | _GEN_7;
  wire [6:0] _dFirst_size_T_2 = {_dFirst_size_T_1, 1'h0};
  wire [6:0] _dFirst_size_T_3 = _dFirst_size_T_2 | 7'h1;
  wire [6:0] _dFirst_size_T_4 = {1'h0,_dFirst_size_T_1};
  wire [6:0] _dFirst_size_T_5 = ~_dFirst_size_T_4;
  wire [6:0] _dFirst_size_T_6 = _dFirst_size_T_3 & _dFirst_size_T_5;
  wire [2:0] dFirst_size_hi = _dFirst_size_T_6[6:4];
  wire [3:0] dFirst_size_lo = _dFirst_size_T_6[3:0];
  wire  _dFirst_size_T_7 = |dFirst_size_hi;
  wire [3:0] _GEN_8 = {{1'd0}, dFirst_size_hi};
  wire [3:0] _dFirst_size_T_8 = _GEN_8 | dFirst_size_lo;
  wire [1:0] dFirst_size_hi_1 = _dFirst_size_T_8[3:2];
  wire [1:0] dFirst_size_lo_1 = _dFirst_size_T_8[1:0];
  wire  _dFirst_size_T_9 = |dFirst_size_hi_1;
  wire [1:0] _dFirst_size_T_10 = dFirst_size_hi_1 | dFirst_size_lo_1;
  wire [2:0] dFirst_size = {_dFirst_size_T_7,_dFirst_size_T_9,_dFirst_size_T_10[1]};
  wire  drop = ~dHasData & ~dLast;
  wire  bundleOut_0_d_ready = auto_in_d_ready | drop;
  wire  _T_7 = bundleOut_0_d_ready & auto_out_d_valid;
  wire [3:0] _GEN_9 = {{3'd0}, ack_decrement};
  wire [3:0] _acknum_T_1 = acknum - _GEN_9;
  wire [2:0] aFrag = repeater_io_deq_bits_size > 3'h2 ? 3'h2 : repeater_io_deq_bits_size;
  wire [12:0] _aOrigOH1_T_1 = 13'h3f << repeater_io_deq_bits_size;
  wire [5:0] aOrigOH1 = ~_aOrigOH1_T_1[5:0];
  wire [8:0] _aFragOH1_T_1 = 9'h3 << aFrag;
  wire [1:0] aFragOH1 = ~_aFragOH1_T_1[1:0];
  wire  aHasData = ~repeater_io_deq_bits_opcode[2];
  reg [3:0] gennum;
  wire  aFirst = gennum == 4'h0;
  wire [3:0] _old_gennum1_T_2 = gennum - 4'h1;
  wire [3:0] old_gennum1 = aFirst ? aOrigOH1[5:2] : _old_gennum1_T_2;
  wire [3:0] _new_gennum_T = ~old_gennum1;
  wire [3:0] new_gennum = ~_new_gennum_T;
  reg  aToggle_r;
  wire  _GEN_5 = aFirst ? dToggle : aToggle_r;
  wire  aToggle = ~_GEN_5;
  wire  bundleOut_0_a_valid = repeater_io_deq_valid;
  wire  _T_8 = auto_out_a_ready & bundleOut_0_a_valid;
  wire  _repeater_io_repeat_T = ~aHasData;
  wire [5:0] _bundleOut_0_a_bits_address_T = {old_gennum1, 2'h0};
  wire [5:0] _bundleOut_0_a_bits_address_T_1 = ~aOrigOH1;
  wire [5:0] _bundleOut_0_a_bits_address_T_2 = _bundleOut_0_a_bits_address_T | _bundleOut_0_a_bits_address_T_1;
  wire [5:0] _GEN_10 = {{4'd0}, aFragOH1};
  wire [5:0] _bundleOut_0_a_bits_address_T_3 = _bundleOut_0_a_bits_address_T_2 | _GEN_10;
  wire [5:0] _bundleOut_0_a_bits_address_T_4 = _bundleOut_0_a_bits_address_T_3 | 6'h3;
  wire [5:0] _bundleOut_0_a_bits_address_T_5 = ~_bundleOut_0_a_bits_address_T_4;
  wire [11:0] _GEN_11 = {{6'd0}, _bundleOut_0_a_bits_address_T_5};
  wire [5:0] bundleOut_0_a_bits_source_hi = {repeater_io_deq_bits_source,aToggle};
  wire  _T_9 = ~repeater_io_full;
  
  Repeater_3 repeater (
    .clock(repeater_clock),
    .reset(repeater_reset),
    .io_repeat(repeater_io_repeat),
    .io_full(repeater_io_full),
    .io_enq_ready(repeater_io_enq_ready),
    .io_enq_valid(repeater_io_enq_valid),
    .io_enq_bits_opcode(repeater_io_enq_bits_opcode),
    .io_enq_bits_param(repeater_io_enq_bits_param),
    .io_enq_bits_size(repeater_io_enq_bits_size),
    .io_enq_bits_source(repeater_io_enq_bits_source),
    .io_enq_bits_address(repeater_io_enq_bits_address),
    .io_enq_bits_mask(repeater_io_enq_bits_mask),
    .io_enq_bits_corrupt(repeater_io_enq_bits_corrupt),
    .io_deq_ready(repeater_io_deq_ready),
    .io_deq_valid(repeater_io_deq_valid),
    .io_deq_bits_opcode(repeater_io_deq_bits_opcode),
    .io_deq_bits_param(repeater_io_deq_bits_param),
    .io_deq_bits_size(repeater_io_deq_bits_size),
    .io_deq_bits_source(repeater_io_deq_bits_source),
    .io_deq_bits_address(repeater_io_deq_bits_address),
    .io_deq_bits_mask(repeater_io_deq_bits_mask),
    .io_deq_bits_corrupt(repeater_io_deq_bits_corrupt)
  );
  assign auto_in_a_ready = repeater_io_enq_ready;
  assign auto_in_d_valid = auto_out_d_valid & ~drop;
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_size = dFirst ? dFirst_size : dOrig;
  assign auto_in_d_bits_source = auto_out_d_bits_source[9:5];
  assign auto_in_d_bits_data = auto_out_d_bits_data;
  assign auto_out_a_valid = repeater_io_deq_valid;
  assign auto_out_a_bits_opcode = repeater_io_deq_bits_opcode;
  assign auto_out_a_bits_param = repeater_io_deq_bits_param;
  assign auto_out_a_bits_size = aFrag[1:0];
  assign auto_out_a_bits_source = {bundleOut_0_a_bits_source_hi,new_gennum};
  assign auto_out_a_bits_address = repeater_io_deq_bits_address | _GEN_11;
  assign auto_out_a_bits_mask = repeater_io_full ? 4'hf : auto_in_a_bits_mask;
  assign auto_out_a_bits_data = auto_in_a_bits_data;
  assign auto_out_a_bits_corrupt = repeater_io_deq_bits_corrupt;
  assign auto_out_d_ready = auto_in_d_ready | drop;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = repeater_io_enq_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = auto_out_d_valid & ~drop;
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign monitor_io_in_d_bits_size = dFirst ? dFirst_size : dOrig;
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source[9:5];
  assign repeater_clock = clock;
  assign repeater_reset = reset;
  assign repeater_io_repeat = ~aHasData & new_gennum != 4'h0;
  assign repeater_io_enq_valid = auto_in_a_valid;
  assign repeater_io_enq_bits_opcode = auto_in_a_bits_opcode;
  assign repeater_io_enq_bits_param = auto_in_a_bits_param;
  assign repeater_io_enq_bits_size = auto_in_a_bits_size;
  assign repeater_io_enq_bits_source = auto_in_a_bits_source;
  assign repeater_io_enq_bits_address = auto_in_a_bits_address;
  assign repeater_io_enq_bits_mask = auto_in_a_bits_mask;
  assign repeater_io_enq_bits_corrupt = auto_in_a_bits_corrupt;
  assign repeater_io_deq_ready = auto_out_a_ready;
  always @(posedge clock) begin
    if (reset) begin
      acknum <= 4'h0;
    end else if (_T_7) begin
      if (dFirst) begin
        acknum <= dFragnum;
      end else begin
        acknum <= _acknum_T_1;
      end
    end
    if (_T_7) begin
      if (dFirst) begin
        dOrig <= dFirst_size;
      end
    end
    if (reset) begin
      dToggle <= 1'h0;
    end else if (_T_7) begin
      if (dFirst) begin
        dToggle <= auto_out_d_bits_source[4];
      end
    end
    if (reset) begin
      gennum <= 4'h0;
    end else if (_T_8) begin
      gennum <= new_gennum;
    end
    if (aFirst) begin
      aToggle_r <= dToggle;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~repeater_io_full | _repeater_io_repeat_T) & _T_5) begin
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
        if (_T_5 & ~(~repeater_io_full | _repeater_io_repeat_T)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:309 assert (!repeater.io.full || !aHasData)\n"
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
        if (~(_T_9 | repeater_io_deq_bits_mask == 4'hf) & _T_5) begin
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
        if (_T_5 & ~(_T_9 | repeater_io_deq_bits_mask == 4'hf)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Fragmenter.scala:312 assert (!repeater.io.full || in_a.bits.mask === fullMask)\n"
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
  acknum = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  dOrig = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  dToggle = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  gennum = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  aToggle_r = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule