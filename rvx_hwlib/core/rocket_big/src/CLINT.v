`default_nettype wire
module CLINT(
  input         clock,
  input         reset,
  output        auto_int_out_0,
  output        auto_int_out_1,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [9:0]  auto_in_a_bits_source,
  input  [25:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [9:0]  auto_in_d_bits_source,
  output [31:0] auto_in_d_bits_data,
  input         io_rtcTick
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [1:0] monitor_io_in_a_bits_size;
  wire [9:0] monitor_io_in_a_bits_source;
  wire [25:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_size;
  wire [9:0] monitor_io_in_d_bits_source;
  reg [63:0] time_;
  wire [63:0] _time_T_1 = time_ + 64'h1;
  reg [63:0] timecmp_0;
  reg  ipi_0;
  wire [7:0] oldBytes__0 = timecmp_0[7:0];
  wire [7:0] oldBytes__1 = timecmp_0[15:8];
  wire [7:0] oldBytes__2 = timecmp_0[23:16];
  wire [7:0] oldBytes__3 = timecmp_0[31:24];
  wire [7:0] oldBytes__4 = timecmp_0[39:32];
  wire [7:0] oldBytes__5 = timecmp_0[47:40];
  wire [7:0] oldBytes__6 = timecmp_0[55:48];
  wire [7:0] oldBytes__7 = timecmp_0[63:56];
  wire  in_bits_read = auto_in_a_bits_opcode == 3'h4;
  wire [13:0] in_bits_index = auto_in_a_bits_address[15:2];
  wire [2:0] out_iindex = {in_bits_index[13],in_bits_index[12],in_bits_index[0]};
  wire [13:0] out_findex = in_bits_index & 14'hffe;
  wire  _out_T_6 = out_findex == 14'hffe;
  wire  _out_T_2 = out_findex == 14'h0;
  wire [7:0] _out_backSel_T = 8'h1 << out_iindex;
  wire  out_backSel_2 = _out_backSel_T[2];
  wire  out_woready_14 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & out_backSel_2 & out_findex == 14'h0;
  wire [7:0] _out_backMask_T_11 = auto_in_a_bits_mask[3] ? 8'hff : 8'h0;
  wire [7:0] _out_backMask_T_9 = auto_in_a_bits_mask[2] ? 8'hff : 8'h0;
  wire [7:0] _out_backMask_T_7 = auto_in_a_bits_mask[1] ? 8'hff : 8'h0;
  wire [7:0] _out_backMask_T_5 = auto_in_a_bits_mask[0] ? 8'hff : 8'h0;
  wire [31:0] out_backMask = {_out_backMask_T_11,_out_backMask_T_9,_out_backMask_T_7,_out_backMask_T_5};
  wire  out_womask_14 = &out_backMask[7:0];
  wire  out_f_woready_14 = out_woready_14 & out_womask_14;
  wire  out_womask_15 = &out_backMask[15:8];
  wire  out_f_woready_15 = out_woready_14 & out_womask_15;
  wire  out_womask_16 = &out_backMask[23:16];
  wire  out_f_woready_16 = out_woready_14 & out_womask_16;
  wire  out_womask_17 = &out_backMask[31:24];
  wire  out_f_woready_17 = out_woready_14 & out_womask_17;
  wire  out_backSel_3 = _out_backSel_T[3];
  wire  out_woready_2 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & out_backSel_3 & out_findex == 14'h0;
  wire  out_f_woready_2 = out_woready_2 & out_womask_14;
  wire  out_f_woready_3 = out_woready_2 & out_womask_15;
  wire  out_f_woready_4 = out_woready_2 & out_womask_16;
  wire  out_f_woready_5 = out_woready_2 & out_womask_17;
  wire [7:0] newBytes__1 = out_f_woready_15 ? auto_in_a_bits_data[15:8] : oldBytes__1;
  wire [7:0] newBytes__0 = out_f_woready_14 ? auto_in_a_bits_data[7:0] : oldBytes__0;
  wire [7:0] newBytes__3 = out_f_woready_17 ? auto_in_a_bits_data[31:24] : oldBytes__3;
  wire [7:0] newBytes__2 = out_f_woready_16 ? auto_in_a_bits_data[23:16] : oldBytes__2;
  wire [7:0] newBytes__5 = out_f_woready_3 ? auto_in_a_bits_data[15:8] : oldBytes__5;
  wire [7:0] newBytes__4 = out_f_woready_2 ? auto_in_a_bits_data[7:0] : oldBytes__4;
  wire [7:0] newBytes__7 = out_f_woready_5 ? auto_in_a_bits_data[31:24] : oldBytes__7;
  wire [7:0] newBytes__6 = out_f_woready_4 ? auto_in_a_bits_data[23:16] : oldBytes__6;
  wire [63:0] _timecmp_0_T = {newBytes__7,newBytes__6,newBytes__5,newBytes__4,newBytes__3,newBytes__2,newBytes__1,
    newBytes__0};
  wire [7:0] oldBytes_1_0 = time_[7:0];
  wire [7:0] oldBytes_1_1 = time_[15:8];
  wire [7:0] oldBytes_1_2 = time_[23:16];
  wire [7:0] oldBytes_1_3 = time_[31:24];
  wire [7:0] oldBytes_1_4 = time_[39:32];
  wire [7:0] oldBytes_1_5 = time_[47:40];
  wire [7:0] oldBytes_1_6 = time_[55:48];
  wire [7:0] oldBytes_1_7 = time_[63:56];
  wire  out_backSel_4 = _out_backSel_T[4];
  wire  out_woready_6 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & out_backSel_4 & out_findex == 14'hffe;
  wire  out_f_woready_6 = out_woready_6 & out_womask_14;
  wire  out_f_woready_7 = out_woready_6 & out_womask_15;
  wire  out_f_woready_8 = out_woready_6 & out_womask_16;
  wire  out_f_woready_9 = out_woready_6 & out_womask_17;
  wire  out_backSel_5 = _out_backSel_T[5];
  wire  out_woready_10 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & out_backSel_5 & out_findex == 14'hffe;
  wire  out_f_woready_10 = out_woready_10 & out_womask_14;
  wire  out_f_woready_11 = out_woready_10 & out_womask_15;
  wire  out_f_woready_12 = out_woready_10 & out_womask_16;
  wire  out_f_woready_13 = out_woready_10 & out_womask_17;
  wire [7:0] newBytes_1_1 = out_f_woready_7 ? auto_in_a_bits_data[15:8] : oldBytes_1_1;
  wire [7:0] newBytes_1_0 = out_f_woready_6 ? auto_in_a_bits_data[7:0] : oldBytes_1_0;
  wire [7:0] newBytes_1_3 = out_f_woready_9 ? auto_in_a_bits_data[31:24] : oldBytes_1_3;
  wire [7:0] newBytes_1_2 = out_f_woready_8 ? auto_in_a_bits_data[23:16] : oldBytes_1_2;
  wire [7:0] newBytes_1_5 = out_f_woready_11 ? auto_in_a_bits_data[15:8] : oldBytes_1_5;
  wire [7:0] newBytes_1_4 = out_f_woready_10 ? auto_in_a_bits_data[7:0] : oldBytes_1_4;
  wire [7:0] newBytes_1_7 = out_f_woready_13 ? auto_in_a_bits_data[31:24] : oldBytes_1_7;
  wire [7:0] newBytes_1_6 = out_f_woready_12 ? auto_in_a_bits_data[23:16] : oldBytes_1_6;
  wire [63:0] _time_T_2 = {newBytes_1_7,newBytes_1_6,newBytes_1_5,newBytes_1_4,newBytes_1_3,newBytes_1_2,newBytes_1_1,
    newBytes_1_0};
  wire  out_wimask = &out_backMask[0];
  wire  out_frontSel_0 = _out_backSel_T[0];
  wire  out_wivalid_0 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & out_frontSel_0 & out_findex == 14'h0;
  wire  out_f_wivalid = out_wivalid_0 & out_wimask;
  wire [1:0] out_prepend = {1'h0,ipi_0};
  wire [31:0] _out_T_28 = {{30'd0}, out_prepend};
  wire [31:0] out_prepend_3 = {oldBytes__7,oldBytes__6,oldBytes__5,oldBytes__4};
  wire [31:0] out_prepend_6 = {oldBytes_1_3,oldBytes_1_2,oldBytes_1_1,oldBytes_1_0};
  wire [31:0] out_prepend_9 = {oldBytes_1_7,oldBytes_1_6,oldBytes_1_5,oldBytes_1_4};
  wire [31:0] out_prepend_12 = {oldBytes__3,oldBytes__2,oldBytes__1,oldBytes__0};
  wire  _GEN_54 = 3'h2 == out_iindex ? _out_T_2 : 3'h1 == out_iindex | _out_T_2;
  wire  _GEN_55 = 3'h3 == out_iindex ? _out_T_2 : _GEN_54;
  wire  _GEN_56 = 3'h4 == out_iindex ? _out_T_6 : _GEN_55;
  wire  _GEN_57 = 3'h5 == out_iindex ? _out_T_6 : _GEN_56;
  wire  _GEN_59 = 3'h7 == out_iindex | (3'h6 == out_iindex | _GEN_57);
  wire [31:0] _GEN_61 = 3'h1 == out_iindex ? 32'h0 : _out_T_28;
  wire [31:0] _GEN_62 = 3'h2 == out_iindex ? out_prepend_12 : _GEN_61;
  wire [31:0] _GEN_63 = 3'h3 == out_iindex ? out_prepend_3 : _GEN_62;
  wire [31:0] _GEN_64 = 3'h4 == out_iindex ? out_prepend_6 : _GEN_63;
  wire [31:0] _GEN_65 = 3'h5 == out_iindex ? out_prepend_9 : _GEN_64;
  wire [31:0] _GEN_66 = 3'h6 == out_iindex ? 32'h0 : _GEN_65;
  wire [31:0] _GEN_67 = 3'h7 == out_iindex ? 32'h0 : _GEN_66;
  
  assign auto_int_out_0 = ipi_0;
  assign auto_int_out_1 = time_ >= timecmp_0;
  assign auto_in_a_ready = auto_in_d_ready;
  assign auto_in_d_valid = auto_in_a_valid;
  assign auto_in_d_bits_opcode = {{2'd0}, in_bits_read};
  assign auto_in_d_bits_size = auto_in_a_bits_size;
  assign auto_in_d_bits_source = auto_in_a_bits_source;
  assign auto_in_d_bits_data = _GEN_59 ? _GEN_67 : 32'h0;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_in_d_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = auto_in_a_valid;
  assign monitor_io_in_d_bits_opcode = {{2'd0}, in_bits_read};
  assign monitor_io_in_d_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_d_bits_source = auto_in_a_bits_source;
  always @(posedge clock) begin
    if (reset) begin
      time_ <= 64'h0;
    end else if (out_f_woready_6 | out_f_woready_7 | out_f_woready_8 | out_f_woready_9 | out_f_woready_10 |
      out_f_woready_11 | out_f_woready_12 | out_f_woready_13) begin
      time_ <= _time_T_2;
    end else if (io_rtcTick) begin
      time_ <= _time_T_1;
    end
    if (out_f_woready_14 | out_f_woready_15 | out_f_woready_16 | out_f_woready_17 | out_f_woready_2 | out_f_woready_3 |
      out_f_woready_4 | out_f_woready_5) begin
      timecmp_0 <= _timecmp_0_T;
    end
    if (reset) begin
      ipi_0 <= 1'h0;
    end else if (out_f_wivalid) begin
      ipi_0 <= auto_in_a_bits_data[0];
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
  _RAND_0 = {2{`RANDOM}};
  time_ = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  timecmp_0 = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  ipi_0 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule