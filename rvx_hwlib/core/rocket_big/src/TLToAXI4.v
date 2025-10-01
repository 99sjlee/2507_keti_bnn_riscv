`default_nettype wire
module TLToAXI4(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
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
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [2:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [2:0]  auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output [7:0]  auto_out_aw_bits_len,
  output [2:0]  auto_out_aw_bits_size,
  output [1:0]  auto_out_aw_bits_burst,
  output        auto_out_aw_bits_lock,
  output [3:0]  auto_out_aw_bits_cache,
  output [2:0]  auto_out_aw_bits_prot,
  output [3:0]  auto_out_aw_bits_qos,
  output [3:0]  auto_out_aw_bits_echo_tl_state_size,
  output [4:0]  auto_out_aw_bits_echo_tl_state_source,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [31:0] auto_out_w_bits_data,
  output [3:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [2:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input  [3:0]  auto_out_b_bits_echo_tl_state_size,
  input  [4:0]  auto_out_b_bits_echo_tl_state_source,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [2:0]  auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output [7:0]  auto_out_ar_bits_len,
  output [2:0]  auto_out_ar_bits_size,
  output [1:0]  auto_out_ar_bits_burst,
  output        auto_out_ar_bits_lock,
  output [3:0]  auto_out_ar_bits_cache,
  output [2:0]  auto_out_ar_bits_prot,
  output [3:0]  auto_out_ar_bits_qos,
  output [3:0]  auto_out_ar_bits_echo_tl_state_size,
  output [4:0]  auto_out_ar_bits_echo_tl_state_source,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [2:0]  auto_out_r_bits_id,
  input  [31:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input  [3:0]  auto_out_r_bits_echo_tl_state_size,
  input  [4:0]  auto_out_r_bits_echo_tl_state_source,
  input         auto_out_r_bits_last
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
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [2:0] monitor_io_in_a_bits_size;
  wire [4:0] monitor_io_in_a_bits_source;
  wire [31:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [2:0] monitor_io_in_d_bits_size;
  wire [4:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  deq_clock;
  wire  deq_reset;
  wire  deq_io_enq_ready;
  wire  deq_io_enq_valid;
  wire [31:0] deq_io_enq_bits_data;
  wire [3:0] deq_io_enq_bits_strb;
  wire  deq_io_enq_bits_last;
  wire  deq_io_deq_ready;
  wire  deq_io_deq_valid;
  wire [31:0] deq_io_deq_bits_data;
  wire [3:0] deq_io_deq_bits_strb;
  wire  deq_io_deq_bits_last;
  wire  queue_arw_deq_clock;
  wire  queue_arw_deq_reset;
  wire  queue_arw_deq_io_enq_ready;
  wire  queue_arw_deq_io_enq_valid;
  wire [2:0] queue_arw_deq_io_enq_bits_id;
  wire [31:0] queue_arw_deq_io_enq_bits_addr;
  wire [7:0] queue_arw_deq_io_enq_bits_len;
  wire [2:0] queue_arw_deq_io_enq_bits_size;
  wire [3:0] queue_arw_deq_io_enq_bits_cache;
  wire [2:0] queue_arw_deq_io_enq_bits_prot;
  wire [3:0] queue_arw_deq_io_enq_bits_echo_tl_state_size;
  wire [4:0] queue_arw_deq_io_enq_bits_echo_tl_state_source;
  wire  queue_arw_deq_io_enq_bits_wen;
  wire  queue_arw_deq_io_deq_ready;
  wire  queue_arw_deq_io_deq_valid;
  wire [2:0] queue_arw_deq_io_deq_bits_id;
  wire [31:0] queue_arw_deq_io_deq_bits_addr;
  wire [7:0] queue_arw_deq_io_deq_bits_len;
  wire [2:0] queue_arw_deq_io_deq_bits_size;
  wire [1:0] queue_arw_deq_io_deq_bits_burst;
  wire  queue_arw_deq_io_deq_bits_lock;
  wire [3:0] queue_arw_deq_io_deq_bits_cache;
  wire [2:0] queue_arw_deq_io_deq_bits_prot;
  wire [3:0] queue_arw_deq_io_deq_bits_qos;
  wire [3:0] queue_arw_deq_io_deq_bits_echo_tl_state_size;
  wire [4:0] queue_arw_deq_io_deq_bits_echo_tl_state_source;
  wire  queue_arw_deq_io_deq_bits_wen;
  wire  a_isPut = ~auto_in_a_bits_opcode[2];
  reg  count_4;
  wire  idle_3 = ~count_4;
  reg  count_3;
  wire  idle_2 = ~count_3;
  reg [1:0] count_7;
  wire  idle_6 = count_7 == 2'h0;
  reg  write_6;
  wire  mismatch_2 = write_6 != a_isPut;
  wire  idStall_6 = ~idle_6 & mismatch_2 | count_7 == 2'h2;
  reg  count_2;
  wire  idle_1 = ~count_2;
  reg  count_1;
  wire  idle = ~count_1;
  reg [3:0] count_6;
  wire  idle_5 = count_6 == 4'h0;
  reg  write_5;
  wire  mismatch_1 = write_5 != a_isPut;
  wire  idStall_5 = ~idle_5 & mismatch_1 | count_6 == 4'h8;
  reg [3:0] count_5;
  wire  idle_4 = count_5 == 4'h0;
  reg  write_4;
  wire  mismatch = write_4 != a_isPut;
  wire  idStall_4 = ~idle_4 & mismatch | count_5 == 4'h8;
  wire  _GEN_32 = 5'h8 == auto_in_a_bits_source ? idStall_5 : idStall_4;
  wire  _GEN_33 = 5'h9 == auto_in_a_bits_source ? idStall_5 : _GEN_32;
  wire  _GEN_34 = 5'ha == auto_in_a_bits_source ? idStall_5 : _GEN_33;
  wire  _GEN_35 = 5'hb == auto_in_a_bits_source ? idStall_5 : _GEN_34;
  wire  _GEN_36 = 5'hc == auto_in_a_bits_source ? idStall_5 : _GEN_35;
  wire  _GEN_37 = 5'hd == auto_in_a_bits_source ? idStall_5 : _GEN_36;
  wire  _GEN_38 = 5'he == auto_in_a_bits_source ? idStall_5 : _GEN_37;
  wire  _GEN_39 = 5'hf == auto_in_a_bits_source ? idStall_5 : _GEN_38;
  wire  _GEN_40 = 5'h10 == auto_in_a_bits_source ? count_1 : _GEN_39;
  wire  _GEN_41 = 5'h11 == auto_in_a_bits_source ? count_2 : _GEN_40;
  wire  _GEN_42 = 5'h12 == auto_in_a_bits_source ? idStall_6 : _GEN_41;
  wire  _GEN_43 = 5'h13 == auto_in_a_bits_source ? idStall_6 : _GEN_42;
  wire  _GEN_44 = 5'h14 == auto_in_a_bits_source ? count_3 : _GEN_43;
  wire  _GEN_45 = 5'h15 == auto_in_a_bits_source ? count_4 : _GEN_44;
  reg [3:0] counter;
  wire  a_first = counter == 4'h0;
  wire  stall = _GEN_45 & a_first;
  wire  _bundleIn_0_a_ready_T = ~stall;
  reg  doneAW;
  wire  out_arw_ready = queue_arw_deq_io_enq_ready;
  wire  _bundleIn_0_a_ready_T_1 = doneAW | out_arw_ready;
  wire  out_w_ready = deq_io_enq_ready;
  wire  _bundleIn_0_a_ready_T_3 = a_isPut ? (doneAW | out_arw_ready) & out_w_ready : out_arw_ready;
  wire  bundleIn_0_a_ready = ~stall & _bundleIn_0_a_ready_T_3;
  wire  _T = bundleIn_0_a_ready & auto_in_a_valid;
  wire [12:0] _beats1_decode_T_1 = 13'h3f << auto_in_a_bits_size;
  wire [5:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[5:0];
  wire [3:0] beats1_decode = _beats1_decode_T_3[5:2];
  wire [3:0] beats1 = a_isPut ? beats1_decode : 4'h0;
  wire [3:0] counter1 = counter - 4'h1;
  wire  a_last = counter == 4'h1 | beats1 == 4'h0;
  wire  queue_arw_bits_wen = queue_arw_deq_io_deq_bits_wen;
  wire  queue_arw_valid = queue_arw_deq_io_deq_valid;
  wire [2:0] _GEN_10 = 5'h8 == auto_in_a_bits_source ? 3'h5 : 3'h4;
  wire [2:0] _GEN_11 = 5'h9 == auto_in_a_bits_source ? 3'h5 : _GEN_10;
  wire [2:0] _GEN_12 = 5'ha == auto_in_a_bits_source ? 3'h5 : _GEN_11;
  wire [2:0] _GEN_13 = 5'hb == auto_in_a_bits_source ? 3'h5 : _GEN_12;
  wire [2:0] _GEN_14 = 5'hc == auto_in_a_bits_source ? 3'h5 : _GEN_13;
  wire [2:0] _GEN_15 = 5'hd == auto_in_a_bits_source ? 3'h5 : _GEN_14;
  wire [2:0] _GEN_16 = 5'he == auto_in_a_bits_source ? 3'h5 : _GEN_15;
  wire [2:0] _GEN_17 = 5'hf == auto_in_a_bits_source ? 3'h5 : _GEN_16;
  wire [2:0] _GEN_18 = 5'h10 == auto_in_a_bits_source ? 3'h0 : _GEN_17;
  wire [2:0] _GEN_19 = 5'h11 == auto_in_a_bits_source ? 3'h1 : _GEN_18;
  wire [2:0] _GEN_20 = 5'h12 == auto_in_a_bits_source ? 3'h6 : _GEN_19;
  wire [2:0] _GEN_21 = 5'h13 == auto_in_a_bits_source ? 3'h6 : _GEN_20;
  wire [2:0] _GEN_22 = 5'h14 == auto_in_a_bits_source ? 3'h2 : _GEN_21;
  wire [2:0] out_arw_bits_id = 5'h15 == auto_in_a_bits_source ? 3'h3 : _GEN_22;
  wire [16:0] _out_arw_bits_len_T_1 = 17'h3ff << auto_in_a_bits_size;
  wire [9:0] _out_arw_bits_len_T_3 = ~_out_arw_bits_len_T_1[9:0];
  wire  prot_1 = ~auto_in_a_bits_user_amba_prot_secure;
  wire [1:0] out_arw_bits_prot_hi = {auto_in_a_bits_user_amba_prot_fetch,prot_1};
  wire [1:0] out_arw_bits_cache_lo = {auto_in_a_bits_user_amba_prot_modifiable,auto_in_a_bits_user_amba_prot_bufferable}
    ;
  wire [1:0] out_arw_bits_cache_hi = {auto_in_a_bits_user_amba_prot_writealloc,auto_in_a_bits_user_amba_prot_readalloc};
  wire  _out_arw_valid_T_1 = _bundleIn_0_a_ready_T & auto_in_a_valid;
  wire  _out_arw_valid_T_4 = a_isPut ? ~doneAW & out_w_ready : 1'h1;
  wire  out_arw_valid = _bundleIn_0_a_ready_T & auto_in_a_valid & _out_arw_valid_T_4;
  reg  r_holds_d;
  reg [2:0] b_delay;
  wire  r_wins = auto_out_r_valid & b_delay != 3'h7 | r_holds_d;
  wire  bundleOut_0_r_ready = auto_in_d_ready & r_wins;
  wire  _T_2 = bundleOut_0_r_ready & auto_out_r_valid;
  wire  bundleOut_0_b_ready = auto_in_d_ready & ~r_wins;
  wire [2:0] _b_delay_T_1 = b_delay + 3'h1;
  wire  bundleIn_0_d_valid = r_wins ? auto_out_r_valid : auto_out_b_valid;
  reg  r_first;
  wire  _GEN_48 = _T_2 ? auto_out_r_bits_last : r_first;
  wire  _r_denied_T = auto_out_r_bits_resp == 2'h3;
  reg  r_denied_r;
  wire  _GEN_49 = r_first ? _r_denied_T : r_denied_r;
  wire  r_corrupt = auto_out_r_bits_resp != 2'h0;
  wire  b_denied = auto_out_b_bits_resp != 2'h0;
  wire  r_d_corrupt = r_corrupt | _GEN_49;
  wire [2:0] r_d_size = auto_out_r_bits_echo_tl_state_size[2:0];
  wire [2:0] b_d_size = auto_out_b_bits_echo_tl_state_size[2:0];
  wire [7:0] _a_sel_T = 8'h1 << out_arw_bits_id;
  wire  a_sel_0 = _a_sel_T[0];
  wire  a_sel_1 = _a_sel_T[1];
  wire  a_sel_2 = _a_sel_T[2];
  wire  a_sel_3 = _a_sel_T[3];
  wire  a_sel_4 = _a_sel_T[4];
  wire  a_sel_5 = _a_sel_T[5];
  wire  a_sel_6 = _a_sel_T[6];
  wire [2:0] d_sel_shiftAmount = r_wins ? auto_out_r_bits_id : auto_out_b_bits_id;
  wire [7:0] _d_sel_T_1 = 8'h1 << d_sel_shiftAmount;
  wire  d_sel_0 = _d_sel_T_1[0];
  wire  d_sel_1 = _d_sel_T_1[1];
  wire  d_sel_2 = _d_sel_T_1[2];
  wire  d_sel_3 = _d_sel_T_1[3];
  wire  d_sel_4 = _d_sel_T_1[4];
  wire  d_sel_5 = _d_sel_T_1[5];
  wire  d_sel_6 = _d_sel_T_1[6];
  wire  d_last = r_wins ? auto_out_r_bits_last : 1'h1;
  wire  _inc_T = out_arw_ready & out_arw_valid;
  wire  inc = a_sel_0 & _inc_T;
  wire  _dec_T_1 = auto_in_d_ready & bundleIn_0_d_valid;
  wire  dec = d_sel_0 & d_last & _dec_T_1;
  wire  _count_T_2 = count_1 + inc;
  wire  _T_10 = ~reset;
  wire  inc_1 = a_sel_1 & _inc_T;
  wire  dec_1 = d_sel_1 & d_last & _dec_T_1;
  wire  _count_T_6 = count_2 + inc_1;
  wire  inc_2 = a_sel_2 & _inc_T;
  wire  dec_2 = d_sel_2 & d_last & _dec_T_1;
  wire  _count_T_10 = count_3 + inc_2;
  wire  inc_3 = a_sel_3 & _inc_T;
  wire  dec_3 = d_sel_3 & d_last & _dec_T_1;
  wire  _count_T_14 = count_4 + inc_3;
  wire  inc_4 = a_sel_4 & _inc_T;
  wire  dec_4 = d_sel_4 & d_last & _dec_T_1;
  wire [3:0] _GEN_57 = {{3'd0}, inc_4};
  wire [3:0] _count_T_18 = count_5 + _GEN_57;
  wire [3:0] _GEN_58 = {{3'd0}, dec_4};
  wire [3:0] _count_T_20 = _count_T_18 - _GEN_58;
  wire  inc_5 = a_sel_5 & _inc_T;
  wire  dec_5 = d_sel_5 & d_last & _dec_T_1;
  wire [3:0] _GEN_59 = {{3'd0}, inc_5};
  wire [3:0] _count_T_22 = count_6 + _GEN_59;
  wire [3:0] _GEN_60 = {{3'd0}, dec_5};
  wire [3:0] _count_T_24 = _count_T_22 - _GEN_60;
  wire  inc_6 = a_sel_6 & _inc_T;
  wire  dec_6 = d_sel_6 & d_last & _dec_T_1;
  wire [1:0] _GEN_61 = {{1'd0}, inc_6};
  wire [1:0] _count_T_26 = count_7 + _GEN_61;
  wire [1:0] _GEN_62 = {{1'd0}, dec_6};
  wire [1:0] _count_T_28 = _count_T_26 - _GEN_62;
  
  Queue_2 deq (
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_data(deq_io_enq_bits_data),
    .io_enq_bits_strb(deq_io_enq_bits_strb),
    .io_enq_bits_last(deq_io_enq_bits_last),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_data(deq_io_deq_bits_data),
    .io_deq_bits_strb(deq_io_deq_bits_strb),
    .io_deq_bits_last(deq_io_deq_bits_last)
  );
  Queue_3 queue_arw_deq (
    .clock(queue_arw_deq_clock),
    .reset(queue_arw_deq_reset),
    .io_enq_ready(queue_arw_deq_io_enq_ready),
    .io_enq_valid(queue_arw_deq_io_enq_valid),
    .io_enq_bits_id(queue_arw_deq_io_enq_bits_id),
    .io_enq_bits_addr(queue_arw_deq_io_enq_bits_addr),
    .io_enq_bits_len(queue_arw_deq_io_enq_bits_len),
    .io_enq_bits_size(queue_arw_deq_io_enq_bits_size),
    .io_enq_bits_cache(queue_arw_deq_io_enq_bits_cache),
    .io_enq_bits_prot(queue_arw_deq_io_enq_bits_prot),
    .io_enq_bits_echo_tl_state_size(queue_arw_deq_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(queue_arw_deq_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_wen(queue_arw_deq_io_enq_bits_wen),
    .io_deq_ready(queue_arw_deq_io_deq_ready),
    .io_deq_valid(queue_arw_deq_io_deq_valid),
    .io_deq_bits_id(queue_arw_deq_io_deq_bits_id),
    .io_deq_bits_addr(queue_arw_deq_io_deq_bits_addr),
    .io_deq_bits_len(queue_arw_deq_io_deq_bits_len),
    .io_deq_bits_size(queue_arw_deq_io_deq_bits_size),
    .io_deq_bits_burst(queue_arw_deq_io_deq_bits_burst),
    .io_deq_bits_lock(queue_arw_deq_io_deq_bits_lock),
    .io_deq_bits_cache(queue_arw_deq_io_deq_bits_cache),
    .io_deq_bits_prot(queue_arw_deq_io_deq_bits_prot),
    .io_deq_bits_qos(queue_arw_deq_io_deq_bits_qos),
    .io_deq_bits_echo_tl_state_size(queue_arw_deq_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(queue_arw_deq_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_wen(queue_arw_deq_io_deq_bits_wen)
  );
  assign auto_in_a_ready = ~stall & _bundleIn_0_a_ready_T_3;
  assign auto_in_d_valid = r_wins ? auto_out_r_valid : auto_out_b_valid;
  assign auto_in_d_bits_opcode = r_wins ? 3'h1 : 3'h0;
  assign auto_in_d_bits_size = r_wins ? r_d_size : b_d_size;
  assign auto_in_d_bits_source = r_wins ? auto_out_r_bits_echo_tl_state_source : auto_out_b_bits_echo_tl_state_source;
  assign auto_in_d_bits_denied = r_wins ? _GEN_49 : b_denied;
  assign auto_in_d_bits_data = auto_out_r_bits_data;
  assign auto_in_d_bits_corrupt = r_wins & r_d_corrupt;
  assign auto_out_aw_valid = queue_arw_valid & queue_arw_bits_wen;
  assign auto_out_aw_bits_id = queue_arw_deq_io_deq_bits_id;
  assign auto_out_aw_bits_addr = queue_arw_deq_io_deq_bits_addr;
  assign auto_out_aw_bits_len = queue_arw_deq_io_deq_bits_len;
  assign auto_out_aw_bits_size = queue_arw_deq_io_deq_bits_size;
  assign auto_out_aw_bits_burst = queue_arw_deq_io_deq_bits_burst;
  assign auto_out_aw_bits_lock = queue_arw_deq_io_deq_bits_lock;
  assign auto_out_aw_bits_cache = queue_arw_deq_io_deq_bits_cache;
  assign auto_out_aw_bits_prot = queue_arw_deq_io_deq_bits_prot;
  assign auto_out_aw_bits_qos = queue_arw_deq_io_deq_bits_qos;
  assign auto_out_aw_bits_echo_tl_state_size = queue_arw_deq_io_deq_bits_echo_tl_state_size;
  assign auto_out_aw_bits_echo_tl_state_source = queue_arw_deq_io_deq_bits_echo_tl_state_source;
  assign auto_out_w_valid = deq_io_deq_valid;
  assign auto_out_w_bits_data = deq_io_deq_bits_data;
  assign auto_out_w_bits_strb = deq_io_deq_bits_strb;
  assign auto_out_w_bits_last = deq_io_deq_bits_last;
  assign auto_out_b_ready = auto_in_d_ready & ~r_wins;
  assign auto_out_ar_valid = queue_arw_valid & ~queue_arw_bits_wen;
  assign auto_out_ar_bits_id = queue_arw_deq_io_deq_bits_id;
  assign auto_out_ar_bits_addr = queue_arw_deq_io_deq_bits_addr;
  assign auto_out_ar_bits_len = queue_arw_deq_io_deq_bits_len;
  assign auto_out_ar_bits_size = queue_arw_deq_io_deq_bits_size;
  assign auto_out_ar_bits_burst = queue_arw_deq_io_deq_bits_burst;
  assign auto_out_ar_bits_lock = queue_arw_deq_io_deq_bits_lock;
  assign auto_out_ar_bits_cache = queue_arw_deq_io_deq_bits_cache;
  assign auto_out_ar_bits_prot = queue_arw_deq_io_deq_bits_prot;
  assign auto_out_ar_bits_qos = queue_arw_deq_io_deq_bits_qos;
  assign auto_out_ar_bits_echo_tl_state_size = queue_arw_deq_io_deq_bits_echo_tl_state_size;
  assign auto_out_ar_bits_echo_tl_state_source = queue_arw_deq_io_deq_bits_echo_tl_state_source;
  assign auto_out_r_ready = auto_in_d_ready & r_wins;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = ~stall & _bundleIn_0_a_ready_T_3;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = r_wins ? auto_out_r_valid : auto_out_b_valid;
  assign monitor_io_in_d_bits_opcode = r_wins ? 3'h1 : 3'h0;
  assign monitor_io_in_d_bits_size = r_wins ? r_d_size : b_d_size;
  assign monitor_io_in_d_bits_source = r_wins ? auto_out_r_bits_echo_tl_state_source :
    auto_out_b_bits_echo_tl_state_source;
  assign monitor_io_in_d_bits_denied = r_wins ? _GEN_49 : b_denied;
  assign monitor_io_in_d_bits_corrupt = r_wins & r_d_corrupt;
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = _out_arw_valid_T_1 & a_isPut & _bundleIn_0_a_ready_T_1;
  assign deq_io_enq_bits_data = auto_in_a_bits_data;
  assign deq_io_enq_bits_strb = auto_in_a_bits_mask;
  assign deq_io_enq_bits_last = counter == 4'h1 | beats1 == 4'h0;
  assign deq_io_deq_ready = auto_out_w_ready;
  assign queue_arw_deq_clock = clock;
  assign queue_arw_deq_reset = reset;
  assign queue_arw_deq_io_enq_valid = _bundleIn_0_a_ready_T & auto_in_a_valid & _out_arw_valid_T_4;
  assign queue_arw_deq_io_enq_bits_id = 5'h15 == auto_in_a_bits_source ? 3'h3 : _GEN_22;
  assign queue_arw_deq_io_enq_bits_addr = auto_in_a_bits_address;
  assign queue_arw_deq_io_enq_bits_len = _out_arw_bits_len_T_3[9:2];
  assign queue_arw_deq_io_enq_bits_size = auto_in_a_bits_size >= 3'h2 ? 3'h2 : auto_in_a_bits_size;
  assign queue_arw_deq_io_enq_bits_cache = {out_arw_bits_cache_hi,out_arw_bits_cache_lo};
  assign queue_arw_deq_io_enq_bits_prot = {out_arw_bits_prot_hi,auto_in_a_bits_user_amba_prot_privileged};
  assign queue_arw_deq_io_enq_bits_echo_tl_state_size = {{1'd0}, auto_in_a_bits_size};
  assign queue_arw_deq_io_enq_bits_echo_tl_state_source = auto_in_a_bits_source;
  assign queue_arw_deq_io_enq_bits_wen = ~auto_in_a_bits_opcode[2];
  assign queue_arw_deq_io_deq_ready = queue_arw_bits_wen ? auto_out_aw_ready : auto_out_ar_ready;
  always @(posedge clock) begin
    if (reset) begin
      count_4 <= 1'h0;
    end else begin
      count_4 <= _count_T_14 - dec_3;
    end
    if (reset) begin
      count_3 <= 1'h0;
    end else begin
      count_3 <= _count_T_10 - dec_2;
    end
    if (reset) begin
      count_7 <= 2'h0;
    end else begin
      count_7 <= _count_T_28;
    end
    if (inc_6) begin
      write_6 <= a_isPut;
    end
    if (reset) begin
      count_2 <= 1'h0;
    end else begin
      count_2 <= _count_T_6 - dec_1;
    end
    if (reset) begin
      count_1 <= 1'h0;
    end else begin
      count_1 <= _count_T_2 - dec;
    end
    if (reset) begin
      count_6 <= 4'h0;
    end else begin
      count_6 <= _count_T_24;
    end
    if (inc_5) begin
      write_5 <= a_isPut;
    end
    if (reset) begin
      count_5 <= 4'h0;
    end else begin
      count_5 <= _count_T_20;
    end
    if (inc_4) begin
      write_4 <= a_isPut;
    end
    if (reset) begin
      counter <= 4'h0;
    end else if (_T) begin
      if (a_first) begin
        if (a_isPut) begin
          counter <= beats1_decode;
        end else begin
          counter <= 4'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    if (reset) begin
      doneAW <= 1'h0;
    end else if (_T) begin
      doneAW <= ~a_last;
    end
    if (reset) begin
      r_holds_d <= 1'h0;
    end else if (_T_2) begin
      r_holds_d <= ~auto_out_r_bits_last;
    end
    if (auto_out_b_valid & ~bundleOut_0_b_ready) begin
      b_delay <= _b_delay_T_1;
    end else begin
      b_delay <= 3'h0;
    end
    r_first <= reset | _GEN_48;
    if (r_first) begin
      r_denied_r <= _r_denied_T;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec | count_1) & ~reset) begin
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
        if (~reset & ~(~dec | count_1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc | idle) & _T_10) begin
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
        if (_T_10 & ~(~inc | idle)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_1 | count_2) & ~reset) begin
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
        if (~reset & ~(~dec_1 | count_2)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_1 | idle_1) & _T_10) begin
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
        if (_T_10 & ~(~inc_1 | idle_1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_2 | count_3) & ~reset) begin
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
        if (~reset & ~(~dec_2 | count_3)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_2 | idle_2) & _T_10) begin
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
        if (_T_10 & ~(~inc_2 | idle_2)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_3 | count_4) & ~reset) begin
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
        if (~reset & ~(~dec_3 | count_4)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_3 | idle_3) & _T_10) begin
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
        if (_T_10 & ~(~inc_3 | idle_3)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_4 | count_5 != 4'h0) & ~reset) begin
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
        if (~reset & ~(~dec_4 | count_5 != 4'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_4 | count_5 != 4'h8) & _T_10) begin
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
        if (_T_10 & ~(~inc_4 | count_5 != 4'h8)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_5 | count_6 != 4'h0) & ~reset) begin
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
        if (~reset & ~(~dec_5 | count_6 != 4'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_5 | count_6 != 4'h8) & _T_10) begin
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
        if (_T_10 & ~(~inc_5 | count_6 != 4'h8)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_6 | count_7 != 2'h0) & ~reset) begin
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
        if (~reset & ~(~dec_6 | count_7 != 2'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_6 | count_7 != 2'h2) & _T_10) begin
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
        if (_T_10 & ~(~inc_6 | count_7 != 2'h2)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
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
  count_4 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  count_3 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  count_7 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  write_6 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  count_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  count_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  count_6 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  write_5 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  count_5 = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  write_4 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  counter = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  doneAW = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  r_holds_d = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  b_delay = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  r_first = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  r_denied_r = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule