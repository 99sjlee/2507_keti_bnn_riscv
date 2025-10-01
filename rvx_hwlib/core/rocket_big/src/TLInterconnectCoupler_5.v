`default_nettype wire
module TLInterconnectCoupler_5(
  input         clock,
  input         reset,
  output        auto_axi4index_in_aw_ready,
  input         auto_axi4index_in_aw_valid,
  input  [7:0]  auto_axi4index_in_aw_bits_id,
  input  [31:0] auto_axi4index_in_aw_bits_addr,
  input  [7:0]  auto_axi4index_in_aw_bits_len,
  input  [2:0]  auto_axi4index_in_aw_bits_size,
  input  [1:0]  auto_axi4index_in_aw_bits_burst,
  input  [3:0]  auto_axi4index_in_aw_bits_cache,
  input  [2:0]  auto_axi4index_in_aw_bits_prot,
  output        auto_axi4index_in_w_ready,
  input         auto_axi4index_in_w_valid,
  input  [63:0] auto_axi4index_in_w_bits_data,
  input  [7:0]  auto_axi4index_in_w_bits_strb,
  input         auto_axi4index_in_w_bits_last,
  input         auto_axi4index_in_b_ready,
  output        auto_axi4index_in_b_valid,
  output [7:0]  auto_axi4index_in_b_bits_id,
  output [1:0]  auto_axi4index_in_b_bits_resp,
  output        auto_axi4index_in_ar_ready,
  input         auto_axi4index_in_ar_valid,
  input  [7:0]  auto_axi4index_in_ar_bits_id,
  input  [31:0] auto_axi4index_in_ar_bits_addr,
  input  [7:0]  auto_axi4index_in_ar_bits_len,
  input  [2:0]  auto_axi4index_in_ar_bits_size,
  input  [1:0]  auto_axi4index_in_ar_bits_burst,
  input  [3:0]  auto_axi4index_in_ar_bits_cache,
  input  [2:0]  auto_axi4index_in_ar_bits_prot,
  input         auto_axi4index_in_r_ready,
  output        auto_axi4index_in_r_valid,
  output [7:0]  auto_axi4index_in_r_bits_id,
  output [63:0] auto_axi4index_in_r_bits_data,
  output [1:0]  auto_axi4index_in_r_bits_resp,
  output        auto_axi4index_in_r_bits_last,
  input         auto_tl_out_a_ready,
  output        auto_tl_out_a_valid,
  output [2:0]  auto_tl_out_a_bits_opcode,
  output [2:0]  auto_tl_out_a_bits_param,
  output [3:0]  auto_tl_out_a_bits_size,
  output [3:0]  auto_tl_out_a_bits_source,
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
  input  [1:0]  auto_tl_out_d_bits_param,
  input  [3:0]  auto_tl_out_d_bits_size,
  input  [3:0]  auto_tl_out_d_bits_source,
  input         auto_tl_out_d_bits_sink,
  input         auto_tl_out_d_bits_denied,
  input  [31:0] auto_tl_out_d_bits_data,
  input         auto_tl_out_d_bits_corrupt
);
  wire  buffer_clock;
  wire  buffer_reset;
  wire  buffer_auto_in_a_ready;
  wire  buffer_auto_in_a_valid;
  wire [2:0] buffer_auto_in_a_bits_opcode;
  wire [3:0] buffer_auto_in_a_bits_size;
  wire [3:0] buffer_auto_in_a_bits_source;
  wire [31:0] buffer_auto_in_a_bits_address;
  wire  buffer_auto_in_a_bits_user_amba_prot_bufferable;
  wire  buffer_auto_in_a_bits_user_amba_prot_modifiable;
  wire  buffer_auto_in_a_bits_user_amba_prot_readalloc;
  wire  buffer_auto_in_a_bits_user_amba_prot_writealloc;
  wire  buffer_auto_in_a_bits_user_amba_prot_privileged;
  wire  buffer_auto_in_a_bits_user_amba_prot_secure;
  wire  buffer_auto_in_a_bits_user_amba_prot_fetch;
  wire [3:0] buffer_auto_in_a_bits_mask;
  wire [31:0] buffer_auto_in_a_bits_data;
  wire  buffer_auto_in_d_ready;
  wire  buffer_auto_in_d_valid;
  wire [2:0] buffer_auto_in_d_bits_opcode;
  wire [1:0] buffer_auto_in_d_bits_param;
  wire [3:0] buffer_auto_in_d_bits_size;
  wire [3:0] buffer_auto_in_d_bits_source;
  wire  buffer_auto_in_d_bits_sink;
  wire  buffer_auto_in_d_bits_denied;
  wire [31:0] buffer_auto_in_d_bits_data;
  wire  buffer_auto_in_d_bits_corrupt;
  wire  buffer_auto_out_a_ready;
  wire  buffer_auto_out_a_valid;
  wire [2:0] buffer_auto_out_a_bits_opcode;
  wire [2:0] buffer_auto_out_a_bits_param;
  wire [3:0] buffer_auto_out_a_bits_size;
  wire [3:0] buffer_auto_out_a_bits_source;
  wire [31:0] buffer_auto_out_a_bits_address;
  wire  buffer_auto_out_a_bits_user_amba_prot_bufferable;
  wire  buffer_auto_out_a_bits_user_amba_prot_modifiable;
  wire  buffer_auto_out_a_bits_user_amba_prot_readalloc;
  wire  buffer_auto_out_a_bits_user_amba_prot_writealloc;
  wire  buffer_auto_out_a_bits_user_amba_prot_privileged;
  wire  buffer_auto_out_a_bits_user_amba_prot_secure;
  wire  buffer_auto_out_a_bits_user_amba_prot_fetch;
  wire [3:0] buffer_auto_out_a_bits_mask;
  wire [31:0] buffer_auto_out_a_bits_data;
  wire  buffer_auto_out_a_bits_corrupt;
  wire  buffer_auto_out_d_ready;
  wire  buffer_auto_out_d_valid;
  wire [2:0] buffer_auto_out_d_bits_opcode;
  wire [1:0] buffer_auto_out_d_bits_param;
  wire [3:0] buffer_auto_out_d_bits_size;
  wire [3:0] buffer_auto_out_d_bits_source;
  wire  buffer_auto_out_d_bits_sink;
  wire  buffer_auto_out_d_bits_denied;
  wire [31:0] buffer_auto_out_d_bits_data;
  wire  buffer_auto_out_d_bits_corrupt;
  wire  fixer_clock;
  wire  fixer_reset;
  wire  fixer_auto_in_a_ready;
  wire  fixer_auto_in_a_valid;
  wire [2:0] fixer_auto_in_a_bits_opcode;
  wire [3:0] fixer_auto_in_a_bits_size;
  wire [3:0] fixer_auto_in_a_bits_source;
  wire [31:0] fixer_auto_in_a_bits_address;
  wire  fixer_auto_in_a_bits_user_amba_prot_bufferable;
  wire  fixer_auto_in_a_bits_user_amba_prot_modifiable;
  wire  fixer_auto_in_a_bits_user_amba_prot_readalloc;
  wire  fixer_auto_in_a_bits_user_amba_prot_writealloc;
  wire  fixer_auto_in_a_bits_user_amba_prot_privileged;
  wire  fixer_auto_in_a_bits_user_amba_prot_secure;
  wire  fixer_auto_in_a_bits_user_amba_prot_fetch;
  wire [3:0] fixer_auto_in_a_bits_mask;
  wire [31:0] fixer_auto_in_a_bits_data;
  wire  fixer_auto_in_d_ready;
  wire  fixer_auto_in_d_valid;
  wire [2:0] fixer_auto_in_d_bits_opcode;
  wire [1:0] fixer_auto_in_d_bits_param;
  wire [3:0] fixer_auto_in_d_bits_size;
  wire [3:0] fixer_auto_in_d_bits_source;
  wire  fixer_auto_in_d_bits_sink;
  wire  fixer_auto_in_d_bits_denied;
  wire [31:0] fixer_auto_in_d_bits_data;
  wire  fixer_auto_in_d_bits_corrupt;
  wire  fixer_auto_out_a_ready;
  wire  fixer_auto_out_a_valid;
  wire [2:0] fixer_auto_out_a_bits_opcode;
  wire [3:0] fixer_auto_out_a_bits_size;
  wire [3:0] fixer_auto_out_a_bits_source;
  wire [31:0] fixer_auto_out_a_bits_address;
  wire  fixer_auto_out_a_bits_user_amba_prot_bufferable;
  wire  fixer_auto_out_a_bits_user_amba_prot_modifiable;
  wire  fixer_auto_out_a_bits_user_amba_prot_readalloc;
  wire  fixer_auto_out_a_bits_user_amba_prot_writealloc;
  wire  fixer_auto_out_a_bits_user_amba_prot_privileged;
  wire  fixer_auto_out_a_bits_user_amba_prot_secure;
  wire  fixer_auto_out_a_bits_user_amba_prot_fetch;
  wire [3:0] fixer_auto_out_a_bits_mask;
  wire [31:0] fixer_auto_out_a_bits_data;
  wire  fixer_auto_out_d_ready;
  wire  fixer_auto_out_d_valid;
  wire [2:0] fixer_auto_out_d_bits_opcode;
  wire [1:0] fixer_auto_out_d_bits_param;
  wire [3:0] fixer_auto_out_d_bits_size;
  wire [3:0] fixer_auto_out_d_bits_source;
  wire  fixer_auto_out_d_bits_sink;
  wire  fixer_auto_out_d_bits_denied;
  wire [31:0] fixer_auto_out_d_bits_data;
  wire  fixer_auto_out_d_bits_corrupt;
  wire  widget_clock;
  wire  widget_reset;
  wire  widget_auto_in_a_ready;
  wire  widget_auto_in_a_valid;
  wire [2:0] widget_auto_in_a_bits_opcode;
  wire [3:0] widget_auto_in_a_bits_size;
  wire [3:0] widget_auto_in_a_bits_source;
  wire [31:0] widget_auto_in_a_bits_address;
  wire  widget_auto_in_a_bits_user_amba_prot_bufferable;
  wire  widget_auto_in_a_bits_user_amba_prot_modifiable;
  wire  widget_auto_in_a_bits_user_amba_prot_readalloc;
  wire  widget_auto_in_a_bits_user_amba_prot_writealloc;
  wire  widget_auto_in_a_bits_user_amba_prot_privileged;
  wire  widget_auto_in_a_bits_user_amba_prot_secure;
  wire  widget_auto_in_a_bits_user_amba_prot_fetch;
  wire [7:0] widget_auto_in_a_bits_mask;
  wire [63:0] widget_auto_in_a_bits_data;
  wire  widget_auto_in_d_ready;
  wire  widget_auto_in_d_valid;
  wire [2:0] widget_auto_in_d_bits_opcode;
  wire [3:0] widget_auto_in_d_bits_size;
  wire [3:0] widget_auto_in_d_bits_source;
  wire  widget_auto_in_d_bits_denied;
  wire [63:0] widget_auto_in_d_bits_data;
  wire  widget_auto_in_d_bits_corrupt;
  wire  widget_auto_out_a_ready;
  wire  widget_auto_out_a_valid;
  wire [2:0] widget_auto_out_a_bits_opcode;
  wire [3:0] widget_auto_out_a_bits_size;
  wire [3:0] widget_auto_out_a_bits_source;
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
  wire  widget_auto_out_d_ready;
  wire  widget_auto_out_d_valid;
  wire [2:0] widget_auto_out_d_bits_opcode;
  wire [1:0] widget_auto_out_d_bits_param;
  wire [3:0] widget_auto_out_d_bits_size;
  wire [3:0] widget_auto_out_d_bits_source;
  wire  widget_auto_out_d_bits_sink;
  wire  widget_auto_out_d_bits_denied;
  wire [31:0] widget_auto_out_d_bits_data;
  wire  widget_auto_out_d_bits_corrupt;
  wire  axi42tl_clock;
  wire  axi42tl_reset;
  wire  axi42tl_auto_in_aw_ready;
  wire  axi42tl_auto_in_aw_valid;
  wire  axi42tl_auto_in_aw_bits_id;
  wire [31:0] axi42tl_auto_in_aw_bits_addr;
  wire [7:0] axi42tl_auto_in_aw_bits_len;
  wire [2:0] axi42tl_auto_in_aw_bits_size;
  wire [3:0] axi42tl_auto_in_aw_bits_cache;
  wire [2:0] axi42tl_auto_in_aw_bits_prot;
  wire  axi42tl_auto_in_w_ready;
  wire  axi42tl_auto_in_w_valid;
  wire [63:0] axi42tl_auto_in_w_bits_data;
  wire [7:0] axi42tl_auto_in_w_bits_strb;
  wire  axi42tl_auto_in_w_bits_last;
  wire  axi42tl_auto_in_b_ready;
  wire  axi42tl_auto_in_b_valid;
  wire  axi42tl_auto_in_b_bits_id;
  wire [1:0] axi42tl_auto_in_b_bits_resp;
  wire  axi42tl_auto_in_ar_ready;
  wire  axi42tl_auto_in_ar_valid;
  wire  axi42tl_auto_in_ar_bits_id;
  wire [31:0] axi42tl_auto_in_ar_bits_addr;
  wire [7:0] axi42tl_auto_in_ar_bits_len;
  wire [2:0] axi42tl_auto_in_ar_bits_size;
  wire [3:0] axi42tl_auto_in_ar_bits_cache;
  wire [2:0] axi42tl_auto_in_ar_bits_prot;
  wire  axi42tl_auto_in_r_ready;
  wire  axi42tl_auto_in_r_valid;
  wire  axi42tl_auto_in_r_bits_id;
  wire [63:0] axi42tl_auto_in_r_bits_data;
  wire [1:0] axi42tl_auto_in_r_bits_resp;
  wire  axi42tl_auto_in_r_bits_last;
  wire  axi42tl_auto_out_a_ready;
  wire  axi42tl_auto_out_a_valid;
  wire [2:0] axi42tl_auto_out_a_bits_opcode;
  wire [3:0] axi42tl_auto_out_a_bits_size;
  wire [3:0] axi42tl_auto_out_a_bits_source;
  wire [31:0] axi42tl_auto_out_a_bits_address;
  wire  axi42tl_auto_out_a_bits_user_amba_prot_bufferable;
  wire  axi42tl_auto_out_a_bits_user_amba_prot_modifiable;
  wire  axi42tl_auto_out_a_bits_user_amba_prot_readalloc;
  wire  axi42tl_auto_out_a_bits_user_amba_prot_writealloc;
  wire  axi42tl_auto_out_a_bits_user_amba_prot_privileged;
  wire  axi42tl_auto_out_a_bits_user_amba_prot_secure;
  wire  axi42tl_auto_out_a_bits_user_amba_prot_fetch;
  wire [7:0] axi42tl_auto_out_a_bits_mask;
  wire [63:0] axi42tl_auto_out_a_bits_data;
  wire  axi42tl_auto_out_d_ready;
  wire  axi42tl_auto_out_d_valid;
  wire [2:0] axi42tl_auto_out_d_bits_opcode;
  wire [3:0] axi42tl_auto_out_d_bits_size;
  wire [3:0] axi42tl_auto_out_d_bits_source;
  wire  axi42tl_auto_out_d_bits_denied;
  wire [63:0] axi42tl_auto_out_d_bits_data;
  wire  axi42tl_auto_out_d_bits_corrupt;
  wire  axi4yank_clock;
  wire  axi4yank_reset;
  wire  axi4yank_auto_in_aw_ready;
  wire  axi4yank_auto_in_aw_valid;
  wire  axi4yank_auto_in_aw_bits_id;
  wire [31:0] axi4yank_auto_in_aw_bits_addr;
  wire [7:0] axi4yank_auto_in_aw_bits_len;
  wire [2:0] axi4yank_auto_in_aw_bits_size;
  wire [3:0] axi4yank_auto_in_aw_bits_cache;
  wire [2:0] axi4yank_auto_in_aw_bits_prot;
  wire [6:0] axi4yank_auto_in_aw_bits_echo_extra_id;
  wire  axi4yank_auto_in_aw_bits_echo_real_last;
  wire  axi4yank_auto_in_w_ready;
  wire  axi4yank_auto_in_w_valid;
  wire [63:0] axi4yank_auto_in_w_bits_data;
  wire [7:0] axi4yank_auto_in_w_bits_strb;
  wire  axi4yank_auto_in_w_bits_last;
  wire  axi4yank_auto_in_b_ready;
  wire  axi4yank_auto_in_b_valid;
  wire  axi4yank_auto_in_b_bits_id;
  wire [1:0] axi4yank_auto_in_b_bits_resp;
  wire [6:0] axi4yank_auto_in_b_bits_echo_extra_id;
  wire  axi4yank_auto_in_b_bits_echo_real_last;
  wire  axi4yank_auto_in_ar_ready;
  wire  axi4yank_auto_in_ar_valid;
  wire  axi4yank_auto_in_ar_bits_id;
  wire [31:0] axi4yank_auto_in_ar_bits_addr;
  wire [7:0] axi4yank_auto_in_ar_bits_len;
  wire [2:0] axi4yank_auto_in_ar_bits_size;
  wire [3:0] axi4yank_auto_in_ar_bits_cache;
  wire [2:0] axi4yank_auto_in_ar_bits_prot;
  wire [6:0] axi4yank_auto_in_ar_bits_echo_extra_id;
  wire  axi4yank_auto_in_ar_bits_echo_real_last;
  wire  axi4yank_auto_in_r_ready;
  wire  axi4yank_auto_in_r_valid;
  wire  axi4yank_auto_in_r_bits_id;
  wire [63:0] axi4yank_auto_in_r_bits_data;
  wire [1:0] axi4yank_auto_in_r_bits_resp;
  wire [6:0] axi4yank_auto_in_r_bits_echo_extra_id;
  wire  axi4yank_auto_in_r_bits_echo_real_last;
  wire  axi4yank_auto_in_r_bits_last;
  wire  axi4yank_auto_out_aw_ready;
  wire  axi4yank_auto_out_aw_valid;
  wire  axi4yank_auto_out_aw_bits_id;
  wire [31:0] axi4yank_auto_out_aw_bits_addr;
  wire [7:0] axi4yank_auto_out_aw_bits_len;
  wire [2:0] axi4yank_auto_out_aw_bits_size;
  wire [3:0] axi4yank_auto_out_aw_bits_cache;
  wire [2:0] axi4yank_auto_out_aw_bits_prot;
  wire  axi4yank_auto_out_w_ready;
  wire  axi4yank_auto_out_w_valid;
  wire [63:0] axi4yank_auto_out_w_bits_data;
  wire [7:0] axi4yank_auto_out_w_bits_strb;
  wire  axi4yank_auto_out_w_bits_last;
  wire  axi4yank_auto_out_b_ready;
  wire  axi4yank_auto_out_b_valid;
  wire  axi4yank_auto_out_b_bits_id;
  wire [1:0] axi4yank_auto_out_b_bits_resp;
  wire  axi4yank_auto_out_ar_ready;
  wire  axi4yank_auto_out_ar_valid;
  wire  axi4yank_auto_out_ar_bits_id;
  wire [31:0] axi4yank_auto_out_ar_bits_addr;
  wire [7:0] axi4yank_auto_out_ar_bits_len;
  wire [2:0] axi4yank_auto_out_ar_bits_size;
  wire [3:0] axi4yank_auto_out_ar_bits_cache;
  wire [2:0] axi4yank_auto_out_ar_bits_prot;
  wire  axi4yank_auto_out_r_ready;
  wire  axi4yank_auto_out_r_valid;
  wire  axi4yank_auto_out_r_bits_id;
  wire [63:0] axi4yank_auto_out_r_bits_data;
  wire [1:0] axi4yank_auto_out_r_bits_resp;
  wire  axi4yank_auto_out_r_bits_last;
  wire  axi4frag_clock;
  wire  axi4frag_reset;
  wire  axi4frag_auto_in_aw_ready;
  wire  axi4frag_auto_in_aw_valid;
  wire  axi4frag_auto_in_aw_bits_id;
  wire [31:0] axi4frag_auto_in_aw_bits_addr;
  wire [7:0] axi4frag_auto_in_aw_bits_len;
  wire [2:0] axi4frag_auto_in_aw_bits_size;
  wire [1:0] axi4frag_auto_in_aw_bits_burst;
  wire [3:0] axi4frag_auto_in_aw_bits_cache;
  wire [2:0] axi4frag_auto_in_aw_bits_prot;
  wire [6:0] axi4frag_auto_in_aw_bits_echo_extra_id;
  wire  axi4frag_auto_in_w_ready;
  wire  axi4frag_auto_in_w_valid;
  wire [63:0] axi4frag_auto_in_w_bits_data;
  wire [7:0] axi4frag_auto_in_w_bits_strb;
  wire  axi4frag_auto_in_w_bits_last;
  wire  axi4frag_auto_in_b_ready;
  wire  axi4frag_auto_in_b_valid;
  wire  axi4frag_auto_in_b_bits_id;
  wire [1:0] axi4frag_auto_in_b_bits_resp;
  wire [6:0] axi4frag_auto_in_b_bits_echo_extra_id;
  wire  axi4frag_auto_in_ar_ready;
  wire  axi4frag_auto_in_ar_valid;
  wire  axi4frag_auto_in_ar_bits_id;
  wire [31:0] axi4frag_auto_in_ar_bits_addr;
  wire [7:0] axi4frag_auto_in_ar_bits_len;
  wire [2:0] axi4frag_auto_in_ar_bits_size;
  wire [1:0] axi4frag_auto_in_ar_bits_burst;
  wire [3:0] axi4frag_auto_in_ar_bits_cache;
  wire [2:0] axi4frag_auto_in_ar_bits_prot;
  wire [6:0] axi4frag_auto_in_ar_bits_echo_extra_id;
  wire  axi4frag_auto_in_r_ready;
  wire  axi4frag_auto_in_r_valid;
  wire  axi4frag_auto_in_r_bits_id;
  wire [63:0] axi4frag_auto_in_r_bits_data;
  wire [1:0] axi4frag_auto_in_r_bits_resp;
  wire [6:0] axi4frag_auto_in_r_bits_echo_extra_id;
  wire  axi4frag_auto_in_r_bits_last;
  wire  axi4frag_auto_out_aw_ready;
  wire  axi4frag_auto_out_aw_valid;
  wire  axi4frag_auto_out_aw_bits_id;
  wire [31:0] axi4frag_auto_out_aw_bits_addr;
  wire [7:0] axi4frag_auto_out_aw_bits_len;
  wire [2:0] axi4frag_auto_out_aw_bits_size;
  wire [3:0] axi4frag_auto_out_aw_bits_cache;
  wire [2:0] axi4frag_auto_out_aw_bits_prot;
  wire [6:0] axi4frag_auto_out_aw_bits_echo_extra_id;
  wire  axi4frag_auto_out_aw_bits_echo_real_last;
  wire  axi4frag_auto_out_w_ready;
  wire  axi4frag_auto_out_w_valid;
  wire [63:0] axi4frag_auto_out_w_bits_data;
  wire [7:0] axi4frag_auto_out_w_bits_strb;
  wire  axi4frag_auto_out_w_bits_last;
  wire  axi4frag_auto_out_b_ready;
  wire  axi4frag_auto_out_b_valid;
  wire  axi4frag_auto_out_b_bits_id;
  wire [1:0] axi4frag_auto_out_b_bits_resp;
  wire [6:0] axi4frag_auto_out_b_bits_echo_extra_id;
  wire  axi4frag_auto_out_b_bits_echo_real_last;
  wire  axi4frag_auto_out_ar_ready;
  wire  axi4frag_auto_out_ar_valid;
  wire  axi4frag_auto_out_ar_bits_id;
  wire [31:0] axi4frag_auto_out_ar_bits_addr;
  wire [7:0] axi4frag_auto_out_ar_bits_len;
  wire [2:0] axi4frag_auto_out_ar_bits_size;
  wire [3:0] axi4frag_auto_out_ar_bits_cache;
  wire [2:0] axi4frag_auto_out_ar_bits_prot;
  wire [6:0] axi4frag_auto_out_ar_bits_echo_extra_id;
  wire  axi4frag_auto_out_ar_bits_echo_real_last;
  wire  axi4frag_auto_out_r_ready;
  wire  axi4frag_auto_out_r_valid;
  wire  axi4frag_auto_out_r_bits_id;
  wire [63:0] axi4frag_auto_out_r_bits_data;
  wire [1:0] axi4frag_auto_out_r_bits_resp;
  wire [6:0] axi4frag_auto_out_r_bits_echo_extra_id;
  wire  axi4frag_auto_out_r_bits_echo_real_last;
  wire  axi4frag_auto_out_r_bits_last;
  wire  axi4index_auto_in_aw_ready;
  wire  axi4index_auto_in_aw_valid;
  wire [7:0] axi4index_auto_in_aw_bits_id;
  wire [31:0] axi4index_auto_in_aw_bits_addr;
  wire [7:0] axi4index_auto_in_aw_bits_len;
  wire [2:0] axi4index_auto_in_aw_bits_size;
  wire [1:0] axi4index_auto_in_aw_bits_burst;
  wire [3:0] axi4index_auto_in_aw_bits_cache;
  wire [2:0] axi4index_auto_in_aw_bits_prot;
  wire  axi4index_auto_in_w_ready;
  wire  axi4index_auto_in_w_valid;
  wire [63:0] axi4index_auto_in_w_bits_data;
  wire [7:0] axi4index_auto_in_w_bits_strb;
  wire  axi4index_auto_in_w_bits_last;
  wire  axi4index_auto_in_b_ready;
  wire  axi4index_auto_in_b_valid;
  wire [7:0] axi4index_auto_in_b_bits_id;
  wire [1:0] axi4index_auto_in_b_bits_resp;
  wire  axi4index_auto_in_ar_ready;
  wire  axi4index_auto_in_ar_valid;
  wire [7:0] axi4index_auto_in_ar_bits_id;
  wire [31:0] axi4index_auto_in_ar_bits_addr;
  wire [7:0] axi4index_auto_in_ar_bits_len;
  wire [2:0] axi4index_auto_in_ar_bits_size;
  wire [1:0] axi4index_auto_in_ar_bits_burst;
  wire [3:0] axi4index_auto_in_ar_bits_cache;
  wire [2:0] axi4index_auto_in_ar_bits_prot;
  wire  axi4index_auto_in_r_ready;
  wire  axi4index_auto_in_r_valid;
  wire [7:0] axi4index_auto_in_r_bits_id;
  wire [63:0] axi4index_auto_in_r_bits_data;
  wire [1:0] axi4index_auto_in_r_bits_resp;
  wire  axi4index_auto_in_r_bits_last;
  wire  axi4index_auto_out_aw_ready;
  wire  axi4index_auto_out_aw_valid;
  wire  axi4index_auto_out_aw_bits_id;
  wire [31:0] axi4index_auto_out_aw_bits_addr;
  wire [7:0] axi4index_auto_out_aw_bits_len;
  wire [2:0] axi4index_auto_out_aw_bits_size;
  wire [1:0] axi4index_auto_out_aw_bits_burst;
  wire [3:0] axi4index_auto_out_aw_bits_cache;
  wire [2:0] axi4index_auto_out_aw_bits_prot;
  wire [6:0] axi4index_auto_out_aw_bits_echo_extra_id;
  wire  axi4index_auto_out_w_ready;
  wire  axi4index_auto_out_w_valid;
  wire [63:0] axi4index_auto_out_w_bits_data;
  wire [7:0] axi4index_auto_out_w_bits_strb;
  wire  axi4index_auto_out_w_bits_last;
  wire  axi4index_auto_out_b_ready;
  wire  axi4index_auto_out_b_valid;
  wire  axi4index_auto_out_b_bits_id;
  wire [1:0] axi4index_auto_out_b_bits_resp;
  wire [6:0] axi4index_auto_out_b_bits_echo_extra_id;
  wire  axi4index_auto_out_ar_ready;
  wire  axi4index_auto_out_ar_valid;
  wire  axi4index_auto_out_ar_bits_id;
  wire [31:0] axi4index_auto_out_ar_bits_addr;
  wire [7:0] axi4index_auto_out_ar_bits_len;
  wire [2:0] axi4index_auto_out_ar_bits_size;
  wire [1:0] axi4index_auto_out_ar_bits_burst;
  wire [3:0] axi4index_auto_out_ar_bits_cache;
  wire [2:0] axi4index_auto_out_ar_bits_prot;
  wire [6:0] axi4index_auto_out_ar_bits_echo_extra_id;
  wire  axi4index_auto_out_r_ready;
  wire  axi4index_auto_out_r_valid;
  wire  axi4index_auto_out_r_bits_id;
  wire [63:0] axi4index_auto_out_r_bits_data;
  wire [1:0] axi4index_auto_out_r_bits_resp;
  wire [6:0] axi4index_auto_out_r_bits_echo_extra_id;
  wire  axi4index_auto_out_r_bits_last;
  TLBuffer_3 buffer (
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_user_amba_prot_bufferable(buffer_auto_in_a_bits_user_amba_prot_bufferable),
    .auto_in_a_bits_user_amba_prot_modifiable(buffer_auto_in_a_bits_user_amba_prot_modifiable),
    .auto_in_a_bits_user_amba_prot_readalloc(buffer_auto_in_a_bits_user_amba_prot_readalloc),
    .auto_in_a_bits_user_amba_prot_writealloc(buffer_auto_in_a_bits_user_amba_prot_writealloc),
    .auto_in_a_bits_user_amba_prot_privileged(buffer_auto_in_a_bits_user_amba_prot_privileged),
    .auto_in_a_bits_user_amba_prot_secure(buffer_auto_in_a_bits_user_amba_prot_secure),
    .auto_in_a_bits_user_amba_prot_fetch(buffer_auto_in_a_bits_user_amba_prot_fetch),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_user_amba_prot_bufferable(buffer_auto_out_a_bits_user_amba_prot_bufferable),
    .auto_out_a_bits_user_amba_prot_modifiable(buffer_auto_out_a_bits_user_amba_prot_modifiable),
    .auto_out_a_bits_user_amba_prot_readalloc(buffer_auto_out_a_bits_user_amba_prot_readalloc),
    .auto_out_a_bits_user_amba_prot_writealloc(buffer_auto_out_a_bits_user_amba_prot_writealloc),
    .auto_out_a_bits_user_amba_prot_privileged(buffer_auto_out_a_bits_user_amba_prot_privileged),
    .auto_out_a_bits_user_amba_prot_secure(buffer_auto_out_a_bits_user_amba_prot_secure),
    .auto_out_a_bits_user_amba_prot_fetch(buffer_auto_out_a_bits_user_amba_prot_fetch),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  TLFIFOFixer_2 fixer (
    .clock(fixer_clock),
    .reset(fixer_reset),
    .auto_in_a_ready(fixer_auto_in_a_ready),
    .auto_in_a_valid(fixer_auto_in_a_valid),
    .auto_in_a_bits_opcode(fixer_auto_in_a_bits_opcode),
    .auto_in_a_bits_size(fixer_auto_in_a_bits_size),
    .auto_in_a_bits_source(fixer_auto_in_a_bits_source),
    .auto_in_a_bits_address(fixer_auto_in_a_bits_address),
    .auto_in_a_bits_user_amba_prot_bufferable(fixer_auto_in_a_bits_user_amba_prot_bufferable),
    .auto_in_a_bits_user_amba_prot_modifiable(fixer_auto_in_a_bits_user_amba_prot_modifiable),
    .auto_in_a_bits_user_amba_prot_readalloc(fixer_auto_in_a_bits_user_amba_prot_readalloc),
    .auto_in_a_bits_user_amba_prot_writealloc(fixer_auto_in_a_bits_user_amba_prot_writealloc),
    .auto_in_a_bits_user_amba_prot_privileged(fixer_auto_in_a_bits_user_amba_prot_privileged),
    .auto_in_a_bits_user_amba_prot_secure(fixer_auto_in_a_bits_user_amba_prot_secure),
    .auto_in_a_bits_user_amba_prot_fetch(fixer_auto_in_a_bits_user_amba_prot_fetch),
    .auto_in_a_bits_mask(fixer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fixer_auto_in_a_bits_data),
    .auto_in_d_ready(fixer_auto_in_d_ready),
    .auto_in_d_valid(fixer_auto_in_d_valid),
    .auto_in_d_bits_opcode(fixer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fixer_auto_in_d_bits_param),
    .auto_in_d_bits_size(fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source(fixer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(fixer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(fixer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fixer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fixer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(fixer_auto_out_a_ready),
    .auto_out_a_valid(fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode(fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_size(fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source(fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address(fixer_auto_out_a_bits_address),
    .auto_out_a_bits_user_amba_prot_bufferable(fixer_auto_out_a_bits_user_amba_prot_bufferable),
    .auto_out_a_bits_user_amba_prot_modifiable(fixer_auto_out_a_bits_user_amba_prot_modifiable),
    .auto_out_a_bits_user_amba_prot_readalloc(fixer_auto_out_a_bits_user_amba_prot_readalloc),
    .auto_out_a_bits_user_amba_prot_writealloc(fixer_auto_out_a_bits_user_amba_prot_writealloc),
    .auto_out_a_bits_user_amba_prot_privileged(fixer_auto_out_a_bits_user_amba_prot_privileged),
    .auto_out_a_bits_user_amba_prot_secure(fixer_auto_out_a_bits_user_amba_prot_secure),
    .auto_out_a_bits_user_amba_prot_fetch(fixer_auto_out_a_bits_user_amba_prot_fetch),
    .auto_out_a_bits_mask(fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fixer_auto_out_a_bits_data),
    .auto_out_d_ready(fixer_auto_out_d_ready),
    .auto_out_d_valid(fixer_auto_out_d_valid),
    .auto_out_d_bits_opcode(fixer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fixer_auto_out_d_bits_param),
    .auto_out_d_bits_size(fixer_auto_out_d_bits_size),
    .auto_out_d_bits_source(fixer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(fixer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(fixer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fixer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fixer_auto_out_d_bits_corrupt)
  );
  TLWidthWidget_4 widget (
    .clock(widget_clock),
    .reset(widget_reset),
    .auto_in_a_ready(widget_auto_in_a_ready),
    .auto_in_a_valid(widget_auto_in_a_valid),
    .auto_in_a_bits_opcode(widget_auto_in_a_bits_opcode),
    .auto_in_a_bits_size(widget_auto_in_a_bits_size),
    .auto_in_a_bits_source(widget_auto_in_a_bits_source),
    .auto_in_a_bits_address(widget_auto_in_a_bits_address),
    .auto_in_a_bits_user_amba_prot_bufferable(widget_auto_in_a_bits_user_amba_prot_bufferable),
    .auto_in_a_bits_user_amba_prot_modifiable(widget_auto_in_a_bits_user_amba_prot_modifiable),
    .auto_in_a_bits_user_amba_prot_readalloc(widget_auto_in_a_bits_user_amba_prot_readalloc),
    .auto_in_a_bits_user_amba_prot_writealloc(widget_auto_in_a_bits_user_amba_prot_writealloc),
    .auto_in_a_bits_user_amba_prot_privileged(widget_auto_in_a_bits_user_amba_prot_privileged),
    .auto_in_a_bits_user_amba_prot_secure(widget_auto_in_a_bits_user_amba_prot_secure),
    .auto_in_a_bits_user_amba_prot_fetch(widget_auto_in_a_bits_user_amba_prot_fetch),
    .auto_in_a_bits_mask(widget_auto_in_a_bits_mask),
    .auto_in_a_bits_data(widget_auto_in_a_bits_data),
    .auto_in_d_ready(widget_auto_in_d_ready),
    .auto_in_d_valid(widget_auto_in_d_valid),
    .auto_in_d_bits_opcode(widget_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(widget_auto_in_d_bits_size),
    .auto_in_d_bits_source(widget_auto_in_d_bits_source),
    .auto_in_d_bits_denied(widget_auto_in_d_bits_denied),
    .auto_in_d_bits_data(widget_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(widget_auto_in_d_bits_corrupt),
    .auto_out_a_ready(widget_auto_out_a_ready),
    .auto_out_a_valid(widget_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_out_a_bits_size(widget_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_auto_out_a_bits_address),
    .auto_out_a_bits_user_amba_prot_bufferable(widget_auto_out_a_bits_user_amba_prot_bufferable),
    .auto_out_a_bits_user_amba_prot_modifiable(widget_auto_out_a_bits_user_amba_prot_modifiable),
    .auto_out_a_bits_user_amba_prot_readalloc(widget_auto_out_a_bits_user_amba_prot_readalloc),
    .auto_out_a_bits_user_amba_prot_writealloc(widget_auto_out_a_bits_user_amba_prot_writealloc),
    .auto_out_a_bits_user_amba_prot_privileged(widget_auto_out_a_bits_user_amba_prot_privileged),
    .auto_out_a_bits_user_amba_prot_secure(widget_auto_out_a_bits_user_amba_prot_secure),
    .auto_out_a_bits_user_amba_prot_fetch(widget_auto_out_a_bits_user_amba_prot_fetch),
    .auto_out_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_out_a_bits_data(widget_auto_out_a_bits_data),
    .auto_out_d_ready(widget_auto_out_d_ready),
    .auto_out_d_valid(widget_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_auto_out_d_bits_source),
    .auto_out_d_bits_sink(widget_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(widget_auto_out_d_bits_denied),
    .auto_out_d_bits_data(widget_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(widget_auto_out_d_bits_corrupt)
  );
  AXI4ToTL axi42tl (
    .clock(axi42tl_clock),
    .reset(axi42tl_reset),
    .auto_in_aw_ready(axi42tl_auto_in_aw_ready),
    .auto_in_aw_valid(axi42tl_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi42tl_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi42tl_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi42tl_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi42tl_auto_in_aw_bits_size),
    .auto_in_aw_bits_cache(axi42tl_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi42tl_auto_in_aw_bits_prot),
    .auto_in_w_ready(axi42tl_auto_in_w_ready),
    .auto_in_w_valid(axi42tl_auto_in_w_valid),
    .auto_in_w_bits_data(axi42tl_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi42tl_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi42tl_auto_in_w_bits_last),
    .auto_in_b_ready(axi42tl_auto_in_b_ready),
    .auto_in_b_valid(axi42tl_auto_in_b_valid),
    .auto_in_b_bits_id(axi42tl_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi42tl_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi42tl_auto_in_ar_ready),
    .auto_in_ar_valid(axi42tl_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi42tl_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi42tl_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi42tl_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi42tl_auto_in_ar_bits_size),
    .auto_in_ar_bits_cache(axi42tl_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi42tl_auto_in_ar_bits_prot),
    .auto_in_r_ready(axi42tl_auto_in_r_ready),
    .auto_in_r_valid(axi42tl_auto_in_r_valid),
    .auto_in_r_bits_id(axi42tl_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi42tl_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi42tl_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi42tl_auto_in_r_bits_last),
    .auto_out_a_ready(axi42tl_auto_out_a_ready),
    .auto_out_a_valid(axi42tl_auto_out_a_valid),
    .auto_out_a_bits_opcode(axi42tl_auto_out_a_bits_opcode),
    .auto_out_a_bits_size(axi42tl_auto_out_a_bits_size),
    .auto_out_a_bits_source(axi42tl_auto_out_a_bits_source),
    .auto_out_a_bits_address(axi42tl_auto_out_a_bits_address),
    .auto_out_a_bits_user_amba_prot_bufferable(axi42tl_auto_out_a_bits_user_amba_prot_bufferable),
    .auto_out_a_bits_user_amba_prot_modifiable(axi42tl_auto_out_a_bits_user_amba_prot_modifiable),
    .auto_out_a_bits_user_amba_prot_readalloc(axi42tl_auto_out_a_bits_user_amba_prot_readalloc),
    .auto_out_a_bits_user_amba_prot_writealloc(axi42tl_auto_out_a_bits_user_amba_prot_writealloc),
    .auto_out_a_bits_user_amba_prot_privileged(axi42tl_auto_out_a_bits_user_amba_prot_privileged),
    .auto_out_a_bits_user_amba_prot_secure(axi42tl_auto_out_a_bits_user_amba_prot_secure),
    .auto_out_a_bits_user_amba_prot_fetch(axi42tl_auto_out_a_bits_user_amba_prot_fetch),
    .auto_out_a_bits_mask(axi42tl_auto_out_a_bits_mask),
    .auto_out_a_bits_data(axi42tl_auto_out_a_bits_data),
    .auto_out_d_ready(axi42tl_auto_out_d_ready),
    .auto_out_d_valid(axi42tl_auto_out_d_valid),
    .auto_out_d_bits_opcode(axi42tl_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(axi42tl_auto_out_d_bits_size),
    .auto_out_d_bits_source(axi42tl_auto_out_d_bits_source),
    .auto_out_d_bits_denied(axi42tl_auto_out_d_bits_denied),
    .auto_out_d_bits_data(axi42tl_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(axi42tl_auto_out_d_bits_corrupt)
  );
  AXI4UserYanker_2 axi4yank (
    .clock(axi4yank_clock),
    .reset(axi4yank_reset),
    .auto_in_aw_ready(axi4yank_auto_in_aw_ready),
    .auto_in_aw_valid(axi4yank_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4yank_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4yank_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4yank_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4yank_auto_in_aw_bits_size),
    .auto_in_aw_bits_cache(axi4yank_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4yank_auto_in_aw_bits_prot),
    .auto_in_aw_bits_echo_extra_id(axi4yank_auto_in_aw_bits_echo_extra_id),
    .auto_in_aw_bits_echo_real_last(axi4yank_auto_in_aw_bits_echo_real_last),
    .auto_in_w_ready(axi4yank_auto_in_w_ready),
    .auto_in_w_valid(axi4yank_auto_in_w_valid),
    .auto_in_w_bits_data(axi4yank_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4yank_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4yank_auto_in_w_bits_last),
    .auto_in_b_ready(axi4yank_auto_in_b_ready),
    .auto_in_b_valid(axi4yank_auto_in_b_valid),
    .auto_in_b_bits_id(axi4yank_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4yank_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_extra_id(axi4yank_auto_in_b_bits_echo_extra_id),
    .auto_in_b_bits_echo_real_last(axi4yank_auto_in_b_bits_echo_real_last),
    .auto_in_ar_ready(axi4yank_auto_in_ar_ready),
    .auto_in_ar_valid(axi4yank_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4yank_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4yank_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4yank_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4yank_auto_in_ar_bits_size),
    .auto_in_ar_bits_cache(axi4yank_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4yank_auto_in_ar_bits_prot),
    .auto_in_ar_bits_echo_extra_id(axi4yank_auto_in_ar_bits_echo_extra_id),
    .auto_in_ar_bits_echo_real_last(axi4yank_auto_in_ar_bits_echo_real_last),
    .auto_in_r_ready(axi4yank_auto_in_r_ready),
    .auto_in_r_valid(axi4yank_auto_in_r_valid),
    .auto_in_r_bits_id(axi4yank_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4yank_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4yank_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_extra_id(axi4yank_auto_in_r_bits_echo_extra_id),
    .auto_in_r_bits_echo_real_last(axi4yank_auto_in_r_bits_echo_real_last),
    .auto_in_r_bits_last(axi4yank_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4yank_auto_out_aw_ready),
    .auto_out_aw_valid(axi4yank_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4yank_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4yank_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4yank_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4yank_auto_out_aw_bits_size),
    .auto_out_aw_bits_cache(axi4yank_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4yank_auto_out_aw_bits_prot),
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
    .auto_out_ar_bits_cache(axi4yank_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4yank_auto_out_ar_bits_prot),
    .auto_out_r_ready(axi4yank_auto_out_r_ready),
    .auto_out_r_valid(axi4yank_auto_out_r_valid),
    .auto_out_r_bits_id(axi4yank_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4yank_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4yank_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4yank_auto_out_r_bits_last)
  );
  AXI4Fragmenter axi4frag (
    .clock(axi4frag_clock),
    .reset(axi4frag_reset),
    .auto_in_aw_ready(axi4frag_auto_in_aw_ready),
    .auto_in_aw_valid(axi4frag_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4frag_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4frag_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4frag_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4frag_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4frag_auto_in_aw_bits_burst),
    .auto_in_aw_bits_cache(axi4frag_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4frag_auto_in_aw_bits_prot),
    .auto_in_aw_bits_echo_extra_id(axi4frag_auto_in_aw_bits_echo_extra_id),
    .auto_in_w_ready(axi4frag_auto_in_w_ready),
    .auto_in_w_valid(axi4frag_auto_in_w_valid),
    .auto_in_w_bits_data(axi4frag_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4frag_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4frag_auto_in_w_bits_last),
    .auto_in_b_ready(axi4frag_auto_in_b_ready),
    .auto_in_b_valid(axi4frag_auto_in_b_valid),
    .auto_in_b_bits_id(axi4frag_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4frag_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_extra_id(axi4frag_auto_in_b_bits_echo_extra_id),
    .auto_in_ar_ready(axi4frag_auto_in_ar_ready),
    .auto_in_ar_valid(axi4frag_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4frag_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4frag_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4frag_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4frag_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4frag_auto_in_ar_bits_burst),
    .auto_in_ar_bits_cache(axi4frag_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4frag_auto_in_ar_bits_prot),
    .auto_in_ar_bits_echo_extra_id(axi4frag_auto_in_ar_bits_echo_extra_id),
    .auto_in_r_ready(axi4frag_auto_in_r_ready),
    .auto_in_r_valid(axi4frag_auto_in_r_valid),
    .auto_in_r_bits_id(axi4frag_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4frag_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4frag_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_extra_id(axi4frag_auto_in_r_bits_echo_extra_id),
    .auto_in_r_bits_last(axi4frag_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4frag_auto_out_aw_ready),
    .auto_out_aw_valid(axi4frag_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4frag_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4frag_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4frag_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4frag_auto_out_aw_bits_size),
    .auto_out_aw_bits_cache(axi4frag_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4frag_auto_out_aw_bits_prot),
    .auto_out_aw_bits_echo_extra_id(axi4frag_auto_out_aw_bits_echo_extra_id),
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
    .auto_out_b_bits_echo_extra_id(axi4frag_auto_out_b_bits_echo_extra_id),
    .auto_out_b_bits_echo_real_last(axi4frag_auto_out_b_bits_echo_real_last),
    .auto_out_ar_ready(axi4frag_auto_out_ar_ready),
    .auto_out_ar_valid(axi4frag_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4frag_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4frag_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4frag_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4frag_auto_out_ar_bits_size),
    .auto_out_ar_bits_cache(axi4frag_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4frag_auto_out_ar_bits_prot),
    .auto_out_ar_bits_echo_extra_id(axi4frag_auto_out_ar_bits_echo_extra_id),
    .auto_out_ar_bits_echo_real_last(axi4frag_auto_out_ar_bits_echo_real_last),
    .auto_out_r_ready(axi4frag_auto_out_r_ready),
    .auto_out_r_valid(axi4frag_auto_out_r_valid),
    .auto_out_r_bits_id(axi4frag_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4frag_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4frag_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_extra_id(axi4frag_auto_out_r_bits_echo_extra_id),
    .auto_out_r_bits_echo_real_last(axi4frag_auto_out_r_bits_echo_real_last),
    .auto_out_r_bits_last(axi4frag_auto_out_r_bits_last)
  );
  AXI4IdIndexer_2 axi4index (
    .auto_in_aw_ready(axi4index_auto_in_aw_ready),
    .auto_in_aw_valid(axi4index_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4index_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4index_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4index_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4index_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4index_auto_in_aw_bits_burst),
    .auto_in_aw_bits_cache(axi4index_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4index_auto_in_aw_bits_prot),
    .auto_in_w_ready(axi4index_auto_in_w_ready),
    .auto_in_w_valid(axi4index_auto_in_w_valid),
    .auto_in_w_bits_data(axi4index_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4index_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4index_auto_in_w_bits_last),
    .auto_in_b_ready(axi4index_auto_in_b_ready),
    .auto_in_b_valid(axi4index_auto_in_b_valid),
    .auto_in_b_bits_id(axi4index_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4index_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4index_auto_in_ar_ready),
    .auto_in_ar_valid(axi4index_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4index_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4index_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4index_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4index_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4index_auto_in_ar_bits_burst),
    .auto_in_ar_bits_cache(axi4index_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4index_auto_in_ar_bits_prot),
    .auto_in_r_ready(axi4index_auto_in_r_ready),
    .auto_in_r_valid(axi4index_auto_in_r_valid),
    .auto_in_r_bits_id(axi4index_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4index_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4index_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4index_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4index_auto_out_aw_ready),
    .auto_out_aw_valid(axi4index_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4index_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4index_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4index_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4index_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4index_auto_out_aw_bits_burst),
    .auto_out_aw_bits_cache(axi4index_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4index_auto_out_aw_bits_prot),
    .auto_out_aw_bits_echo_extra_id(axi4index_auto_out_aw_bits_echo_extra_id),
    .auto_out_w_ready(axi4index_auto_out_w_ready),
    .auto_out_w_valid(axi4index_auto_out_w_valid),
    .auto_out_w_bits_data(axi4index_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4index_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4index_auto_out_w_bits_last),
    .auto_out_b_ready(axi4index_auto_out_b_ready),
    .auto_out_b_valid(axi4index_auto_out_b_valid),
    .auto_out_b_bits_id(axi4index_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4index_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_extra_id(axi4index_auto_out_b_bits_echo_extra_id),
    .auto_out_ar_ready(axi4index_auto_out_ar_ready),
    .auto_out_ar_valid(axi4index_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4index_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4index_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4index_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4index_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4index_auto_out_ar_bits_burst),
    .auto_out_ar_bits_cache(axi4index_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4index_auto_out_ar_bits_prot),
    .auto_out_ar_bits_echo_extra_id(axi4index_auto_out_ar_bits_echo_extra_id),
    .auto_out_r_ready(axi4index_auto_out_r_ready),
    .auto_out_r_valid(axi4index_auto_out_r_valid),
    .auto_out_r_bits_id(axi4index_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4index_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4index_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_extra_id(axi4index_auto_out_r_bits_echo_extra_id),
    .auto_out_r_bits_last(axi4index_auto_out_r_bits_last)
  );
  assign auto_axi4index_in_aw_ready = axi4index_auto_in_aw_ready;
  assign auto_axi4index_in_w_ready = axi4index_auto_in_w_ready;
  assign auto_axi4index_in_b_valid = axi4index_auto_in_b_valid;
  assign auto_axi4index_in_b_bits_id = axi4index_auto_in_b_bits_id;
  assign auto_axi4index_in_b_bits_resp = axi4index_auto_in_b_bits_resp;
  assign auto_axi4index_in_ar_ready = axi4index_auto_in_ar_ready;
  assign auto_axi4index_in_r_valid = axi4index_auto_in_r_valid;
  assign auto_axi4index_in_r_bits_id = axi4index_auto_in_r_bits_id;
  assign auto_axi4index_in_r_bits_data = axi4index_auto_in_r_bits_data;
  assign auto_axi4index_in_r_bits_resp = axi4index_auto_in_r_bits_resp;
  assign auto_axi4index_in_r_bits_last = axi4index_auto_in_r_bits_last;
  assign auto_tl_out_a_valid = buffer_auto_out_a_valid;
  assign auto_tl_out_a_bits_opcode = buffer_auto_out_a_bits_opcode;
  assign auto_tl_out_a_bits_param = buffer_auto_out_a_bits_param;
  assign auto_tl_out_a_bits_size = buffer_auto_out_a_bits_size;
  assign auto_tl_out_a_bits_source = buffer_auto_out_a_bits_source;
  assign auto_tl_out_a_bits_address = buffer_auto_out_a_bits_address;
  assign auto_tl_out_a_bits_user_amba_prot_bufferable = buffer_auto_out_a_bits_user_amba_prot_bufferable;
  assign auto_tl_out_a_bits_user_amba_prot_modifiable = buffer_auto_out_a_bits_user_amba_prot_modifiable;
  assign auto_tl_out_a_bits_user_amba_prot_readalloc = buffer_auto_out_a_bits_user_amba_prot_readalloc;
  assign auto_tl_out_a_bits_user_amba_prot_writealloc = buffer_auto_out_a_bits_user_amba_prot_writealloc;
  assign auto_tl_out_a_bits_user_amba_prot_privileged = buffer_auto_out_a_bits_user_amba_prot_privileged;
  assign auto_tl_out_a_bits_user_amba_prot_secure = buffer_auto_out_a_bits_user_amba_prot_secure;
  assign auto_tl_out_a_bits_user_amba_prot_fetch = buffer_auto_out_a_bits_user_amba_prot_fetch;
  assign auto_tl_out_a_bits_mask = buffer_auto_out_a_bits_mask;
  assign auto_tl_out_a_bits_data = buffer_auto_out_a_bits_data;
  assign auto_tl_out_a_bits_corrupt = buffer_auto_out_a_bits_corrupt;
  assign auto_tl_out_d_ready = buffer_auto_out_d_ready;
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_auto_in_a_valid = fixer_auto_out_a_valid;
  assign buffer_auto_in_a_bits_opcode = fixer_auto_out_a_bits_opcode;
  assign buffer_auto_in_a_bits_size = fixer_auto_out_a_bits_size;
  assign buffer_auto_in_a_bits_source = fixer_auto_out_a_bits_source;
  assign buffer_auto_in_a_bits_address = fixer_auto_out_a_bits_address;
  assign buffer_auto_in_a_bits_user_amba_prot_bufferable = fixer_auto_out_a_bits_user_amba_prot_bufferable;
  assign buffer_auto_in_a_bits_user_amba_prot_modifiable = fixer_auto_out_a_bits_user_amba_prot_modifiable;
  assign buffer_auto_in_a_bits_user_amba_prot_readalloc = fixer_auto_out_a_bits_user_amba_prot_readalloc;
  assign buffer_auto_in_a_bits_user_amba_prot_writealloc = fixer_auto_out_a_bits_user_amba_prot_writealloc;
  assign buffer_auto_in_a_bits_user_amba_prot_privileged = fixer_auto_out_a_bits_user_amba_prot_privileged;
  assign buffer_auto_in_a_bits_user_amba_prot_secure = fixer_auto_out_a_bits_user_amba_prot_secure;
  assign buffer_auto_in_a_bits_user_amba_prot_fetch = fixer_auto_out_a_bits_user_amba_prot_fetch;
  assign buffer_auto_in_a_bits_mask = fixer_auto_out_a_bits_mask;
  assign buffer_auto_in_a_bits_data = fixer_auto_out_a_bits_data;
  assign buffer_auto_in_d_ready = fixer_auto_out_d_ready;
  assign buffer_auto_out_a_ready = auto_tl_out_a_ready;
  assign buffer_auto_out_d_valid = auto_tl_out_d_valid;
  assign buffer_auto_out_d_bits_opcode = auto_tl_out_d_bits_opcode;
  assign buffer_auto_out_d_bits_param = auto_tl_out_d_bits_param;
  assign buffer_auto_out_d_bits_size = auto_tl_out_d_bits_size;
  assign buffer_auto_out_d_bits_source = auto_tl_out_d_bits_source;
  assign buffer_auto_out_d_bits_sink = auto_tl_out_d_bits_sink;
  assign buffer_auto_out_d_bits_denied = auto_tl_out_d_bits_denied;
  assign buffer_auto_out_d_bits_data = auto_tl_out_d_bits_data;
  assign buffer_auto_out_d_bits_corrupt = auto_tl_out_d_bits_corrupt;
  assign fixer_clock = clock;
  assign fixer_reset = reset;
  assign fixer_auto_in_a_valid = widget_auto_out_a_valid;
  assign fixer_auto_in_a_bits_opcode = widget_auto_out_a_bits_opcode;
  assign fixer_auto_in_a_bits_size = widget_auto_out_a_bits_size;
  assign fixer_auto_in_a_bits_source = widget_auto_out_a_bits_source;
  assign fixer_auto_in_a_bits_address = widget_auto_out_a_bits_address;
  assign fixer_auto_in_a_bits_user_amba_prot_bufferable = widget_auto_out_a_bits_user_amba_prot_bufferable;
  assign fixer_auto_in_a_bits_user_amba_prot_modifiable = widget_auto_out_a_bits_user_amba_prot_modifiable;
  assign fixer_auto_in_a_bits_user_amba_prot_readalloc = widget_auto_out_a_bits_user_amba_prot_readalloc;
  assign fixer_auto_in_a_bits_user_amba_prot_writealloc = widget_auto_out_a_bits_user_amba_prot_writealloc;
  assign fixer_auto_in_a_bits_user_amba_prot_privileged = widget_auto_out_a_bits_user_amba_prot_privileged;
  assign fixer_auto_in_a_bits_user_amba_prot_secure = widget_auto_out_a_bits_user_amba_prot_secure;
  assign fixer_auto_in_a_bits_user_amba_prot_fetch = widget_auto_out_a_bits_user_amba_prot_fetch;
  assign fixer_auto_in_a_bits_mask = widget_auto_out_a_bits_mask;
  assign fixer_auto_in_a_bits_data = widget_auto_out_a_bits_data;
  assign fixer_auto_in_d_ready = widget_auto_out_d_ready;
  assign fixer_auto_out_a_ready = buffer_auto_in_a_ready;
  assign fixer_auto_out_d_valid = buffer_auto_in_d_valid;
  assign fixer_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode;
  assign fixer_auto_out_d_bits_param = buffer_auto_in_d_bits_param;
  assign fixer_auto_out_d_bits_size = buffer_auto_in_d_bits_size;
  assign fixer_auto_out_d_bits_source = buffer_auto_in_d_bits_source;
  assign fixer_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink;
  assign fixer_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied;
  assign fixer_auto_out_d_bits_data = buffer_auto_in_d_bits_data;
  assign fixer_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt;
  assign widget_clock = clock;
  assign widget_reset = reset;
  assign widget_auto_in_a_valid = axi42tl_auto_out_a_valid;
  assign widget_auto_in_a_bits_opcode = axi42tl_auto_out_a_bits_opcode;
  assign widget_auto_in_a_bits_size = axi42tl_auto_out_a_bits_size;
  assign widget_auto_in_a_bits_source = axi42tl_auto_out_a_bits_source;
  assign widget_auto_in_a_bits_address = axi42tl_auto_out_a_bits_address;
  assign widget_auto_in_a_bits_user_amba_prot_bufferable = axi42tl_auto_out_a_bits_user_amba_prot_bufferable;
  assign widget_auto_in_a_bits_user_amba_prot_modifiable = axi42tl_auto_out_a_bits_user_amba_prot_modifiable;
  assign widget_auto_in_a_bits_user_amba_prot_readalloc = axi42tl_auto_out_a_bits_user_amba_prot_readalloc;
  assign widget_auto_in_a_bits_user_amba_prot_writealloc = axi42tl_auto_out_a_bits_user_amba_prot_writealloc;
  assign widget_auto_in_a_bits_user_amba_prot_privileged = axi42tl_auto_out_a_bits_user_amba_prot_privileged;
  assign widget_auto_in_a_bits_user_amba_prot_secure = axi42tl_auto_out_a_bits_user_amba_prot_secure;
  assign widget_auto_in_a_bits_user_amba_prot_fetch = axi42tl_auto_out_a_bits_user_amba_prot_fetch;
  assign widget_auto_in_a_bits_mask = axi42tl_auto_out_a_bits_mask;
  assign widget_auto_in_a_bits_data = axi42tl_auto_out_a_bits_data;
  assign widget_auto_in_d_ready = axi42tl_auto_out_d_ready;
  assign widget_auto_out_a_ready = fixer_auto_in_a_ready;
  assign widget_auto_out_d_valid = fixer_auto_in_d_valid;
  assign widget_auto_out_d_bits_opcode = fixer_auto_in_d_bits_opcode;
  assign widget_auto_out_d_bits_param = fixer_auto_in_d_bits_param;
  assign widget_auto_out_d_bits_size = fixer_auto_in_d_bits_size;
  assign widget_auto_out_d_bits_source = fixer_auto_in_d_bits_source;
  assign widget_auto_out_d_bits_sink = fixer_auto_in_d_bits_sink;
  assign widget_auto_out_d_bits_denied = fixer_auto_in_d_bits_denied;
  assign widget_auto_out_d_bits_data = fixer_auto_in_d_bits_data;
  assign widget_auto_out_d_bits_corrupt = fixer_auto_in_d_bits_corrupt;
  assign axi42tl_clock = clock;
  assign axi42tl_reset = reset;
  assign axi42tl_auto_in_aw_valid = axi4yank_auto_out_aw_valid;
  assign axi42tl_auto_in_aw_bits_id = axi4yank_auto_out_aw_bits_id;
  assign axi42tl_auto_in_aw_bits_addr = axi4yank_auto_out_aw_bits_addr;
  assign axi42tl_auto_in_aw_bits_len = axi4yank_auto_out_aw_bits_len;
  assign axi42tl_auto_in_aw_bits_size = axi4yank_auto_out_aw_bits_size;
  assign axi42tl_auto_in_aw_bits_cache = axi4yank_auto_out_aw_bits_cache;
  assign axi42tl_auto_in_aw_bits_prot = axi4yank_auto_out_aw_bits_prot;
  assign axi42tl_auto_in_w_valid = axi4yank_auto_out_w_valid;
  assign axi42tl_auto_in_w_bits_data = axi4yank_auto_out_w_bits_data;
  assign axi42tl_auto_in_w_bits_strb = axi4yank_auto_out_w_bits_strb;
  assign axi42tl_auto_in_w_bits_last = axi4yank_auto_out_w_bits_last;
  assign axi42tl_auto_in_b_ready = axi4yank_auto_out_b_ready;
  assign axi42tl_auto_in_ar_valid = axi4yank_auto_out_ar_valid;
  assign axi42tl_auto_in_ar_bits_id = axi4yank_auto_out_ar_bits_id;
  assign axi42tl_auto_in_ar_bits_addr = axi4yank_auto_out_ar_bits_addr;
  assign axi42tl_auto_in_ar_bits_len = axi4yank_auto_out_ar_bits_len;
  assign axi42tl_auto_in_ar_bits_size = axi4yank_auto_out_ar_bits_size;
  assign axi42tl_auto_in_ar_bits_cache = axi4yank_auto_out_ar_bits_cache;
  assign axi42tl_auto_in_ar_bits_prot = axi4yank_auto_out_ar_bits_prot;
  assign axi42tl_auto_in_r_ready = axi4yank_auto_out_r_ready;
  assign axi42tl_auto_out_a_ready = widget_auto_in_a_ready;
  assign axi42tl_auto_out_d_valid = widget_auto_in_d_valid;
  assign axi42tl_auto_out_d_bits_opcode = widget_auto_in_d_bits_opcode;
  assign axi42tl_auto_out_d_bits_size = widget_auto_in_d_bits_size;
  assign axi42tl_auto_out_d_bits_source = widget_auto_in_d_bits_source;
  assign axi42tl_auto_out_d_bits_denied = widget_auto_in_d_bits_denied;
  assign axi42tl_auto_out_d_bits_data = widget_auto_in_d_bits_data;
  assign axi42tl_auto_out_d_bits_corrupt = widget_auto_in_d_bits_corrupt;
  assign axi4yank_clock = clock;
  assign axi4yank_reset = reset;
  assign axi4yank_auto_in_aw_valid = axi4frag_auto_out_aw_valid;
  assign axi4yank_auto_in_aw_bits_id = axi4frag_auto_out_aw_bits_id;
  assign axi4yank_auto_in_aw_bits_addr = axi4frag_auto_out_aw_bits_addr;
  assign axi4yank_auto_in_aw_bits_len = axi4frag_auto_out_aw_bits_len;
  assign axi4yank_auto_in_aw_bits_size = axi4frag_auto_out_aw_bits_size;
  assign axi4yank_auto_in_aw_bits_cache = axi4frag_auto_out_aw_bits_cache;
  assign axi4yank_auto_in_aw_bits_prot = axi4frag_auto_out_aw_bits_prot;
  assign axi4yank_auto_in_aw_bits_echo_extra_id = axi4frag_auto_out_aw_bits_echo_extra_id;
  assign axi4yank_auto_in_aw_bits_echo_real_last = axi4frag_auto_out_aw_bits_echo_real_last;
  assign axi4yank_auto_in_w_valid = axi4frag_auto_out_w_valid;
  assign axi4yank_auto_in_w_bits_data = axi4frag_auto_out_w_bits_data;
  assign axi4yank_auto_in_w_bits_strb = axi4frag_auto_out_w_bits_strb;
  assign axi4yank_auto_in_w_bits_last = axi4frag_auto_out_w_bits_last;
  assign axi4yank_auto_in_b_ready = axi4frag_auto_out_b_ready;
  assign axi4yank_auto_in_ar_valid = axi4frag_auto_out_ar_valid;
  assign axi4yank_auto_in_ar_bits_id = axi4frag_auto_out_ar_bits_id;
  assign axi4yank_auto_in_ar_bits_addr = axi4frag_auto_out_ar_bits_addr;
  assign axi4yank_auto_in_ar_bits_len = axi4frag_auto_out_ar_bits_len;
  assign axi4yank_auto_in_ar_bits_size = axi4frag_auto_out_ar_bits_size;
  assign axi4yank_auto_in_ar_bits_cache = axi4frag_auto_out_ar_bits_cache;
  assign axi4yank_auto_in_ar_bits_prot = axi4frag_auto_out_ar_bits_prot;
  assign axi4yank_auto_in_ar_bits_echo_extra_id = axi4frag_auto_out_ar_bits_echo_extra_id;
  assign axi4yank_auto_in_ar_bits_echo_real_last = axi4frag_auto_out_ar_bits_echo_real_last;
  assign axi4yank_auto_in_r_ready = axi4frag_auto_out_r_ready;
  assign axi4yank_auto_out_aw_ready = axi42tl_auto_in_aw_ready;
  assign axi4yank_auto_out_w_ready = axi42tl_auto_in_w_ready;
  assign axi4yank_auto_out_b_valid = axi42tl_auto_in_b_valid;
  assign axi4yank_auto_out_b_bits_id = axi42tl_auto_in_b_bits_id;
  assign axi4yank_auto_out_b_bits_resp = axi42tl_auto_in_b_bits_resp;
  assign axi4yank_auto_out_ar_ready = axi42tl_auto_in_ar_ready;
  assign axi4yank_auto_out_r_valid = axi42tl_auto_in_r_valid;
  assign axi4yank_auto_out_r_bits_id = axi42tl_auto_in_r_bits_id;
  assign axi4yank_auto_out_r_bits_data = axi42tl_auto_in_r_bits_data;
  assign axi4yank_auto_out_r_bits_resp = axi42tl_auto_in_r_bits_resp;
  assign axi4yank_auto_out_r_bits_last = axi42tl_auto_in_r_bits_last;
  assign axi4frag_clock = clock;
  assign axi4frag_reset = reset;
  assign axi4frag_auto_in_aw_valid = axi4index_auto_out_aw_valid;
  assign axi4frag_auto_in_aw_bits_id = axi4index_auto_out_aw_bits_id;
  assign axi4frag_auto_in_aw_bits_addr = axi4index_auto_out_aw_bits_addr;
  assign axi4frag_auto_in_aw_bits_len = axi4index_auto_out_aw_bits_len;
  assign axi4frag_auto_in_aw_bits_size = axi4index_auto_out_aw_bits_size;
  assign axi4frag_auto_in_aw_bits_burst = axi4index_auto_out_aw_bits_burst;
  assign axi4frag_auto_in_aw_bits_cache = axi4index_auto_out_aw_bits_cache;
  assign axi4frag_auto_in_aw_bits_prot = axi4index_auto_out_aw_bits_prot;
  assign axi4frag_auto_in_aw_bits_echo_extra_id = axi4index_auto_out_aw_bits_echo_extra_id;
  assign axi4frag_auto_in_w_valid = axi4index_auto_out_w_valid;
  assign axi4frag_auto_in_w_bits_data = axi4index_auto_out_w_bits_data;
  assign axi4frag_auto_in_w_bits_strb = axi4index_auto_out_w_bits_strb;
  assign axi4frag_auto_in_w_bits_last = axi4index_auto_out_w_bits_last;
  assign axi4frag_auto_in_b_ready = axi4index_auto_out_b_ready;
  assign axi4frag_auto_in_ar_valid = axi4index_auto_out_ar_valid;
  assign axi4frag_auto_in_ar_bits_id = axi4index_auto_out_ar_bits_id;
  assign axi4frag_auto_in_ar_bits_addr = axi4index_auto_out_ar_bits_addr;
  assign axi4frag_auto_in_ar_bits_len = axi4index_auto_out_ar_bits_len;
  assign axi4frag_auto_in_ar_bits_size = axi4index_auto_out_ar_bits_size;
  assign axi4frag_auto_in_ar_bits_burst = axi4index_auto_out_ar_bits_burst;
  assign axi4frag_auto_in_ar_bits_cache = axi4index_auto_out_ar_bits_cache;
  assign axi4frag_auto_in_ar_bits_prot = axi4index_auto_out_ar_bits_prot;
  assign axi4frag_auto_in_ar_bits_echo_extra_id = axi4index_auto_out_ar_bits_echo_extra_id;
  assign axi4frag_auto_in_r_ready = axi4index_auto_out_r_ready;
  assign axi4frag_auto_out_aw_ready = axi4yank_auto_in_aw_ready;
  assign axi4frag_auto_out_w_ready = axi4yank_auto_in_w_ready;
  assign axi4frag_auto_out_b_valid = axi4yank_auto_in_b_valid;
  assign axi4frag_auto_out_b_bits_id = axi4yank_auto_in_b_bits_id;
  assign axi4frag_auto_out_b_bits_resp = axi4yank_auto_in_b_bits_resp;
  assign axi4frag_auto_out_b_bits_echo_extra_id = axi4yank_auto_in_b_bits_echo_extra_id;
  assign axi4frag_auto_out_b_bits_echo_real_last = axi4yank_auto_in_b_bits_echo_real_last;
  assign axi4frag_auto_out_ar_ready = axi4yank_auto_in_ar_ready;
  assign axi4frag_auto_out_r_valid = axi4yank_auto_in_r_valid;
  assign axi4frag_auto_out_r_bits_id = axi4yank_auto_in_r_bits_id;
  assign axi4frag_auto_out_r_bits_data = axi4yank_auto_in_r_bits_data;
  assign axi4frag_auto_out_r_bits_resp = axi4yank_auto_in_r_bits_resp;
  assign axi4frag_auto_out_r_bits_echo_extra_id = axi4yank_auto_in_r_bits_echo_extra_id;
  assign axi4frag_auto_out_r_bits_echo_real_last = axi4yank_auto_in_r_bits_echo_real_last;
  assign axi4frag_auto_out_r_bits_last = axi4yank_auto_in_r_bits_last;
  assign axi4index_auto_in_aw_valid = auto_axi4index_in_aw_valid;
  assign axi4index_auto_in_aw_bits_id = auto_axi4index_in_aw_bits_id;
  assign axi4index_auto_in_aw_bits_addr = auto_axi4index_in_aw_bits_addr;
  assign axi4index_auto_in_aw_bits_len = auto_axi4index_in_aw_bits_len;
  assign axi4index_auto_in_aw_bits_size = auto_axi4index_in_aw_bits_size;
  assign axi4index_auto_in_aw_bits_burst = auto_axi4index_in_aw_bits_burst;
  assign axi4index_auto_in_aw_bits_cache = auto_axi4index_in_aw_bits_cache;
  assign axi4index_auto_in_aw_bits_prot = auto_axi4index_in_aw_bits_prot;
  assign axi4index_auto_in_w_valid = auto_axi4index_in_w_valid;
  assign axi4index_auto_in_w_bits_data = auto_axi4index_in_w_bits_data;
  assign axi4index_auto_in_w_bits_strb = auto_axi4index_in_w_bits_strb;
  assign axi4index_auto_in_w_bits_last = auto_axi4index_in_w_bits_last;
  assign axi4index_auto_in_b_ready = auto_axi4index_in_b_ready;
  assign axi4index_auto_in_ar_valid = auto_axi4index_in_ar_valid;
  assign axi4index_auto_in_ar_bits_id = auto_axi4index_in_ar_bits_id;
  assign axi4index_auto_in_ar_bits_addr = auto_axi4index_in_ar_bits_addr;
  assign axi4index_auto_in_ar_bits_len = auto_axi4index_in_ar_bits_len;
  assign axi4index_auto_in_ar_bits_size = auto_axi4index_in_ar_bits_size;
  assign axi4index_auto_in_ar_bits_burst = auto_axi4index_in_ar_bits_burst;
  assign axi4index_auto_in_ar_bits_cache = auto_axi4index_in_ar_bits_cache;
  assign axi4index_auto_in_ar_bits_prot = auto_axi4index_in_ar_bits_prot;
  assign axi4index_auto_in_r_ready = auto_axi4index_in_r_ready;
  assign axi4index_auto_out_aw_ready = axi4frag_auto_in_aw_ready;
  assign axi4index_auto_out_w_ready = axi4frag_auto_in_w_ready;
  assign axi4index_auto_out_b_valid = axi4frag_auto_in_b_valid;
  assign axi4index_auto_out_b_bits_id = axi4frag_auto_in_b_bits_id;
  assign axi4index_auto_out_b_bits_resp = axi4frag_auto_in_b_bits_resp;
  assign axi4index_auto_out_b_bits_echo_extra_id = axi4frag_auto_in_b_bits_echo_extra_id;
  assign axi4index_auto_out_ar_ready = axi4frag_auto_in_ar_ready;
  assign axi4index_auto_out_r_valid = axi4frag_auto_in_r_valid;
  assign axi4index_auto_out_r_bits_id = axi4frag_auto_in_r_bits_id;
  assign axi4index_auto_out_r_bits_data = axi4frag_auto_in_r_bits_data;
  assign axi4index_auto_out_r_bits_resp = axi4frag_auto_in_r_bits_resp;
  assign axi4index_auto_out_r_bits_echo_extra_id = axi4frag_auto_in_r_bits_echo_extra_id;
  assign axi4index_auto_out_r_bits_last = axi4frag_auto_in_r_bits_last;
endmodule