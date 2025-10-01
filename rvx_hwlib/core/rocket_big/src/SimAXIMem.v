`default_nettype wire
module SimAXIMem(
  input         clock,
  input         reset,
  output        io_axi4_0_aw_ready,
  input         io_axi4_0_aw_valid,
  input  [3:0]  io_axi4_0_aw_bits_id,
  input  [31:0] io_axi4_0_aw_bits_addr,
  input  [7:0]  io_axi4_0_aw_bits_len,
  input  [2:0]  io_axi4_0_aw_bits_size,
  input  [1:0]  io_axi4_0_aw_bits_burst,
  output        io_axi4_0_w_ready,
  input         io_axi4_0_w_valid,
  input  [31:0] io_axi4_0_w_bits_data,
  input  [3:0]  io_axi4_0_w_bits_strb,
  input         io_axi4_0_w_bits_last,
  input         io_axi4_0_b_ready,
  output        io_axi4_0_b_valid,
  output [3:0]  io_axi4_0_b_bits_id,
  output [1:0]  io_axi4_0_b_bits_resp,
  output        io_axi4_0_ar_ready,
  input         io_axi4_0_ar_valid,
  input  [3:0]  io_axi4_0_ar_bits_id,
  input  [31:0] io_axi4_0_ar_bits_addr,
  input  [7:0]  io_axi4_0_ar_bits_len,
  input  [2:0]  io_axi4_0_ar_bits_size,
  input  [1:0]  io_axi4_0_ar_bits_burst,
  input         io_axi4_0_r_ready,
  output        io_axi4_0_r_valid,
  output [3:0]  io_axi4_0_r_bits_id,
  output [31:0] io_axi4_0_r_bits_data,
  output [1:0]  io_axi4_0_r_bits_resp,
  output        io_axi4_0_r_bits_last
);
  wire  srams_clock;
  wire  srams_reset;
  wire  srams_auto_in_aw_ready;
  wire  srams_auto_in_aw_valid;
  wire [3:0] srams_auto_in_aw_bits_id;
  wire [28:0] srams_auto_in_aw_bits_addr;
  wire  srams_auto_in_aw_bits_echo_real_last;
  wire  srams_auto_in_w_ready;
  wire  srams_auto_in_w_valid;
  wire [31:0] srams_auto_in_w_bits_data;
  wire [3:0] srams_auto_in_w_bits_strb;
  wire  srams_auto_in_b_ready;
  wire  srams_auto_in_b_valid;
  wire [3:0] srams_auto_in_b_bits_id;
  wire [1:0] srams_auto_in_b_bits_resp;
  wire  srams_auto_in_b_bits_echo_real_last;
  wire  srams_auto_in_ar_ready;
  wire  srams_auto_in_ar_valid;
  wire [3:0] srams_auto_in_ar_bits_id;
  wire [28:0] srams_auto_in_ar_bits_addr;
  wire  srams_auto_in_ar_bits_echo_real_last;
  wire  srams_auto_in_r_ready;
  wire  srams_auto_in_r_valid;
  wire [3:0] srams_auto_in_r_bits_id;
  wire [31:0] srams_auto_in_r_bits_data;
  wire [1:0] srams_auto_in_r_bits_resp;
  wire  srams_auto_in_r_bits_echo_real_last;
  wire  srams_1_clock;
  wire  srams_1_reset;
  wire  srams_1_auto_in_aw_ready;
  wire  srams_1_auto_in_aw_valid;
  wire [3:0] srams_1_auto_in_aw_bits_id;
  wire [29:0] srams_1_auto_in_aw_bits_addr;
  wire  srams_1_auto_in_aw_bits_echo_real_last;
  wire  srams_1_auto_in_w_ready;
  wire  srams_1_auto_in_w_valid;
  wire [31:0] srams_1_auto_in_w_bits_data;
  wire [3:0] srams_1_auto_in_w_bits_strb;
  wire  srams_1_auto_in_b_ready;
  wire  srams_1_auto_in_b_valid;
  wire [3:0] srams_1_auto_in_b_bits_id;
  wire [1:0] srams_1_auto_in_b_bits_resp;
  wire  srams_1_auto_in_b_bits_echo_real_last;
  wire  srams_1_auto_in_ar_ready;
  wire  srams_1_auto_in_ar_valid;
  wire [3:0] srams_1_auto_in_ar_bits_id;
  wire [29:0] srams_1_auto_in_ar_bits_addr;
  wire  srams_1_auto_in_ar_bits_echo_real_last;
  wire  srams_1_auto_in_r_ready;
  wire  srams_1_auto_in_r_valid;
  wire [3:0] srams_1_auto_in_r_bits_id;
  wire [31:0] srams_1_auto_in_r_bits_data;
  wire [1:0] srams_1_auto_in_r_bits_resp;
  wire  srams_1_auto_in_r_bits_echo_real_last;
  wire  srams_2_clock;
  wire  srams_2_reset;
  wire  srams_2_auto_in_aw_ready;
  wire  srams_2_auto_in_aw_valid;
  wire [3:0] srams_2_auto_in_aw_bits_id;
  wire [30:0] srams_2_auto_in_aw_bits_addr;
  wire  srams_2_auto_in_aw_bits_echo_real_last;
  wire  srams_2_auto_in_w_ready;
  wire  srams_2_auto_in_w_valid;
  wire [31:0] srams_2_auto_in_w_bits_data;
  wire [3:0] srams_2_auto_in_w_bits_strb;
  wire  srams_2_auto_in_b_ready;
  wire  srams_2_auto_in_b_valid;
  wire [3:0] srams_2_auto_in_b_bits_id;
  wire [1:0] srams_2_auto_in_b_bits_resp;
  wire  srams_2_auto_in_b_bits_echo_real_last;
  wire  srams_2_auto_in_ar_ready;
  wire  srams_2_auto_in_ar_valid;
  wire [3:0] srams_2_auto_in_ar_bits_id;
  wire [30:0] srams_2_auto_in_ar_bits_addr;
  wire  srams_2_auto_in_ar_bits_echo_real_last;
  wire  srams_2_auto_in_r_ready;
  wire  srams_2_auto_in_r_valid;
  wire [3:0] srams_2_auto_in_r_bits_id;
  wire [31:0] srams_2_auto_in_r_bits_data;
  wire [1:0] srams_2_auto_in_r_bits_resp;
  wire  srams_2_auto_in_r_bits_echo_real_last;
  wire  srams_3_clock;
  wire  srams_3_reset;
  wire  srams_3_auto_in_aw_ready;
  wire  srams_3_auto_in_aw_valid;
  wire [3:0] srams_3_auto_in_aw_bits_id;
  wire [31:0] srams_3_auto_in_aw_bits_addr;
  wire  srams_3_auto_in_aw_bits_echo_real_last;
  wire  srams_3_auto_in_w_ready;
  wire  srams_3_auto_in_w_valid;
  wire [31:0] srams_3_auto_in_w_bits_data;
  wire [3:0] srams_3_auto_in_w_bits_strb;
  wire  srams_3_auto_in_b_ready;
  wire  srams_3_auto_in_b_valid;
  wire [3:0] srams_3_auto_in_b_bits_id;
  wire [1:0] srams_3_auto_in_b_bits_resp;
  wire  srams_3_auto_in_b_bits_echo_real_last;
  wire  srams_3_auto_in_ar_ready;
  wire  srams_3_auto_in_ar_valid;
  wire [3:0] srams_3_auto_in_ar_bits_id;
  wire [31:0] srams_3_auto_in_ar_bits_addr;
  wire  srams_3_auto_in_ar_bits_echo_real_last;
  wire  srams_3_auto_in_r_ready;
  wire  srams_3_auto_in_r_valid;
  wire [3:0] srams_3_auto_in_r_bits_id;
  wire [31:0] srams_3_auto_in_r_bits_data;
  wire [1:0] srams_3_auto_in_r_bits_resp;
  wire  srams_3_auto_in_r_bits_echo_real_last;
  wire  axi4xbar_clock;
  wire  axi4xbar_reset;
  wire  axi4xbar_auto_in_aw_ready;
  wire  axi4xbar_auto_in_aw_valid;
  wire [3:0] axi4xbar_auto_in_aw_bits_id;
  wire [31:0] axi4xbar_auto_in_aw_bits_addr;
  wire [7:0] axi4xbar_auto_in_aw_bits_len;
  wire [2:0] axi4xbar_auto_in_aw_bits_size;
  wire [1:0] axi4xbar_auto_in_aw_bits_burst;
  wire  axi4xbar_auto_in_w_ready;
  wire  axi4xbar_auto_in_w_valid;
  wire [31:0] axi4xbar_auto_in_w_bits_data;
  wire [3:0] axi4xbar_auto_in_w_bits_strb;
  wire  axi4xbar_auto_in_w_bits_last;
  wire  axi4xbar_auto_in_b_ready;
  wire  axi4xbar_auto_in_b_valid;
  wire [3:0] axi4xbar_auto_in_b_bits_id;
  wire [1:0] axi4xbar_auto_in_b_bits_resp;
  wire  axi4xbar_auto_in_ar_ready;
  wire  axi4xbar_auto_in_ar_valid;
  wire [3:0] axi4xbar_auto_in_ar_bits_id;
  wire [31:0] axi4xbar_auto_in_ar_bits_addr;
  wire [7:0] axi4xbar_auto_in_ar_bits_len;
  wire [2:0] axi4xbar_auto_in_ar_bits_size;
  wire [1:0] axi4xbar_auto_in_ar_bits_burst;
  wire  axi4xbar_auto_in_r_ready;
  wire  axi4xbar_auto_in_r_valid;
  wire [3:0] axi4xbar_auto_in_r_bits_id;
  wire [31:0] axi4xbar_auto_in_r_bits_data;
  wire [1:0] axi4xbar_auto_in_r_bits_resp;
  wire  axi4xbar_auto_in_r_bits_last;
  wire  axi4xbar_auto_out_3_aw_ready;
  wire  axi4xbar_auto_out_3_aw_valid;
  wire [3:0] axi4xbar_auto_out_3_aw_bits_id;
  wire [31:0] axi4xbar_auto_out_3_aw_bits_addr;
  wire [7:0] axi4xbar_auto_out_3_aw_bits_len;
  wire [2:0] axi4xbar_auto_out_3_aw_bits_size;
  wire [1:0] axi4xbar_auto_out_3_aw_bits_burst;
  wire  axi4xbar_auto_out_3_w_ready;
  wire  axi4xbar_auto_out_3_w_valid;
  wire [31:0] axi4xbar_auto_out_3_w_bits_data;
  wire [3:0] axi4xbar_auto_out_3_w_bits_strb;
  wire  axi4xbar_auto_out_3_w_bits_last;
  wire  axi4xbar_auto_out_3_b_ready;
  wire  axi4xbar_auto_out_3_b_valid;
  wire [3:0] axi4xbar_auto_out_3_b_bits_id;
  wire [1:0] axi4xbar_auto_out_3_b_bits_resp;
  wire  axi4xbar_auto_out_3_ar_ready;
  wire  axi4xbar_auto_out_3_ar_valid;
  wire [3:0] axi4xbar_auto_out_3_ar_bits_id;
  wire [31:0] axi4xbar_auto_out_3_ar_bits_addr;
  wire [7:0] axi4xbar_auto_out_3_ar_bits_len;
  wire [2:0] axi4xbar_auto_out_3_ar_bits_size;
  wire [1:0] axi4xbar_auto_out_3_ar_bits_burst;
  wire  axi4xbar_auto_out_3_r_ready;
  wire  axi4xbar_auto_out_3_r_valid;
  wire [3:0] axi4xbar_auto_out_3_r_bits_id;
  wire [31:0] axi4xbar_auto_out_3_r_bits_data;
  wire [1:0] axi4xbar_auto_out_3_r_bits_resp;
  wire  axi4xbar_auto_out_3_r_bits_last;
  wire  axi4xbar_auto_out_2_aw_ready;
  wire  axi4xbar_auto_out_2_aw_valid;
  wire [3:0] axi4xbar_auto_out_2_aw_bits_id;
  wire [30:0] axi4xbar_auto_out_2_aw_bits_addr;
  wire [7:0] axi4xbar_auto_out_2_aw_bits_len;
  wire [2:0] axi4xbar_auto_out_2_aw_bits_size;
  wire [1:0] axi4xbar_auto_out_2_aw_bits_burst;
  wire  axi4xbar_auto_out_2_w_ready;
  wire  axi4xbar_auto_out_2_w_valid;
  wire [31:0] axi4xbar_auto_out_2_w_bits_data;
  wire [3:0] axi4xbar_auto_out_2_w_bits_strb;
  wire  axi4xbar_auto_out_2_w_bits_last;
  wire  axi4xbar_auto_out_2_b_ready;
  wire  axi4xbar_auto_out_2_b_valid;
  wire [3:0] axi4xbar_auto_out_2_b_bits_id;
  wire [1:0] axi4xbar_auto_out_2_b_bits_resp;
  wire  axi4xbar_auto_out_2_ar_ready;
  wire  axi4xbar_auto_out_2_ar_valid;
  wire [3:0] axi4xbar_auto_out_2_ar_bits_id;
  wire [30:0] axi4xbar_auto_out_2_ar_bits_addr;
  wire [7:0] axi4xbar_auto_out_2_ar_bits_len;
  wire [2:0] axi4xbar_auto_out_2_ar_bits_size;
  wire [1:0] axi4xbar_auto_out_2_ar_bits_burst;
  wire  axi4xbar_auto_out_2_r_ready;
  wire  axi4xbar_auto_out_2_r_valid;
  wire [3:0] axi4xbar_auto_out_2_r_bits_id;
  wire [31:0] axi4xbar_auto_out_2_r_bits_data;
  wire [1:0] axi4xbar_auto_out_2_r_bits_resp;
  wire  axi4xbar_auto_out_2_r_bits_last;
  wire  axi4xbar_auto_out_1_aw_ready;
  wire  axi4xbar_auto_out_1_aw_valid;
  wire [3:0] axi4xbar_auto_out_1_aw_bits_id;
  wire [29:0] axi4xbar_auto_out_1_aw_bits_addr;
  wire [7:0] axi4xbar_auto_out_1_aw_bits_len;
  wire [2:0] axi4xbar_auto_out_1_aw_bits_size;
  wire [1:0] axi4xbar_auto_out_1_aw_bits_burst;
  wire  axi4xbar_auto_out_1_w_ready;
  wire  axi4xbar_auto_out_1_w_valid;
  wire [31:0] axi4xbar_auto_out_1_w_bits_data;
  wire [3:0] axi4xbar_auto_out_1_w_bits_strb;
  wire  axi4xbar_auto_out_1_w_bits_last;
  wire  axi4xbar_auto_out_1_b_ready;
  wire  axi4xbar_auto_out_1_b_valid;
  wire [3:0] axi4xbar_auto_out_1_b_bits_id;
  wire [1:0] axi4xbar_auto_out_1_b_bits_resp;
  wire  axi4xbar_auto_out_1_ar_ready;
  wire  axi4xbar_auto_out_1_ar_valid;
  wire [3:0] axi4xbar_auto_out_1_ar_bits_id;
  wire [29:0] axi4xbar_auto_out_1_ar_bits_addr;
  wire [7:0] axi4xbar_auto_out_1_ar_bits_len;
  wire [2:0] axi4xbar_auto_out_1_ar_bits_size;
  wire [1:0] axi4xbar_auto_out_1_ar_bits_burst;
  wire  axi4xbar_auto_out_1_r_ready;
  wire  axi4xbar_auto_out_1_r_valid;
  wire [3:0] axi4xbar_auto_out_1_r_bits_id;
  wire [31:0] axi4xbar_auto_out_1_r_bits_data;
  wire [1:0] axi4xbar_auto_out_1_r_bits_resp;
  wire  axi4xbar_auto_out_1_r_bits_last;
  wire  axi4xbar_auto_out_0_aw_ready;
  wire  axi4xbar_auto_out_0_aw_valid;
  wire [3:0] axi4xbar_auto_out_0_aw_bits_id;
  wire [28:0] axi4xbar_auto_out_0_aw_bits_addr;
  wire [7:0] axi4xbar_auto_out_0_aw_bits_len;
  wire [2:0] axi4xbar_auto_out_0_aw_bits_size;
  wire [1:0] axi4xbar_auto_out_0_aw_bits_burst;
  wire  axi4xbar_auto_out_0_w_ready;
  wire  axi4xbar_auto_out_0_w_valid;
  wire [31:0] axi4xbar_auto_out_0_w_bits_data;
  wire [3:0] axi4xbar_auto_out_0_w_bits_strb;
  wire  axi4xbar_auto_out_0_w_bits_last;
  wire  axi4xbar_auto_out_0_b_ready;
  wire  axi4xbar_auto_out_0_b_valid;
  wire [3:0] axi4xbar_auto_out_0_b_bits_id;
  wire [1:0] axi4xbar_auto_out_0_b_bits_resp;
  wire  axi4xbar_auto_out_0_ar_ready;
  wire  axi4xbar_auto_out_0_ar_valid;
  wire [3:0] axi4xbar_auto_out_0_ar_bits_id;
  wire [28:0] axi4xbar_auto_out_0_ar_bits_addr;
  wire [7:0] axi4xbar_auto_out_0_ar_bits_len;
  wire [2:0] axi4xbar_auto_out_0_ar_bits_size;
  wire [1:0] axi4xbar_auto_out_0_ar_bits_burst;
  wire  axi4xbar_auto_out_0_r_ready;
  wire  axi4xbar_auto_out_0_r_valid;
  wire [3:0] axi4xbar_auto_out_0_r_bits_id;
  wire [31:0] axi4xbar_auto_out_0_r_bits_data;
  wire [1:0] axi4xbar_auto_out_0_r_bits_resp;
  wire  axi4xbar_auto_out_0_r_bits_last;
  wire  axi4buf_clock;
  wire  axi4buf_reset;
  wire  axi4buf_auto_in_aw_ready;
  wire  axi4buf_auto_in_aw_valid;
  wire [3:0] axi4buf_auto_in_aw_bits_id;
  wire [28:0] axi4buf_auto_in_aw_bits_addr;
  wire  axi4buf_auto_in_aw_bits_echo_real_last;
  wire  axi4buf_auto_in_w_ready;
  wire  axi4buf_auto_in_w_valid;
  wire [31:0] axi4buf_auto_in_w_bits_data;
  wire [3:0] axi4buf_auto_in_w_bits_strb;
  wire  axi4buf_auto_in_w_bits_last;
  wire  axi4buf_auto_in_b_ready;
  wire  axi4buf_auto_in_b_valid;
  wire [3:0] axi4buf_auto_in_b_bits_id;
  wire [1:0] axi4buf_auto_in_b_bits_resp;
  wire  axi4buf_auto_in_b_bits_echo_real_last;
  wire  axi4buf_auto_in_ar_ready;
  wire  axi4buf_auto_in_ar_valid;
  wire [3:0] axi4buf_auto_in_ar_bits_id;
  wire [28:0] axi4buf_auto_in_ar_bits_addr;
  wire  axi4buf_auto_in_ar_bits_echo_real_last;
  wire  axi4buf_auto_in_r_ready;
  wire  axi4buf_auto_in_r_valid;
  wire [3:0] axi4buf_auto_in_r_bits_id;
  wire [31:0] axi4buf_auto_in_r_bits_data;
  wire [1:0] axi4buf_auto_in_r_bits_resp;
  wire  axi4buf_auto_in_r_bits_echo_real_last;
  wire  axi4buf_auto_in_r_bits_last;
  wire  axi4buf_auto_out_aw_ready;
  wire  axi4buf_auto_out_aw_valid;
  wire [3:0] axi4buf_auto_out_aw_bits_id;
  wire [28:0] axi4buf_auto_out_aw_bits_addr;
  wire  axi4buf_auto_out_aw_bits_echo_real_last;
  wire  axi4buf_auto_out_w_ready;
  wire  axi4buf_auto_out_w_valid;
  wire [31:0] axi4buf_auto_out_w_bits_data;
  wire [3:0] axi4buf_auto_out_w_bits_strb;
  wire  axi4buf_auto_out_b_ready;
  wire  axi4buf_auto_out_b_valid;
  wire [3:0] axi4buf_auto_out_b_bits_id;
  wire [1:0] axi4buf_auto_out_b_bits_resp;
  wire  axi4buf_auto_out_b_bits_echo_real_last;
  wire  axi4buf_auto_out_ar_ready;
  wire  axi4buf_auto_out_ar_valid;
  wire [3:0] axi4buf_auto_out_ar_bits_id;
  wire [28:0] axi4buf_auto_out_ar_bits_addr;
  wire  axi4buf_auto_out_ar_bits_echo_real_last;
  wire  axi4buf_auto_out_r_ready;
  wire  axi4buf_auto_out_r_valid;
  wire [3:0] axi4buf_auto_out_r_bits_id;
  wire [31:0] axi4buf_auto_out_r_bits_data;
  wire [1:0] axi4buf_auto_out_r_bits_resp;
  wire  axi4buf_auto_out_r_bits_echo_real_last;
  wire  axi4frag_clock;
  wire  axi4frag_reset;
  wire  axi4frag_auto_in_aw_ready;
  wire  axi4frag_auto_in_aw_valid;
  wire [3:0] axi4frag_auto_in_aw_bits_id;
  wire [28:0] axi4frag_auto_in_aw_bits_addr;
  wire [7:0] axi4frag_auto_in_aw_bits_len;
  wire [2:0] axi4frag_auto_in_aw_bits_size;
  wire [1:0] axi4frag_auto_in_aw_bits_burst;
  wire  axi4frag_auto_in_w_ready;
  wire  axi4frag_auto_in_w_valid;
  wire [31:0] axi4frag_auto_in_w_bits_data;
  wire [3:0] axi4frag_auto_in_w_bits_strb;
  wire  axi4frag_auto_in_w_bits_last;
  wire  axi4frag_auto_in_b_ready;
  wire  axi4frag_auto_in_b_valid;
  wire [3:0] axi4frag_auto_in_b_bits_id;
  wire [1:0] axi4frag_auto_in_b_bits_resp;
  wire  axi4frag_auto_in_ar_ready;
  wire  axi4frag_auto_in_ar_valid;
  wire [3:0] axi4frag_auto_in_ar_bits_id;
  wire [28:0] axi4frag_auto_in_ar_bits_addr;
  wire [7:0] axi4frag_auto_in_ar_bits_len;
  wire [2:0] axi4frag_auto_in_ar_bits_size;
  wire [1:0] axi4frag_auto_in_ar_bits_burst;
  wire  axi4frag_auto_in_r_ready;
  wire  axi4frag_auto_in_r_valid;
  wire [3:0] axi4frag_auto_in_r_bits_id;
  wire [31:0] axi4frag_auto_in_r_bits_data;
  wire [1:0] axi4frag_auto_in_r_bits_resp;
  wire  axi4frag_auto_in_r_bits_last;
  wire  axi4frag_auto_out_aw_ready;
  wire  axi4frag_auto_out_aw_valid;
  wire [3:0] axi4frag_auto_out_aw_bits_id;
  wire [28:0] axi4frag_auto_out_aw_bits_addr;
  wire  axi4frag_auto_out_aw_bits_echo_real_last;
  wire  axi4frag_auto_out_w_ready;
  wire  axi4frag_auto_out_w_valid;
  wire [31:0] axi4frag_auto_out_w_bits_data;
  wire [3:0] axi4frag_auto_out_w_bits_strb;
  wire  axi4frag_auto_out_w_bits_last;
  wire  axi4frag_auto_out_b_ready;
  wire  axi4frag_auto_out_b_valid;
  wire [3:0] axi4frag_auto_out_b_bits_id;
  wire [1:0] axi4frag_auto_out_b_bits_resp;
  wire  axi4frag_auto_out_b_bits_echo_real_last;
  wire  axi4frag_auto_out_ar_ready;
  wire  axi4frag_auto_out_ar_valid;
  wire [3:0] axi4frag_auto_out_ar_bits_id;
  wire [28:0] axi4frag_auto_out_ar_bits_addr;
  wire  axi4frag_auto_out_ar_bits_echo_real_last;
  wire  axi4frag_auto_out_r_ready;
  wire  axi4frag_auto_out_r_valid;
  wire [3:0] axi4frag_auto_out_r_bits_id;
  wire [31:0] axi4frag_auto_out_r_bits_data;
  wire [1:0] axi4frag_auto_out_r_bits_resp;
  wire  axi4frag_auto_out_r_bits_echo_real_last;
  wire  axi4frag_auto_out_r_bits_last;
  wire  axi4buf_1_clock;
  wire  axi4buf_1_reset;
  wire  axi4buf_1_auto_in_aw_ready;
  wire  axi4buf_1_auto_in_aw_valid;
  wire [3:0] axi4buf_1_auto_in_aw_bits_id;
  wire [29:0] axi4buf_1_auto_in_aw_bits_addr;
  wire  axi4buf_1_auto_in_aw_bits_echo_real_last;
  wire  axi4buf_1_auto_in_w_ready;
  wire  axi4buf_1_auto_in_w_valid;
  wire [31:0] axi4buf_1_auto_in_w_bits_data;
  wire [3:0] axi4buf_1_auto_in_w_bits_strb;
  wire  axi4buf_1_auto_in_w_bits_last;
  wire  axi4buf_1_auto_in_b_ready;
  wire  axi4buf_1_auto_in_b_valid;
  wire [3:0] axi4buf_1_auto_in_b_bits_id;
  wire [1:0] axi4buf_1_auto_in_b_bits_resp;
  wire  axi4buf_1_auto_in_b_bits_echo_real_last;
  wire  axi4buf_1_auto_in_ar_ready;
  wire  axi4buf_1_auto_in_ar_valid;
  wire [3:0] axi4buf_1_auto_in_ar_bits_id;
  wire [29:0] axi4buf_1_auto_in_ar_bits_addr;
  wire  axi4buf_1_auto_in_ar_bits_echo_real_last;
  wire  axi4buf_1_auto_in_r_ready;
  wire  axi4buf_1_auto_in_r_valid;
  wire [3:0] axi4buf_1_auto_in_r_bits_id;
  wire [31:0] axi4buf_1_auto_in_r_bits_data;
  wire [1:0] axi4buf_1_auto_in_r_bits_resp;
  wire  axi4buf_1_auto_in_r_bits_echo_real_last;
  wire  axi4buf_1_auto_in_r_bits_last;
  wire  axi4buf_1_auto_out_aw_ready;
  wire  axi4buf_1_auto_out_aw_valid;
  wire [3:0] axi4buf_1_auto_out_aw_bits_id;
  wire [29:0] axi4buf_1_auto_out_aw_bits_addr;
  wire  axi4buf_1_auto_out_aw_bits_echo_real_last;
  wire  axi4buf_1_auto_out_w_ready;
  wire  axi4buf_1_auto_out_w_valid;
  wire [31:0] axi4buf_1_auto_out_w_bits_data;
  wire [3:0] axi4buf_1_auto_out_w_bits_strb;
  wire  axi4buf_1_auto_out_b_ready;
  wire  axi4buf_1_auto_out_b_valid;
  wire [3:0] axi4buf_1_auto_out_b_bits_id;
  wire [1:0] axi4buf_1_auto_out_b_bits_resp;
  wire  axi4buf_1_auto_out_b_bits_echo_real_last;
  wire  axi4buf_1_auto_out_ar_ready;
  wire  axi4buf_1_auto_out_ar_valid;
  wire [3:0] axi4buf_1_auto_out_ar_bits_id;
  wire [29:0] axi4buf_1_auto_out_ar_bits_addr;
  wire  axi4buf_1_auto_out_ar_bits_echo_real_last;
  wire  axi4buf_1_auto_out_r_ready;
  wire  axi4buf_1_auto_out_r_valid;
  wire [3:0] axi4buf_1_auto_out_r_bits_id;
  wire [31:0] axi4buf_1_auto_out_r_bits_data;
  wire [1:0] axi4buf_1_auto_out_r_bits_resp;
  wire  axi4buf_1_auto_out_r_bits_echo_real_last;
  wire  axi4frag_1_clock;
  wire  axi4frag_1_reset;
  wire  axi4frag_1_auto_in_aw_ready;
  wire  axi4frag_1_auto_in_aw_valid;
  wire [3:0] axi4frag_1_auto_in_aw_bits_id;
  wire [29:0] axi4frag_1_auto_in_aw_bits_addr;
  wire [7:0] axi4frag_1_auto_in_aw_bits_len;
  wire [2:0] axi4frag_1_auto_in_aw_bits_size;
  wire [1:0] axi4frag_1_auto_in_aw_bits_burst;
  wire  axi4frag_1_auto_in_w_ready;
  wire  axi4frag_1_auto_in_w_valid;
  wire [31:0] axi4frag_1_auto_in_w_bits_data;
  wire [3:0] axi4frag_1_auto_in_w_bits_strb;
  wire  axi4frag_1_auto_in_w_bits_last;
  wire  axi4frag_1_auto_in_b_ready;
  wire  axi4frag_1_auto_in_b_valid;
  wire [3:0] axi4frag_1_auto_in_b_bits_id;
  wire [1:0] axi4frag_1_auto_in_b_bits_resp;
  wire  axi4frag_1_auto_in_ar_ready;
  wire  axi4frag_1_auto_in_ar_valid;
  wire [3:0] axi4frag_1_auto_in_ar_bits_id;
  wire [29:0] axi4frag_1_auto_in_ar_bits_addr;
  wire [7:0] axi4frag_1_auto_in_ar_bits_len;
  wire [2:0] axi4frag_1_auto_in_ar_bits_size;
  wire [1:0] axi4frag_1_auto_in_ar_bits_burst;
  wire  axi4frag_1_auto_in_r_ready;
  wire  axi4frag_1_auto_in_r_valid;
  wire [3:0] axi4frag_1_auto_in_r_bits_id;
  wire [31:0] axi4frag_1_auto_in_r_bits_data;
  wire [1:0] axi4frag_1_auto_in_r_bits_resp;
  wire  axi4frag_1_auto_in_r_bits_last;
  wire  axi4frag_1_auto_out_aw_ready;
  wire  axi4frag_1_auto_out_aw_valid;
  wire [3:0] axi4frag_1_auto_out_aw_bits_id;
  wire [29:0] axi4frag_1_auto_out_aw_bits_addr;
  wire  axi4frag_1_auto_out_aw_bits_echo_real_last;
  wire  axi4frag_1_auto_out_w_ready;
  wire  axi4frag_1_auto_out_w_valid;
  wire [31:0] axi4frag_1_auto_out_w_bits_data;
  wire [3:0] axi4frag_1_auto_out_w_bits_strb;
  wire  axi4frag_1_auto_out_w_bits_last;
  wire  axi4frag_1_auto_out_b_ready;
  wire  axi4frag_1_auto_out_b_valid;
  wire [3:0] axi4frag_1_auto_out_b_bits_id;
  wire [1:0] axi4frag_1_auto_out_b_bits_resp;
  wire  axi4frag_1_auto_out_b_bits_echo_real_last;
  wire  axi4frag_1_auto_out_ar_ready;
  wire  axi4frag_1_auto_out_ar_valid;
  wire [3:0] axi4frag_1_auto_out_ar_bits_id;
  wire [29:0] axi4frag_1_auto_out_ar_bits_addr;
  wire  axi4frag_1_auto_out_ar_bits_echo_real_last;
  wire  axi4frag_1_auto_out_r_ready;
  wire  axi4frag_1_auto_out_r_valid;
  wire [3:0] axi4frag_1_auto_out_r_bits_id;
  wire [31:0] axi4frag_1_auto_out_r_bits_data;
  wire [1:0] axi4frag_1_auto_out_r_bits_resp;
  wire  axi4frag_1_auto_out_r_bits_echo_real_last;
  wire  axi4frag_1_auto_out_r_bits_last;
  wire  axi4buf_2_clock;
  wire  axi4buf_2_reset;
  wire  axi4buf_2_auto_in_aw_ready;
  wire  axi4buf_2_auto_in_aw_valid;
  wire [3:0] axi4buf_2_auto_in_aw_bits_id;
  wire [30:0] axi4buf_2_auto_in_aw_bits_addr;
  wire  axi4buf_2_auto_in_aw_bits_echo_real_last;
  wire  axi4buf_2_auto_in_w_ready;
  wire  axi4buf_2_auto_in_w_valid;
  wire [31:0] axi4buf_2_auto_in_w_bits_data;
  wire [3:0] axi4buf_2_auto_in_w_bits_strb;
  wire  axi4buf_2_auto_in_w_bits_last;
  wire  axi4buf_2_auto_in_b_ready;
  wire  axi4buf_2_auto_in_b_valid;
  wire [3:0] axi4buf_2_auto_in_b_bits_id;
  wire [1:0] axi4buf_2_auto_in_b_bits_resp;
  wire  axi4buf_2_auto_in_b_bits_echo_real_last;
  wire  axi4buf_2_auto_in_ar_ready;
  wire  axi4buf_2_auto_in_ar_valid;
  wire [3:0] axi4buf_2_auto_in_ar_bits_id;
  wire [30:0] axi4buf_2_auto_in_ar_bits_addr;
  wire  axi4buf_2_auto_in_ar_bits_echo_real_last;
  wire  axi4buf_2_auto_in_r_ready;
  wire  axi4buf_2_auto_in_r_valid;
  wire [3:0] axi4buf_2_auto_in_r_bits_id;
  wire [31:0] axi4buf_2_auto_in_r_bits_data;
  wire [1:0] axi4buf_2_auto_in_r_bits_resp;
  wire  axi4buf_2_auto_in_r_bits_echo_real_last;
  wire  axi4buf_2_auto_in_r_bits_last;
  wire  axi4buf_2_auto_out_aw_ready;
  wire  axi4buf_2_auto_out_aw_valid;
  wire [3:0] axi4buf_2_auto_out_aw_bits_id;
  wire [30:0] axi4buf_2_auto_out_aw_bits_addr;
  wire  axi4buf_2_auto_out_aw_bits_echo_real_last;
  wire  axi4buf_2_auto_out_w_ready;
  wire  axi4buf_2_auto_out_w_valid;
  wire [31:0] axi4buf_2_auto_out_w_bits_data;
  wire [3:0] axi4buf_2_auto_out_w_bits_strb;
  wire  axi4buf_2_auto_out_b_ready;
  wire  axi4buf_2_auto_out_b_valid;
  wire [3:0] axi4buf_2_auto_out_b_bits_id;
  wire [1:0] axi4buf_2_auto_out_b_bits_resp;
  wire  axi4buf_2_auto_out_b_bits_echo_real_last;
  wire  axi4buf_2_auto_out_ar_ready;
  wire  axi4buf_2_auto_out_ar_valid;
  wire [3:0] axi4buf_2_auto_out_ar_bits_id;
  wire [30:0] axi4buf_2_auto_out_ar_bits_addr;
  wire  axi4buf_2_auto_out_ar_bits_echo_real_last;
  wire  axi4buf_2_auto_out_r_ready;
  wire  axi4buf_2_auto_out_r_valid;
  wire [3:0] axi4buf_2_auto_out_r_bits_id;
  wire [31:0] axi4buf_2_auto_out_r_bits_data;
  wire [1:0] axi4buf_2_auto_out_r_bits_resp;
  wire  axi4buf_2_auto_out_r_bits_echo_real_last;
  wire  axi4frag_2_clock;
  wire  axi4frag_2_reset;
  wire  axi4frag_2_auto_in_aw_ready;
  wire  axi4frag_2_auto_in_aw_valid;
  wire [3:0] axi4frag_2_auto_in_aw_bits_id;
  wire [30:0] axi4frag_2_auto_in_aw_bits_addr;
  wire [7:0] axi4frag_2_auto_in_aw_bits_len;
  wire [2:0] axi4frag_2_auto_in_aw_bits_size;
  wire [1:0] axi4frag_2_auto_in_aw_bits_burst;
  wire  axi4frag_2_auto_in_w_ready;
  wire  axi4frag_2_auto_in_w_valid;
  wire [31:0] axi4frag_2_auto_in_w_bits_data;
  wire [3:0] axi4frag_2_auto_in_w_bits_strb;
  wire  axi4frag_2_auto_in_w_bits_last;
  wire  axi4frag_2_auto_in_b_ready;
  wire  axi4frag_2_auto_in_b_valid;
  wire [3:0] axi4frag_2_auto_in_b_bits_id;
  wire [1:0] axi4frag_2_auto_in_b_bits_resp;
  wire  axi4frag_2_auto_in_ar_ready;
  wire  axi4frag_2_auto_in_ar_valid;
  wire [3:0] axi4frag_2_auto_in_ar_bits_id;
  wire [30:0] axi4frag_2_auto_in_ar_bits_addr;
  wire [7:0] axi4frag_2_auto_in_ar_bits_len;
  wire [2:0] axi4frag_2_auto_in_ar_bits_size;
  wire [1:0] axi4frag_2_auto_in_ar_bits_burst;
  wire  axi4frag_2_auto_in_r_ready;
  wire  axi4frag_2_auto_in_r_valid;
  wire [3:0] axi4frag_2_auto_in_r_bits_id;
  wire [31:0] axi4frag_2_auto_in_r_bits_data;
  wire [1:0] axi4frag_2_auto_in_r_bits_resp;
  wire  axi4frag_2_auto_in_r_bits_last;
  wire  axi4frag_2_auto_out_aw_ready;
  wire  axi4frag_2_auto_out_aw_valid;
  wire [3:0] axi4frag_2_auto_out_aw_bits_id;
  wire [30:0] axi4frag_2_auto_out_aw_bits_addr;
  wire  axi4frag_2_auto_out_aw_bits_echo_real_last;
  wire  axi4frag_2_auto_out_w_ready;
  wire  axi4frag_2_auto_out_w_valid;
  wire [31:0] axi4frag_2_auto_out_w_bits_data;
  wire [3:0] axi4frag_2_auto_out_w_bits_strb;
  wire  axi4frag_2_auto_out_w_bits_last;
  wire  axi4frag_2_auto_out_b_ready;
  wire  axi4frag_2_auto_out_b_valid;
  wire [3:0] axi4frag_2_auto_out_b_bits_id;
  wire [1:0] axi4frag_2_auto_out_b_bits_resp;
  wire  axi4frag_2_auto_out_b_bits_echo_real_last;
  wire  axi4frag_2_auto_out_ar_ready;
  wire  axi4frag_2_auto_out_ar_valid;
  wire [3:0] axi4frag_2_auto_out_ar_bits_id;
  wire [30:0] axi4frag_2_auto_out_ar_bits_addr;
  wire  axi4frag_2_auto_out_ar_bits_echo_real_last;
  wire  axi4frag_2_auto_out_r_ready;
  wire  axi4frag_2_auto_out_r_valid;
  wire [3:0] axi4frag_2_auto_out_r_bits_id;
  wire [31:0] axi4frag_2_auto_out_r_bits_data;
  wire [1:0] axi4frag_2_auto_out_r_bits_resp;
  wire  axi4frag_2_auto_out_r_bits_echo_real_last;
  wire  axi4frag_2_auto_out_r_bits_last;
  wire  axi4buf_3_clock;
  wire  axi4buf_3_reset;
  wire  axi4buf_3_auto_in_aw_ready;
  wire  axi4buf_3_auto_in_aw_valid;
  wire [3:0] axi4buf_3_auto_in_aw_bits_id;
  wire [31:0] axi4buf_3_auto_in_aw_bits_addr;
  wire  axi4buf_3_auto_in_aw_bits_echo_real_last;
  wire  axi4buf_3_auto_in_w_ready;
  wire  axi4buf_3_auto_in_w_valid;
  wire [31:0] axi4buf_3_auto_in_w_bits_data;
  wire [3:0] axi4buf_3_auto_in_w_bits_strb;
  wire  axi4buf_3_auto_in_w_bits_last;
  wire  axi4buf_3_auto_in_b_ready;
  wire  axi4buf_3_auto_in_b_valid;
  wire [3:0] axi4buf_3_auto_in_b_bits_id;
  wire [1:0] axi4buf_3_auto_in_b_bits_resp;
  wire  axi4buf_3_auto_in_b_bits_echo_real_last;
  wire  axi4buf_3_auto_in_ar_ready;
  wire  axi4buf_3_auto_in_ar_valid;
  wire [3:0] axi4buf_3_auto_in_ar_bits_id;
  wire [31:0] axi4buf_3_auto_in_ar_bits_addr;
  wire  axi4buf_3_auto_in_ar_bits_echo_real_last;
  wire  axi4buf_3_auto_in_r_ready;
  wire  axi4buf_3_auto_in_r_valid;
  wire [3:0] axi4buf_3_auto_in_r_bits_id;
  wire [31:0] axi4buf_3_auto_in_r_bits_data;
  wire [1:0] axi4buf_3_auto_in_r_bits_resp;
  wire  axi4buf_3_auto_in_r_bits_echo_real_last;
  wire  axi4buf_3_auto_in_r_bits_last;
  wire  axi4buf_3_auto_out_aw_ready;
  wire  axi4buf_3_auto_out_aw_valid;
  wire [3:0] axi4buf_3_auto_out_aw_bits_id;
  wire [31:0] axi4buf_3_auto_out_aw_bits_addr;
  wire  axi4buf_3_auto_out_aw_bits_echo_real_last;
  wire  axi4buf_3_auto_out_w_ready;
  wire  axi4buf_3_auto_out_w_valid;
  wire [31:0] axi4buf_3_auto_out_w_bits_data;
  wire [3:0] axi4buf_3_auto_out_w_bits_strb;
  wire  axi4buf_3_auto_out_b_ready;
  wire  axi4buf_3_auto_out_b_valid;
  wire [3:0] axi4buf_3_auto_out_b_bits_id;
  wire [1:0] axi4buf_3_auto_out_b_bits_resp;
  wire  axi4buf_3_auto_out_b_bits_echo_real_last;
  wire  axi4buf_3_auto_out_ar_ready;
  wire  axi4buf_3_auto_out_ar_valid;
  wire [3:0] axi4buf_3_auto_out_ar_bits_id;
  wire [31:0] axi4buf_3_auto_out_ar_bits_addr;
  wire  axi4buf_3_auto_out_ar_bits_echo_real_last;
  wire  axi4buf_3_auto_out_r_ready;
  wire  axi4buf_3_auto_out_r_valid;
  wire [3:0] axi4buf_3_auto_out_r_bits_id;
  wire [31:0] axi4buf_3_auto_out_r_bits_data;
  wire [1:0] axi4buf_3_auto_out_r_bits_resp;
  wire  axi4buf_3_auto_out_r_bits_echo_real_last;
  wire  axi4frag_3_clock;
  wire  axi4frag_3_reset;
  wire  axi4frag_3_auto_in_aw_ready;
  wire  axi4frag_3_auto_in_aw_valid;
  wire [3:0] axi4frag_3_auto_in_aw_bits_id;
  wire [31:0] axi4frag_3_auto_in_aw_bits_addr;
  wire [7:0] axi4frag_3_auto_in_aw_bits_len;
  wire [2:0] axi4frag_3_auto_in_aw_bits_size;
  wire [1:0] axi4frag_3_auto_in_aw_bits_burst;
  wire  axi4frag_3_auto_in_w_ready;
  wire  axi4frag_3_auto_in_w_valid;
  wire [31:0] axi4frag_3_auto_in_w_bits_data;
  wire [3:0] axi4frag_3_auto_in_w_bits_strb;
  wire  axi4frag_3_auto_in_w_bits_last;
  wire  axi4frag_3_auto_in_b_ready;
  wire  axi4frag_3_auto_in_b_valid;
  wire [3:0] axi4frag_3_auto_in_b_bits_id;
  wire [1:0] axi4frag_3_auto_in_b_bits_resp;
  wire  axi4frag_3_auto_in_ar_ready;
  wire  axi4frag_3_auto_in_ar_valid;
  wire [3:0] axi4frag_3_auto_in_ar_bits_id;
  wire [31:0] axi4frag_3_auto_in_ar_bits_addr;
  wire [7:0] axi4frag_3_auto_in_ar_bits_len;
  wire [2:0] axi4frag_3_auto_in_ar_bits_size;
  wire [1:0] axi4frag_3_auto_in_ar_bits_burst;
  wire  axi4frag_3_auto_in_r_ready;
  wire  axi4frag_3_auto_in_r_valid;
  wire [3:0] axi4frag_3_auto_in_r_bits_id;
  wire [31:0] axi4frag_3_auto_in_r_bits_data;
  wire [1:0] axi4frag_3_auto_in_r_bits_resp;
  wire  axi4frag_3_auto_in_r_bits_last;
  wire  axi4frag_3_auto_out_aw_ready;
  wire  axi4frag_3_auto_out_aw_valid;
  wire [3:0] axi4frag_3_auto_out_aw_bits_id;
  wire [31:0] axi4frag_3_auto_out_aw_bits_addr;
  wire  axi4frag_3_auto_out_aw_bits_echo_real_last;
  wire  axi4frag_3_auto_out_w_ready;
  wire  axi4frag_3_auto_out_w_valid;
  wire [31:0] axi4frag_3_auto_out_w_bits_data;
  wire [3:0] axi4frag_3_auto_out_w_bits_strb;
  wire  axi4frag_3_auto_out_w_bits_last;
  wire  axi4frag_3_auto_out_b_ready;
  wire  axi4frag_3_auto_out_b_valid;
  wire [3:0] axi4frag_3_auto_out_b_bits_id;
  wire [1:0] axi4frag_3_auto_out_b_bits_resp;
  wire  axi4frag_3_auto_out_b_bits_echo_real_last;
  wire  axi4frag_3_auto_out_ar_ready;
  wire  axi4frag_3_auto_out_ar_valid;
  wire [3:0] axi4frag_3_auto_out_ar_bits_id;
  wire [31:0] axi4frag_3_auto_out_ar_bits_addr;
  wire  axi4frag_3_auto_out_ar_bits_echo_real_last;
  wire  axi4frag_3_auto_out_r_ready;
  wire  axi4frag_3_auto_out_r_valid;
  wire [3:0] axi4frag_3_auto_out_r_bits_id;
  wire [31:0] axi4frag_3_auto_out_r_bits_data;
  wire [1:0] axi4frag_3_auto_out_r_bits_resp;
  wire  axi4frag_3_auto_out_r_bits_echo_real_last;
  wire  axi4frag_3_auto_out_r_bits_last;
  AXI4RAM srams (
    .clock(srams_clock),
    .reset(srams_reset),
    .auto_in_aw_ready(srams_auto_in_aw_ready),
    .auto_in_aw_valid(srams_auto_in_aw_valid),
    .auto_in_aw_bits_id(srams_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(srams_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(srams_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(srams_auto_in_w_ready),
    .auto_in_w_valid(srams_auto_in_w_valid),
    .auto_in_w_bits_data(srams_auto_in_w_bits_data),
    .auto_in_w_bits_strb(srams_auto_in_w_bits_strb),
    .auto_in_b_ready(srams_auto_in_b_ready),
    .auto_in_b_valid(srams_auto_in_b_valid),
    .auto_in_b_bits_id(srams_auto_in_b_bits_id),
    .auto_in_b_bits_resp(srams_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(srams_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(srams_auto_in_ar_ready),
    .auto_in_ar_valid(srams_auto_in_ar_valid),
    .auto_in_ar_bits_id(srams_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(srams_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(srams_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(srams_auto_in_r_ready),
    .auto_in_r_valid(srams_auto_in_r_valid),
    .auto_in_r_bits_id(srams_auto_in_r_bits_id),
    .auto_in_r_bits_data(srams_auto_in_r_bits_data),
    .auto_in_r_bits_resp(srams_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(srams_auto_in_r_bits_echo_real_last)
  );
  AXI4RAM_1 srams_1 (
    .clock(srams_1_clock),
    .reset(srams_1_reset),
    .auto_in_aw_ready(srams_1_auto_in_aw_ready),
    .auto_in_aw_valid(srams_1_auto_in_aw_valid),
    .auto_in_aw_bits_id(srams_1_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(srams_1_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(srams_1_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(srams_1_auto_in_w_ready),
    .auto_in_w_valid(srams_1_auto_in_w_valid),
    .auto_in_w_bits_data(srams_1_auto_in_w_bits_data),
    .auto_in_w_bits_strb(srams_1_auto_in_w_bits_strb),
    .auto_in_b_ready(srams_1_auto_in_b_ready),
    .auto_in_b_valid(srams_1_auto_in_b_valid),
    .auto_in_b_bits_id(srams_1_auto_in_b_bits_id),
    .auto_in_b_bits_resp(srams_1_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(srams_1_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(srams_1_auto_in_ar_ready),
    .auto_in_ar_valid(srams_1_auto_in_ar_valid),
    .auto_in_ar_bits_id(srams_1_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(srams_1_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(srams_1_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(srams_1_auto_in_r_ready),
    .auto_in_r_valid(srams_1_auto_in_r_valid),
    .auto_in_r_bits_id(srams_1_auto_in_r_bits_id),
    .auto_in_r_bits_data(srams_1_auto_in_r_bits_data),
    .auto_in_r_bits_resp(srams_1_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(srams_1_auto_in_r_bits_echo_real_last)
  );
  AXI4RAM_2 srams_2 (
    .clock(srams_2_clock),
    .reset(srams_2_reset),
    .auto_in_aw_ready(srams_2_auto_in_aw_ready),
    .auto_in_aw_valid(srams_2_auto_in_aw_valid),
    .auto_in_aw_bits_id(srams_2_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(srams_2_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(srams_2_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(srams_2_auto_in_w_ready),
    .auto_in_w_valid(srams_2_auto_in_w_valid),
    .auto_in_w_bits_data(srams_2_auto_in_w_bits_data),
    .auto_in_w_bits_strb(srams_2_auto_in_w_bits_strb),
    .auto_in_b_ready(srams_2_auto_in_b_ready),
    .auto_in_b_valid(srams_2_auto_in_b_valid),
    .auto_in_b_bits_id(srams_2_auto_in_b_bits_id),
    .auto_in_b_bits_resp(srams_2_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(srams_2_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(srams_2_auto_in_ar_ready),
    .auto_in_ar_valid(srams_2_auto_in_ar_valid),
    .auto_in_ar_bits_id(srams_2_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(srams_2_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(srams_2_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(srams_2_auto_in_r_ready),
    .auto_in_r_valid(srams_2_auto_in_r_valid),
    .auto_in_r_bits_id(srams_2_auto_in_r_bits_id),
    .auto_in_r_bits_data(srams_2_auto_in_r_bits_data),
    .auto_in_r_bits_resp(srams_2_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(srams_2_auto_in_r_bits_echo_real_last)
  );
  AXI4RAM_3 srams_3 (
    .clock(srams_3_clock),
    .reset(srams_3_reset),
    .auto_in_aw_ready(srams_3_auto_in_aw_ready),
    .auto_in_aw_valid(srams_3_auto_in_aw_valid),
    .auto_in_aw_bits_id(srams_3_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(srams_3_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(srams_3_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(srams_3_auto_in_w_ready),
    .auto_in_w_valid(srams_3_auto_in_w_valid),
    .auto_in_w_bits_data(srams_3_auto_in_w_bits_data),
    .auto_in_w_bits_strb(srams_3_auto_in_w_bits_strb),
    .auto_in_b_ready(srams_3_auto_in_b_ready),
    .auto_in_b_valid(srams_3_auto_in_b_valid),
    .auto_in_b_bits_id(srams_3_auto_in_b_bits_id),
    .auto_in_b_bits_resp(srams_3_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(srams_3_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(srams_3_auto_in_ar_ready),
    .auto_in_ar_valid(srams_3_auto_in_ar_valid),
    .auto_in_ar_bits_id(srams_3_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(srams_3_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(srams_3_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(srams_3_auto_in_r_ready),
    .auto_in_r_valid(srams_3_auto_in_r_valid),
    .auto_in_r_bits_id(srams_3_auto_in_r_bits_id),
    .auto_in_r_bits_data(srams_3_auto_in_r_bits_data),
    .auto_in_r_bits_resp(srams_3_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(srams_3_auto_in_r_bits_echo_real_last)
  );
  AXI4Xbar axi4xbar (
    .clock(axi4xbar_clock),
    .reset(axi4xbar_reset),
    .auto_in_aw_ready(axi4xbar_auto_in_aw_ready),
    .auto_in_aw_valid(axi4xbar_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4xbar_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4xbar_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4xbar_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4xbar_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4xbar_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4xbar_auto_in_w_ready),
    .auto_in_w_valid(axi4xbar_auto_in_w_valid),
    .auto_in_w_bits_data(axi4xbar_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4xbar_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4xbar_auto_in_w_bits_last),
    .auto_in_b_ready(axi4xbar_auto_in_b_ready),
    .auto_in_b_valid(axi4xbar_auto_in_b_valid),
    .auto_in_b_bits_id(axi4xbar_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4xbar_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4xbar_auto_in_ar_ready),
    .auto_in_ar_valid(axi4xbar_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4xbar_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4xbar_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4xbar_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4xbar_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4xbar_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4xbar_auto_in_r_ready),
    .auto_in_r_valid(axi4xbar_auto_in_r_valid),
    .auto_in_r_bits_id(axi4xbar_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4xbar_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4xbar_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4xbar_auto_in_r_bits_last),
    .auto_out_3_aw_ready(axi4xbar_auto_out_3_aw_ready),
    .auto_out_3_aw_valid(axi4xbar_auto_out_3_aw_valid),
    .auto_out_3_aw_bits_id(axi4xbar_auto_out_3_aw_bits_id),
    .auto_out_3_aw_bits_addr(axi4xbar_auto_out_3_aw_bits_addr),
    .auto_out_3_aw_bits_len(axi4xbar_auto_out_3_aw_bits_len),
    .auto_out_3_aw_bits_size(axi4xbar_auto_out_3_aw_bits_size),
    .auto_out_3_aw_bits_burst(axi4xbar_auto_out_3_aw_bits_burst),
    .auto_out_3_w_ready(axi4xbar_auto_out_3_w_ready),
    .auto_out_3_w_valid(axi4xbar_auto_out_3_w_valid),
    .auto_out_3_w_bits_data(axi4xbar_auto_out_3_w_bits_data),
    .auto_out_3_w_bits_strb(axi4xbar_auto_out_3_w_bits_strb),
    .auto_out_3_w_bits_last(axi4xbar_auto_out_3_w_bits_last),
    .auto_out_3_b_ready(axi4xbar_auto_out_3_b_ready),
    .auto_out_3_b_valid(axi4xbar_auto_out_3_b_valid),
    .auto_out_3_b_bits_id(axi4xbar_auto_out_3_b_bits_id),
    .auto_out_3_b_bits_resp(axi4xbar_auto_out_3_b_bits_resp),
    .auto_out_3_ar_ready(axi4xbar_auto_out_3_ar_ready),
    .auto_out_3_ar_valid(axi4xbar_auto_out_3_ar_valid),
    .auto_out_3_ar_bits_id(axi4xbar_auto_out_3_ar_bits_id),
    .auto_out_3_ar_bits_addr(axi4xbar_auto_out_3_ar_bits_addr),
    .auto_out_3_ar_bits_len(axi4xbar_auto_out_3_ar_bits_len),
    .auto_out_3_ar_bits_size(axi4xbar_auto_out_3_ar_bits_size),
    .auto_out_3_ar_bits_burst(axi4xbar_auto_out_3_ar_bits_burst),
    .auto_out_3_r_ready(axi4xbar_auto_out_3_r_ready),
    .auto_out_3_r_valid(axi4xbar_auto_out_3_r_valid),
    .auto_out_3_r_bits_id(axi4xbar_auto_out_3_r_bits_id),
    .auto_out_3_r_bits_data(axi4xbar_auto_out_3_r_bits_data),
    .auto_out_3_r_bits_resp(axi4xbar_auto_out_3_r_bits_resp),
    .auto_out_3_r_bits_last(axi4xbar_auto_out_3_r_bits_last),
    .auto_out_2_aw_ready(axi4xbar_auto_out_2_aw_ready),
    .auto_out_2_aw_valid(axi4xbar_auto_out_2_aw_valid),
    .auto_out_2_aw_bits_id(axi4xbar_auto_out_2_aw_bits_id),
    .auto_out_2_aw_bits_addr(axi4xbar_auto_out_2_aw_bits_addr),
    .auto_out_2_aw_bits_len(axi4xbar_auto_out_2_aw_bits_len),
    .auto_out_2_aw_bits_size(axi4xbar_auto_out_2_aw_bits_size),
    .auto_out_2_aw_bits_burst(axi4xbar_auto_out_2_aw_bits_burst),
    .auto_out_2_w_ready(axi4xbar_auto_out_2_w_ready),
    .auto_out_2_w_valid(axi4xbar_auto_out_2_w_valid),
    .auto_out_2_w_bits_data(axi4xbar_auto_out_2_w_bits_data),
    .auto_out_2_w_bits_strb(axi4xbar_auto_out_2_w_bits_strb),
    .auto_out_2_w_bits_last(axi4xbar_auto_out_2_w_bits_last),
    .auto_out_2_b_ready(axi4xbar_auto_out_2_b_ready),
    .auto_out_2_b_valid(axi4xbar_auto_out_2_b_valid),
    .auto_out_2_b_bits_id(axi4xbar_auto_out_2_b_bits_id),
    .auto_out_2_b_bits_resp(axi4xbar_auto_out_2_b_bits_resp),
    .auto_out_2_ar_ready(axi4xbar_auto_out_2_ar_ready),
    .auto_out_2_ar_valid(axi4xbar_auto_out_2_ar_valid),
    .auto_out_2_ar_bits_id(axi4xbar_auto_out_2_ar_bits_id),
    .auto_out_2_ar_bits_addr(axi4xbar_auto_out_2_ar_bits_addr),
    .auto_out_2_ar_bits_len(axi4xbar_auto_out_2_ar_bits_len),
    .auto_out_2_ar_bits_size(axi4xbar_auto_out_2_ar_bits_size),
    .auto_out_2_ar_bits_burst(axi4xbar_auto_out_2_ar_bits_burst),
    .auto_out_2_r_ready(axi4xbar_auto_out_2_r_ready),
    .auto_out_2_r_valid(axi4xbar_auto_out_2_r_valid),
    .auto_out_2_r_bits_id(axi4xbar_auto_out_2_r_bits_id),
    .auto_out_2_r_bits_data(axi4xbar_auto_out_2_r_bits_data),
    .auto_out_2_r_bits_resp(axi4xbar_auto_out_2_r_bits_resp),
    .auto_out_2_r_bits_last(axi4xbar_auto_out_2_r_bits_last),
    .auto_out_1_aw_ready(axi4xbar_auto_out_1_aw_ready),
    .auto_out_1_aw_valid(axi4xbar_auto_out_1_aw_valid),
    .auto_out_1_aw_bits_id(axi4xbar_auto_out_1_aw_bits_id),
    .auto_out_1_aw_bits_addr(axi4xbar_auto_out_1_aw_bits_addr),
    .auto_out_1_aw_bits_len(axi4xbar_auto_out_1_aw_bits_len),
    .auto_out_1_aw_bits_size(axi4xbar_auto_out_1_aw_bits_size),
    .auto_out_1_aw_bits_burst(axi4xbar_auto_out_1_aw_bits_burst),
    .auto_out_1_w_ready(axi4xbar_auto_out_1_w_ready),
    .auto_out_1_w_valid(axi4xbar_auto_out_1_w_valid),
    .auto_out_1_w_bits_data(axi4xbar_auto_out_1_w_bits_data),
    .auto_out_1_w_bits_strb(axi4xbar_auto_out_1_w_bits_strb),
    .auto_out_1_w_bits_last(axi4xbar_auto_out_1_w_bits_last),
    .auto_out_1_b_ready(axi4xbar_auto_out_1_b_ready),
    .auto_out_1_b_valid(axi4xbar_auto_out_1_b_valid),
    .auto_out_1_b_bits_id(axi4xbar_auto_out_1_b_bits_id),
    .auto_out_1_b_bits_resp(axi4xbar_auto_out_1_b_bits_resp),
    .auto_out_1_ar_ready(axi4xbar_auto_out_1_ar_ready),
    .auto_out_1_ar_valid(axi4xbar_auto_out_1_ar_valid),
    .auto_out_1_ar_bits_id(axi4xbar_auto_out_1_ar_bits_id),
    .auto_out_1_ar_bits_addr(axi4xbar_auto_out_1_ar_bits_addr),
    .auto_out_1_ar_bits_len(axi4xbar_auto_out_1_ar_bits_len),
    .auto_out_1_ar_bits_size(axi4xbar_auto_out_1_ar_bits_size),
    .auto_out_1_ar_bits_burst(axi4xbar_auto_out_1_ar_bits_burst),
    .auto_out_1_r_ready(axi4xbar_auto_out_1_r_ready),
    .auto_out_1_r_valid(axi4xbar_auto_out_1_r_valid),
    .auto_out_1_r_bits_id(axi4xbar_auto_out_1_r_bits_id),
    .auto_out_1_r_bits_data(axi4xbar_auto_out_1_r_bits_data),
    .auto_out_1_r_bits_resp(axi4xbar_auto_out_1_r_bits_resp),
    .auto_out_1_r_bits_last(axi4xbar_auto_out_1_r_bits_last),
    .auto_out_0_aw_ready(axi4xbar_auto_out_0_aw_ready),
    .auto_out_0_aw_valid(axi4xbar_auto_out_0_aw_valid),
    .auto_out_0_aw_bits_id(axi4xbar_auto_out_0_aw_bits_id),
    .auto_out_0_aw_bits_addr(axi4xbar_auto_out_0_aw_bits_addr),
    .auto_out_0_aw_bits_len(axi4xbar_auto_out_0_aw_bits_len),
    .auto_out_0_aw_bits_size(axi4xbar_auto_out_0_aw_bits_size),
    .auto_out_0_aw_bits_burst(axi4xbar_auto_out_0_aw_bits_burst),
    .auto_out_0_w_ready(axi4xbar_auto_out_0_w_ready),
    .auto_out_0_w_valid(axi4xbar_auto_out_0_w_valid),
    .auto_out_0_w_bits_data(axi4xbar_auto_out_0_w_bits_data),
    .auto_out_0_w_bits_strb(axi4xbar_auto_out_0_w_bits_strb),
    .auto_out_0_w_bits_last(axi4xbar_auto_out_0_w_bits_last),
    .auto_out_0_b_ready(axi4xbar_auto_out_0_b_ready),
    .auto_out_0_b_valid(axi4xbar_auto_out_0_b_valid),
    .auto_out_0_b_bits_id(axi4xbar_auto_out_0_b_bits_id),
    .auto_out_0_b_bits_resp(axi4xbar_auto_out_0_b_bits_resp),
    .auto_out_0_ar_ready(axi4xbar_auto_out_0_ar_ready),
    .auto_out_0_ar_valid(axi4xbar_auto_out_0_ar_valid),
    .auto_out_0_ar_bits_id(axi4xbar_auto_out_0_ar_bits_id),
    .auto_out_0_ar_bits_addr(axi4xbar_auto_out_0_ar_bits_addr),
    .auto_out_0_ar_bits_len(axi4xbar_auto_out_0_ar_bits_len),
    .auto_out_0_ar_bits_size(axi4xbar_auto_out_0_ar_bits_size),
    .auto_out_0_ar_bits_burst(axi4xbar_auto_out_0_ar_bits_burst),
    .auto_out_0_r_ready(axi4xbar_auto_out_0_r_ready),
    .auto_out_0_r_valid(axi4xbar_auto_out_0_r_valid),
    .auto_out_0_r_bits_id(axi4xbar_auto_out_0_r_bits_id),
    .auto_out_0_r_bits_data(axi4xbar_auto_out_0_r_bits_data),
    .auto_out_0_r_bits_resp(axi4xbar_auto_out_0_r_bits_resp),
    .auto_out_0_r_bits_last(axi4xbar_auto_out_0_r_bits_last)
  );
  AXI4Buffer_1 axi4buf (
    .clock(axi4buf_clock),
    .reset(axi4buf_reset),
    .auto_in_aw_ready(axi4buf_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(axi4buf_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(axi4buf_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4buf_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(axi4buf_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(axi4buf_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(axi4buf_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(axi4buf_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4buf_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(axi4buf_auto_in_r_bits_echo_real_last),
    .auto_in_r_bits_last(axi4buf_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4buf_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4buf_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4buf_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4buf_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4buf_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4buf_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4buf_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4buf_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4buf_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4buf_auto_out_r_bits_echo_real_last)
  );
  AXI4Fragmenter_1 axi4frag (
    .clock(axi4frag_clock),
    .reset(axi4frag_reset),
    .auto_in_aw_ready(axi4frag_auto_in_aw_ready),
    .auto_in_aw_valid(axi4frag_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4frag_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4frag_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4frag_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4frag_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4frag_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4frag_auto_in_w_ready),
    .auto_in_w_valid(axi4frag_auto_in_w_valid),
    .auto_in_w_bits_data(axi4frag_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4frag_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4frag_auto_in_w_bits_last),
    .auto_in_b_ready(axi4frag_auto_in_b_ready),
    .auto_in_b_valid(axi4frag_auto_in_b_valid),
    .auto_in_b_bits_id(axi4frag_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4frag_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4frag_auto_in_ar_ready),
    .auto_in_ar_valid(axi4frag_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4frag_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4frag_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4frag_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4frag_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4frag_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4frag_auto_in_r_ready),
    .auto_in_r_valid(axi4frag_auto_in_r_valid),
    .auto_in_r_bits_id(axi4frag_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4frag_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4frag_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4frag_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4frag_auto_out_aw_ready),
    .auto_out_aw_valid(axi4frag_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4frag_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4frag_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4frag_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4frag_auto_out_w_ready),
    .auto_out_w_valid(axi4frag_auto_out_w_valid),
    .auto_out_w_bits_data(axi4frag_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4frag_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4frag_auto_out_w_bits_last),
    .auto_out_b_ready(axi4frag_auto_out_b_ready),
    .auto_out_b_valid(axi4frag_auto_out_b_valid),
    .auto_out_b_bits_id(axi4frag_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4frag_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4frag_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4frag_auto_out_ar_ready),
    .auto_out_ar_valid(axi4frag_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4frag_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4frag_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4frag_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4frag_auto_out_r_ready),
    .auto_out_r_valid(axi4frag_auto_out_r_valid),
    .auto_out_r_bits_id(axi4frag_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4frag_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4frag_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4frag_auto_out_r_bits_echo_real_last),
    .auto_out_r_bits_last(axi4frag_auto_out_r_bits_last)
  );
  AXI4Buffer_2 axi4buf_1 (
    .clock(axi4buf_1_clock),
    .reset(axi4buf_1_reset),
    .auto_in_aw_ready(axi4buf_1_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_1_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_1_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_1_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(axi4buf_1_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(axi4buf_1_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_1_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_1_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_1_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_1_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_1_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_1_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_1_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4buf_1_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(axi4buf_1_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(axi4buf_1_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_1_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_1_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_1_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(axi4buf_1_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(axi4buf_1_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_1_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_1_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4buf_1_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_1_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(axi4buf_1_auto_in_r_bits_echo_real_last),
    .auto_in_r_bits_last(axi4buf_1_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_1_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_1_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_1_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_1_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4buf_1_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4buf_1_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_1_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_1_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_1_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4buf_1_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_1_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_1_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4buf_1_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4buf_1_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4buf_1_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_1_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_1_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_1_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4buf_1_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4buf_1_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_1_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_1_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4buf_1_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_1_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4buf_1_auto_out_r_bits_echo_real_last)
  );
  AXI4Fragmenter_2 axi4frag_1 (
    .clock(axi4frag_1_clock),
    .reset(axi4frag_1_reset),
    .auto_in_aw_ready(axi4frag_1_auto_in_aw_ready),
    .auto_in_aw_valid(axi4frag_1_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4frag_1_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4frag_1_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4frag_1_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4frag_1_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4frag_1_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4frag_1_auto_in_w_ready),
    .auto_in_w_valid(axi4frag_1_auto_in_w_valid),
    .auto_in_w_bits_data(axi4frag_1_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4frag_1_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4frag_1_auto_in_w_bits_last),
    .auto_in_b_ready(axi4frag_1_auto_in_b_ready),
    .auto_in_b_valid(axi4frag_1_auto_in_b_valid),
    .auto_in_b_bits_id(axi4frag_1_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4frag_1_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4frag_1_auto_in_ar_ready),
    .auto_in_ar_valid(axi4frag_1_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4frag_1_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4frag_1_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4frag_1_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4frag_1_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4frag_1_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4frag_1_auto_in_r_ready),
    .auto_in_r_valid(axi4frag_1_auto_in_r_valid),
    .auto_in_r_bits_id(axi4frag_1_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4frag_1_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4frag_1_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4frag_1_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4frag_1_auto_out_aw_ready),
    .auto_out_aw_valid(axi4frag_1_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4frag_1_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4frag_1_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4frag_1_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4frag_1_auto_out_w_ready),
    .auto_out_w_valid(axi4frag_1_auto_out_w_valid),
    .auto_out_w_bits_data(axi4frag_1_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4frag_1_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4frag_1_auto_out_w_bits_last),
    .auto_out_b_ready(axi4frag_1_auto_out_b_ready),
    .auto_out_b_valid(axi4frag_1_auto_out_b_valid),
    .auto_out_b_bits_id(axi4frag_1_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4frag_1_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4frag_1_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4frag_1_auto_out_ar_ready),
    .auto_out_ar_valid(axi4frag_1_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4frag_1_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4frag_1_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4frag_1_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4frag_1_auto_out_r_ready),
    .auto_out_r_valid(axi4frag_1_auto_out_r_valid),
    .auto_out_r_bits_id(axi4frag_1_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4frag_1_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4frag_1_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4frag_1_auto_out_r_bits_echo_real_last),
    .auto_out_r_bits_last(axi4frag_1_auto_out_r_bits_last)
  );
  AXI4Buffer_3 axi4buf_2 (
    .clock(axi4buf_2_clock),
    .reset(axi4buf_2_reset),
    .auto_in_aw_ready(axi4buf_2_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_2_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_2_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_2_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(axi4buf_2_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(axi4buf_2_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_2_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_2_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_2_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_2_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_2_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_2_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_2_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4buf_2_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(axi4buf_2_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(axi4buf_2_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_2_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_2_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_2_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(axi4buf_2_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(axi4buf_2_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_2_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_2_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4buf_2_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_2_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(axi4buf_2_auto_in_r_bits_echo_real_last),
    .auto_in_r_bits_last(axi4buf_2_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_2_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_2_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_2_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_2_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4buf_2_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4buf_2_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_2_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_2_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_2_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4buf_2_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_2_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_2_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4buf_2_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4buf_2_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4buf_2_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_2_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_2_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_2_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4buf_2_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4buf_2_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_2_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_2_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4buf_2_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_2_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4buf_2_auto_out_r_bits_echo_real_last)
  );
  AXI4Fragmenter_3 axi4frag_2 (
    .clock(axi4frag_2_clock),
    .reset(axi4frag_2_reset),
    .auto_in_aw_ready(axi4frag_2_auto_in_aw_ready),
    .auto_in_aw_valid(axi4frag_2_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4frag_2_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4frag_2_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4frag_2_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4frag_2_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4frag_2_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4frag_2_auto_in_w_ready),
    .auto_in_w_valid(axi4frag_2_auto_in_w_valid),
    .auto_in_w_bits_data(axi4frag_2_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4frag_2_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4frag_2_auto_in_w_bits_last),
    .auto_in_b_ready(axi4frag_2_auto_in_b_ready),
    .auto_in_b_valid(axi4frag_2_auto_in_b_valid),
    .auto_in_b_bits_id(axi4frag_2_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4frag_2_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4frag_2_auto_in_ar_ready),
    .auto_in_ar_valid(axi4frag_2_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4frag_2_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4frag_2_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4frag_2_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4frag_2_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4frag_2_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4frag_2_auto_in_r_ready),
    .auto_in_r_valid(axi4frag_2_auto_in_r_valid),
    .auto_in_r_bits_id(axi4frag_2_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4frag_2_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4frag_2_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4frag_2_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4frag_2_auto_out_aw_ready),
    .auto_out_aw_valid(axi4frag_2_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4frag_2_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4frag_2_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4frag_2_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4frag_2_auto_out_w_ready),
    .auto_out_w_valid(axi4frag_2_auto_out_w_valid),
    .auto_out_w_bits_data(axi4frag_2_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4frag_2_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4frag_2_auto_out_w_bits_last),
    .auto_out_b_ready(axi4frag_2_auto_out_b_ready),
    .auto_out_b_valid(axi4frag_2_auto_out_b_valid),
    .auto_out_b_bits_id(axi4frag_2_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4frag_2_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4frag_2_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4frag_2_auto_out_ar_ready),
    .auto_out_ar_valid(axi4frag_2_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4frag_2_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4frag_2_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4frag_2_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4frag_2_auto_out_r_ready),
    .auto_out_r_valid(axi4frag_2_auto_out_r_valid),
    .auto_out_r_bits_id(axi4frag_2_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4frag_2_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4frag_2_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4frag_2_auto_out_r_bits_echo_real_last),
    .auto_out_r_bits_last(axi4frag_2_auto_out_r_bits_last)
  );
  AXI4Buffer_4 axi4buf_3 (
    .clock(axi4buf_3_clock),
    .reset(axi4buf_3_reset),
    .auto_in_aw_ready(axi4buf_3_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_3_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_3_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_3_auto_in_aw_bits_addr),
    .auto_in_aw_bits_echo_real_last(axi4buf_3_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(axi4buf_3_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_3_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_3_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_3_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_3_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_3_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_3_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_3_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4buf_3_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_real_last(axi4buf_3_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(axi4buf_3_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_3_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_3_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_3_auto_in_ar_bits_addr),
    .auto_in_ar_bits_echo_real_last(axi4buf_3_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(axi4buf_3_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_3_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_3_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4buf_3_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_3_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_real_last(axi4buf_3_auto_in_r_bits_echo_real_last),
    .auto_in_r_bits_last(axi4buf_3_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_3_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_3_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_3_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_3_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4buf_3_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4buf_3_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_3_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_3_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_3_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4buf_3_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_3_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_3_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4buf_3_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4buf_3_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4buf_3_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_3_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_3_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_3_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4buf_3_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4buf_3_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_3_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_3_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4buf_3_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_3_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4buf_3_auto_out_r_bits_echo_real_last)
  );
  AXI4Fragmenter_4 axi4frag_3 (
    .clock(axi4frag_3_clock),
    .reset(axi4frag_3_reset),
    .auto_in_aw_ready(axi4frag_3_auto_in_aw_ready),
    .auto_in_aw_valid(axi4frag_3_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4frag_3_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4frag_3_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4frag_3_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4frag_3_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4frag_3_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4frag_3_auto_in_w_ready),
    .auto_in_w_valid(axi4frag_3_auto_in_w_valid),
    .auto_in_w_bits_data(axi4frag_3_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4frag_3_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4frag_3_auto_in_w_bits_last),
    .auto_in_b_ready(axi4frag_3_auto_in_b_ready),
    .auto_in_b_valid(axi4frag_3_auto_in_b_valid),
    .auto_in_b_bits_id(axi4frag_3_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4frag_3_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4frag_3_auto_in_ar_ready),
    .auto_in_ar_valid(axi4frag_3_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4frag_3_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4frag_3_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4frag_3_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4frag_3_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4frag_3_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4frag_3_auto_in_r_ready),
    .auto_in_r_valid(axi4frag_3_auto_in_r_valid),
    .auto_in_r_bits_id(axi4frag_3_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4frag_3_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4frag_3_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4frag_3_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4frag_3_auto_out_aw_ready),
    .auto_out_aw_valid(axi4frag_3_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4frag_3_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4frag_3_auto_out_aw_bits_addr),
    .auto_out_aw_bits_echo_real_last(axi4frag_3_auto_out_aw_bits_echo_real_last),
    .auto_out_w_ready(axi4frag_3_auto_out_w_ready),
    .auto_out_w_valid(axi4frag_3_auto_out_w_valid),
    .auto_out_w_bits_data(axi4frag_3_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4frag_3_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4frag_3_auto_out_w_bits_last),
    .auto_out_b_ready(axi4frag_3_auto_out_b_ready),
    .auto_out_b_valid(axi4frag_3_auto_out_b_valid),
    .auto_out_b_bits_id(axi4frag_3_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4frag_3_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_real_last(axi4frag_3_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4frag_3_auto_out_ar_ready),
    .auto_out_ar_valid(axi4frag_3_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4frag_3_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4frag_3_auto_out_ar_bits_addr),
    .auto_out_ar_bits_echo_real_last(axi4frag_3_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4frag_3_auto_out_r_ready),
    .auto_out_r_valid(axi4frag_3_auto_out_r_valid),
    .auto_out_r_bits_id(axi4frag_3_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4frag_3_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4frag_3_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_real_last(axi4frag_3_auto_out_r_bits_echo_real_last),
    .auto_out_r_bits_last(axi4frag_3_auto_out_r_bits_last)
  );
  assign io_axi4_0_aw_ready = axi4xbar_auto_in_aw_ready;
  assign io_axi4_0_w_ready = axi4xbar_auto_in_w_ready;
  assign io_axi4_0_b_valid = axi4xbar_auto_in_b_valid;
  assign io_axi4_0_b_bits_id = axi4xbar_auto_in_b_bits_id;
  assign io_axi4_0_b_bits_resp = axi4xbar_auto_in_b_bits_resp;
  assign io_axi4_0_ar_ready = axi4xbar_auto_in_ar_ready;
  assign io_axi4_0_r_valid = axi4xbar_auto_in_r_valid;
  assign io_axi4_0_r_bits_id = axi4xbar_auto_in_r_bits_id;
  assign io_axi4_0_r_bits_data = axi4xbar_auto_in_r_bits_data;
  assign io_axi4_0_r_bits_resp = axi4xbar_auto_in_r_bits_resp;
  assign io_axi4_0_r_bits_last = axi4xbar_auto_in_r_bits_last;
  assign srams_clock = clock;
  assign srams_reset = reset;
  assign srams_auto_in_aw_valid = axi4buf_auto_out_aw_valid;
  assign srams_auto_in_aw_bits_id = axi4buf_auto_out_aw_bits_id;
  assign srams_auto_in_aw_bits_addr = axi4buf_auto_out_aw_bits_addr;
  assign srams_auto_in_aw_bits_echo_real_last = axi4buf_auto_out_aw_bits_echo_real_last;
  assign srams_auto_in_w_valid = axi4buf_auto_out_w_valid;
  assign srams_auto_in_w_bits_data = axi4buf_auto_out_w_bits_data;
  assign srams_auto_in_w_bits_strb = axi4buf_auto_out_w_bits_strb;
  assign srams_auto_in_b_ready = axi4buf_auto_out_b_ready;
  assign srams_auto_in_ar_valid = axi4buf_auto_out_ar_valid;
  assign srams_auto_in_ar_bits_id = axi4buf_auto_out_ar_bits_id;
  assign srams_auto_in_ar_bits_addr = axi4buf_auto_out_ar_bits_addr;
  assign srams_auto_in_ar_bits_echo_real_last = axi4buf_auto_out_ar_bits_echo_real_last;
  assign srams_auto_in_r_ready = axi4buf_auto_out_r_ready;
  assign srams_1_clock = clock;
  assign srams_1_reset = reset;
  assign srams_1_auto_in_aw_valid = axi4buf_1_auto_out_aw_valid;
  assign srams_1_auto_in_aw_bits_id = axi4buf_1_auto_out_aw_bits_id;
  assign srams_1_auto_in_aw_bits_addr = axi4buf_1_auto_out_aw_bits_addr;
  assign srams_1_auto_in_aw_bits_echo_real_last = axi4buf_1_auto_out_aw_bits_echo_real_last;
  assign srams_1_auto_in_w_valid = axi4buf_1_auto_out_w_valid;
  assign srams_1_auto_in_w_bits_data = axi4buf_1_auto_out_w_bits_data;
  assign srams_1_auto_in_w_bits_strb = axi4buf_1_auto_out_w_bits_strb;
  assign srams_1_auto_in_b_ready = axi4buf_1_auto_out_b_ready;
  assign srams_1_auto_in_ar_valid = axi4buf_1_auto_out_ar_valid;
  assign srams_1_auto_in_ar_bits_id = axi4buf_1_auto_out_ar_bits_id;
  assign srams_1_auto_in_ar_bits_addr = axi4buf_1_auto_out_ar_bits_addr;
  assign srams_1_auto_in_ar_bits_echo_real_last = axi4buf_1_auto_out_ar_bits_echo_real_last;
  assign srams_1_auto_in_r_ready = axi4buf_1_auto_out_r_ready;
  assign srams_2_clock = clock;
  assign srams_2_reset = reset;
  assign srams_2_auto_in_aw_valid = axi4buf_2_auto_out_aw_valid;
  assign srams_2_auto_in_aw_bits_id = axi4buf_2_auto_out_aw_bits_id;
  assign srams_2_auto_in_aw_bits_addr = axi4buf_2_auto_out_aw_bits_addr;
  assign srams_2_auto_in_aw_bits_echo_real_last = axi4buf_2_auto_out_aw_bits_echo_real_last;
  assign srams_2_auto_in_w_valid = axi4buf_2_auto_out_w_valid;
  assign srams_2_auto_in_w_bits_data = axi4buf_2_auto_out_w_bits_data;
  assign srams_2_auto_in_w_bits_strb = axi4buf_2_auto_out_w_bits_strb;
  assign srams_2_auto_in_b_ready = axi4buf_2_auto_out_b_ready;
  assign srams_2_auto_in_ar_valid = axi4buf_2_auto_out_ar_valid;
  assign srams_2_auto_in_ar_bits_id = axi4buf_2_auto_out_ar_bits_id;
  assign srams_2_auto_in_ar_bits_addr = axi4buf_2_auto_out_ar_bits_addr;
  assign srams_2_auto_in_ar_bits_echo_real_last = axi4buf_2_auto_out_ar_bits_echo_real_last;
  assign srams_2_auto_in_r_ready = axi4buf_2_auto_out_r_ready;
  assign srams_3_clock = clock;
  assign srams_3_reset = reset;
  assign srams_3_auto_in_aw_valid = axi4buf_3_auto_out_aw_valid;
  assign srams_3_auto_in_aw_bits_id = axi4buf_3_auto_out_aw_bits_id;
  assign srams_3_auto_in_aw_bits_addr = axi4buf_3_auto_out_aw_bits_addr;
  assign srams_3_auto_in_aw_bits_echo_real_last = axi4buf_3_auto_out_aw_bits_echo_real_last;
  assign srams_3_auto_in_w_valid = axi4buf_3_auto_out_w_valid;
  assign srams_3_auto_in_w_bits_data = axi4buf_3_auto_out_w_bits_data;
  assign srams_3_auto_in_w_bits_strb = axi4buf_3_auto_out_w_bits_strb;
  assign srams_3_auto_in_b_ready = axi4buf_3_auto_out_b_ready;
  assign srams_3_auto_in_ar_valid = axi4buf_3_auto_out_ar_valid;
  assign srams_3_auto_in_ar_bits_id = axi4buf_3_auto_out_ar_bits_id;
  assign srams_3_auto_in_ar_bits_addr = axi4buf_3_auto_out_ar_bits_addr;
  assign srams_3_auto_in_ar_bits_echo_real_last = axi4buf_3_auto_out_ar_bits_echo_real_last;
  assign srams_3_auto_in_r_ready = axi4buf_3_auto_out_r_ready;
  assign axi4xbar_clock = clock;
  assign axi4xbar_reset = reset;
  assign axi4xbar_auto_in_aw_valid = io_axi4_0_aw_valid;
  assign axi4xbar_auto_in_aw_bits_id = io_axi4_0_aw_bits_id;
  assign axi4xbar_auto_in_aw_bits_addr = io_axi4_0_aw_bits_addr;
  assign axi4xbar_auto_in_aw_bits_len = io_axi4_0_aw_bits_len;
  assign axi4xbar_auto_in_aw_bits_size = io_axi4_0_aw_bits_size;
  assign axi4xbar_auto_in_aw_bits_burst = io_axi4_0_aw_bits_burst;
  assign axi4xbar_auto_in_w_valid = io_axi4_0_w_valid;
  assign axi4xbar_auto_in_w_bits_data = io_axi4_0_w_bits_data;
  assign axi4xbar_auto_in_w_bits_strb = io_axi4_0_w_bits_strb;
  assign axi4xbar_auto_in_w_bits_last = io_axi4_0_w_bits_last;
  assign axi4xbar_auto_in_b_ready = io_axi4_0_b_ready;
  assign axi4xbar_auto_in_ar_valid = io_axi4_0_ar_valid;
  assign axi4xbar_auto_in_ar_bits_id = io_axi4_0_ar_bits_id;
  assign axi4xbar_auto_in_ar_bits_addr = io_axi4_0_ar_bits_addr;
  assign axi4xbar_auto_in_ar_bits_len = io_axi4_0_ar_bits_len;
  assign axi4xbar_auto_in_ar_bits_size = io_axi4_0_ar_bits_size;
  assign axi4xbar_auto_in_ar_bits_burst = io_axi4_0_ar_bits_burst;
  assign axi4xbar_auto_in_r_ready = io_axi4_0_r_ready;
  assign axi4xbar_auto_out_3_aw_ready = axi4frag_3_auto_in_aw_ready;
  assign axi4xbar_auto_out_3_w_ready = axi4frag_3_auto_in_w_ready;
  assign axi4xbar_auto_out_3_b_valid = axi4frag_3_auto_in_b_valid;
  assign axi4xbar_auto_out_3_b_bits_id = axi4frag_3_auto_in_b_bits_id;
  assign axi4xbar_auto_out_3_b_bits_resp = axi4frag_3_auto_in_b_bits_resp;
  assign axi4xbar_auto_out_3_ar_ready = axi4frag_3_auto_in_ar_ready;
  assign axi4xbar_auto_out_3_r_valid = axi4frag_3_auto_in_r_valid;
  assign axi4xbar_auto_out_3_r_bits_id = axi4frag_3_auto_in_r_bits_id;
  assign axi4xbar_auto_out_3_r_bits_data = axi4frag_3_auto_in_r_bits_data;
  assign axi4xbar_auto_out_3_r_bits_resp = axi4frag_3_auto_in_r_bits_resp;
  assign axi4xbar_auto_out_3_r_bits_last = axi4frag_3_auto_in_r_bits_last;
  assign axi4xbar_auto_out_2_aw_ready = axi4frag_2_auto_in_aw_ready;
  assign axi4xbar_auto_out_2_w_ready = axi4frag_2_auto_in_w_ready;
  assign axi4xbar_auto_out_2_b_valid = axi4frag_2_auto_in_b_valid;
  assign axi4xbar_auto_out_2_b_bits_id = axi4frag_2_auto_in_b_bits_id;
  assign axi4xbar_auto_out_2_b_bits_resp = axi4frag_2_auto_in_b_bits_resp;
  assign axi4xbar_auto_out_2_ar_ready = axi4frag_2_auto_in_ar_ready;
  assign axi4xbar_auto_out_2_r_valid = axi4frag_2_auto_in_r_valid;
  assign axi4xbar_auto_out_2_r_bits_id = axi4frag_2_auto_in_r_bits_id;
  assign axi4xbar_auto_out_2_r_bits_data = axi4frag_2_auto_in_r_bits_data;
  assign axi4xbar_auto_out_2_r_bits_resp = axi4frag_2_auto_in_r_bits_resp;
  assign axi4xbar_auto_out_2_r_bits_last = axi4frag_2_auto_in_r_bits_last;
  assign axi4xbar_auto_out_1_aw_ready = axi4frag_1_auto_in_aw_ready;
  assign axi4xbar_auto_out_1_w_ready = axi4frag_1_auto_in_w_ready;
  assign axi4xbar_auto_out_1_b_valid = axi4frag_1_auto_in_b_valid;
  assign axi4xbar_auto_out_1_b_bits_id = axi4frag_1_auto_in_b_bits_id;
  assign axi4xbar_auto_out_1_b_bits_resp = axi4frag_1_auto_in_b_bits_resp;
  assign axi4xbar_auto_out_1_ar_ready = axi4frag_1_auto_in_ar_ready;
  assign axi4xbar_auto_out_1_r_valid = axi4frag_1_auto_in_r_valid;
  assign axi4xbar_auto_out_1_r_bits_id = axi4frag_1_auto_in_r_bits_id;
  assign axi4xbar_auto_out_1_r_bits_data = axi4frag_1_auto_in_r_bits_data;
  assign axi4xbar_auto_out_1_r_bits_resp = axi4frag_1_auto_in_r_bits_resp;
  assign axi4xbar_auto_out_1_r_bits_last = axi4frag_1_auto_in_r_bits_last;
  assign axi4xbar_auto_out_0_aw_ready = axi4frag_auto_in_aw_ready;
  assign axi4xbar_auto_out_0_w_ready = axi4frag_auto_in_w_ready;
  assign axi4xbar_auto_out_0_b_valid = axi4frag_auto_in_b_valid;
  assign axi4xbar_auto_out_0_b_bits_id = axi4frag_auto_in_b_bits_id;
  assign axi4xbar_auto_out_0_b_bits_resp = axi4frag_auto_in_b_bits_resp;
  assign axi4xbar_auto_out_0_ar_ready = axi4frag_auto_in_ar_ready;
  assign axi4xbar_auto_out_0_r_valid = axi4frag_auto_in_r_valid;
  assign axi4xbar_auto_out_0_r_bits_id = axi4frag_auto_in_r_bits_id;
  assign axi4xbar_auto_out_0_r_bits_data = axi4frag_auto_in_r_bits_data;
  assign axi4xbar_auto_out_0_r_bits_resp = axi4frag_auto_in_r_bits_resp;
  assign axi4xbar_auto_out_0_r_bits_last = axi4frag_auto_in_r_bits_last;
  assign axi4buf_clock = clock;
  assign axi4buf_reset = reset;
  assign axi4buf_auto_in_aw_valid = axi4frag_auto_out_aw_valid;
  assign axi4buf_auto_in_aw_bits_id = axi4frag_auto_out_aw_bits_id;
  assign axi4buf_auto_in_aw_bits_addr = axi4frag_auto_out_aw_bits_addr;
  assign axi4buf_auto_in_aw_bits_echo_real_last = axi4frag_auto_out_aw_bits_echo_real_last;
  assign axi4buf_auto_in_w_valid = axi4frag_auto_out_w_valid;
  assign axi4buf_auto_in_w_bits_data = axi4frag_auto_out_w_bits_data;
  assign axi4buf_auto_in_w_bits_strb = axi4frag_auto_out_w_bits_strb;
  assign axi4buf_auto_in_w_bits_last = axi4frag_auto_out_w_bits_last;
  assign axi4buf_auto_in_b_ready = axi4frag_auto_out_b_ready;
  assign axi4buf_auto_in_ar_valid = axi4frag_auto_out_ar_valid;
  assign axi4buf_auto_in_ar_bits_id = axi4frag_auto_out_ar_bits_id;
  assign axi4buf_auto_in_ar_bits_addr = axi4frag_auto_out_ar_bits_addr;
  assign axi4buf_auto_in_ar_bits_echo_real_last = axi4frag_auto_out_ar_bits_echo_real_last;
  assign axi4buf_auto_in_r_ready = axi4frag_auto_out_r_ready;
  assign axi4buf_auto_out_aw_ready = srams_auto_in_aw_ready;
  assign axi4buf_auto_out_w_ready = srams_auto_in_w_ready;
  assign axi4buf_auto_out_b_valid = srams_auto_in_b_valid;
  assign axi4buf_auto_out_b_bits_id = srams_auto_in_b_bits_id;
  assign axi4buf_auto_out_b_bits_resp = srams_auto_in_b_bits_resp;
  assign axi4buf_auto_out_b_bits_echo_real_last = srams_auto_in_b_bits_echo_real_last;
  assign axi4buf_auto_out_ar_ready = srams_auto_in_ar_ready;
  assign axi4buf_auto_out_r_valid = srams_auto_in_r_valid;
  assign axi4buf_auto_out_r_bits_id = srams_auto_in_r_bits_id;
  assign axi4buf_auto_out_r_bits_data = srams_auto_in_r_bits_data;
  assign axi4buf_auto_out_r_bits_resp = srams_auto_in_r_bits_resp;
  assign axi4buf_auto_out_r_bits_echo_real_last = srams_auto_in_r_bits_echo_real_last;
  assign axi4frag_clock = clock;
  assign axi4frag_reset = reset;
  assign axi4frag_auto_in_aw_valid = axi4xbar_auto_out_0_aw_valid;
  assign axi4frag_auto_in_aw_bits_id = axi4xbar_auto_out_0_aw_bits_id;
  assign axi4frag_auto_in_aw_bits_addr = axi4xbar_auto_out_0_aw_bits_addr;
  assign axi4frag_auto_in_aw_bits_len = axi4xbar_auto_out_0_aw_bits_len;
  assign axi4frag_auto_in_aw_bits_size = axi4xbar_auto_out_0_aw_bits_size;
  assign axi4frag_auto_in_aw_bits_burst = axi4xbar_auto_out_0_aw_bits_burst;
  assign axi4frag_auto_in_w_valid = axi4xbar_auto_out_0_w_valid;
  assign axi4frag_auto_in_w_bits_data = axi4xbar_auto_out_0_w_bits_data;
  assign axi4frag_auto_in_w_bits_strb = axi4xbar_auto_out_0_w_bits_strb;
  assign axi4frag_auto_in_w_bits_last = axi4xbar_auto_out_0_w_bits_last;
  assign axi4frag_auto_in_b_ready = axi4xbar_auto_out_0_b_ready;
  assign axi4frag_auto_in_ar_valid = axi4xbar_auto_out_0_ar_valid;
  assign axi4frag_auto_in_ar_bits_id = axi4xbar_auto_out_0_ar_bits_id;
  assign axi4frag_auto_in_ar_bits_addr = axi4xbar_auto_out_0_ar_bits_addr;
  assign axi4frag_auto_in_ar_bits_len = axi4xbar_auto_out_0_ar_bits_len;
  assign axi4frag_auto_in_ar_bits_size = axi4xbar_auto_out_0_ar_bits_size;
  assign axi4frag_auto_in_ar_bits_burst = axi4xbar_auto_out_0_ar_bits_burst;
  assign axi4frag_auto_in_r_ready = axi4xbar_auto_out_0_r_ready;
  assign axi4frag_auto_out_aw_ready = axi4buf_auto_in_aw_ready;
  assign axi4frag_auto_out_w_ready = axi4buf_auto_in_w_ready;
  assign axi4frag_auto_out_b_valid = axi4buf_auto_in_b_valid;
  assign axi4frag_auto_out_b_bits_id = axi4buf_auto_in_b_bits_id;
  assign axi4frag_auto_out_b_bits_resp = axi4buf_auto_in_b_bits_resp;
  assign axi4frag_auto_out_b_bits_echo_real_last = axi4buf_auto_in_b_bits_echo_real_last;
  assign axi4frag_auto_out_ar_ready = axi4buf_auto_in_ar_ready;
  assign axi4frag_auto_out_r_valid = axi4buf_auto_in_r_valid;
  assign axi4frag_auto_out_r_bits_id = axi4buf_auto_in_r_bits_id;
  assign axi4frag_auto_out_r_bits_data = axi4buf_auto_in_r_bits_data;
  assign axi4frag_auto_out_r_bits_resp = axi4buf_auto_in_r_bits_resp;
  assign axi4frag_auto_out_r_bits_echo_real_last = axi4buf_auto_in_r_bits_echo_real_last;
  assign axi4frag_auto_out_r_bits_last = axi4buf_auto_in_r_bits_last;
  assign axi4buf_1_clock = clock;
  assign axi4buf_1_reset = reset;
  assign axi4buf_1_auto_in_aw_valid = axi4frag_1_auto_out_aw_valid;
  assign axi4buf_1_auto_in_aw_bits_id = axi4frag_1_auto_out_aw_bits_id;
  assign axi4buf_1_auto_in_aw_bits_addr = axi4frag_1_auto_out_aw_bits_addr;
  assign axi4buf_1_auto_in_aw_bits_echo_real_last = axi4frag_1_auto_out_aw_bits_echo_real_last;
  assign axi4buf_1_auto_in_w_valid = axi4frag_1_auto_out_w_valid;
  assign axi4buf_1_auto_in_w_bits_data = axi4frag_1_auto_out_w_bits_data;
  assign axi4buf_1_auto_in_w_bits_strb = axi4frag_1_auto_out_w_bits_strb;
  assign axi4buf_1_auto_in_w_bits_last = axi4frag_1_auto_out_w_bits_last;
  assign axi4buf_1_auto_in_b_ready = axi4frag_1_auto_out_b_ready;
  assign axi4buf_1_auto_in_ar_valid = axi4frag_1_auto_out_ar_valid;
  assign axi4buf_1_auto_in_ar_bits_id = axi4frag_1_auto_out_ar_bits_id;
  assign axi4buf_1_auto_in_ar_bits_addr = axi4frag_1_auto_out_ar_bits_addr;
  assign axi4buf_1_auto_in_ar_bits_echo_real_last = axi4frag_1_auto_out_ar_bits_echo_real_last;
  assign axi4buf_1_auto_in_r_ready = axi4frag_1_auto_out_r_ready;
  assign axi4buf_1_auto_out_aw_ready = srams_1_auto_in_aw_ready;
  assign axi4buf_1_auto_out_w_ready = srams_1_auto_in_w_ready;
  assign axi4buf_1_auto_out_b_valid = srams_1_auto_in_b_valid;
  assign axi4buf_1_auto_out_b_bits_id = srams_1_auto_in_b_bits_id;
  assign axi4buf_1_auto_out_b_bits_resp = srams_1_auto_in_b_bits_resp;
  assign axi4buf_1_auto_out_b_bits_echo_real_last = srams_1_auto_in_b_bits_echo_real_last;
  assign axi4buf_1_auto_out_ar_ready = srams_1_auto_in_ar_ready;
  assign axi4buf_1_auto_out_r_valid = srams_1_auto_in_r_valid;
  assign axi4buf_1_auto_out_r_bits_id = srams_1_auto_in_r_bits_id;
  assign axi4buf_1_auto_out_r_bits_data = srams_1_auto_in_r_bits_data;
  assign axi4buf_1_auto_out_r_bits_resp = srams_1_auto_in_r_bits_resp;
  assign axi4buf_1_auto_out_r_bits_echo_real_last = srams_1_auto_in_r_bits_echo_real_last;
  assign axi4frag_1_clock = clock;
  assign axi4frag_1_reset = reset;
  assign axi4frag_1_auto_in_aw_valid = axi4xbar_auto_out_1_aw_valid;
  assign axi4frag_1_auto_in_aw_bits_id = axi4xbar_auto_out_1_aw_bits_id;
  assign axi4frag_1_auto_in_aw_bits_addr = axi4xbar_auto_out_1_aw_bits_addr;
  assign axi4frag_1_auto_in_aw_bits_len = axi4xbar_auto_out_1_aw_bits_len;
  assign axi4frag_1_auto_in_aw_bits_size = axi4xbar_auto_out_1_aw_bits_size;
  assign axi4frag_1_auto_in_aw_bits_burst = axi4xbar_auto_out_1_aw_bits_burst;
  assign axi4frag_1_auto_in_w_valid = axi4xbar_auto_out_1_w_valid;
  assign axi4frag_1_auto_in_w_bits_data = axi4xbar_auto_out_1_w_bits_data;
  assign axi4frag_1_auto_in_w_bits_strb = axi4xbar_auto_out_1_w_bits_strb;
  assign axi4frag_1_auto_in_w_bits_last = axi4xbar_auto_out_1_w_bits_last;
  assign axi4frag_1_auto_in_b_ready = axi4xbar_auto_out_1_b_ready;
  assign axi4frag_1_auto_in_ar_valid = axi4xbar_auto_out_1_ar_valid;
  assign axi4frag_1_auto_in_ar_bits_id = axi4xbar_auto_out_1_ar_bits_id;
  assign axi4frag_1_auto_in_ar_bits_addr = axi4xbar_auto_out_1_ar_bits_addr;
  assign axi4frag_1_auto_in_ar_bits_len = axi4xbar_auto_out_1_ar_bits_len;
  assign axi4frag_1_auto_in_ar_bits_size = axi4xbar_auto_out_1_ar_bits_size;
  assign axi4frag_1_auto_in_ar_bits_burst = axi4xbar_auto_out_1_ar_bits_burst;
  assign axi4frag_1_auto_in_r_ready = axi4xbar_auto_out_1_r_ready;
  assign axi4frag_1_auto_out_aw_ready = axi4buf_1_auto_in_aw_ready;
  assign axi4frag_1_auto_out_w_ready = axi4buf_1_auto_in_w_ready;
  assign axi4frag_1_auto_out_b_valid = axi4buf_1_auto_in_b_valid;
  assign axi4frag_1_auto_out_b_bits_id = axi4buf_1_auto_in_b_bits_id;
  assign axi4frag_1_auto_out_b_bits_resp = axi4buf_1_auto_in_b_bits_resp;
  assign axi4frag_1_auto_out_b_bits_echo_real_last = axi4buf_1_auto_in_b_bits_echo_real_last;
  assign axi4frag_1_auto_out_ar_ready = axi4buf_1_auto_in_ar_ready;
  assign axi4frag_1_auto_out_r_valid = axi4buf_1_auto_in_r_valid;
  assign axi4frag_1_auto_out_r_bits_id = axi4buf_1_auto_in_r_bits_id;
  assign axi4frag_1_auto_out_r_bits_data = axi4buf_1_auto_in_r_bits_data;
  assign axi4frag_1_auto_out_r_bits_resp = axi4buf_1_auto_in_r_bits_resp;
  assign axi4frag_1_auto_out_r_bits_echo_real_last = axi4buf_1_auto_in_r_bits_echo_real_last;
  assign axi4frag_1_auto_out_r_bits_last = axi4buf_1_auto_in_r_bits_last;
  assign axi4buf_2_clock = clock;
  assign axi4buf_2_reset = reset;
  assign axi4buf_2_auto_in_aw_valid = axi4frag_2_auto_out_aw_valid;
  assign axi4buf_2_auto_in_aw_bits_id = axi4frag_2_auto_out_aw_bits_id;
  assign axi4buf_2_auto_in_aw_bits_addr = axi4frag_2_auto_out_aw_bits_addr;
  assign axi4buf_2_auto_in_aw_bits_echo_real_last = axi4frag_2_auto_out_aw_bits_echo_real_last;
  assign axi4buf_2_auto_in_w_valid = axi4frag_2_auto_out_w_valid;
  assign axi4buf_2_auto_in_w_bits_data = axi4frag_2_auto_out_w_bits_data;
  assign axi4buf_2_auto_in_w_bits_strb = axi4frag_2_auto_out_w_bits_strb;
  assign axi4buf_2_auto_in_w_bits_last = axi4frag_2_auto_out_w_bits_last;
  assign axi4buf_2_auto_in_b_ready = axi4frag_2_auto_out_b_ready;
  assign axi4buf_2_auto_in_ar_valid = axi4frag_2_auto_out_ar_valid;
  assign axi4buf_2_auto_in_ar_bits_id = axi4frag_2_auto_out_ar_bits_id;
  assign axi4buf_2_auto_in_ar_bits_addr = axi4frag_2_auto_out_ar_bits_addr;
  assign axi4buf_2_auto_in_ar_bits_echo_real_last = axi4frag_2_auto_out_ar_bits_echo_real_last;
  assign axi4buf_2_auto_in_r_ready = axi4frag_2_auto_out_r_ready;
  assign axi4buf_2_auto_out_aw_ready = srams_2_auto_in_aw_ready;
  assign axi4buf_2_auto_out_w_ready = srams_2_auto_in_w_ready;
  assign axi4buf_2_auto_out_b_valid = srams_2_auto_in_b_valid;
  assign axi4buf_2_auto_out_b_bits_id = srams_2_auto_in_b_bits_id;
  assign axi4buf_2_auto_out_b_bits_resp = srams_2_auto_in_b_bits_resp;
  assign axi4buf_2_auto_out_b_bits_echo_real_last = srams_2_auto_in_b_bits_echo_real_last;
  assign axi4buf_2_auto_out_ar_ready = srams_2_auto_in_ar_ready;
  assign axi4buf_2_auto_out_r_valid = srams_2_auto_in_r_valid;
  assign axi4buf_2_auto_out_r_bits_id = srams_2_auto_in_r_bits_id;
  assign axi4buf_2_auto_out_r_bits_data = srams_2_auto_in_r_bits_data;
  assign axi4buf_2_auto_out_r_bits_resp = srams_2_auto_in_r_bits_resp;
  assign axi4buf_2_auto_out_r_bits_echo_real_last = srams_2_auto_in_r_bits_echo_real_last;
  assign axi4frag_2_clock = clock;
  assign axi4frag_2_reset = reset;
  assign axi4frag_2_auto_in_aw_valid = axi4xbar_auto_out_2_aw_valid;
  assign axi4frag_2_auto_in_aw_bits_id = axi4xbar_auto_out_2_aw_bits_id;
  assign axi4frag_2_auto_in_aw_bits_addr = axi4xbar_auto_out_2_aw_bits_addr;
  assign axi4frag_2_auto_in_aw_bits_len = axi4xbar_auto_out_2_aw_bits_len;
  assign axi4frag_2_auto_in_aw_bits_size = axi4xbar_auto_out_2_aw_bits_size;
  assign axi4frag_2_auto_in_aw_bits_burst = axi4xbar_auto_out_2_aw_bits_burst;
  assign axi4frag_2_auto_in_w_valid = axi4xbar_auto_out_2_w_valid;
  assign axi4frag_2_auto_in_w_bits_data = axi4xbar_auto_out_2_w_bits_data;
  assign axi4frag_2_auto_in_w_bits_strb = axi4xbar_auto_out_2_w_bits_strb;
  assign axi4frag_2_auto_in_w_bits_last = axi4xbar_auto_out_2_w_bits_last;
  assign axi4frag_2_auto_in_b_ready = axi4xbar_auto_out_2_b_ready;
  assign axi4frag_2_auto_in_ar_valid = axi4xbar_auto_out_2_ar_valid;
  assign axi4frag_2_auto_in_ar_bits_id = axi4xbar_auto_out_2_ar_bits_id;
  assign axi4frag_2_auto_in_ar_bits_addr = axi4xbar_auto_out_2_ar_bits_addr;
  assign axi4frag_2_auto_in_ar_bits_len = axi4xbar_auto_out_2_ar_bits_len;
  assign axi4frag_2_auto_in_ar_bits_size = axi4xbar_auto_out_2_ar_bits_size;
  assign axi4frag_2_auto_in_ar_bits_burst = axi4xbar_auto_out_2_ar_bits_burst;
  assign axi4frag_2_auto_in_r_ready = axi4xbar_auto_out_2_r_ready;
  assign axi4frag_2_auto_out_aw_ready = axi4buf_2_auto_in_aw_ready;
  assign axi4frag_2_auto_out_w_ready = axi4buf_2_auto_in_w_ready;
  assign axi4frag_2_auto_out_b_valid = axi4buf_2_auto_in_b_valid;
  assign axi4frag_2_auto_out_b_bits_id = axi4buf_2_auto_in_b_bits_id;
  assign axi4frag_2_auto_out_b_bits_resp = axi4buf_2_auto_in_b_bits_resp;
  assign axi4frag_2_auto_out_b_bits_echo_real_last = axi4buf_2_auto_in_b_bits_echo_real_last;
  assign axi4frag_2_auto_out_ar_ready = axi4buf_2_auto_in_ar_ready;
  assign axi4frag_2_auto_out_r_valid = axi4buf_2_auto_in_r_valid;
  assign axi4frag_2_auto_out_r_bits_id = axi4buf_2_auto_in_r_bits_id;
  assign axi4frag_2_auto_out_r_bits_data = axi4buf_2_auto_in_r_bits_data;
  assign axi4frag_2_auto_out_r_bits_resp = axi4buf_2_auto_in_r_bits_resp;
  assign axi4frag_2_auto_out_r_bits_echo_real_last = axi4buf_2_auto_in_r_bits_echo_real_last;
  assign axi4frag_2_auto_out_r_bits_last = axi4buf_2_auto_in_r_bits_last;
  assign axi4buf_3_clock = clock;
  assign axi4buf_3_reset = reset;
  assign axi4buf_3_auto_in_aw_valid = axi4frag_3_auto_out_aw_valid;
  assign axi4buf_3_auto_in_aw_bits_id = axi4frag_3_auto_out_aw_bits_id;
  assign axi4buf_3_auto_in_aw_bits_addr = axi4frag_3_auto_out_aw_bits_addr;
  assign axi4buf_3_auto_in_aw_bits_echo_real_last = axi4frag_3_auto_out_aw_bits_echo_real_last;
  assign axi4buf_3_auto_in_w_valid = axi4frag_3_auto_out_w_valid;
  assign axi4buf_3_auto_in_w_bits_data = axi4frag_3_auto_out_w_bits_data;
  assign axi4buf_3_auto_in_w_bits_strb = axi4frag_3_auto_out_w_bits_strb;
  assign axi4buf_3_auto_in_w_bits_last = axi4frag_3_auto_out_w_bits_last;
  assign axi4buf_3_auto_in_b_ready = axi4frag_3_auto_out_b_ready;
  assign axi4buf_3_auto_in_ar_valid = axi4frag_3_auto_out_ar_valid;
  assign axi4buf_3_auto_in_ar_bits_id = axi4frag_3_auto_out_ar_bits_id;
  assign axi4buf_3_auto_in_ar_bits_addr = axi4frag_3_auto_out_ar_bits_addr;
  assign axi4buf_3_auto_in_ar_bits_echo_real_last = axi4frag_3_auto_out_ar_bits_echo_real_last;
  assign axi4buf_3_auto_in_r_ready = axi4frag_3_auto_out_r_ready;
  assign axi4buf_3_auto_out_aw_ready = srams_3_auto_in_aw_ready;
  assign axi4buf_3_auto_out_w_ready = srams_3_auto_in_w_ready;
  assign axi4buf_3_auto_out_b_valid = srams_3_auto_in_b_valid;
  assign axi4buf_3_auto_out_b_bits_id = srams_3_auto_in_b_bits_id;
  assign axi4buf_3_auto_out_b_bits_resp = srams_3_auto_in_b_bits_resp;
  assign axi4buf_3_auto_out_b_bits_echo_real_last = srams_3_auto_in_b_bits_echo_real_last;
  assign axi4buf_3_auto_out_ar_ready = srams_3_auto_in_ar_ready;
  assign axi4buf_3_auto_out_r_valid = srams_3_auto_in_r_valid;
  assign axi4buf_3_auto_out_r_bits_id = srams_3_auto_in_r_bits_id;
  assign axi4buf_3_auto_out_r_bits_data = srams_3_auto_in_r_bits_data;
  assign axi4buf_3_auto_out_r_bits_resp = srams_3_auto_in_r_bits_resp;
  assign axi4buf_3_auto_out_r_bits_echo_real_last = srams_3_auto_in_r_bits_echo_real_last;
  assign axi4frag_3_clock = clock;
  assign axi4frag_3_reset = reset;
  assign axi4frag_3_auto_in_aw_valid = axi4xbar_auto_out_3_aw_valid;
  assign axi4frag_3_auto_in_aw_bits_id = axi4xbar_auto_out_3_aw_bits_id;
  assign axi4frag_3_auto_in_aw_bits_addr = axi4xbar_auto_out_3_aw_bits_addr;
  assign axi4frag_3_auto_in_aw_bits_len = axi4xbar_auto_out_3_aw_bits_len;
  assign axi4frag_3_auto_in_aw_bits_size = axi4xbar_auto_out_3_aw_bits_size;
  assign axi4frag_3_auto_in_aw_bits_burst = axi4xbar_auto_out_3_aw_bits_burst;
  assign axi4frag_3_auto_in_w_valid = axi4xbar_auto_out_3_w_valid;
  assign axi4frag_3_auto_in_w_bits_data = axi4xbar_auto_out_3_w_bits_data;
  assign axi4frag_3_auto_in_w_bits_strb = axi4xbar_auto_out_3_w_bits_strb;
  assign axi4frag_3_auto_in_w_bits_last = axi4xbar_auto_out_3_w_bits_last;
  assign axi4frag_3_auto_in_b_ready = axi4xbar_auto_out_3_b_ready;
  assign axi4frag_3_auto_in_ar_valid = axi4xbar_auto_out_3_ar_valid;
  assign axi4frag_3_auto_in_ar_bits_id = axi4xbar_auto_out_3_ar_bits_id;
  assign axi4frag_3_auto_in_ar_bits_addr = axi4xbar_auto_out_3_ar_bits_addr;
  assign axi4frag_3_auto_in_ar_bits_len = axi4xbar_auto_out_3_ar_bits_len;
  assign axi4frag_3_auto_in_ar_bits_size = axi4xbar_auto_out_3_ar_bits_size;
  assign axi4frag_3_auto_in_ar_bits_burst = axi4xbar_auto_out_3_ar_bits_burst;
  assign axi4frag_3_auto_in_r_ready = axi4xbar_auto_out_3_r_ready;
  assign axi4frag_3_auto_out_aw_ready = axi4buf_3_auto_in_aw_ready;
  assign axi4frag_3_auto_out_w_ready = axi4buf_3_auto_in_w_ready;
  assign axi4frag_3_auto_out_b_valid = axi4buf_3_auto_in_b_valid;
  assign axi4frag_3_auto_out_b_bits_id = axi4buf_3_auto_in_b_bits_id;
  assign axi4frag_3_auto_out_b_bits_resp = axi4buf_3_auto_in_b_bits_resp;
  assign axi4frag_3_auto_out_b_bits_echo_real_last = axi4buf_3_auto_in_b_bits_echo_real_last;
  assign axi4frag_3_auto_out_ar_ready = axi4buf_3_auto_in_ar_ready;
  assign axi4frag_3_auto_out_r_valid = axi4buf_3_auto_in_r_valid;
  assign axi4frag_3_auto_out_r_bits_id = axi4buf_3_auto_in_r_bits_id;
  assign axi4frag_3_auto_out_r_bits_data = axi4buf_3_auto_in_r_bits_data;
  assign axi4frag_3_auto_out_r_bits_resp = axi4buf_3_auto_in_r_bits_resp;
  assign axi4frag_3_auto_out_r_bits_echo_real_last = axi4buf_3_auto_in_r_bits_echo_real_last;
  assign axi4frag_3_auto_out_r_bits_last = axi4buf_3_auto_in_r_bits_last;
endmodule