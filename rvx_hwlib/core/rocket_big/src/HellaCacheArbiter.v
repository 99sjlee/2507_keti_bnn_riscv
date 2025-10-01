`default_nettype wire
module HellaCacheArbiter(
  input         clock,
  output        io_requestor_0_req_ready,
  input         io_requestor_0_req_valid,
  input  [31:0] io_requestor_0_req_bits_addr,
  input         io_requestor_0_s1_kill,
  output        io_requestor_0_s2_nack,
  output        io_requestor_0_resp_valid,
  output [31:0] io_requestor_0_resp_bits_data,
  output        io_requestor_0_s2_xcpt_ae_ld,
  output        io_requestor_1_req_ready,
  input         io_requestor_1_req_valid,
  input  [31:0] io_requestor_1_req_bits_addr,
  input  [6:0]  io_requestor_1_req_bits_tag,
  input  [4:0]  io_requestor_1_req_bits_cmd,
  input  [1:0]  io_requestor_1_req_bits_size,
  input         io_requestor_1_req_bits_signed,
  input  [1:0]  io_requestor_1_req_bits_dprv,
  input         io_requestor_1_s1_kill,
  input  [31:0] io_requestor_1_s1_data_data,
  output        io_requestor_1_s2_nack,
  output        io_requestor_1_resp_valid,
  output [6:0]  io_requestor_1_resp_bits_tag,
  output [31:0] io_requestor_1_resp_bits_data,
  output        io_requestor_1_resp_bits_replay,
  output        io_requestor_1_resp_bits_has_data,
  output [31:0] io_requestor_1_resp_bits_data_word_bypass,
  output        io_requestor_1_replay_next,
  output        io_requestor_1_s2_xcpt_ma_ld,
  output        io_requestor_1_s2_xcpt_ma_st,
  output        io_requestor_1_s2_xcpt_pf_ld,
  output        io_requestor_1_s2_xcpt_pf_st,
  output        io_requestor_1_s2_xcpt_ae_ld,
  output        io_requestor_1_s2_xcpt_ae_st,
  output        io_requestor_1_ordered,
  output        io_requestor_1_perf_release,
  output        io_requestor_1_perf_grant,
  input         io_mem_req_ready,
  output        io_mem_req_valid,
  output [31:0] io_mem_req_bits_addr,
  output [6:0]  io_mem_req_bits_tag,
  output [4:0]  io_mem_req_bits_cmd,
  output [1:0]  io_mem_req_bits_size,
  output        io_mem_req_bits_signed,
  output [1:0]  io_mem_req_bits_dprv,
  output        io_mem_req_bits_phys,
  output        io_mem_s1_kill,
  output [31:0] io_mem_s1_data_data,
  input         io_mem_s2_nack,
  input         io_mem_resp_valid,
  input  [6:0]  io_mem_resp_bits_tag,
  input  [31:0] io_mem_resp_bits_data,
  input         io_mem_resp_bits_replay,
  input         io_mem_resp_bits_has_data,
  input  [31:0] io_mem_resp_bits_data_word_bypass,
  input         io_mem_replay_next,
  input         io_mem_s2_xcpt_ma_ld,
  input         io_mem_s2_xcpt_ma_st,
  input         io_mem_s2_xcpt_pf_ld,
  input         io_mem_s2_xcpt_pf_st,
  input         io_mem_s2_xcpt_ae_ld,
  input         io_mem_s2_xcpt_ae_st,
  input         io_mem_ordered,
  input         io_mem_perf_release,
  input         io_mem_perf_grant
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  s1_id;
  reg  s2_id;
  wire [7:0] _io_mem_req_bits_tag_T = {io_requestor_1_req_bits_tag,1'h1};
  wire [7:0] _GEN_1 = io_requestor_0_req_valid ? 8'h0 : _io_mem_req_bits_tag_T;
  wire  _T_1 = ~s2_id;
  wire  tag_hit = ~io_mem_resp_bits_tag[0];
  assign io_requestor_0_req_ready = io_mem_req_ready;
  assign io_requestor_0_s2_nack = io_mem_s2_nack & _T_1;
  assign io_requestor_0_resp_valid = io_mem_resp_valid & tag_hit;
  assign io_requestor_0_resp_bits_data = io_mem_resp_bits_data;
  assign io_requestor_0_s2_xcpt_ae_ld = io_mem_s2_xcpt_ae_ld;
  assign io_requestor_1_req_ready = io_requestor_0_req_ready & ~io_requestor_0_req_valid;
  assign io_requestor_1_s2_nack = io_mem_s2_nack & s2_id;
  assign io_requestor_1_resp_valid = io_mem_resp_valid & io_mem_resp_bits_tag[0];
  assign io_requestor_1_resp_bits_tag = {{1'd0}, io_mem_resp_bits_tag[6:1]};
  assign io_requestor_1_resp_bits_data = io_mem_resp_bits_data;
  assign io_requestor_1_resp_bits_replay = io_mem_resp_bits_replay;
  assign io_requestor_1_resp_bits_has_data = io_mem_resp_bits_has_data;
  assign io_requestor_1_resp_bits_data_word_bypass = io_mem_resp_bits_data_word_bypass;
  assign io_requestor_1_replay_next = io_mem_replay_next;
  assign io_requestor_1_s2_xcpt_ma_ld = io_mem_s2_xcpt_ma_ld;
  assign io_requestor_1_s2_xcpt_ma_st = io_mem_s2_xcpt_ma_st;
  assign io_requestor_1_s2_xcpt_pf_ld = io_mem_s2_xcpt_pf_ld;
  assign io_requestor_1_s2_xcpt_pf_st = io_mem_s2_xcpt_pf_st;
  assign io_requestor_1_s2_xcpt_ae_ld = io_mem_s2_xcpt_ae_ld;
  assign io_requestor_1_s2_xcpt_ae_st = io_mem_s2_xcpt_ae_st;
  assign io_requestor_1_ordered = io_mem_ordered;
  assign io_requestor_1_perf_release = io_mem_perf_release;
  assign io_requestor_1_perf_grant = io_mem_perf_grant;
  assign io_mem_req_valid = io_requestor_0_req_valid | io_requestor_1_req_valid;
  assign io_mem_req_bits_addr = io_requestor_0_req_valid ? io_requestor_0_req_bits_addr : io_requestor_1_req_bits_addr;
  assign io_mem_req_bits_tag = _GEN_1[6:0];
  assign io_mem_req_bits_cmd = io_requestor_0_req_valid ? 5'h0 : io_requestor_1_req_bits_cmd;
  assign io_mem_req_bits_size = io_requestor_0_req_valid ? 2'h2 : io_requestor_1_req_bits_size;
  assign io_mem_req_bits_signed = io_requestor_0_req_valid ? 1'h0 : io_requestor_1_req_bits_signed;
  assign io_mem_req_bits_dprv = io_requestor_0_req_valid ? 2'h1 : io_requestor_1_req_bits_dprv;
  assign io_mem_req_bits_phys = io_requestor_0_req_valid;
  assign io_mem_s1_kill = ~s1_id ? io_requestor_0_s1_kill : io_requestor_1_s1_kill;
  assign io_mem_s1_data_data = ~s1_id ? 32'h0 : io_requestor_1_s1_data_data;
  always @(posedge clock) begin
    if (io_requestor_0_req_valid) begin
      s1_id <= 1'h0;
    end else begin
      s1_id <= 1'h1;
    end
    s2_id <= s1_id;
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
  s1_id = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s2_id = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule