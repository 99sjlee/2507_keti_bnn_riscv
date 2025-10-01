`default_nettype wire
module TLInterconnectCoupler_3(
  input         clock,
  input         reset,
  output        auto_widget_in_a_ready,
  input         auto_widget_in_a_valid,
  input  [2:0]  auto_widget_in_a_bits_opcode,
  input  [2:0]  auto_widget_in_a_bits_param,
  input  [2:0]  auto_widget_in_a_bits_size,
  input  [4:0]  auto_widget_in_a_bits_source,
  input  [31:0] auto_widget_in_a_bits_address,
  input         auto_widget_in_a_bits_user_amba_prot_bufferable,
  input         auto_widget_in_a_bits_user_amba_prot_modifiable,
  input         auto_widget_in_a_bits_user_amba_prot_readalloc,
  input         auto_widget_in_a_bits_user_amba_prot_writealloc,
  input         auto_widget_in_a_bits_user_amba_prot_privileged,
  input         auto_widget_in_a_bits_user_amba_prot_secure,
  input         auto_widget_in_a_bits_user_amba_prot_fetch,
  input  [3:0]  auto_widget_in_a_bits_mask,
  input  [31:0] auto_widget_in_a_bits_data,
  input         auto_widget_in_a_bits_corrupt,
  input         auto_widget_in_d_ready,
  output        auto_widget_in_d_valid,
  output [2:0]  auto_widget_in_d_bits_opcode,
  output [2:0]  auto_widget_in_d_bits_size,
  output [4:0]  auto_widget_in_d_bits_source,
  output        auto_widget_in_d_bits_denied,
  output [31:0] auto_widget_in_d_bits_data,
  output        auto_widget_in_d_bits_corrupt,
  input         auto_axi4yank_out_aw_ready,
  output        auto_axi4yank_out_aw_valid,
  output [3:0]  auto_axi4yank_out_aw_bits_id,
  output [31:0] auto_axi4yank_out_aw_bits_addr,
  output [7:0]  auto_axi4yank_out_aw_bits_len,
  output [2:0]  auto_axi4yank_out_aw_bits_size,
  output [1:0]  auto_axi4yank_out_aw_bits_burst,
  output        auto_axi4yank_out_aw_bits_lock,
  output [3:0]  auto_axi4yank_out_aw_bits_cache,
  output [2:0]  auto_axi4yank_out_aw_bits_prot,
  output [3:0]  auto_axi4yank_out_aw_bits_qos,
  input         auto_axi4yank_out_w_ready,
  output        auto_axi4yank_out_w_valid,
  output [31:0] auto_axi4yank_out_w_bits_data,
  output [3:0]  auto_axi4yank_out_w_bits_strb,
  output        auto_axi4yank_out_w_bits_last,
  output        auto_axi4yank_out_b_ready,
  input         auto_axi4yank_out_b_valid,
  input  [3:0]  auto_axi4yank_out_b_bits_id,
  input  [1:0]  auto_axi4yank_out_b_bits_resp,
  input         auto_axi4yank_out_ar_ready,
  output        auto_axi4yank_out_ar_valid,
  output [3:0]  auto_axi4yank_out_ar_bits_id,
  output [31:0] auto_axi4yank_out_ar_bits_addr,
  output [7:0]  auto_axi4yank_out_ar_bits_len,
  output [2:0]  auto_axi4yank_out_ar_bits_size,
  output [1:0]  auto_axi4yank_out_ar_bits_burst,
  output        auto_axi4yank_out_ar_bits_lock,
  output [3:0]  auto_axi4yank_out_ar_bits_cache,
  output [2:0]  auto_axi4yank_out_ar_bits_prot,
  output [3:0]  auto_axi4yank_out_ar_bits_qos,
  output        auto_axi4yank_out_r_ready,
  input         auto_axi4yank_out_r_valid,
  input  [3:0]  auto_axi4yank_out_r_bits_id,
  input  [31:0] auto_axi4yank_out_r_bits_data,
  input  [1:0]  auto_axi4yank_out_r_bits_resp,
  input         auto_axi4yank_out_r_bits_last,
  output        auto_tl_in_a_ready,
  input         auto_tl_in_a_valid,
  input  [2:0]  auto_tl_in_a_bits_opcode,
  input  [2:0]  auto_tl_in_a_bits_param,
  input  [2:0]  auto_tl_in_a_bits_size,
  input  [4:0]  auto_tl_in_a_bits_source,
  input  [31:0] auto_tl_in_a_bits_address,
  input         auto_tl_in_a_bits_user_amba_prot_bufferable,
  input         auto_tl_in_a_bits_user_amba_prot_modifiable,
  input         auto_tl_in_a_bits_user_amba_prot_readalloc,
  input         auto_tl_in_a_bits_user_amba_prot_writealloc,
  input         auto_tl_in_a_bits_user_amba_prot_privileged,
  input         auto_tl_in_a_bits_user_amba_prot_secure,
  input         auto_tl_in_a_bits_user_amba_prot_fetch,
  input  [3:0]  auto_tl_in_a_bits_mask,
  input  [31:0] auto_tl_in_a_bits_data,
  input         auto_tl_in_a_bits_corrupt,
  input         auto_tl_in_d_ready,
  output        auto_tl_in_d_valid,
  output [2:0]  auto_tl_in_d_bits_opcode,
  output [2:0]  auto_tl_in_d_bits_size,
  output [4:0]  auto_tl_in_d_bits_source,
  output        auto_tl_in_d_bits_denied,
  output [31:0] auto_tl_in_d_bits_data,
  output        auto_tl_in_d_bits_corrupt,
  input         auto_tl_out_a_ready,
  output        auto_tl_out_a_valid,
  output [2:0]  auto_tl_out_a_bits_opcode,
  output [2:0]  auto_tl_out_a_bits_param,
  output [2:0]  auto_tl_out_a_bits_size,
  output [4:0]  auto_tl_out_a_bits_source,
  output [31:0] auto_tl_out_a_bits_address,
  output        auto_tl_out_a_bits_user_amba_prot_bufferable,
  output        auto_tl_out_a_bits_user_amba_prot_modifiable,
  output        auto_tl_out_a_bits_user_amba_prot_readalloc,
  output        auto_tl_out_a_bits_user_amba_prot_writealloc,
  output        auto_tl_out_a_bits_user_amba_prot_privileged,
  output        auto_tl_out_a_bits_user_amba_prot_secure,
  output        auto_tl_out_a_bits_user_amba_prot_fetch,
  output [3:0]  auto_tl_out_a_bits_mask,
  output [31:0] auto_tl_out_a_bits_data,
  output        auto_tl_out_a_bits_corrupt,
  output        auto_tl_out_d_ready,
  input         auto_tl_out_d_valid,
  input  [2:0]  auto_tl_out_d_bits_opcode,
  input  [2:0]  auto_tl_out_d_bits_size,
  input  [4:0]  auto_tl_out_d_bits_source,
  input         auto_tl_out_d_bits_denied,
  input  [31:0] auto_tl_out_d_bits_data,
  input         auto_tl_out_d_bits_corrupt
);
  wire  axi4yank_clock;
  wire  axi4yank_reset;
  wire  axi4yank_auto_in_aw_ready;
  wire  axi4yank_auto_in_aw_valid;
  wire [3:0] axi4yank_auto_in_aw_bits_id;
  wire [31:0] axi4yank_auto_in_aw_bits_addr;
  wire [7:0] axi4yank_auto_in_aw_bits_len;
  wire [2:0] axi4yank_auto_in_aw_bits_size;
  wire [1:0] axi4yank_auto_in_aw_bits_burst;
  wire  axi4yank_auto_in_aw_bits_lock;
  wire [3:0] axi4yank_auto_in_aw_bits_cache;
  wire [2:0] axi4yank_auto_in_aw_bits_prot;
  wire [3:0] axi4yank_auto_in_aw_bits_qos;
  wire [3:0] axi4yank_auto_in_aw_bits_echo_tl_state_size;
  wire [4:0] axi4yank_auto_in_aw_bits_echo_tl_state_source;
  wire  axi4yank_auto_in_w_ready;
  wire  axi4yank_auto_in_w_valid;
  wire [31:0] axi4yank_auto_in_w_bits_data;
  wire [3:0] axi4yank_auto_in_w_bits_strb;
  wire  axi4yank_auto_in_w_bits_last;
  wire  axi4yank_auto_in_b_ready;
  wire  axi4yank_auto_in_b_valid;
  wire [3:0] axi4yank_auto_in_b_bits_id;
  wire [1:0] axi4yank_auto_in_b_bits_resp;
  wire [3:0] axi4yank_auto_in_b_bits_echo_tl_state_size;
  wire [4:0] axi4yank_auto_in_b_bits_echo_tl_state_source;
  wire  axi4yank_auto_in_ar_ready;
  wire  axi4yank_auto_in_ar_valid;
  wire [3:0] axi4yank_auto_in_ar_bits_id;
  wire [31:0] axi4yank_auto_in_ar_bits_addr;
  wire [7:0] axi4yank_auto_in_ar_bits_len;
  wire [2:0] axi4yank_auto_in_ar_bits_size;
  wire [1:0] axi4yank_auto_in_ar_bits_burst;
  wire  axi4yank_auto_in_ar_bits_lock;
  wire [3:0] axi4yank_auto_in_ar_bits_cache;
  wire [2:0] axi4yank_auto_in_ar_bits_prot;
  wire [3:0] axi4yank_auto_in_ar_bits_qos;
  wire [3:0] axi4yank_auto_in_ar_bits_echo_tl_state_size;
  wire [4:0] axi4yank_auto_in_ar_bits_echo_tl_state_source;
  wire  axi4yank_auto_in_r_ready;
  wire  axi4yank_auto_in_r_valid;
  wire [3:0] axi4yank_auto_in_r_bits_id;
  wire [31:0] axi4yank_auto_in_r_bits_data;
  wire [1:0] axi4yank_auto_in_r_bits_resp;
  wire [3:0] axi4yank_auto_in_r_bits_echo_tl_state_size;
  wire [4:0] axi4yank_auto_in_r_bits_echo_tl_state_source;
  wire  axi4yank_auto_in_r_bits_last;
  wire  axi4yank_auto_out_aw_ready;
  wire  axi4yank_auto_out_aw_valid;
  wire [3:0] axi4yank_auto_out_aw_bits_id;
  wire [31:0] axi4yank_auto_out_aw_bits_addr;
  wire [7:0] axi4yank_auto_out_aw_bits_len;
  wire [2:0] axi4yank_auto_out_aw_bits_size;
  wire [1:0] axi4yank_auto_out_aw_bits_burst;
  wire  axi4yank_auto_out_aw_bits_lock;
  wire [3:0] axi4yank_auto_out_aw_bits_cache;
  wire [2:0] axi4yank_auto_out_aw_bits_prot;
  wire [3:0] axi4yank_auto_out_aw_bits_qos;
  wire  axi4yank_auto_out_w_ready;
  wire  axi4yank_auto_out_w_valid;
  wire [31:0] axi4yank_auto_out_w_bits_data;
  wire [3:0] axi4yank_auto_out_w_bits_strb;
  wire  axi4yank_auto_out_w_bits_last;
  wire  axi4yank_auto_out_b_ready;
  wire  axi4yank_auto_out_b_valid;
  wire [3:0] axi4yank_auto_out_b_bits_id;
  wire [1:0] axi4yank_auto_out_b_bits_resp;
  wire  axi4yank_auto_out_ar_ready;
  wire  axi4yank_auto_out_ar_valid;
  wire [3:0] axi4yank_auto_out_ar_bits_id;
  wire [31:0] axi4yank_auto_out_ar_bits_addr;
  wire [7:0] axi4yank_auto_out_ar_bits_len;
  wire [2:0] axi4yank_auto_out_ar_bits_size;
  wire [1:0] axi4yank_auto_out_ar_bits_burst;
  wire  axi4yank_auto_out_ar_bits_lock;
  wire [3:0] axi4yank_auto_out_ar_bits_cache;
  wire [2:0] axi4yank_auto_out_ar_bits_prot;
  wire [3:0] axi4yank_auto_out_ar_bits_qos;
  wire  axi4yank_auto_out_r_ready;
  wire  axi4yank_auto_out_r_valid;
  wire [3:0] axi4yank_auto_out_r_bits_id;
  wire [31:0] axi4yank_auto_out_r_bits_data;
  wire [1:0] axi4yank_auto_out_r_bits_resp;
  wire  axi4yank_auto_out_r_bits_last;
  wire  axi4index_auto_in_aw_ready;
  wire  axi4index_auto_in_aw_valid;
  wire [2:0] axi4index_auto_in_aw_bits_id;
  wire [31:0] axi4index_auto_in_aw_bits_addr;
  wire [7:0] axi4index_auto_in_aw_bits_len;
  wire [2:0] axi4index_auto_in_aw_bits_size;
  wire [1:0] axi4index_auto_in_aw_bits_burst;
  wire  axi4index_auto_in_aw_bits_lock;
  wire [3:0] axi4index_auto_in_aw_bits_cache;
  wire [2:0] axi4index_auto_in_aw_bits_prot;
  wire [3:0] axi4index_auto_in_aw_bits_qos;
  wire [3:0] axi4index_auto_in_aw_bits_echo_tl_state_size;
  wire [4:0] axi4index_auto_in_aw_bits_echo_tl_state_source;
  wire  axi4index_auto_in_w_ready;
  wire  axi4index_auto_in_w_valid;
  wire [31:0] axi4index_auto_in_w_bits_data;
  wire [3:0] axi4index_auto_in_w_bits_strb;
  wire  axi4index_auto_in_w_bits_last;
  wire  axi4index_auto_in_b_ready;
  wire  axi4index_auto_in_b_valid;
  wire [2:0] axi4index_auto_in_b_bits_id;
  wire [1:0] axi4index_auto_in_b_bits_resp;
  wire [3:0] axi4index_auto_in_b_bits_echo_tl_state_size;
  wire [4:0] axi4index_auto_in_b_bits_echo_tl_state_source;
  wire  axi4index_auto_in_ar_ready;
  wire  axi4index_auto_in_ar_valid;
  wire [2:0] axi4index_auto_in_ar_bits_id;
  wire [31:0] axi4index_auto_in_ar_bits_addr;
  wire [7:0] axi4index_auto_in_ar_bits_len;
  wire [2:0] axi4index_auto_in_ar_bits_size;
  wire [1:0] axi4index_auto_in_ar_bits_burst;
  wire  axi4index_auto_in_ar_bits_lock;
  wire [3:0] axi4index_auto_in_ar_bits_cache;
  wire [2:0] axi4index_auto_in_ar_bits_prot;
  wire [3:0] axi4index_auto_in_ar_bits_qos;
  wire [3:0] axi4index_auto_in_ar_bits_echo_tl_state_size;
  wire [4:0] axi4index_auto_in_ar_bits_echo_tl_state_source;
  wire  axi4index_auto_in_r_ready;
  wire  axi4index_auto_in_r_valid;
  wire [2:0] axi4index_auto_in_r_bits_id;
  wire [31:0] axi4index_auto_in_r_bits_data;
  wire [1:0] axi4index_auto_in_r_bits_resp;
  wire [3:0] axi4index_auto_in_r_bits_echo_tl_state_size;
  wire [4:0] axi4index_auto_in_r_bits_echo_tl_state_source;
  wire  axi4index_auto_in_r_bits_last;
  wire  axi4index_auto_out_aw_ready;
  wire  axi4index_auto_out_aw_valid;
  wire [3:0] axi4index_auto_out_aw_bits_id;
  wire [31:0] axi4index_auto_out_aw_bits_addr;
  wire [7:0] axi4index_auto_out_aw_bits_len;
  wire [2:0] axi4index_auto_out_aw_bits_size;
  wire [1:0] axi4index_auto_out_aw_bits_burst;
  wire  axi4index_auto_out_aw_bits_lock;
  wire [3:0] axi4index_auto_out_aw_bits_cache;
  wire [2:0] axi4index_auto_out_aw_bits_prot;
  wire [3:0] axi4index_auto_out_aw_bits_qos;
  wire [3:0] axi4index_auto_out_aw_bits_echo_tl_state_size;
  wire [4:0] axi4index_auto_out_aw_bits_echo_tl_state_source;
  wire  axi4index_auto_out_w_ready;
  wire  axi4index_auto_out_w_valid;
  wire [31:0] axi4index_auto_out_w_bits_data;
  wire [3:0] axi4index_auto_out_w_bits_strb;
  wire  axi4index_auto_out_w_bits_last;
  wire  axi4index_auto_out_b_ready;
  wire  axi4index_auto_out_b_valid;
  wire [3:0] axi4index_auto_out_b_bits_id;
  wire [1:0] axi4index_auto_out_b_bits_resp;
  wire [3:0] axi4index_auto_out_b_bits_echo_tl_state_size;
  wire [4:0] axi4index_auto_out_b_bits_echo_tl_state_source;
  wire  axi4index_auto_out_ar_ready;
  wire  axi4index_auto_out_ar_valid;
  wire [3:0] axi4index_auto_out_ar_bits_id;
  wire [31:0] axi4index_auto_out_ar_bits_addr;
  wire [7:0] axi4index_auto_out_ar_bits_len;
  wire [2:0] axi4index_auto_out_ar_bits_size;
  wire [1:0] axi4index_auto_out_ar_bits_burst;
  wire  axi4index_auto_out_ar_bits_lock;
  wire [3:0] axi4index_auto_out_ar_bits_cache;
  wire [2:0] axi4index_auto_out_ar_bits_prot;
  wire [3:0] axi4index_auto_out_ar_bits_qos;
  wire [3:0] axi4index_auto_out_ar_bits_echo_tl_state_size;
  wire [4:0] axi4index_auto_out_ar_bits_echo_tl_state_source;
  wire  axi4index_auto_out_r_ready;
  wire  axi4index_auto_out_r_valid;
  wire [3:0] axi4index_auto_out_r_bits_id;
  wire [31:0] axi4index_auto_out_r_bits_data;
  wire [1:0] axi4index_auto_out_r_bits_resp;
  wire [3:0] axi4index_auto_out_r_bits_echo_tl_state_size;
  wire [4:0] axi4index_auto_out_r_bits_echo_tl_state_source;
  wire  axi4index_auto_out_r_bits_last;
  wire  tl2axi4_clock;
  wire  tl2axi4_reset;
  wire  tl2axi4_auto_in_a_ready;
  wire  tl2axi4_auto_in_a_valid;
  wire [2:0] tl2axi4_auto_in_a_bits_opcode;
  wire [2:0] tl2axi4_auto_in_a_bits_param;
  wire [2:0] tl2axi4_auto_in_a_bits_size;
  wire [4:0] tl2axi4_auto_in_a_bits_source;
  wire [31:0] tl2axi4_auto_in_a_bits_address;
  wire  tl2axi4_auto_in_a_bits_user_amba_prot_bufferable;
  wire  tl2axi4_auto_in_a_bits_user_amba_prot_modifiable;
  wire  tl2axi4_auto_in_a_bits_user_amba_prot_readalloc;
  wire  tl2axi4_auto_in_a_bits_user_amba_prot_writealloc;
  wire  tl2axi4_auto_in_a_bits_user_amba_prot_privileged;
  wire  tl2axi4_auto_in_a_bits_user_amba_prot_secure;
  wire  tl2axi4_auto_in_a_bits_user_amba_prot_fetch;
  wire [3:0] tl2axi4_auto_in_a_bits_mask;
  wire [31:0] tl2axi4_auto_in_a_bits_data;
  wire  tl2axi4_auto_in_a_bits_corrupt;
  wire  tl2axi4_auto_in_d_ready;
  wire  tl2axi4_auto_in_d_valid;
  wire [2:0] tl2axi4_auto_in_d_bits_opcode;
  wire [2:0] tl2axi4_auto_in_d_bits_size;
  wire [4:0] tl2axi4_auto_in_d_bits_source;
  wire  tl2axi4_auto_in_d_bits_denied;
  wire [31:0] tl2axi4_auto_in_d_bits_data;
  wire  tl2axi4_auto_in_d_bits_corrupt;
  wire  tl2axi4_auto_out_aw_ready;
  wire  tl2axi4_auto_out_aw_valid;
  wire [2:0] tl2axi4_auto_out_aw_bits_id;
  wire [31:0] tl2axi4_auto_out_aw_bits_addr;
  wire [7:0] tl2axi4_auto_out_aw_bits_len;
  wire [2:0] tl2axi4_auto_out_aw_bits_size;
  wire [1:0] tl2axi4_auto_out_aw_bits_burst;
  wire  tl2axi4_auto_out_aw_bits_lock;
  wire [3:0] tl2axi4_auto_out_aw_bits_cache;
  wire [2:0] tl2axi4_auto_out_aw_bits_prot;
  wire [3:0] tl2axi4_auto_out_aw_bits_qos;
  wire [3:0] tl2axi4_auto_out_aw_bits_echo_tl_state_size;
  wire [4:0] tl2axi4_auto_out_aw_bits_echo_tl_state_source;
  wire  tl2axi4_auto_out_w_ready;
  wire  tl2axi4_auto_out_w_valid;
  wire [31:0] tl2axi4_auto_out_w_bits_data;
  wire [3:0] tl2axi4_auto_out_w_bits_strb;
  wire  tl2axi4_auto_out_w_bits_last;
  wire  tl2axi4_auto_out_b_ready;
  wire  tl2axi4_auto_out_b_valid;
  wire [2:0] tl2axi4_auto_out_b_bits_id;
  wire [1:0] tl2axi4_auto_out_b_bits_resp;
  wire [3:0] tl2axi4_auto_out_b_bits_echo_tl_state_size;
  wire [4:0] tl2axi4_auto_out_b_bits_echo_tl_state_source;
  wire  tl2axi4_auto_out_ar_ready;
  wire  tl2axi4_auto_out_ar_valid;
  wire [2:0] tl2axi4_auto_out_ar_bits_id;
  wire [31:0] tl2axi4_auto_out_ar_bits_addr;
  wire [7:0] tl2axi4_auto_out_ar_bits_len;
  wire [2:0] tl2axi4_auto_out_ar_bits_size;
  wire [1:0] tl2axi4_auto_out_ar_bits_burst;
  wire  tl2axi4_auto_out_ar_bits_lock;
  wire [3:0] tl2axi4_auto_out_ar_bits_cache;
  wire [2:0] tl2axi4_auto_out_ar_bits_prot;
  wire [3:0] tl2axi4_auto_out_ar_bits_qos;
  wire [3:0] tl2axi4_auto_out_ar_bits_echo_tl_state_size;
  wire [4:0] tl2axi4_auto_out_ar_bits_echo_tl_state_source;
  wire  tl2axi4_auto_out_r_ready;
  wire  tl2axi4_auto_out_r_valid;
  wire [2:0] tl2axi4_auto_out_r_bits_id;
  wire [31:0] tl2axi4_auto_out_r_bits_data;
  wire [1:0] tl2axi4_auto_out_r_bits_resp;
  wire [3:0] tl2axi4_auto_out_r_bits_echo_tl_state_size;
  wire [4:0] tl2axi4_auto_out_r_bits_echo_tl_state_source;
  wire  tl2axi4_auto_out_r_bits_last;
  wire  widget_auto_in_a_ready;
  wire  widget_auto_in_a_valid;
  wire [2:0] widget_auto_in_a_bits_opcode;
  wire [2:0] widget_auto_in_a_bits_param;
  wire [2:0] widget_auto_in_a_bits_size;
  wire [4:0] widget_auto_in_a_bits_source;
  wire [31:0] widget_auto_in_a_bits_address;
  wire  widget_auto_in_a_bits_user_amba_prot_bufferable;
  wire  widget_auto_in_a_bits_user_amba_prot_modifiable;
  wire  widget_auto_in_a_bits_user_amba_prot_readalloc;
  wire  widget_auto_in_a_bits_user_amba_prot_writealloc;
  wire  widget_auto_in_a_bits_user_amba_prot_privileged;
  wire  widget_auto_in_a_bits_user_amba_prot_secure;
  wire  widget_auto_in_a_bits_user_amba_prot_fetch;
  wire [3:0] widget_auto_in_a_bits_mask;
  wire [31:0] widget_auto_in_a_bits_data;
  wire  widget_auto_in_a_bits_corrupt;
  wire  widget_auto_in_d_ready;
  wire  widget_auto_in_d_valid;
  wire [2:0] widget_auto_in_d_bits_opcode;
  wire [2:0] widget_auto_in_d_bits_size;
  wire [4:0] widget_auto_in_d_bits_source;
  wire  widget_auto_in_d_bits_denied;
  wire [31:0] widget_auto_in_d_bits_data;
  wire  widget_auto_in_d_bits_corrupt;
  wire  widget_auto_out_a_ready;
  wire  widget_auto_out_a_valid;
  wire [2:0] widget_auto_out_a_bits_opcode;
  wire [2:0] widget_auto_out_a_bits_param;
  wire [2:0] widget_auto_out_a_bits_size;
  wire [4:0] widget_auto_out_a_bits_source;
  wire [31:0] widget_auto_out_a_bits_address;
  wire  widget_auto_out_a_bits_user_amba_prot_bufferable;
  wire  widget_auto_out_a_bits_user_amba_prot_modifiable;
  wire  widget_auto_out_a_bits_user_amba_prot_readalloc;
  wire  widget_auto_out_a_bits_user_amba_prot_writealloc;
  wire  widget_auto_out_a_bits_user_amba_prot_privileged;
  wire  widget_auto_out_a_bits_user_amba_prot_secure;
  wire  widget_auto_out_a_bits_user_amba_prot_fetch;
  wire [3:0] widget_auto_out_a_bits_mask;
  wire [31:0] widget_auto_out_a_bits_data;
  wire  widget_auto_out_a_bits_corrupt;
  wire  widget_auto_out_d_ready;
  wire  widget_auto_out_d_valid;
  wire [2:0] widget_auto_out_d_bits_opcode;
  wire [2:0] widget_auto_out_d_bits_size;
  wire [4:0] widget_auto_out_d_bits_source;
  wire  widget_auto_out_d_bits_denied;
  wire [31:0] widget_auto_out_d_bits_data;
  wire  widget_auto_out_d_bits_corrupt;
  AXI4UserYanker axi4yank (
    .clock(axi4yank_clock),
    .reset(axi4yank_reset),
    .auto_in_aw_ready(axi4yank_auto_in_aw_ready),
    .auto_in_aw_valid(axi4yank_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4yank_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4yank_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4yank_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4yank_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4yank_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(axi4yank_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(axi4yank_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4yank_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(axi4yank_auto_in_aw_bits_qos),
    .auto_in_aw_bits_echo_tl_state_size(axi4yank_auto_in_aw_bits_echo_tl_state_size),
    .auto_in_aw_bits_echo_tl_state_source(axi4yank_auto_in_aw_bits_echo_tl_state_source),
    .auto_in_w_ready(axi4yank_auto_in_w_ready),
    .auto_in_w_valid(axi4yank_auto_in_w_valid),
    .auto_in_w_bits_data(axi4yank_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4yank_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4yank_auto_in_w_bits_last),
    .auto_in_b_ready(axi4yank_auto_in_b_ready),
    .auto_in_b_valid(axi4yank_auto_in_b_valid),
    .auto_in_b_bits_id(axi4yank_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4yank_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_tl_state_size(axi4yank_auto_in_b_bits_echo_tl_state_size),
    .auto_in_b_bits_echo_tl_state_source(axi4yank_auto_in_b_bits_echo_tl_state_source),
    .auto_in_ar_ready(axi4yank_auto_in_ar_ready),
    .auto_in_ar_valid(axi4yank_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4yank_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4yank_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4yank_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4yank_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4yank_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(axi4yank_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(axi4yank_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4yank_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(axi4yank_auto_in_ar_bits_qos),
    .auto_in_ar_bits_echo_tl_state_size(axi4yank_auto_in_ar_bits_echo_tl_state_size),
    .auto_in_ar_bits_echo_tl_state_source(axi4yank_auto_in_ar_bits_echo_tl_state_source),
    .auto_in_r_ready(axi4yank_auto_in_r_ready),
    .auto_in_r_valid(axi4yank_auto_in_r_valid),
    .auto_in_r_bits_id(axi4yank_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4yank_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4yank_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_tl_state_size(axi4yank_auto_in_r_bits_echo_tl_state_size),
    .auto_in_r_bits_echo_tl_state_source(axi4yank_auto_in_r_bits_echo_tl_state_source),
    .auto_in_r_bits_last(axi4yank_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4yank_auto_out_aw_ready),
    .auto_out_aw_valid(axi4yank_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4yank_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4yank_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4yank_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4yank_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4yank_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(axi4yank_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(axi4yank_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4yank_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(axi4yank_auto_out_aw_bits_qos),
    .auto_out_w_ready(axi4yank_auto_out_w_ready),
    .auto_out_w_valid(axi4yank_auto_out_w_valid),
    .auto_out_w_bits_data(axi4yank_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4yank_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4yank_auto_out_w_bits_last),
    .auto_out_b_ready(axi4yank_auto_out_b_ready),
    .auto_out_b_valid(axi4yank_auto_out_b_valid),
    .auto_out_b_bits_id(axi4yank_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4yank_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4yank_auto_out_ar_ready),
    .auto_out_ar_valid(axi4yank_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4yank_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4yank_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4yank_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4yank_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4yank_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(axi4yank_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(axi4yank_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4yank_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(axi4yank_auto_out_ar_bits_qos),
    .auto_out_r_ready(axi4yank_auto_out_r_ready),
    .auto_out_r_valid(axi4yank_auto_out_r_valid),
    .auto_out_r_bits_id(axi4yank_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4yank_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4yank_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4yank_auto_out_r_bits_last)
  );
  AXI4IdIndexer axi4index (
    .auto_in_aw_ready(axi4index_auto_in_aw_ready),
    .auto_in_aw_valid(axi4index_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4index_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4index_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4index_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4index_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4index_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(axi4index_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(axi4index_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4index_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(axi4index_auto_in_aw_bits_qos),
    .auto_in_aw_bits_echo_tl_state_size(axi4index_auto_in_aw_bits_echo_tl_state_size),
    .auto_in_aw_bits_echo_tl_state_source(axi4index_auto_in_aw_bits_echo_tl_state_source),
    .auto_in_w_ready(axi4index_auto_in_w_ready),
    .auto_in_w_valid(axi4index_auto_in_w_valid),
    .auto_in_w_bits_data(axi4index_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4index_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4index_auto_in_w_bits_last),
    .auto_in_b_ready(axi4index_auto_in_b_ready),
    .auto_in_b_valid(axi4index_auto_in_b_valid),
    .auto_in_b_bits_id(axi4index_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4index_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_tl_state_size(axi4index_auto_in_b_bits_echo_tl_state_size),
    .auto_in_b_bits_echo_tl_state_source(axi4index_auto_in_b_bits_echo_tl_state_source),
    .auto_in_ar_ready(axi4index_auto_in_ar_ready),
    .auto_in_ar_valid(axi4index_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4index_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4index_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4index_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4index_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4index_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(axi4index_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(axi4index_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4index_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(axi4index_auto_in_ar_bits_qos),
    .auto_in_ar_bits_echo_tl_state_size(axi4index_auto_in_ar_bits_echo_tl_state_size),
    .auto_in_ar_bits_echo_tl_state_source(axi4index_auto_in_ar_bits_echo_tl_state_source),
    .auto_in_r_ready(axi4index_auto_in_r_ready),
    .auto_in_r_valid(axi4index_auto_in_r_valid),
    .auto_in_r_bits_id(axi4index_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4index_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4index_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_tl_state_size(axi4index_auto_in_r_bits_echo_tl_state_size),
    .auto_in_r_bits_echo_tl_state_source(axi4index_auto_in_r_bits_echo_tl_state_source),
    .auto_in_r_bits_last(axi4index_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4index_auto_out_aw_ready),
    .auto_out_aw_valid(axi4index_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4index_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4index_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4index_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4index_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4index_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(axi4index_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(axi4index_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4index_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(axi4index_auto_out_aw_bits_qos),
    .auto_out_aw_bits_echo_tl_state_size(axi4index_auto_out_aw_bits_echo_tl_state_size),
    .auto_out_aw_bits_echo_tl_state_source(axi4index_auto_out_aw_bits_echo_tl_state_source),
    .auto_out_w_ready(axi4index_auto_out_w_ready),
    .auto_out_w_valid(axi4index_auto_out_w_valid),
    .auto_out_w_bits_data(axi4index_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4index_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4index_auto_out_w_bits_last),
    .auto_out_b_ready(axi4index_auto_out_b_ready),
    .auto_out_b_valid(axi4index_auto_out_b_valid),
    .auto_out_b_bits_id(axi4index_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4index_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_tl_state_size(axi4index_auto_out_b_bits_echo_tl_state_size),
    .auto_out_b_bits_echo_tl_state_source(axi4index_auto_out_b_bits_echo_tl_state_source),
    .auto_out_ar_ready(axi4index_auto_out_ar_ready),
    .auto_out_ar_valid(axi4index_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4index_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4index_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4index_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4index_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4index_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(axi4index_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(axi4index_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4index_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(axi4index_auto_out_ar_bits_qos),
    .auto_out_ar_bits_echo_tl_state_size(axi4index_auto_out_ar_bits_echo_tl_state_size),
    .auto_out_ar_bits_echo_tl_state_source(axi4index_auto_out_ar_bits_echo_tl_state_source),
    .auto_out_r_ready(axi4index_auto_out_r_ready),
    .auto_out_r_valid(axi4index_auto_out_r_valid),
    .auto_out_r_bits_id(axi4index_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4index_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4index_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_tl_state_size(axi4index_auto_out_r_bits_echo_tl_state_size),
    .auto_out_r_bits_echo_tl_state_source(axi4index_auto_out_r_bits_echo_tl_state_source),
    .auto_out_r_bits_last(axi4index_auto_out_r_bits_last)
  );
  TLToAXI4 tl2axi4 (
    .clock(tl2axi4_clock),
    .reset(tl2axi4_reset),
    .auto_in_a_ready(tl2axi4_auto_in_a_ready),
    .auto_in_a_valid(tl2axi4_auto_in_a_valid),
    .auto_in_a_bits_opcode(tl2axi4_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(tl2axi4_auto_in_a_bits_param),
    .auto_in_a_bits_size(tl2axi4_auto_in_a_bits_size),
    .auto_in_a_bits_source(tl2axi4_auto_in_a_bits_source),
    .auto_in_a_bits_address(tl2axi4_auto_in_a_bits_address),
    .auto_in_a_bits_user_amba_prot_bufferable(tl2axi4_auto_in_a_bits_user_amba_prot_bufferable),
    .auto_in_a_bits_user_amba_prot_modifiable(tl2axi4_auto_in_a_bits_user_amba_prot_modifiable),
    .auto_in_a_bits_user_amba_prot_readalloc(tl2axi4_auto_in_a_bits_user_amba_prot_readalloc),
    .auto_in_a_bits_user_amba_prot_writealloc(tl2axi4_auto_in_a_bits_user_amba_prot_writealloc),
    .auto_in_a_bits_user_amba_prot_privileged(tl2axi4_auto_in_a_bits_user_amba_prot_privileged),
    .auto_in_a_bits_user_amba_prot_secure(tl2axi4_auto_in_a_bits_user_amba_prot_secure),
    .auto_in_a_bits_user_amba_prot_fetch(tl2axi4_auto_in_a_bits_user_amba_prot_fetch),
    .auto_in_a_bits_mask(tl2axi4_auto_in_a_bits_mask),
    .auto_in_a_bits_data(tl2axi4_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(tl2axi4_auto_in_a_bits_corrupt),
    .auto_in_d_ready(tl2axi4_auto_in_d_ready),
    .auto_in_d_valid(tl2axi4_auto_in_d_valid),
    .auto_in_d_bits_opcode(tl2axi4_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(tl2axi4_auto_in_d_bits_size),
    .auto_in_d_bits_source(tl2axi4_auto_in_d_bits_source),
    .auto_in_d_bits_denied(tl2axi4_auto_in_d_bits_denied),
    .auto_in_d_bits_data(tl2axi4_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(tl2axi4_auto_in_d_bits_corrupt),
    .auto_out_aw_ready(tl2axi4_auto_out_aw_ready),
    .auto_out_aw_valid(tl2axi4_auto_out_aw_valid),
    .auto_out_aw_bits_id(tl2axi4_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(tl2axi4_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(tl2axi4_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(tl2axi4_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(tl2axi4_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(tl2axi4_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(tl2axi4_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(tl2axi4_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(tl2axi4_auto_out_aw_bits_qos),
    .auto_out_aw_bits_echo_tl_state_size(tl2axi4_auto_out_aw_bits_echo_tl_state_size),
    .auto_out_aw_bits_echo_tl_state_source(tl2axi4_auto_out_aw_bits_echo_tl_state_source),
    .auto_out_w_ready(tl2axi4_auto_out_w_ready),
    .auto_out_w_valid(tl2axi4_auto_out_w_valid),
    .auto_out_w_bits_data(tl2axi4_auto_out_w_bits_data),
    .auto_out_w_bits_strb(tl2axi4_auto_out_w_bits_strb),
    .auto_out_w_bits_last(tl2axi4_auto_out_w_bits_last),
    .auto_out_b_ready(tl2axi4_auto_out_b_ready),
    .auto_out_b_valid(tl2axi4_auto_out_b_valid),
    .auto_out_b_bits_id(tl2axi4_auto_out_b_bits_id),
    .auto_out_b_bits_resp(tl2axi4_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_tl_state_size(tl2axi4_auto_out_b_bits_echo_tl_state_size),
    .auto_out_b_bits_echo_tl_state_source(tl2axi4_auto_out_b_bits_echo_tl_state_source),
    .auto_out_ar_ready(tl2axi4_auto_out_ar_ready),
    .auto_out_ar_valid(tl2axi4_auto_out_ar_valid),
    .auto_out_ar_bits_id(tl2axi4_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(tl2axi4_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(tl2axi4_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(tl2axi4_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(tl2axi4_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(tl2axi4_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(tl2axi4_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(tl2axi4_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(tl2axi4_auto_out_ar_bits_qos),
    .auto_out_ar_bits_echo_tl_state_size(tl2axi4_auto_out_ar_bits_echo_tl_state_size),
    .auto_out_ar_bits_echo_tl_state_source(tl2axi4_auto_out_ar_bits_echo_tl_state_source),
    .auto_out_r_ready(tl2axi4_auto_out_r_ready),
    .auto_out_r_valid(tl2axi4_auto_out_r_valid),
    .auto_out_r_bits_id(tl2axi4_auto_out_r_bits_id),
    .auto_out_r_bits_data(tl2axi4_auto_out_r_bits_data),
    .auto_out_r_bits_resp(tl2axi4_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_tl_state_size(tl2axi4_auto_out_r_bits_echo_tl_state_size),
    .auto_out_r_bits_echo_tl_state_source(tl2axi4_auto_out_r_bits_echo_tl_state_source),
    .auto_out_r_bits_last(tl2axi4_auto_out_r_bits_last)
  );
  assign widget_auto_in_a_ready = widget_auto_out_a_ready;
  assign widget_auto_in_d_valid = widget_auto_out_d_valid;
  assign widget_auto_in_d_bits_opcode = widget_auto_out_d_bits_opcode;
  assign widget_auto_in_d_bits_size = widget_auto_out_d_bits_size;
  assign widget_auto_in_d_bits_source = widget_auto_out_d_bits_source;
  assign widget_auto_in_d_bits_denied = widget_auto_out_d_bits_denied;
  assign widget_auto_in_d_bits_data = widget_auto_out_d_bits_data;
  assign widget_auto_in_d_bits_corrupt = widget_auto_out_d_bits_corrupt;
  assign widget_auto_out_a_valid = widget_auto_in_a_valid;
  assign widget_auto_out_a_bits_opcode = widget_auto_in_a_bits_opcode;
  assign widget_auto_out_a_bits_param = widget_auto_in_a_bits_param;
  assign widget_auto_out_a_bits_size = widget_auto_in_a_bits_size;
  assign widget_auto_out_a_bits_source = widget_auto_in_a_bits_source;
  assign widget_auto_out_a_bits_address = widget_auto_in_a_bits_address;
  assign widget_auto_out_a_bits_user_amba_prot_bufferable = widget_auto_in_a_bits_user_amba_prot_bufferable;
  assign widget_auto_out_a_bits_user_amba_prot_modifiable = widget_auto_in_a_bits_user_amba_prot_modifiable;
  assign widget_auto_out_a_bits_user_amba_prot_readalloc = widget_auto_in_a_bits_user_amba_prot_readalloc;
  assign widget_auto_out_a_bits_user_amba_prot_writealloc = widget_auto_in_a_bits_user_amba_prot_writealloc;
  assign widget_auto_out_a_bits_user_amba_prot_privileged = widget_auto_in_a_bits_user_amba_prot_privileged;
  assign widget_auto_out_a_bits_user_amba_prot_secure = widget_auto_in_a_bits_user_amba_prot_secure;
  assign widget_auto_out_a_bits_user_amba_prot_fetch = widget_auto_in_a_bits_user_amba_prot_fetch;
  assign widget_auto_out_a_bits_mask = widget_auto_in_a_bits_mask;
  assign widget_auto_out_a_bits_data = widget_auto_in_a_bits_data;
  assign widget_auto_out_a_bits_corrupt = widget_auto_in_a_bits_corrupt;
  assign widget_auto_out_d_ready = widget_auto_in_d_ready;
  assign auto_widget_in_a_ready = widget_auto_in_a_ready;
  assign auto_widget_in_d_valid = widget_auto_in_d_valid;
  assign auto_widget_in_d_bits_opcode = widget_auto_in_d_bits_opcode;
  assign auto_widget_in_d_bits_size = widget_auto_in_d_bits_size;
  assign auto_widget_in_d_bits_source = widget_auto_in_d_bits_source;
  assign auto_widget_in_d_bits_denied = widget_auto_in_d_bits_denied;
  assign auto_widget_in_d_bits_data = widget_auto_in_d_bits_data;
  assign auto_widget_in_d_bits_corrupt = widget_auto_in_d_bits_corrupt;
  assign auto_axi4yank_out_aw_valid = axi4yank_auto_out_aw_valid;
  assign auto_axi4yank_out_aw_bits_id = axi4yank_auto_out_aw_bits_id;
  assign auto_axi4yank_out_aw_bits_addr = axi4yank_auto_out_aw_bits_addr;
  assign auto_axi4yank_out_aw_bits_len = axi4yank_auto_out_aw_bits_len;
  assign auto_axi4yank_out_aw_bits_size = axi4yank_auto_out_aw_bits_size;
  assign auto_axi4yank_out_aw_bits_burst = axi4yank_auto_out_aw_bits_burst;
  assign auto_axi4yank_out_aw_bits_lock = axi4yank_auto_out_aw_bits_lock;
  assign auto_axi4yank_out_aw_bits_cache = axi4yank_auto_out_aw_bits_cache;
  assign auto_axi4yank_out_aw_bits_prot = axi4yank_auto_out_aw_bits_prot;
  assign auto_axi4yank_out_aw_bits_qos = axi4yank_auto_out_aw_bits_qos;
  assign auto_axi4yank_out_w_valid = axi4yank_auto_out_w_valid;
  assign auto_axi4yank_out_w_bits_data = axi4yank_auto_out_w_bits_data;
  assign auto_axi4yank_out_w_bits_strb = axi4yank_auto_out_w_bits_strb;
  assign auto_axi4yank_out_w_bits_last = axi4yank_auto_out_w_bits_last;
  assign auto_axi4yank_out_b_ready = axi4yank_auto_out_b_ready;
  assign auto_axi4yank_out_ar_valid = axi4yank_auto_out_ar_valid;
  assign auto_axi4yank_out_ar_bits_id = axi4yank_auto_out_ar_bits_id;
  assign auto_axi4yank_out_ar_bits_addr = axi4yank_auto_out_ar_bits_addr;
  assign auto_axi4yank_out_ar_bits_len = axi4yank_auto_out_ar_bits_len;
  assign auto_axi4yank_out_ar_bits_size = axi4yank_auto_out_ar_bits_size;
  assign auto_axi4yank_out_ar_bits_burst = axi4yank_auto_out_ar_bits_burst;
  assign auto_axi4yank_out_ar_bits_lock = axi4yank_auto_out_ar_bits_lock;
  assign auto_axi4yank_out_ar_bits_cache = axi4yank_auto_out_ar_bits_cache;
  assign auto_axi4yank_out_ar_bits_prot = axi4yank_auto_out_ar_bits_prot;
  assign auto_axi4yank_out_ar_bits_qos = axi4yank_auto_out_ar_bits_qos;
  assign auto_axi4yank_out_r_ready = axi4yank_auto_out_r_ready;
  assign auto_tl_in_a_ready = auto_tl_out_a_ready;
  assign auto_tl_in_d_valid = auto_tl_out_d_valid;
  assign auto_tl_in_d_bits_opcode = auto_tl_out_d_bits_opcode;
  assign auto_tl_in_d_bits_size = auto_tl_out_d_bits_size;
  assign auto_tl_in_d_bits_source = auto_tl_out_d_bits_source;
  assign auto_tl_in_d_bits_denied = auto_tl_out_d_bits_denied;
  assign auto_tl_in_d_bits_data = auto_tl_out_d_bits_data;
  assign auto_tl_in_d_bits_corrupt = auto_tl_out_d_bits_corrupt;
  assign auto_tl_out_a_valid = auto_tl_in_a_valid;
  assign auto_tl_out_a_bits_opcode = auto_tl_in_a_bits_opcode;
  assign auto_tl_out_a_bits_param = auto_tl_in_a_bits_param;
  assign auto_tl_out_a_bits_size = auto_tl_in_a_bits_size;
  assign auto_tl_out_a_bits_source = auto_tl_in_a_bits_source;
  assign auto_tl_out_a_bits_address = auto_tl_in_a_bits_address;
  assign auto_tl_out_a_bits_user_amba_prot_bufferable = auto_tl_in_a_bits_user_amba_prot_bufferable;
  assign auto_tl_out_a_bits_user_amba_prot_modifiable = auto_tl_in_a_bits_user_amba_prot_modifiable;
  assign auto_tl_out_a_bits_user_amba_prot_readalloc = auto_tl_in_a_bits_user_amba_prot_readalloc;
  assign auto_tl_out_a_bits_user_amba_prot_writealloc = auto_tl_in_a_bits_user_amba_prot_writealloc;
  assign auto_tl_out_a_bits_user_amba_prot_privileged = auto_tl_in_a_bits_user_amba_prot_privileged;
  assign auto_tl_out_a_bits_user_amba_prot_secure = auto_tl_in_a_bits_user_amba_prot_secure;
  assign auto_tl_out_a_bits_user_amba_prot_fetch = auto_tl_in_a_bits_user_amba_prot_fetch;
  assign auto_tl_out_a_bits_mask = auto_tl_in_a_bits_mask;
  assign auto_tl_out_a_bits_data = auto_tl_in_a_bits_data;
  assign auto_tl_out_a_bits_corrupt = auto_tl_in_a_bits_corrupt;
  assign auto_tl_out_d_ready = auto_tl_in_d_ready;
  assign axi4yank_clock = clock;
  assign axi4yank_reset = reset;
  assign axi4yank_auto_in_aw_valid = axi4index_auto_out_aw_valid;
  assign axi4yank_auto_in_aw_bits_id = axi4index_auto_out_aw_bits_id;
  assign axi4yank_auto_in_aw_bits_addr = axi4index_auto_out_aw_bits_addr;
  assign axi4yank_auto_in_aw_bits_len = axi4index_auto_out_aw_bits_len;
  assign axi4yank_auto_in_aw_bits_size = axi4index_auto_out_aw_bits_size;
  assign axi4yank_auto_in_aw_bits_burst = axi4index_auto_out_aw_bits_burst;
  assign axi4yank_auto_in_aw_bits_lock = axi4index_auto_out_aw_bits_lock;
  assign axi4yank_auto_in_aw_bits_cache = axi4index_auto_out_aw_bits_cache;
  assign axi4yank_auto_in_aw_bits_prot = axi4index_auto_out_aw_bits_prot;
  assign axi4yank_auto_in_aw_bits_qos = axi4index_auto_out_aw_bits_qos;
  assign axi4yank_auto_in_aw_bits_echo_tl_state_size = axi4index_auto_out_aw_bits_echo_tl_state_size;
  assign axi4yank_auto_in_aw_bits_echo_tl_state_source = axi4index_auto_out_aw_bits_echo_tl_state_source;
  assign axi4yank_auto_in_w_valid = axi4index_auto_out_w_valid;
  assign axi4yank_auto_in_w_bits_data = axi4index_auto_out_w_bits_data;
  assign axi4yank_auto_in_w_bits_strb = axi4index_auto_out_w_bits_strb;
  assign axi4yank_auto_in_w_bits_last = axi4index_auto_out_w_bits_last;
  assign axi4yank_auto_in_b_ready = axi4index_auto_out_b_ready;
  assign axi4yank_auto_in_ar_valid = axi4index_auto_out_ar_valid;
  assign axi4yank_auto_in_ar_bits_id = axi4index_auto_out_ar_bits_id;
  assign axi4yank_auto_in_ar_bits_addr = axi4index_auto_out_ar_bits_addr;
  assign axi4yank_auto_in_ar_bits_len = axi4index_auto_out_ar_bits_len;
  assign axi4yank_auto_in_ar_bits_size = axi4index_auto_out_ar_bits_size;
  assign axi4yank_auto_in_ar_bits_burst = axi4index_auto_out_ar_bits_burst;
  assign axi4yank_auto_in_ar_bits_lock = axi4index_auto_out_ar_bits_lock;
  assign axi4yank_auto_in_ar_bits_cache = axi4index_auto_out_ar_bits_cache;
  assign axi4yank_auto_in_ar_bits_prot = axi4index_auto_out_ar_bits_prot;
  assign axi4yank_auto_in_ar_bits_qos = axi4index_auto_out_ar_bits_qos;
  assign axi4yank_auto_in_ar_bits_echo_tl_state_size = axi4index_auto_out_ar_bits_echo_tl_state_size;
  assign axi4yank_auto_in_ar_bits_echo_tl_state_source = axi4index_auto_out_ar_bits_echo_tl_state_source;
  assign axi4yank_auto_in_r_ready = axi4index_auto_out_r_ready;
  assign axi4yank_auto_out_aw_ready = auto_axi4yank_out_aw_ready;
  assign axi4yank_auto_out_w_ready = auto_axi4yank_out_w_ready;
  assign axi4yank_auto_out_b_valid = auto_axi4yank_out_b_valid;
  assign axi4yank_auto_out_b_bits_id = auto_axi4yank_out_b_bits_id;
  assign axi4yank_auto_out_b_bits_resp = auto_axi4yank_out_b_bits_resp;
  assign axi4yank_auto_out_ar_ready = auto_axi4yank_out_ar_ready;
  assign axi4yank_auto_out_r_valid = auto_axi4yank_out_r_valid;
  assign axi4yank_auto_out_r_bits_id = auto_axi4yank_out_r_bits_id;
  assign axi4yank_auto_out_r_bits_data = auto_axi4yank_out_r_bits_data;
  assign axi4yank_auto_out_r_bits_resp = auto_axi4yank_out_r_bits_resp;
  assign axi4yank_auto_out_r_bits_last = auto_axi4yank_out_r_bits_last;
  assign axi4index_auto_in_aw_valid = tl2axi4_auto_out_aw_valid;
  assign axi4index_auto_in_aw_bits_id = tl2axi4_auto_out_aw_bits_id;
  assign axi4index_auto_in_aw_bits_addr = tl2axi4_auto_out_aw_bits_addr;
  assign axi4index_auto_in_aw_bits_len = tl2axi4_auto_out_aw_bits_len;
  assign axi4index_auto_in_aw_bits_size = tl2axi4_auto_out_aw_bits_size;
  assign axi4index_auto_in_aw_bits_burst = tl2axi4_auto_out_aw_bits_burst;
  assign axi4index_auto_in_aw_bits_lock = tl2axi4_auto_out_aw_bits_lock;
  assign axi4index_auto_in_aw_bits_cache = tl2axi4_auto_out_aw_bits_cache;
  assign axi4index_auto_in_aw_bits_prot = tl2axi4_auto_out_aw_bits_prot;
  assign axi4index_auto_in_aw_bits_qos = tl2axi4_auto_out_aw_bits_qos;
  assign axi4index_auto_in_aw_bits_echo_tl_state_size = tl2axi4_auto_out_aw_bits_echo_tl_state_size;
  assign axi4index_auto_in_aw_bits_echo_tl_state_source = tl2axi4_auto_out_aw_bits_echo_tl_state_source;
  assign axi4index_auto_in_w_valid = tl2axi4_auto_out_w_valid;
  assign axi4index_auto_in_w_bits_data = tl2axi4_auto_out_w_bits_data;
  assign axi4index_auto_in_w_bits_strb = tl2axi4_auto_out_w_bits_strb;
  assign axi4index_auto_in_w_bits_last = tl2axi4_auto_out_w_bits_last;
  assign axi4index_auto_in_b_ready = tl2axi4_auto_out_b_ready;
  assign axi4index_auto_in_ar_valid = tl2axi4_auto_out_ar_valid;
  assign axi4index_auto_in_ar_bits_id = tl2axi4_auto_out_ar_bits_id;
  assign axi4index_auto_in_ar_bits_addr = tl2axi4_auto_out_ar_bits_addr;
  assign axi4index_auto_in_ar_bits_len = tl2axi4_auto_out_ar_bits_len;
  assign axi4index_auto_in_ar_bits_size = tl2axi4_auto_out_ar_bits_size;
  assign axi4index_auto_in_ar_bits_burst = tl2axi4_auto_out_ar_bits_burst;
  assign axi4index_auto_in_ar_bits_lock = tl2axi4_auto_out_ar_bits_lock;
  assign axi4index_auto_in_ar_bits_cache = tl2axi4_auto_out_ar_bits_cache;
  assign axi4index_auto_in_ar_bits_prot = tl2axi4_auto_out_ar_bits_prot;
  assign axi4index_auto_in_ar_bits_qos = tl2axi4_auto_out_ar_bits_qos;
  assign axi4index_auto_in_ar_bits_echo_tl_state_size = tl2axi4_auto_out_ar_bits_echo_tl_state_size;
  assign axi4index_auto_in_ar_bits_echo_tl_state_source = tl2axi4_auto_out_ar_bits_echo_tl_state_source;
  assign axi4index_auto_in_r_ready = tl2axi4_auto_out_r_ready;
  assign axi4index_auto_out_aw_ready = axi4yank_auto_in_aw_ready;
  assign axi4index_auto_out_w_ready = axi4yank_auto_in_w_ready;
  assign axi4index_auto_out_b_valid = axi4yank_auto_in_b_valid;
  assign axi4index_auto_out_b_bits_id = axi4yank_auto_in_b_bits_id;
  assign axi4index_auto_out_b_bits_resp = axi4yank_auto_in_b_bits_resp;
  assign axi4index_auto_out_b_bits_echo_tl_state_size = axi4yank_auto_in_b_bits_echo_tl_state_size;
  assign axi4index_auto_out_b_bits_echo_tl_state_source = axi4yank_auto_in_b_bits_echo_tl_state_source;
  assign axi4index_auto_out_ar_ready = axi4yank_auto_in_ar_ready;
  assign axi4index_auto_out_r_valid = axi4yank_auto_in_r_valid;
  assign axi4index_auto_out_r_bits_id = axi4yank_auto_in_r_bits_id;
  assign axi4index_auto_out_r_bits_data = axi4yank_auto_in_r_bits_data;
  assign axi4index_auto_out_r_bits_resp = axi4yank_auto_in_r_bits_resp;
  assign axi4index_auto_out_r_bits_echo_tl_state_size = axi4yank_auto_in_r_bits_echo_tl_state_size;
  assign axi4index_auto_out_r_bits_echo_tl_state_source = axi4yank_auto_in_r_bits_echo_tl_state_source;
  assign axi4index_auto_out_r_bits_last = axi4yank_auto_in_r_bits_last;
  assign tl2axi4_clock = clock;
  assign tl2axi4_reset = reset;
  assign tl2axi4_auto_in_a_valid = widget_auto_out_a_valid;
  assign tl2axi4_auto_in_a_bits_opcode = widget_auto_out_a_bits_opcode;
  assign tl2axi4_auto_in_a_bits_param = widget_auto_out_a_bits_param;
  assign tl2axi4_auto_in_a_bits_size = widget_auto_out_a_bits_size;
  assign tl2axi4_auto_in_a_bits_source = widget_auto_out_a_bits_source;
  assign tl2axi4_auto_in_a_bits_address = widget_auto_out_a_bits_address;
  assign tl2axi4_auto_in_a_bits_user_amba_prot_bufferable = widget_auto_out_a_bits_user_amba_prot_bufferable;
  assign tl2axi4_auto_in_a_bits_user_amba_prot_modifiable = widget_auto_out_a_bits_user_amba_prot_modifiable;
  assign tl2axi4_auto_in_a_bits_user_amba_prot_readalloc = widget_auto_out_a_bits_user_amba_prot_readalloc;
  assign tl2axi4_auto_in_a_bits_user_amba_prot_writealloc = widget_auto_out_a_bits_user_amba_prot_writealloc;
  assign tl2axi4_auto_in_a_bits_user_amba_prot_privileged = widget_auto_out_a_bits_user_amba_prot_privileged;
  assign tl2axi4_auto_in_a_bits_user_amba_prot_secure = widget_auto_out_a_bits_user_amba_prot_secure;
  assign tl2axi4_auto_in_a_bits_user_amba_prot_fetch = widget_auto_out_a_bits_user_amba_prot_fetch;
  assign tl2axi4_auto_in_a_bits_mask = widget_auto_out_a_bits_mask;
  assign tl2axi4_auto_in_a_bits_data = widget_auto_out_a_bits_data;
  assign tl2axi4_auto_in_a_bits_corrupt = widget_auto_out_a_bits_corrupt;
  assign tl2axi4_auto_in_d_ready = widget_auto_out_d_ready;
  assign tl2axi4_auto_out_aw_ready = axi4index_auto_in_aw_ready;
  assign tl2axi4_auto_out_w_ready = axi4index_auto_in_w_ready;
  assign tl2axi4_auto_out_b_valid = axi4index_auto_in_b_valid;
  assign tl2axi4_auto_out_b_bits_id = axi4index_auto_in_b_bits_id;
  assign tl2axi4_auto_out_b_bits_resp = axi4index_auto_in_b_bits_resp;
  assign tl2axi4_auto_out_b_bits_echo_tl_state_size = axi4index_auto_in_b_bits_echo_tl_state_size;
  assign tl2axi4_auto_out_b_bits_echo_tl_state_source = axi4index_auto_in_b_bits_echo_tl_state_source;
  assign tl2axi4_auto_out_ar_ready = axi4index_auto_in_ar_ready;
  assign tl2axi4_auto_out_r_valid = axi4index_auto_in_r_valid;
  assign tl2axi4_auto_out_r_bits_id = axi4index_auto_in_r_bits_id;
  assign tl2axi4_auto_out_r_bits_data = axi4index_auto_in_r_bits_data;
  assign tl2axi4_auto_out_r_bits_resp = axi4index_auto_in_r_bits_resp;
  assign tl2axi4_auto_out_r_bits_echo_tl_state_size = axi4index_auto_in_r_bits_echo_tl_state_size;
  assign tl2axi4_auto_out_r_bits_echo_tl_state_source = axi4index_auto_in_r_bits_echo_tl_state_source;
  assign tl2axi4_auto_out_r_bits_last = axi4index_auto_in_r_bits_last;
  assign widget_auto_in_a_valid = auto_widget_in_a_valid;
  assign widget_auto_in_a_bits_opcode = auto_widget_in_a_bits_opcode;
  assign widget_auto_in_a_bits_param = auto_widget_in_a_bits_param;
  assign widget_auto_in_a_bits_size = auto_widget_in_a_bits_size;
  assign widget_auto_in_a_bits_source = auto_widget_in_a_bits_source;
  assign widget_auto_in_a_bits_address = auto_widget_in_a_bits_address;
  assign widget_auto_in_a_bits_user_amba_prot_bufferable = auto_widget_in_a_bits_user_amba_prot_bufferable;
  assign widget_auto_in_a_bits_user_amba_prot_modifiable = auto_widget_in_a_bits_user_amba_prot_modifiable;
  assign widget_auto_in_a_bits_user_amba_prot_readalloc = auto_widget_in_a_bits_user_amba_prot_readalloc;
  assign widget_auto_in_a_bits_user_amba_prot_writealloc = auto_widget_in_a_bits_user_amba_prot_writealloc;
  assign widget_auto_in_a_bits_user_amba_prot_privileged = auto_widget_in_a_bits_user_amba_prot_privileged;
  assign widget_auto_in_a_bits_user_amba_prot_secure = auto_widget_in_a_bits_user_amba_prot_secure;
  assign widget_auto_in_a_bits_user_amba_prot_fetch = auto_widget_in_a_bits_user_amba_prot_fetch;
  assign widget_auto_in_a_bits_mask = auto_widget_in_a_bits_mask;
  assign widget_auto_in_a_bits_data = auto_widget_in_a_bits_data;
  assign widget_auto_in_a_bits_corrupt = auto_widget_in_a_bits_corrupt;
  assign widget_auto_in_d_ready = auto_widget_in_d_ready;
  assign widget_auto_out_a_ready = tl2axi4_auto_in_a_ready;
  assign widget_auto_out_d_valid = tl2axi4_auto_in_d_valid;
  assign widget_auto_out_d_bits_opcode = tl2axi4_auto_in_d_bits_opcode;
  assign widget_auto_out_d_bits_size = tl2axi4_auto_in_d_bits_size;
  assign widget_auto_out_d_bits_source = tl2axi4_auto_in_d_bits_source;
  assign widget_auto_out_d_bits_denied = tl2axi4_auto_in_d_bits_denied;
  assign widget_auto_out_d_bits_data = tl2axi4_auto_in_d_bits_data;
  assign widget_auto_out_d_bits_corrupt = tl2axi4_auto_in_d_bits_corrupt;
endmodule