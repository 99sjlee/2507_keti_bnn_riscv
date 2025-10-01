`default_nettype wire
module frvp_spi_SPIMedia_1(   

   input         clock,
   input         reset,
   output        io_port_sck,
   input         io_port_dq_0_i,
   output        io_port_dq_0_o,
   output        io_port_dq_0_oe,
   input         io_port_dq_1_i,
   output        io_port_dq_1_o,
   output        io_port_dq_1_oe,
   input         io_port_dq_2_i,
   output        io_port_dq_2_o,
   output        io_port_dq_2_oe,
   input         io_port_dq_3_i,
   output        io_port_dq_3_o,
   output        io_port_dq_3_oe,
   output        io_port_cs_0,
   output        io_port_cs_1,
   output        io_port_cs_2,
   output        io_port_cs_3,
   input  [11:0] io_ctrl_sck_div,
   input         io_ctrl_sck_pol,
   input         io_ctrl_sck_pha,
   input  [7:0]  io_ctrl_dla_cssck,
   input  [7:0]  io_ctrl_dla_sckcs,
   input  [7:0]  io_ctrl_dla_intercs,
   input  [7:0]  io_ctrl_dla_interxfr,
   input  [1:0]  io_ctrl_cs_id,
   input         io_ctrl_cs_dflt_0,
   input         io_ctrl_cs_dflt_1,
   input         io_ctrl_cs_dflt_2,
   input         io_ctrl_cs_dflt_3,
   input  [11:0] io_ctrl_extradel_coarse,
   input  [4:0]  io_ctrl_sampledel_sd,
   output        io_link_tx_ready,
   input         io_link_tx_valid,
   input  [7:0]  io_link_tx_bits,
   output        io_link_rx_valid,
   output [7:0]  io_link_rx_bits,
   input  [7:0]  io_link_cnt,
   input  [1:0]  io_link_fmt_proto,
   input         io_link_fmt_endian,
   input         io_link_fmt_iodir,
   input         io_link_cs_set,
   input         io_link_cs_clear );


  wire  phy_clock;   wire  phy_reset;   wire  phy_io_port_sck;   wire  phy_io_port_dq_0_i;   wire  phy_io_port_dq_0_o;   wire  phy_io_port_dq_0_oe;   wire  phy_io_port_dq_1_i;   wire  phy_io_port_dq_1_o;   wire  phy_io_port_dq_1_oe;   wire  phy_io_port_dq_2_i;   wire  phy_io_port_dq_2_o;   wire  phy_io_port_dq_2_oe;   wire  phy_io_port_dq_3_i;   wire  phy_io_port_dq_3_o;   wire  phy_io_port_dq_3_oe;   wire [11:0] phy_io_ctrl_sck_div;   wire  phy_io_ctrl_sck_pol;   wire  phy_io_ctrl_sck_pha;   wire [1:0] phy_io_ctrl_fmt_proto;   wire  phy_io_ctrl_fmt_endian;   wire  phy_io_ctrl_fmt_iodir;   wire [11:0] phy_io_ctrl_extradel_coarse;   wire [4:0] phy_io_ctrl_sampledel_sd;   wire  phy_io_op_ready;   wire  phy_io_op_valid;   wire  phy_io_op_bits_fn;   wire  phy_io_op_bits_stb;   wire [7:0] phy_io_op_bits_cnt;   wire [7:0] phy_io_op_bits_data;   wire  phy_io_rx_valid;   wire [7:0] phy_io_rx_bits;   reg [1:0] cs_id;   reg [31:0] _RAND_0;
  reg  cs_dflt_0;   reg [31:0] _RAND_1;
  reg  cs_dflt_1;   reg [31:0] _RAND_2;
  reg  cs_dflt_2;   reg [31:0] _RAND_3;
  reg  cs_dflt_3;   reg [31:0] _RAND_4;
  reg  cs_set;   reg [31:0] _RAND_5;
  wire [3:0] _GEN_75;   wire [3:0] _T_67;   wire [1:0] _T_68;   wire [1:0] _T_69;   wire [3:0] _T_70;   wire [3:0] _T_71;   wire  cs_active_0;   wire  cs_active_1;   wire  cs_active_2;   wire  cs_active_3;   wire [1:0] _T_85;   wire [1:0] _T_86;   wire [3:0] _T_87;   wire [1:0] _T_88;   wire [1:0] _T_89;   wire [3:0] _T_90;   wire  cs_update;   reg  clear;   reg [31:0] _RAND_6;
  reg  cs_assert;   reg [31:0] _RAND_7;
  wire  cs_deassert;   wire  _T_95;   wire  _T_96;   wire  continuous;   reg [1:0] state;   reg [31:0] _RAND_8;
  wire  _T_99;   wire  _T_100;   wire [7:0] _GEN_2;   wire  _GEN_5;   wire  _GEN_6;   wire  _GEN_7;   wire [7:0] _GEN_14;   wire  _GEN_21;   wire [7:0] _GEN_23;   wire  _GEN_25;   wire  _GEN_26;   wire  _GEN_27;   wire  _GEN_28;   wire  _T_101;   wire  _T_102;   wire  _T_103;   wire  _T_104;   wire [3:0] _GEN_76;   wire [3:0] _T_105;   wire [3:0] _T_109;   wire  _T_110;   wire  _T_111;   wire  _T_112;   wire  _T_113;   wire [7:0] _GEN_42;   wire  _GEN_51;   wire [7:0] _GEN_52;   wire  _GEN_54;   frvp_spi_SPIPhysical_1 phy (     .clock(phy_clock),
    .reset(phy_reset),
    .io_port_sck(phy_io_port_sck),
    .io_port_dq_0_i(phy_io_port_dq_0_i),
    .io_port_dq_0_o(phy_io_port_dq_0_o),
    .io_port_dq_0_oe(phy_io_port_dq_0_oe),
    .io_port_dq_1_i(phy_io_port_dq_1_i),
    .io_port_dq_1_o(phy_io_port_dq_1_o),
    .io_port_dq_1_oe(phy_io_port_dq_1_oe),
    .io_port_dq_2_i(phy_io_port_dq_2_i),
    .io_port_dq_2_o(phy_io_port_dq_2_o),
    .io_port_dq_2_oe(phy_io_port_dq_2_oe),
    .io_port_dq_3_i(phy_io_port_dq_3_i),
    .io_port_dq_3_o(phy_io_port_dq_3_o),
    .io_port_dq_3_oe(phy_io_port_dq_3_oe),
    .io_ctrl_sck_div(phy_io_ctrl_sck_div),
    .io_ctrl_sck_pol(phy_io_ctrl_sck_pol),
    .io_ctrl_sck_pha(phy_io_ctrl_sck_pha),
    .io_ctrl_fmt_proto(phy_io_ctrl_fmt_proto),
    .io_ctrl_fmt_endian(phy_io_ctrl_fmt_endian),
    .io_ctrl_fmt_iodir(phy_io_ctrl_fmt_iodir),
    .io_ctrl_extradel_coarse(phy_io_ctrl_extradel_coarse),
    .io_ctrl_sampledel_sd(phy_io_ctrl_sampledel_sd),
    .io_op_ready(phy_io_op_ready),
    .io_op_valid(phy_io_op_valid),
    .io_op_bits_fn(phy_io_op_bits_fn),
    .io_op_bits_stb(phy_io_op_bits_stb),
    .io_op_bits_cnt(phy_io_op_bits_cnt),
    .io_op_bits_data(phy_io_op_bits_data),
    .io_rx_valid(phy_io_rx_valid),
    .io_rx_bits(phy_io_rx_bits)
  );

  assign io_port_cs_1 = cs_dflt_1;

  assign _GEN_75 = {{3'd0}, io_link_cs_set};   assign _T_67 = _GEN_75 << io_ctrl_cs_id;   assign _T_68 = {io_ctrl_cs_dflt_1,io_ctrl_cs_dflt_0};   assign _T_69 = {io_ctrl_cs_dflt_3,io_ctrl_cs_dflt_2};   assign _T_70 = {_T_69,_T_68};   assign _T_71 = _T_70 ^ _T_67;   assign cs_active_0 = _T_71[0];   assign cs_active_1 = _T_71[1];   assign cs_active_2 = _T_71[2];   assign cs_active_3 = _T_71[3];   assign _T_85 = {cs_active_1,cs_active_0};   assign _T_86 = {cs_active_3,cs_active_2};   assign _T_87 = {_T_86,_T_85};   assign _T_88 = {cs_dflt_1,cs_dflt_0};   assign _T_89 = {cs_dflt_3,cs_dflt_2};   assign _T_90 = {_T_89,_T_88};   assign cs_update = _T_87 != _T_90;   assign cs_deassert = clear | cs_update;   assign _T_95 = io_link_cs_clear & cs_assert;   assign _T_96 = clear | _T_95;   assign continuous = io_ctrl_dla_interxfr == 8'h0;   assign _T_99 = 2'h0 == state;   assign _T_100 = phy_io_op_ready & phy_io_op_valid;   assign _GEN_2 = cs_deassert ? io_ctrl_dla_sckcs : io_link_cnt;   assign _GEN_5 = cs_deassert ? 1'h0 : 1'h1;   assign _GEN_6 = cs_deassert ? 1'h1 : io_link_tx_valid;   assign _GEN_7 = cs_deassert ? 1'h0 : phy_io_op_ready;   assign _GEN_14 = io_link_tx_valid ? io_ctrl_dla_cssck : 8'h0;   assign _GEN_21 = io_link_tx_valid ? 1'h0 : 1'h1;   assign _GEN_23 = cs_assert ? _GEN_2 : _GEN_14;   assign _GEN_25 = cs_assert ? cs_deassert : 1'h1;   assign _GEN_26 = cs_assert ? _GEN_5 : _GEN_21;   assign _GEN_27 = cs_assert ? _GEN_6 : 1'h1;   assign _GEN_28 = cs_assert ? _GEN_7 : 1'h0;   assign _T_101 = 2'h1 == state;   assign _T_102 = continuous == 1'h0;   assign _T_103 = phy_io_op_ready | continuous;   assign _T_104 = 2'h2 == state;   assign _GEN_76 = {{3'd0}, cs_set};   assign _T_105 = _GEN_76 << cs_id;   assign _T_109 = _T_90 ^ _T_105;   assign _T_110 = _T_109[0];   assign _T_111 = _T_109[1];   assign _T_112 = _T_109[2];   assign _T_113 = _T_109[3];   assign _GEN_42 = _T_104 ? io_ctrl_dla_intercs : io_link_cnt;   assign _GEN_51 = _T_101 ? _T_102 : 1'h1;   assign _GEN_52 = _T_101 ? io_ctrl_dla_interxfr : _GEN_42;   assign _GEN_54 = _T_101 ? 1'h0 : _T_104;   assign io_port_sck = phy_io_port_sck;   assign io_port_dq_0_o = phy_io_port_dq_0_o;   assign io_port_dq_0_oe = phy_io_port_dq_0_oe;   assign io_port_dq_1_o = phy_io_port_dq_1_o;   assign io_port_dq_1_oe = phy_io_port_dq_1_oe;   assign io_port_dq_2_o = phy_io_port_dq_2_o;   assign io_port_dq_2_oe = phy_io_port_dq_2_oe;   assign io_port_dq_3_o = phy_io_port_dq_3_o;   assign io_port_dq_3_oe = phy_io_port_dq_3_oe;   assign io_port_cs_0 = cs_dflt_0;   assign io_port_cs_2 = cs_dflt_2;   assign io_port_cs_3 = cs_dflt_3;   assign io_link_tx_ready = _T_99 ? _GEN_28 : 1'h0;   assign io_link_rx_valid = phy_io_rx_valid;   assign io_link_rx_bits = phy_io_rx_bits;   assign phy_clock = clock;   assign phy_reset = reset;   assign phy_io_port_dq_0_i = io_port_dq_0_i;   assign phy_io_port_dq_1_i = io_port_dq_1_i;   assign phy_io_port_dq_2_i = io_port_dq_2_i;   assign phy_io_port_dq_3_i = io_port_dq_3_i;   assign phy_io_ctrl_sck_div = io_ctrl_sck_div;   assign phy_io_ctrl_sck_pol = io_ctrl_sck_pol;   assign phy_io_ctrl_sck_pha = io_ctrl_sck_pha;   assign phy_io_ctrl_fmt_proto = io_link_fmt_proto;   assign phy_io_ctrl_fmt_endian = io_link_fmt_endian;   assign phy_io_ctrl_fmt_iodir = io_link_fmt_iodir;   assign phy_io_ctrl_extradel_coarse = io_ctrl_extradel_coarse;   assign phy_io_ctrl_sampledel_sd = io_ctrl_sampledel_sd;   assign phy_io_op_valid = _T_99 ? _GEN_27 : _GEN_51;   assign phy_io_op_bits_fn = _T_99 ? _GEN_25 : 1'h1;   assign phy_io_op_bits_stb = _T_99 ? _GEN_26 : _GEN_54;   assign phy_io_op_bits_cnt = _T_99 ? _GEN_23 : _GEN_52;   assign phy_io_op_bits_data = io_link_tx_bits;
	
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     cs_id <= 0;
   end
   else if (_T_99) begin
     if (!(cs_assert)) begin
       if (!(io_link_tx_valid)) begin
         cs_id <= io_ctrl_cs_id;
       end
     end
   end
 end
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     cs_dflt_0 <= 0;
   end
   else if (_T_99) begin
     if (!(cs_assert)) begin
       if (io_link_tx_valid) begin
         if (phy_io_op_ready) begin
           cs_dflt_0 <= cs_active_0;
         end
       end else begin
         cs_dflt_0 <= io_ctrl_cs_dflt_0;
       end
     end
   end else begin
     if (!(_T_101)) begin
       if (_T_104) begin
         if (phy_io_op_ready) begin
           cs_dflt_0 <= _T_110;
         end
       end
     end
   end
 end
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     cs_dflt_1 <= 0;
   end
   else if (_T_99) begin
     if (!(cs_assert)) begin
       if (io_link_tx_valid) begin
         if (phy_io_op_ready) begin
           cs_dflt_1 <= cs_active_1;
         end
       end else begin
         cs_dflt_1 <= io_ctrl_cs_dflt_1;
       end
     end
   end else begin
     if (!(_T_101)) begin
       if (_T_104) begin
         if (phy_io_op_ready) begin
           cs_dflt_1 <= _T_111;
         end
       end
     end
   end
 end
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     cs_dflt_2 <= 0;
   end
   else if (_T_99) begin
     if (!(cs_assert)) begin
       if (io_link_tx_valid) begin
         if (phy_io_op_ready) begin
           cs_dflt_2 <= cs_active_2;
         end
       end else begin
         cs_dflt_2 <= io_ctrl_cs_dflt_2;
       end
     end
   end else begin
     if (!(_T_101)) begin
       if (_T_104) begin
         if (phy_io_op_ready) begin
           cs_dflt_2 <= _T_112;
         end
       end
     end
   end
 end
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     cs_dflt_3 <= 0;
   end
   else if (_T_99) begin
     if (!(cs_assert)) begin
       if (io_link_tx_valid) begin
         if (phy_io_op_ready) begin
           cs_dflt_3 <= cs_active_3;
         end
       end else begin
         cs_dflt_3 <= io_ctrl_cs_dflt_3;
       end
     end
   end else begin
     if (!(_T_101)) begin
       if (_T_104) begin
         if (phy_io_op_ready) begin
           cs_dflt_3 <= _T_113;
         end
       end
     end
   end
 end
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     cs_set <= 0;
   end
   else if (_T_99) begin
     if (!(cs_assert)) begin
       if (io_link_tx_valid) begin
         if (phy_io_op_ready) begin
           cs_set <= io_link_cs_set;
         end
       end
     end
   end
 end
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     clear <= 1'h0;
   end else begin
     if (_T_99) begin
       clear <= _T_96;
     end else begin
       if (_T_101) begin
         clear <= _T_96;
       end else begin
         if (_T_104) begin
           clear <= 1'h0;
         end else begin
           clear <= _T_96;
         end
       end
     end
   end
 end
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     cs_assert <= 1'h0;
   end else begin
     if (_T_99) begin
       if (!(cs_assert)) begin
         if (io_link_tx_valid) begin
           if (phy_io_op_ready) begin
             cs_assert <= 1'h1;
           end
         end
       end
     end else begin
       if (!(_T_101)) begin
         if (_T_104) begin
           cs_assert <= 1'h0;
         end
       end
     end
   end
 end
 always @(posedge clock, posedge reset) begin
   if (reset) begin
     state <= 2'h0;
   end else begin
     if (_T_99) begin
       if (cs_assert) begin
         if (cs_deassert) begin
           if (phy_io_op_ready) begin
             state <= 2'h2;
           end
         end else begin
           if (_T_100) begin
             state <= 2'h1;
           end
         end
       end
     end else begin
       if (_T_101) begin
         if (_T_103) begin
           state <= 2'h0;
         end
       end else begin
         if (_T_104) begin
           if (phy_io_op_ready) begin
             state <= 2'h0;
           end
         end
       end
     end
   end
 end
endmodule
