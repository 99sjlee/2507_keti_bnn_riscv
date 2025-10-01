`default_nettype wire
module frvp_spi_SPIFIFO(   input        clock,   input        reset,   input  [1:0] io_ctrl_fmt_proto,   input        io_ctrl_fmt_endian,   input        io_ctrl_fmt_iodir,   input  [3:0] io_ctrl_fmt_len,   input  [1:0] io_ctrl_cs_mode,   input  [3:0] io_ctrl_wm_tx,   input  [3:0] io_ctrl_wm_rx,   input        io_link_tx_ready,   output       io_link_tx_valid,   output [7:0] io_link_tx_bits,   input        io_link_rx_valid,   input  [7:0] io_link_rx_bits,   output [7:0] io_link_cnt,   output [1:0] io_link_fmt_proto,   output       io_link_fmt_endian,   output       io_link_fmt_iodir,   output       io_link_cs_set,   output       io_link_cs_clear,   output       io_link_lock,   output       io_tx_ready,   input        io_tx_valid,   input  [7:0] io_tx_bits,   input        io_rx_ready,   output       io_rx_valid,   output [7:0] io_rx_bits,   output       io_ip_txwm,   output       io_ip_rxwm );
  wire  txq_clock;   wire  txq_reset;   wire  txq_io_enq_ready;   wire  txq_io_enq_valid;   wire [7:0] txq_io_enq_bits;   wire  txq_io_deq_ready;   wire  txq_io_deq_valid;   wire [7:0] txq_io_deq_bits;   wire [3:0] txq_io_count;   wire  rxq_clock;   wire  rxq_reset;   wire  rxq_io_enq_ready;   wire  rxq_io_enq_valid;   wire [7:0] rxq_io_enq_bits;   wire  rxq_io_deq_ready;   wire  rxq_io_deq_valid;   wire [7:0] rxq_io_deq_bits;   wire [3:0] rxq_io_count;   wire  fire_tx;   reg  rxen;   reg [31:0] _RAND_0;
  wire  _T_31;   wire  _T_32;   wire  _T_33;   wire  _T_34;   wire [2:0] _T_36;   wire [1:0] _T_37;   wire [3:0] _T_39;   wire [2:0] _T_40;   wire [1:0] _T_41;   wire [3:0] _GEN_2;   wire [3:0] _T_42;   wire [3:0] _GEN_3;   wire [3:0] cnt_quot;   wire  _T_45;   wire [1:0] _T_47;   wire  _T_48;   wire  _T_51;   wire  _T_52;   wire  cnt_rmdr;   wire [3:0] _GEN_4;   wire [3:0] _T_57;   reg [1:0] cs_mode;   reg [31:0] _RAND_1;
  wire  cs_mode_hold;   wire  cs_mode_off;   wire  cs_update;   wire  _T_59;   wire  cs_clear;   wire  _T_61;   frvp_spi_Queue_14 txq (     .clock(txq_clock),
    .reset(txq_reset),
    .io_enq_ready(txq_io_enq_ready),
    .io_enq_valid(txq_io_enq_valid),
    .io_enq_bits(txq_io_enq_bits),
    .io_deq_ready(txq_io_deq_ready),
    .io_deq_valid(txq_io_deq_valid),
    .io_deq_bits(txq_io_deq_bits),
    .io_count(txq_io_count)
  );
  frvp_spi_Queue_14 rxq (     .clock(rxq_clock),
    .reset(rxq_reset),
    .io_enq_ready(rxq_io_enq_ready),
    .io_enq_valid(rxq_io_enq_valid),
    .io_enq_bits(rxq_io_enq_bits),
    .io_deq_ready(rxq_io_deq_ready),
    .io_deq_valid(rxq_io_deq_valid),
    .io_deq_bits(rxq_io_deq_bits),
    .io_count(rxq_io_count)
  );
  assign fire_tx = io_link_tx_ready & io_link_tx_valid;   assign _T_31 = io_link_fmt_iodir == 1'h0;   assign _T_32 = 2'h0 == io_link_fmt_proto;   assign _T_33 = 2'h1 == io_link_fmt_proto;   assign _T_34 = 2'h2 == io_link_fmt_proto;   assign _T_36 = io_ctrl_fmt_len[3:1];   assign _T_37 = io_ctrl_fmt_len[3:2];   assign _T_39 = _T_32 ? io_ctrl_fmt_len : 4'h0;   assign _T_40 = _T_33 ? _T_36 : 3'h0;   assign _T_41 = _T_34 ? _T_37 : 2'h0;   assign _GEN_2 = {{1'd0}, _T_40};   assign _T_42 = _T_39 | _GEN_2;   assign _GEN_3 = {{2'd0}, _T_41};   assign cnt_quot = _T_42 | _GEN_3;   assign _T_45 = io_ctrl_fmt_len[0];   assign _T_47 = io_ctrl_fmt_len[1:0];   assign _T_48 = _T_47 != 2'h0;   assign _T_51 = _T_33 ? _T_45 : 1'h0;   assign _T_52 = _T_34 ? _T_48 : 1'h0;   assign cnt_rmdr = _T_51 | _T_52;   assign _GEN_4 = {{3'd0}, cnt_rmdr};   assign _T_57 = cnt_quot + _GEN_4;   assign cs_mode_hold = cs_mode == 2'h2;   assign cs_mode_off = cs_mode == 2'h3;   assign cs_update = cs_mode != io_ctrl_cs_mode;   assign _T_59 = cs_mode_hold | cs_mode_off;   assign cs_clear = _T_59 == 1'h0;   assign _T_61 = fire_tx & cs_clear;   assign io_link_tx_valid = txq_io_deq_valid;   assign io_link_tx_bits = txq_io_deq_bits;   assign io_link_cnt = {{4'd0}, _T_57};   assign io_link_fmt_proto = io_ctrl_fmt_proto;   assign io_link_fmt_endian = io_ctrl_fmt_endian;   assign io_link_fmt_iodir = io_ctrl_fmt_iodir;   assign io_link_cs_set = cs_mode_off == 1'h0;   assign io_link_cs_clear = cs_update | _T_61;   assign io_link_lock = io_link_tx_valid | rxen;   assign io_tx_ready = txq_io_enq_ready;   assign io_rx_valid = rxq_io_deq_valid;   assign io_rx_bits = rxq_io_deq_bits;   assign io_ip_txwm = txq_io_count < io_ctrl_wm_tx;   assign io_ip_rxwm = rxq_io_count > io_ctrl_wm_rx;   assign txq_clock = clock;   assign txq_reset = reset;   assign txq_io_enq_valid = io_tx_valid;   assign txq_io_enq_bits = io_tx_bits;   assign txq_io_deq_ready = io_link_tx_ready;   assign rxq_clock = clock;   assign rxq_reset = reset;   assign rxq_io_enq_valid = io_link_rx_valid & rxen;   assign rxq_io_enq_bits = io_link_rx_bits;   assign rxq_io_deq_ready = io_rx_ready;

always@(posedge clock, posedge reset)
begin
  if (reset) begin
    rxen <= 1'h0;
  end else begin
    if (fire_tx) begin
      rxen <= _T_31;
    end else begin
      if (io_link_rx_valid) begin
        rxen <= 1'h0;
      end
    end
  end
end

always@(posedge clock, posedge reset)
begin
  if (reset) begin
    cs_mode <= 2'h0;
  end else begin
    cs_mode <= io_ctrl_cs_mode;
  end
end

endmodule


