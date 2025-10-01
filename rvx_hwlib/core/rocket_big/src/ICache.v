`default_nettype wire
module ICache(
  input         clock,
  input         reset,
  input         auto_master_out_a_ready,
  output        auto_master_out_a_valid,
  output [31:0] auto_master_out_a_bits_address,
  input         auto_master_out_d_valid,
  input  [2:0]  auto_master_out_d_bits_opcode,
  input  [3:0]  auto_master_out_d_bits_size,
  input  [31:0] auto_master_out_d_bits_data,
  input         auto_master_out_d_bits_corrupt,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input  [31:0] io_s1_paddr,
  input         io_s1_kill,
  input         io_s2_kill,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  output        io_resp_bits_ae,
  input         io_invalidate
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [255:0] _RAND_1;
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
`endif // RANDOMIZE_REG_INIT
  wire  repl_way_v0_prng_clock;
  wire  repl_way_v0_prng_reset;
  wire  repl_way_v0_prng_io_increment;
  wire  repl_way_v0_prng_io_out_0;
  wire  repl_way_v0_prng_io_out_1;
  wire  repl_way_v0_prng_io_out_2;
  wire  repl_way_v0_prng_io_out_3;
  wire  repl_way_v0_prng_io_out_4;
  wire  repl_way_v0_prng_io_out_5;
  wire  repl_way_v0_prng_io_out_6;
  wire  repl_way_v0_prng_io_out_7;
  wire  repl_way_v0_prng_io_out_8;
  wire  repl_way_v0_prng_io_out_9;
  wire  repl_way_v0_prng_io_out_10;
  wire  repl_way_v0_prng_io_out_11;
  wire  repl_way_v0_prng_io_out_12;
  wire  repl_way_v0_prng_io_out_13;
  wire  repl_way_v0_prng_io_out_14;
  wire  repl_way_v0_prng_io_out_15;
  wire [5:0] tag_array_RW0_addr;
  wire  tag_array_RW0_en;
  wire  tag_array_RW0_clk;
  wire  tag_array_RW0_wmode;
  wire [20:0] tag_array_RW0_wdata_0;
  wire [20:0] tag_array_RW0_wdata_1;
  wire [20:0] tag_array_RW0_wdata_2;
  wire [20:0] tag_array_RW0_wdata_3;
  wire [20:0] tag_array_RW0_rdata_0;
  wire [20:0] tag_array_RW0_rdata_1;
  wire [20:0] tag_array_RW0_rdata_2;
  wire [20:0] tag_array_RW0_rdata_3;
  wire  tag_array_RW0_wmask_0;
  wire  tag_array_RW0_wmask_1;
  wire  tag_array_RW0_wmask_2;
  wire  tag_array_RW0_wmask_3;
  wire [9:0] data_arrays_0_RW0_addr;
  wire  data_arrays_0_RW0_en;
  wire  data_arrays_0_RW0_clk;
  wire  data_arrays_0_RW0_wmode;
  wire [31:0] data_arrays_0_RW0_wdata_0;
  wire [31:0] data_arrays_0_RW0_wdata_1;
  wire [31:0] data_arrays_0_RW0_wdata_2;
  wire [31:0] data_arrays_0_RW0_wdata_3;
  wire [31:0] data_arrays_0_RW0_rdata_0;
  wire [31:0] data_arrays_0_RW0_rdata_1;
  wire [31:0] data_arrays_0_RW0_rdata_2;
  wire [31:0] data_arrays_0_RW0_rdata_3;
  wire  data_arrays_0_RW0_wmask_0;
  wire  data_arrays_0_RW0_wmask_1;
  wire  data_arrays_0_RW0_wmask_2;
  wire  data_arrays_0_RW0_wmask_3;
  wire  s0_valid = io_req_ready & io_req_valid;
  reg  s1_valid;
  reg [255:0] vb_array;
  wire [5:0] s1_idx = io_s1_paddr[11:6];
  wire [6:0] _s1_vb_T = {1'h0,s1_idx};
  wire [255:0] _s1_vb_T_1 = vb_array >> _s1_vb_T;
  wire  s1_vb = _s1_vb_T_1[0];
  wire [19:0] tag = tag_array_RW0_rdata_0[19:0];
  wire [19:0] s1_tag = io_s1_paddr[31:12];
  wire  tagMatch = s1_vb & tag == s1_tag;
  wire [6:0] _s1_vb_T_4 = {1'h1,s1_idx};
  wire [255:0] _s1_vb_T_5 = vb_array >> _s1_vb_T_4;
  wire  s1_vb_1 = _s1_vb_T_5[0];
  wire [19:0] tag_1 = tag_array_RW0_rdata_1[19:0];
  wire  tagMatch_1 = s1_vb_1 & tag_1 == s1_tag;
  wire [7:0] _s1_vb_T_8 = {2'h2,s1_idx};
  wire [255:0] _s1_vb_T_9 = vb_array >> _s1_vb_T_8;
  wire  s1_vb_2 = _s1_vb_T_9[0];
  wire [19:0] tag_2 = tag_array_RW0_rdata_2[19:0];
  wire  tagMatch_2 = s1_vb_2 & tag_2 == s1_tag;
  wire [7:0] _s1_vb_T_12 = {2'h3,s1_idx};
  wire [255:0] _s1_vb_T_13 = vb_array >> _s1_vb_T_12;
  wire  s1_vb_3 = _s1_vb_T_13[0];
  wire [19:0] tag_3 = tag_array_RW0_rdata_3[19:0];
  wire  tagMatch_3 = s1_vb_3 & tag_3 == s1_tag;
  wire  s1_hit = tagMatch | tagMatch_1 | tagMatch_2 | tagMatch_3;
  reg  s2_valid;
  reg  s2_hit;
  reg  invalidated;
  reg  refill_valid;
  wire  s2_miss = s2_valid & ~s2_hit & ~io_s2_kill;
  reg  s2_request_refill_REG;
  wire  s2_request_refill = s2_miss & s2_request_refill_REG;
  wire  refill_fire = auto_master_out_a_ready & s2_request_refill;
  wire  s1_can_request_refill = ~(s2_miss | refill_valid);
  wire  _refill_paddr_T = s1_valid & s1_can_request_refill;
  reg [31:0] refill_paddr;
  wire [19:0] refill_tag = refill_paddr[31:12];
  wire [5:0] refill_idx = refill_paddr[11:6];
  wire  refill_one_beat_opdata = auto_master_out_d_bits_opcode[0];
  wire  refill_one_beat = auto_master_out_d_valid & refill_one_beat_opdata;
  wire [26:0] _beats1_decode_T_1 = 27'hfff << auto_master_out_d_bits_size;
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0];
  wire [9:0] beats1_decode = _beats1_decode_T_3[11:2];
  wire [9:0] beats1 = refill_one_beat_opdata ? beats1_decode : 10'h0;
  reg [9:0] counter;
  wire [9:0] counter1 = counter - 10'h1;
  wire  first = counter == 10'h0;
  wire  last = counter == 10'h1 | beats1 == 10'h0;
  wire  d_done = last & auto_master_out_d_valid;
  wire [9:0] _count_T = ~counter1;
  wire [9:0] refill_cnt = beats1 & _count_T;
  wire  refill_done = refill_one_beat & d_done;
  wire [7:0] repl_way_v0_lo = {repl_way_v0_prng_io_out_7,repl_way_v0_prng_io_out_6,repl_way_v0_prng_io_out_5,
    repl_way_v0_prng_io_out_4,repl_way_v0_prng_io_out_3,repl_way_v0_prng_io_out_2,repl_way_v0_prng_io_out_1,
    repl_way_v0_prng_io_out_0};
  wire [15:0] _repl_way_v0_T = {repl_way_v0_prng_io_out_15,repl_way_v0_prng_io_out_14,repl_way_v0_prng_io_out_13,
    repl_way_v0_prng_io_out_12,repl_way_v0_prng_io_out_11,repl_way_v0_prng_io_out_10,repl_way_v0_prng_io_out_9,
    repl_way_v0_prng_io_out_8,repl_way_v0_lo};
  wire [1:0] repl_way_v0 = _repl_way_v0_T[1:0];
  wire [7:0] _repl_way_T_1 = {repl_way_v0,refill_idx};
  wire  _repl_way_T_10 = ~reset;
  wire  _tag_rdata_T_2 = ~refill_done & s0_valid;
  reg  accruedRefillError;
  wire  refillError = auto_master_out_d_bits_corrupt | refill_cnt > 10'h0 & accruedRefillError;
  wire  _vb_array_T_1 = ~invalidated;
  wire [255:0] _vb_array_T_3 = 256'h1 << _repl_way_T_1;
  wire [255:0] _vb_array_T_4 = vb_array | _vb_array_T_3;
  wire [255:0] _vb_array_T_5 = ~vb_array;
  wire [255:0] _vb_array_T_6 = _vb_array_T_5 | _vb_array_T_3;
  wire [255:0] _vb_array_T_7 = ~_vb_array_T_6;
  wire  _GEN_30 = io_invalidate | invalidated;
  wire  tl_error = tag_array_RW0_rdata_0[20];
  wire  s1_tl_error_0 = tagMatch & tl_error;
  wire  tl_error_1 = tag_array_RW0_rdata_1[20];
  wire  s1_tl_error_1 = tagMatch_1 & tl_error_1;
  wire  tl_error_2 = tag_array_RW0_rdata_2[20];
  wire  s1_tl_error_2 = tagMatch_2 & tl_error_2;
  wire  tl_error_3 = tag_array_RW0_rdata_3[20];
  wire  s1_tl_error_3 = tagMatch_3 & tl_error_3;
  wire [1:0] _T_15 = tagMatch + tagMatch_1;
  wire [1:0] _T_17 = tagMatch_2 + tagMatch_3;
  wire [2:0] _T_19 = _T_15 + _T_17;
  wire  wen = refill_one_beat & _vb_array_T_1;
  wire [9:0] _mem_idx_T = {refill_idx, 4'h0};
  wire [9:0] _mem_idx_T_1 = _mem_idx_T | refill_cnt;
  wire  _dout_T_1 = ~wen & s0_valid;
  wire [31:0] s1_dout_0 = data_arrays_0_RW0_rdata_0;
  wire [31:0] s1_dout_1 = data_arrays_0_RW0_rdata_1;
  wire [31:0] s1_dout_2 = data_arrays_0_RW0_rdata_2;
  wire [31:0] s1_dout_3 = data_arrays_0_RW0_rdata_3;
  reg  s2_tag_hit_0;
  reg  s2_tag_hit_1;
  reg  s2_tag_hit_2;
  reg  s2_tag_hit_3;
  reg [31:0] s2_dout_0;
  reg [31:0] s2_dout_1;
  reg [31:0] s2_dout_2;
  reg [31:0] s2_dout_3;
  wire [31:0] _s2_way_mux_T = s2_tag_hit_0 ? s2_dout_0 : 32'h0;
  wire [31:0] _s2_way_mux_T_1 = s2_tag_hit_1 ? s2_dout_1 : 32'h0;
  wire [31:0] _s2_way_mux_T_2 = s2_tag_hit_2 ? s2_dout_2 : 32'h0;
  wire [31:0] _s2_way_mux_T_3 = s2_tag_hit_3 ? s2_dout_3 : 32'h0;
  wire [31:0] _s2_way_mux_T_4 = _s2_way_mux_T | _s2_way_mux_T_1;
  wire [31:0] _s2_way_mux_T_5 = _s2_way_mux_T_4 | _s2_way_mux_T_2;
  wire [3:0] _s2_tl_error_T = {s1_tl_error_3,s1_tl_error_2,s1_tl_error_1,s1_tl_error_0};
  wire  _s2_tl_error_T_1 = |_s2_tl_error_T;
  reg  s2_tl_error;
  wire  _GEN_74 = refill_fire | refill_valid;
  MaxPeriodFibonacciLFSR repl_way_v0_prng (
    .clock(repl_way_v0_prng_clock),
    .reset(repl_way_v0_prng_reset),
    .io_increment(repl_way_v0_prng_io_increment),
    .io_out_0(repl_way_v0_prng_io_out_0),
    .io_out_1(repl_way_v0_prng_io_out_1),
    .io_out_2(repl_way_v0_prng_io_out_2),
    .io_out_3(repl_way_v0_prng_io_out_3),
    .io_out_4(repl_way_v0_prng_io_out_4),
    .io_out_5(repl_way_v0_prng_io_out_5),
    .io_out_6(repl_way_v0_prng_io_out_6),
    .io_out_7(repl_way_v0_prng_io_out_7),
    .io_out_8(repl_way_v0_prng_io_out_8),
    .io_out_9(repl_way_v0_prng_io_out_9),
    .io_out_10(repl_way_v0_prng_io_out_10),
    .io_out_11(repl_way_v0_prng_io_out_11),
    .io_out_12(repl_way_v0_prng_io_out_12),
    .io_out_13(repl_way_v0_prng_io_out_13),
    .io_out_14(repl_way_v0_prng_io_out_14),
    .io_out_15(repl_way_v0_prng_io_out_15)
  );
  tag_array_0 tag_array (
    .RW0_addr(tag_array_RW0_addr),
    .RW0_en(tag_array_RW0_en),
    .RW0_clk(tag_array_RW0_clk),
    .RW0_wmode(tag_array_RW0_wmode),
    .RW0_wdata_0(tag_array_RW0_wdata_0),
    .RW0_wdata_1(tag_array_RW0_wdata_1),
    .RW0_wdata_2(tag_array_RW0_wdata_2),
    .RW0_wdata_3(tag_array_RW0_wdata_3),
    .RW0_rdata_0(tag_array_RW0_rdata_0),
    .RW0_rdata_1(tag_array_RW0_rdata_1),
    .RW0_rdata_2(tag_array_RW0_rdata_2),
    .RW0_rdata_3(tag_array_RW0_rdata_3),
    .RW0_wmask_0(tag_array_RW0_wmask_0),
    .RW0_wmask_1(tag_array_RW0_wmask_1),
    .RW0_wmask_2(tag_array_RW0_wmask_2),
    .RW0_wmask_3(tag_array_RW0_wmask_3)
  );
  data_arrays_0_0 data_arrays_0 (
    .RW0_addr(data_arrays_0_RW0_addr),
    .RW0_en(data_arrays_0_RW0_en),
    .RW0_clk(data_arrays_0_RW0_clk),
    .RW0_wmode(data_arrays_0_RW0_wmode),
    .RW0_wdata_0(data_arrays_0_RW0_wdata_0),
    .RW0_wdata_1(data_arrays_0_RW0_wdata_1),
    .RW0_wdata_2(data_arrays_0_RW0_wdata_2),
    .RW0_wdata_3(data_arrays_0_RW0_wdata_3),
    .RW0_rdata_0(data_arrays_0_RW0_rdata_0),
    .RW0_rdata_1(data_arrays_0_RW0_rdata_1),
    .RW0_rdata_2(data_arrays_0_RW0_rdata_2),
    .RW0_rdata_3(data_arrays_0_RW0_rdata_3),
    .RW0_wmask_0(data_arrays_0_RW0_wmask_0),
    .RW0_wmask_1(data_arrays_0_RW0_wmask_1),
    .RW0_wmask_2(data_arrays_0_RW0_wmask_2),
    .RW0_wmask_3(data_arrays_0_RW0_wmask_3)
  );
  assign auto_master_out_a_valid = s2_miss & s2_request_refill_REG;
  assign auto_master_out_a_bits_address = {refill_paddr[31:6], 6'h0};
  assign io_req_ready = ~refill_one_beat;
  assign io_resp_valid = s2_valid & s2_hit;
  assign io_resp_bits_data = _s2_way_mux_T_5 | _s2_way_mux_T_3;
  assign io_resp_bits_ae = s2_tl_error;
  assign repl_way_v0_prng_clock = clock;
  assign repl_way_v0_prng_reset = reset;
  assign repl_way_v0_prng_io_increment = auto_master_out_a_ready & s2_request_refill;
  assign tag_array_RW0_clk = clock;
  assign tag_array_RW0_wdata_0 = {refillError,refill_tag};
  assign tag_array_RW0_wdata_1 = {refillError,refill_tag};
  assign tag_array_RW0_wdata_2 = {refillError,refill_tag};
  assign tag_array_RW0_wdata_3 = {refillError,refill_tag};
  assign tag_array_RW0_wmask_0 = repl_way_v0 == 2'h0;
  assign tag_array_RW0_wmask_1 = repl_way_v0 == 2'h1;
  assign tag_array_RW0_wmask_2 = repl_way_v0 == 2'h2;
  assign tag_array_RW0_wmask_3 = repl_way_v0 == 2'h3;
  assign data_arrays_0_RW0_clk = clock;
  assign data_arrays_0_RW0_wdata_0 = auto_master_out_d_bits_data;
  assign data_arrays_0_RW0_wdata_1 = auto_master_out_d_bits_data;
  assign data_arrays_0_RW0_wdata_2 = auto_master_out_d_bits_data;
  assign data_arrays_0_RW0_wdata_3 = auto_master_out_d_bits_data;
  assign data_arrays_0_RW0_wmask_0 = repl_way_v0 == 2'h0;
  assign data_arrays_0_RW0_wmask_1 = repl_way_v0 == 2'h1;
  assign data_arrays_0_RW0_wmask_2 = repl_way_v0 == 2'h2;
  assign data_arrays_0_RW0_wmask_3 = repl_way_v0 == 2'h3;
  assign tag_array_RW0_en = _tag_rdata_T_2 | refill_done;
  assign tag_array_RW0_wmode = refill_one_beat & d_done;
  assign tag_array_RW0_addr = refill_done ? refill_idx : io_req_bits_addr[11:6];
  assign data_arrays_0_RW0_en = _dout_T_1 | wen;
  assign data_arrays_0_RW0_wmode = refill_one_beat & _vb_array_T_1;
  assign data_arrays_0_RW0_addr = refill_one_beat ? _mem_idx_T_1 : io_req_bits_addr[11:2];
  always @(posedge clock) begin
    if (reset) begin
      s1_valid <= 1'h0;
    end else begin
      s1_valid <= s0_valid;
    end
    if (reset) begin
      vb_array <= 256'h0;
    end else if (io_invalidate) begin
      vb_array <= 256'h0;
    end else if (refill_one_beat) begin
      if (refill_done & ~invalidated) begin
        vb_array <= _vb_array_T_4;
      end else begin
        vb_array <= _vb_array_T_7;
      end
    end
    if (reset) begin
      s2_valid <= 1'h0;
    end else begin
      s2_valid <= s1_valid & ~io_s1_kill;
    end
    s2_hit <= s1_hit;
    if (~refill_valid) begin
      invalidated <= 1'h0;
    end else begin
      invalidated <= _GEN_30;
    end
    if (reset) begin
      refill_valid <= 1'h0;
    end else if (refill_done) begin
      refill_valid <= 1'h0;
    end else begin
      refill_valid <= _GEN_74;
    end
    s2_request_refill_REG <= ~(s2_miss | refill_valid);
    if (_refill_paddr_T) begin
      refill_paddr <= io_s1_paddr;
    end
    if (reset) begin
      counter <= 10'h0;
    end else if (auto_master_out_d_valid) begin
      if (first) begin
        if (refill_one_beat_opdata) begin
          counter <= beats1_decode;
        end else begin
          counter <= 10'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    if (refill_one_beat) begin
      accruedRefillError <= refillError;
    end
    if (s1_valid) begin
      s2_tag_hit_0 <= tagMatch;
    end
    if (s1_valid) begin
      s2_tag_hit_1 <= tagMatch_1;
    end
    if (s1_valid) begin
      s2_tag_hit_2 <= tagMatch_2;
    end
    if (s1_valid) begin
      s2_tag_hit_3 <= tagMatch_3;
    end
    if (s1_valid) begin
      s2_dout_0 <= s1_dout_0;
    end
    if (s1_valid) begin
      s2_dout_1 <= s1_dout_1;
    end
    if (s1_valid) begin
      s2_dout_2 <= s1_dout_2;
    end
    if (s1_valid) begin
      s2_dout_3 <= s1_dout_3;
    end
    if (s1_valid) begin
      s2_tl_error <= _s2_tl_error_T_1;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~s1_valid | _T_19 <= 3'h1) & _repl_way_T_10) begin
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
        if (_repl_way_T_10 & ~(~s1_valid | _T_19 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ICache.scala:512 assert(!(s1_valid || s1_slaveValid) || PopCount(s1_tag_hit zip s1_tag_disparity map { case (h, d) => h && !d }) <= 1)\n"
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {8{`RANDOM}};
  vb_array = _RAND_1[255:0];
  _RAND_2 = {1{`RANDOM}};
  s2_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s2_hit = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  invalidated = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  refill_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_request_refill_REG = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  refill_paddr = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  counter = _RAND_8[9:0];
  _RAND_9 = {1{`RANDOM}};
  accruedRefillError = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_tag_hit_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s2_tag_hit_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s2_tag_hit_2 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s2_tag_hit_3 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s2_dout_0 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s2_dout_1 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s2_dout_2 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s2_dout_3 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  s2_tl_error = _RAND_18[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule