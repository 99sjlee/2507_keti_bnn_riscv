`default_nettype wire
module ShiftQueue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_btb_taken,
  input         io_enq_bits_btb_bridx,
  input  [4:0]  io_enq_bits_btb_entry,
  input  [7:0]  io_enq_bits_btb_bht_history,
  input  [31:0] io_enq_bits_pc,
  input  [31:0] io_enq_bits_data,
  input  [1:0]  io_enq_bits_mask,
  input         io_enq_bits_xcpt_pf_inst,
  input         io_enq_bits_xcpt_ae_inst,
  input         io_enq_bits_replay,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_btb_taken,
  output        io_deq_bits_btb_bridx,
  output [4:0]  io_deq_bits_btb_entry,
  output [7:0]  io_deq_bits_btb_bht_history,
  output [31:0] io_deq_bits_pc,
  output [31:0] io_deq_bits_data,
  output        io_deq_bits_xcpt_pf_inst,
  output        io_deq_bits_xcpt_ae_inst,
  output        io_deq_bits_replay,
  output [4:0]  io_mask
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
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
`endif // RANDOMIZE_REG_INIT
  reg  valid_0;
  reg  valid_1;
  reg  valid_2;
  reg  valid_3;
  reg  valid_4;
  reg  elts_0_btb_taken;
  reg  elts_0_btb_bridx;
  reg [4:0] elts_0_btb_entry;
  reg [7:0] elts_0_btb_bht_history;
  reg [31:0] elts_0_pc;
  reg [31:0] elts_0_data;
  reg  elts_0_xcpt_pf_inst;
  reg  elts_0_xcpt_ae_inst;
  reg  elts_0_replay;
  reg  elts_1_btb_taken;
  reg  elts_1_btb_bridx;
  reg [4:0] elts_1_btb_entry;
  reg [7:0] elts_1_btb_bht_history;
  reg [31:0] elts_1_pc;
  reg [31:0] elts_1_data;
  reg  elts_1_xcpt_pf_inst;
  reg  elts_1_xcpt_ae_inst;
  reg  elts_1_replay;
  reg  elts_2_btb_taken;
  reg  elts_2_btb_bridx;
  reg [4:0] elts_2_btb_entry;
  reg [7:0] elts_2_btb_bht_history;
  reg [31:0] elts_2_pc;
  reg [31:0] elts_2_data;
  reg  elts_2_xcpt_pf_inst;
  reg  elts_2_xcpt_ae_inst;
  reg  elts_2_replay;
  reg  elts_3_btb_taken;
  reg  elts_3_btb_bridx;
  reg [4:0] elts_3_btb_entry;
  reg [7:0] elts_3_btb_bht_history;
  reg [31:0] elts_3_pc;
  reg [31:0] elts_3_data;
  reg  elts_3_xcpt_pf_inst;
  reg  elts_3_xcpt_ae_inst;
  reg  elts_3_replay;
  reg  elts_4_btb_taken;
  reg  elts_4_btb_bridx;
  reg [4:0] elts_4_btb_entry;
  reg [7:0] elts_4_btb_bht_history;
  reg [31:0] elts_4_pc;
  reg [31:0] elts_4_data;
  reg  elts_4_xcpt_pf_inst;
  reg  elts_4_xcpt_ae_inst;
  reg  elts_4_replay;
  wire  _wen_T = io_enq_ready & io_enq_valid;
  wire  _wen_T_2 = _wen_T & valid_0;
  wire  _wen_T_3 = valid_1 | _wen_T & valid_0;
  wire  _wen_T_6 = ~valid_0;
  wire  _wen_T_7 = _wen_T & ~valid_0;
  wire  wen = io_deq_ready ? _wen_T_3 : _wen_T_7;
  wire  _valid_0_T_6 = _wen_T | valid_0;
  wire  _wen_T_10 = _wen_T & valid_1;
  wire  _wen_T_11 = valid_2 | _wen_T & valid_1;
  wire  _wen_T_15 = _wen_T_2 & ~valid_1;
  wire  wen_1 = io_deq_ready ? _wen_T_11 : _wen_T_15;
  wire  _valid_1_T_6 = _wen_T_2 | valid_1;
  wire  _wen_T_18 = _wen_T & valid_2;
  wire  _wen_T_19 = valid_3 | _wen_T & valid_2;
  wire  _wen_T_23 = _wen_T_10 & ~valid_2;
  wire  wen_2 = io_deq_ready ? _wen_T_19 : _wen_T_23;
  wire  _valid_2_T_6 = _wen_T_10 | valid_2;
  wire  _wen_T_26 = _wen_T & valid_3;
  wire  _wen_T_27 = valid_4 | _wen_T & valid_3;
  wire  _wen_T_31 = _wen_T_18 & ~valid_3;
  wire  wen_3 = io_deq_ready ? _wen_T_27 : _wen_T_31;
  wire  _valid_3_T_6 = _wen_T_18 | valid_3;
  wire  _wen_T_34 = _wen_T & valid_4;
  wire  _wen_T_39 = _wen_T_26 & ~valid_4;
  wire  wen_4 = io_deq_ready ? _wen_T_34 : _wen_T_39;
  wire  _valid_4_T_6 = _wen_T_26 | valid_4;
  wire [1:0] io_mask_lo = {valid_1,valid_0};
  wire [2:0] io_mask_hi = {valid_4,valid_3,valid_2};
  assign io_enq_ready = ~valid_4;
  assign io_deq_valid = io_enq_valid | valid_0;
  assign io_deq_bits_btb_taken = _wen_T_6 ? io_enq_bits_btb_taken : elts_0_btb_taken;
  assign io_deq_bits_btb_bridx = _wen_T_6 ? io_enq_bits_btb_bridx : elts_0_btb_bridx;
  assign io_deq_bits_btb_entry = _wen_T_6 ? io_enq_bits_btb_entry : elts_0_btb_entry;
  assign io_deq_bits_btb_bht_history = _wen_T_6 ? io_enq_bits_btb_bht_history : elts_0_btb_bht_history;
  assign io_deq_bits_pc = _wen_T_6 ? io_enq_bits_pc : elts_0_pc;
  assign io_deq_bits_data = _wen_T_6 ? io_enq_bits_data : elts_0_data;
  assign io_deq_bits_xcpt_pf_inst = _wen_T_6 ? io_enq_bits_xcpt_pf_inst : elts_0_xcpt_pf_inst;
  assign io_deq_bits_xcpt_ae_inst = _wen_T_6 ? io_enq_bits_xcpt_ae_inst : elts_0_xcpt_ae_inst;
  assign io_deq_bits_replay = _wen_T_6 ? io_enq_bits_replay : elts_0_replay;
  assign io_mask = {io_mask_hi,io_mask_lo};
  always @(posedge clock) begin
    if (reset) begin
      valid_0 <= 1'h0;
    end else if (io_deq_ready) begin
      valid_0 <= _wen_T_3;
    end else begin
      valid_0 <= _valid_0_T_6;
    end
    if (reset) begin
      valid_1 <= 1'h0;
    end else if (io_deq_ready) begin
      valid_1 <= _wen_T_11;
    end else begin
      valid_1 <= _valid_1_T_6;
    end
    if (reset) begin
      valid_2 <= 1'h0;
    end else if (io_deq_ready) begin
      valid_2 <= _wen_T_19;
    end else begin
      valid_2 <= _valid_2_T_6;
    end
    if (reset) begin
      valid_3 <= 1'h0;
    end else if (io_deq_ready) begin
      valid_3 <= _wen_T_27;
    end else begin
      valid_3 <= _valid_3_T_6;
    end
    if (reset) begin
      valid_4 <= 1'h0;
    end else if (io_deq_ready) begin
      valid_4 <= _wen_T_34;
    end else begin
      valid_4 <= _valid_4_T_6;
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_btb_taken <= elts_1_btb_taken;
      end else begin
        elts_0_btb_taken <= io_enq_bits_btb_taken;
      end
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_btb_bridx <= elts_1_btb_bridx;
      end else begin
        elts_0_btb_bridx <= io_enq_bits_btb_bridx;
      end
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_btb_entry <= elts_1_btb_entry;
      end else begin
        elts_0_btb_entry <= io_enq_bits_btb_entry;
      end
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_btb_bht_history <= elts_1_btb_bht_history;
      end else begin
        elts_0_btb_bht_history <= io_enq_bits_btb_bht_history;
      end
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_pc <= elts_1_pc;
      end else begin
        elts_0_pc <= io_enq_bits_pc;
      end
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_data <= elts_1_data;
      end else begin
        elts_0_data <= io_enq_bits_data;
      end
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_xcpt_pf_inst <= elts_1_xcpt_pf_inst;
      end else begin
        elts_0_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
      end
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_xcpt_ae_inst <= elts_1_xcpt_ae_inst;
      end else begin
        elts_0_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
      end
    end
    if (wen) begin
      if (valid_1) begin
        elts_0_replay <= elts_1_replay;
      end else begin
        elts_0_replay <= io_enq_bits_replay;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_btb_taken <= elts_2_btb_taken;
      end else begin
        elts_1_btb_taken <= io_enq_bits_btb_taken;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_btb_bridx <= elts_2_btb_bridx;
      end else begin
        elts_1_btb_bridx <= io_enq_bits_btb_bridx;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_btb_entry <= elts_2_btb_entry;
      end else begin
        elts_1_btb_entry <= io_enq_bits_btb_entry;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_btb_bht_history <= elts_2_btb_bht_history;
      end else begin
        elts_1_btb_bht_history <= io_enq_bits_btb_bht_history;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_pc <= elts_2_pc;
      end else begin
        elts_1_pc <= io_enq_bits_pc;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_data <= elts_2_data;
      end else begin
        elts_1_data <= io_enq_bits_data;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_xcpt_pf_inst <= elts_2_xcpt_pf_inst;
      end else begin
        elts_1_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_xcpt_ae_inst <= elts_2_xcpt_ae_inst;
      end else begin
        elts_1_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
      end
    end
    if (wen_1) begin
      if (valid_2) begin
        elts_1_replay <= elts_2_replay;
      end else begin
        elts_1_replay <= io_enq_bits_replay;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_btb_taken <= elts_3_btb_taken;
      end else begin
        elts_2_btb_taken <= io_enq_bits_btb_taken;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_btb_bridx <= elts_3_btb_bridx;
      end else begin
        elts_2_btb_bridx <= io_enq_bits_btb_bridx;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_btb_entry <= elts_3_btb_entry;
      end else begin
        elts_2_btb_entry <= io_enq_bits_btb_entry;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_btb_bht_history <= elts_3_btb_bht_history;
      end else begin
        elts_2_btb_bht_history <= io_enq_bits_btb_bht_history;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_pc <= elts_3_pc;
      end else begin
        elts_2_pc <= io_enq_bits_pc;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_data <= elts_3_data;
      end else begin
        elts_2_data <= io_enq_bits_data;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_xcpt_pf_inst <= elts_3_xcpt_pf_inst;
      end else begin
        elts_2_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_xcpt_ae_inst <= elts_3_xcpt_ae_inst;
      end else begin
        elts_2_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
      end
    end
    if (wen_2) begin
      if (valid_3) begin
        elts_2_replay <= elts_3_replay;
      end else begin
        elts_2_replay <= io_enq_bits_replay;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_btb_taken <= elts_4_btb_taken;
      end else begin
        elts_3_btb_taken <= io_enq_bits_btb_taken;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_btb_bridx <= elts_4_btb_bridx;
      end else begin
        elts_3_btb_bridx <= io_enq_bits_btb_bridx;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_btb_entry <= elts_4_btb_entry;
      end else begin
        elts_3_btb_entry <= io_enq_bits_btb_entry;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_btb_bht_history <= elts_4_btb_bht_history;
      end else begin
        elts_3_btb_bht_history <= io_enq_bits_btb_bht_history;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_pc <= elts_4_pc;
      end else begin
        elts_3_pc <= io_enq_bits_pc;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_data <= elts_4_data;
      end else begin
        elts_3_data <= io_enq_bits_data;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_xcpt_pf_inst <= elts_4_xcpt_pf_inst;
      end else begin
        elts_3_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_xcpt_ae_inst <= elts_4_xcpt_ae_inst;
      end else begin
        elts_3_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
      end
    end
    if (wen_3) begin
      if (valid_4) begin
        elts_3_replay <= elts_4_replay;
      end else begin
        elts_3_replay <= io_enq_bits_replay;
      end
    end
    if (wen_4) begin
      elts_4_btb_taken <= io_enq_bits_btb_taken;
    end
    if (wen_4) begin
      elts_4_btb_bridx <= io_enq_bits_btb_bridx;
    end
    if (wen_4) begin
      elts_4_btb_entry <= io_enq_bits_btb_entry;
    end
    if (wen_4) begin
      elts_4_btb_bht_history <= io_enq_bits_btb_bht_history;
    end
    if (wen_4) begin
      elts_4_pc <= io_enq_bits_pc;
    end
    if (wen_4) begin
      elts_4_data <= io_enq_bits_data;
    end
    if (wen_4) begin
      elts_4_xcpt_pf_inst <= io_enq_bits_xcpt_pf_inst;
    end
    if (wen_4) begin
      elts_4_xcpt_ae_inst <= io_enq_bits_xcpt_ae_inst;
    end
    if (wen_4) begin
      elts_4_replay <= io_enq_bits_replay;
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
  valid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  valid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  valid_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  valid_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  elts_0_btb_taken = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  elts_0_btb_bridx = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  elts_0_btb_entry = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  elts_0_btb_bht_history = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  elts_0_pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  elts_0_data = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  elts_0_xcpt_pf_inst = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  elts_0_xcpt_ae_inst = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  elts_0_replay = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  elts_1_btb_taken = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  elts_1_btb_bridx = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  elts_1_btb_entry = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  elts_1_btb_bht_history = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  elts_1_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  elts_1_data = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  elts_1_xcpt_pf_inst = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  elts_1_xcpt_ae_inst = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  elts_1_replay = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  elts_2_btb_taken = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  elts_2_btb_bridx = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  elts_2_btb_entry = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  elts_2_btb_bht_history = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  elts_2_pc = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  elts_2_data = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  elts_2_xcpt_pf_inst = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  elts_2_xcpt_ae_inst = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  elts_2_replay = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  elts_3_btb_taken = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  elts_3_btb_bridx = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  elts_3_btb_entry = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  elts_3_btb_bht_history = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  elts_3_pc = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  elts_3_data = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  elts_3_xcpt_pf_inst = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  elts_3_xcpt_ae_inst = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  elts_3_replay = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  elts_4_btb_taken = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  elts_4_btb_bridx = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  elts_4_btb_entry = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  elts_4_btb_bht_history = _RAND_44[7:0];
  _RAND_45 = {1{`RANDOM}};
  elts_4_pc = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  elts_4_data = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  elts_4_xcpt_pf_inst = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  elts_4_xcpt_ae_inst = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  elts_4_replay = _RAND_49[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule