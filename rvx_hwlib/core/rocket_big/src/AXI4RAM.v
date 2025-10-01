`default_nettype wire
module AXI4RAM(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [28:0] auto_in_aw_bits_addr,
  input         auto_in_aw_bits_echo_real_last,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [31:0] auto_in_w_bits_data,
  input  [3:0]  auto_in_w_bits_strb,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_b_bits_echo_real_last,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [28:0] auto_in_ar_bits_addr,
  input         auto_in_ar_bits_echo_real_last,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [31:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_echo_real_last
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
`endif // RANDOMIZE_REG_INIT
  wire [25:0] mem_R0_addr;
  wire  mem_R0_en;
  wire  mem_R0_clk;
  wire [7:0] mem_R0_data_0;
  wire [7:0] mem_R0_data_1;
  wire [7:0] mem_R0_data_2;
  wire [7:0] mem_R0_data_3;
  wire [25:0] mem_W0_addr;
  wire  mem_W0_en;
  wire  mem_W0_clk;
  wire [7:0] mem_W0_data_0;
  wire [7:0] mem_W0_data_1;
  wire [7:0] mem_W0_data_2;
  wire [7:0] mem_W0_data_3;
  wire  mem_W0_mask_0;
  wire  mem_W0_mask_1;
  wire  mem_W0_mask_2;
  wire  mem_W0_mask_3;
  wire [5:0] r_addr_lo_lo = {auto_in_ar_bits_addr[7],auto_in_ar_bits_addr[6],auto_in_ar_bits_addr[5],
    auto_in_ar_bits_addr[4],auto_in_ar_bits_addr[3],auto_in_ar_bits_addr[2]};
  wire [12:0] r_addr_lo = {auto_in_ar_bits_addr[14],auto_in_ar_bits_addr[13],auto_in_ar_bits_addr[12],
    auto_in_ar_bits_addr[11],auto_in_ar_bits_addr[10],auto_in_ar_bits_addr[9],auto_in_ar_bits_addr[8],r_addr_lo_lo};
  wire [5:0] r_addr_hi_lo = {auto_in_ar_bits_addr[20],auto_in_ar_bits_addr[19],auto_in_ar_bits_addr[18],
    auto_in_ar_bits_addr[17],auto_in_ar_bits_addr[16],auto_in_ar_bits_addr[15]};
  wire [12:0] r_addr_hi = {auto_in_ar_bits_addr[27],auto_in_ar_bits_addr[26],auto_in_ar_bits_addr[25],
    auto_in_ar_bits_addr[24],auto_in_ar_bits_addr[23],auto_in_ar_bits_addr[22],auto_in_ar_bits_addr[21],r_addr_hi_lo};
  wire [5:0] w_addr_lo_lo = {auto_in_aw_bits_addr[7],auto_in_aw_bits_addr[6],auto_in_aw_bits_addr[5],
    auto_in_aw_bits_addr[4],auto_in_aw_bits_addr[3],auto_in_aw_bits_addr[2]};
  wire [12:0] w_addr_lo = {auto_in_aw_bits_addr[14],auto_in_aw_bits_addr[13],auto_in_aw_bits_addr[12],
    auto_in_aw_bits_addr[11],auto_in_aw_bits_addr[10],auto_in_aw_bits_addr[9],auto_in_aw_bits_addr[8],w_addr_lo_lo};
  wire [5:0] w_addr_hi_lo = {auto_in_aw_bits_addr[20],auto_in_aw_bits_addr[19],auto_in_aw_bits_addr[18],
    auto_in_aw_bits_addr[17],auto_in_aw_bits_addr[16],auto_in_aw_bits_addr[15]};
  wire [12:0] w_addr_hi = {auto_in_aw_bits_addr[27],auto_in_aw_bits_addr[26],auto_in_aw_bits_addr[25],
    auto_in_aw_bits_addr[24],auto_in_aw_bits_addr[23],auto_in_aw_bits_addr[22],auto_in_aw_bits_addr[21],w_addr_hi_lo};
  wire [28:0] _r_sel0_T = auto_in_ar_bits_addr ^ 29'h10000000;
  wire [29:0] _r_sel0_T_1 = {1'b0,$signed(_r_sel0_T)};
  wire [29:0] _r_sel0_T_3 = $signed(_r_sel0_T_1) & -30'sh10000000;
  wire  r_sel0 = $signed(_r_sel0_T_3) == 30'sh0;
  wire [28:0] _w_sel0_T = auto_in_aw_bits_addr ^ 29'h10000000;
  wire [29:0] _w_sel0_T_1 = {1'b0,$signed(_w_sel0_T)};
  wire [29:0] _w_sel0_T_3 = $signed(_w_sel0_T_1) & -30'sh10000000;
  wire  w_sel0 = $signed(_w_sel0_T_3) == 30'sh0;
  reg  w_full;
  reg [3:0] w_id;
  reg  w_echo_real_last;
  reg  r_sel1;
  reg  w_sel1;
  wire  _T = auto_in_b_ready & w_full;
  wire  _GEN_0 = _T ? 1'h0 : w_full;
  wire  _bundleIn_0_aw_ready_T_1 = auto_in_b_ready | ~w_full;
  wire  in_aw_ready = auto_in_w_valid & (auto_in_b_ready | ~w_full);
  wire  _T_1 = in_aw_ready & auto_in_aw_valid;
  wire  _GEN_1 = _T_1 | _GEN_0;
  reg  r_full;
  reg [3:0] r_id;
  reg  r_echo_real_last;
  wire  _T_9 = auto_in_r_ready & r_full;
  wire  _GEN_24 = _T_9 ? 1'h0 : r_full;
  wire  in_ar_ready = auto_in_r_ready | ~r_full;
  wire  _T_10 = in_ar_ready & auto_in_ar_valid;
  wire  _GEN_25 = _T_10 | _GEN_24;
  reg  rdata_REG;
  reg [7:0] rdata_r_0;
  reg [7:0] rdata_r_1;
  reg [7:0] rdata_r_2;
  reg [7:0] rdata_r_3;
  wire [7:0] _GEN_33 = rdata_REG ? mem_R0_data_0 : rdata_r_0;
  wire [7:0] _GEN_34 = rdata_REG ? mem_R0_data_1 : rdata_r_1;
  wire [7:0] _GEN_35 = rdata_REG ? mem_R0_data_2 : rdata_r_2;
  wire [7:0] _GEN_36 = rdata_REG ? mem_R0_data_3 : rdata_r_3;
  wire [15:0] bundleIn_0_r_bits_data_lo = {_GEN_34,_GEN_33};
  wire [15:0] bundleIn_0_r_bits_data_hi = {_GEN_36,_GEN_35};
  mem mem (
    .R0_addr(mem_R0_addr),
    .R0_en(mem_R0_en),
    .R0_clk(mem_R0_clk),
    .R0_data_0(mem_R0_data_0),
    .R0_data_1(mem_R0_data_1),
    .R0_data_2(mem_R0_data_2),
    .R0_data_3(mem_R0_data_3),
    .W0_addr(mem_W0_addr),
    .W0_en(mem_W0_en),
    .W0_clk(mem_W0_clk),
    .W0_data_0(mem_W0_data_0),
    .W0_data_1(mem_W0_data_1),
    .W0_data_2(mem_W0_data_2),
    .W0_data_3(mem_W0_data_3),
    .W0_mask_0(mem_W0_mask_0),
    .W0_mask_1(mem_W0_mask_1),
    .W0_mask_2(mem_W0_mask_2),
    .W0_mask_3(mem_W0_mask_3)
  );
  assign auto_in_aw_ready = auto_in_w_valid & (auto_in_b_ready | ~w_full);
  assign auto_in_w_ready = auto_in_aw_valid & _bundleIn_0_aw_ready_T_1;
  assign auto_in_b_valid = w_full;
  assign auto_in_b_bits_id = w_id;
  assign auto_in_b_bits_resp = w_sel1 ? 2'h0 : 2'h3;
  assign auto_in_b_bits_echo_real_last = w_echo_real_last;
  assign auto_in_ar_ready = auto_in_r_ready | ~r_full;
  assign auto_in_r_valid = r_full;
  assign auto_in_r_bits_id = r_id;
  assign auto_in_r_bits_data = {bundleIn_0_r_bits_data_hi,bundleIn_0_r_bits_data_lo};
  assign auto_in_r_bits_resp = r_sel1 ? 2'h0 : 2'h3;
  assign auto_in_r_bits_echo_real_last = r_echo_real_last;
  assign mem_R0_addr = {r_addr_hi,r_addr_lo};
  assign mem_R0_en = in_ar_ready & auto_in_ar_valid;
  assign mem_R0_clk = clock;
  assign mem_W0_addr = {w_addr_hi,w_addr_lo};
  assign mem_W0_en = _T_1 & w_sel0;
  assign mem_W0_clk = clock;
  assign mem_W0_data_0 = auto_in_w_bits_data[7:0];
  assign mem_W0_data_1 = auto_in_w_bits_data[15:8];
  assign mem_W0_data_2 = auto_in_w_bits_data[23:16];
  assign mem_W0_data_3 = auto_in_w_bits_data[31:24];
  assign mem_W0_mask_0 = auto_in_w_bits_strb[0];
  assign mem_W0_mask_1 = auto_in_w_bits_strb[1];
  assign mem_W0_mask_2 = auto_in_w_bits_strb[2];
  assign mem_W0_mask_3 = auto_in_w_bits_strb[3];
  always @(posedge clock) begin
    if (reset) begin
      w_full <= 1'h0;
    end else begin
      w_full <= _GEN_1;
    end
    if (_T_1) begin
      w_id <= auto_in_aw_bits_id;
    end
    if (_T_1) begin
      w_echo_real_last <= auto_in_aw_bits_echo_real_last;
    end
    if (_T_10) begin
      r_sel1 <= r_sel0;
    end
    if (_T_1) begin
      w_sel1 <= w_sel0;
    end
    if (reset) begin
      r_full <= 1'h0;
    end else begin
      r_full <= _GEN_25;
    end
    if (_T_10) begin
      r_id <= auto_in_ar_bits_id;
    end
    if (_T_10) begin
      r_echo_real_last <= auto_in_ar_bits_echo_real_last;
    end
    rdata_REG <= in_ar_ready & auto_in_ar_valid;
    if (rdata_REG) begin
      rdata_r_0 <= mem_R0_data_0;
    end
    if (rdata_REG) begin
      rdata_r_1 <= mem_R0_data_1;
    end
    if (rdata_REG) begin
      rdata_r_2 <= mem_R0_data_2;
    end
    if (rdata_REG) begin
      rdata_r_3 <= mem_R0_data_3;
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
  w_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  w_id = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  w_echo_real_last = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  r_sel1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  w_sel1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  r_full = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  r_id = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  r_echo_real_last = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rdata_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  rdata_r_0 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  rdata_r_1 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  rdata_r_2 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  rdata_r_3 = _RAND_12[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule