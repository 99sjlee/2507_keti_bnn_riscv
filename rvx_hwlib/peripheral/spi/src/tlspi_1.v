`default_nettype wire
module frvp_spi_TLSPI_1
( 
   input         clock,
   input         reset,
   output        auto_int_xing_out_sync_0,
   output        auto_control_xing_in_a_ready,
   input         auto_control_xing_in_a_valid,
   input  [2:0]  auto_control_xing_in_a_bits_opcode,
   input  [2:0]  auto_control_xing_in_a_bits_param,
   input  [1:0]  auto_control_xing_in_a_bits_size,
   input  [5:0]  auto_control_xing_in_a_bits_source,
   input  [28:0] auto_control_xing_in_a_bits_address,
   input  [3:0]  auto_control_xing_in_a_bits_mask,
   input  [31:0] auto_control_xing_in_a_bits_data,
   input         auto_control_xing_in_a_bits_corrupt,
   input         auto_control_xing_in_d_ready,
   output        auto_control_xing_in_d_valid,
   output [2:0]  auto_control_xing_in_d_bits_opcode,
   output [1:0]  auto_control_xing_in_d_bits_size,
   output [5:0]  auto_control_xing_in_d_bits_source,
   output [31:0] auto_control_xing_in_d_bits_data,
   output        auto_io_out_sck,
   input         auto_io_out_dq_0_i,
   output        auto_io_out_dq_0_o,
   output        auto_io_out_dq_0_oe,
   input         auto_io_out_dq_1_i,
   output        auto_io_out_dq_1_o,
   output        auto_io_out_dq_1_oe,
   input         auto_io_out_dq_2_i,
   output        auto_io_out_dq_2_o,
   output        auto_io_out_dq_2_oe,
   input         auto_io_out_dq_3_i,
   output        auto_io_out_dq_3_o,
   output        auto_io_out_dq_3_oe,
   output        auto_io_out_cs_0, 
   output        auto_io_out_cs_1,
   output        auto_io_out_cs_2,
   output        auto_io_out_cs_3
);




wire  buffer_clock;
wire  buffer_reset;
wire  buffer_auto_in_a_ready;
wire  buffer_auto_in_a_valid;
wire [2:0] buffer_auto_in_a_bits_opcode;
wire [2:0] buffer_auto_in_a_bits_param;
wire [1:0] buffer_auto_in_a_bits_size;
wire [5:0] buffer_auto_in_a_bits_source;
wire [28:0] buffer_auto_in_a_bits_address;
wire [3:0] buffer_auto_in_a_bits_mask;
wire [31:0] buffer_auto_in_a_bits_data;
wire  buffer_auto_in_a_bits_corrupt;
wire  buffer_auto_in_d_ready;
wire  buffer_auto_in_d_valid;
wire [2:0] buffer_auto_in_d_bits_opcode;
wire [1:0] buffer_auto_in_d_bits_size;
wire [5:0] buffer_auto_in_d_bits_source;
wire [31:0] buffer_auto_in_d_bits_data;
wire  buffer_auto_out_a_ready;
wire  buffer_auto_out_a_valid;
wire [2:0] buffer_auto_out_a_bits_opcode;
wire [2:0] buffer_auto_out_a_bits_param;
wire [1:0] buffer_auto_out_a_bits_size;
wire [5:0] buffer_auto_out_a_bits_source;
wire [28:0] buffer_auto_out_a_bits_address;
wire [3:0] buffer_auto_out_a_bits_mask;
wire [31:0] buffer_auto_out_a_bits_data;
wire  buffer_auto_out_a_bits_corrupt;
wire  buffer_auto_out_d_ready;
wire  buffer_auto_out_d_valid;
wire [2:0] buffer_auto_out_d_bits_opcode;
wire [1:0] buffer_auto_out_d_bits_size;
wire [5:0] buffer_auto_out_d_bits_source;
wire [31:0] buffer_auto_out_d_bits_data;
wire  intsource_clock;
wire  intsource_reset;
wire  intsource_auto_in_0;
wire  intsource_auto_out_sync_0;
wire  TLMonitor_clock;
wire  TLMonitor_reset;
wire  TLMonitor_io_in_a_ready;
wire  TLMonitor_io_in_a_valid;
wire [2:0] TLMonitor_io_in_a_bits_opcode;
wire [2:0] TLMonitor_io_in_a_bits_param;
wire [1:0] TLMonitor_io_in_a_bits_size;
wire [5:0] TLMonitor_io_in_a_bits_source;
wire [28:0] TLMonitor_io_in_a_bits_address;
wire [3:0] TLMonitor_io_in_a_bits_mask;
wire  TLMonitor_io_in_a_bits_corrupt;
wire  TLMonitor_io_in_d_ready;
wire  TLMonitor_io_in_d_valid;
wire [2:0] TLMonitor_io_in_d_bits_opcode;
wire [1:0] TLMonitor_io_in_d_bits_size;
wire [5:0] TLMonitor_io_in_d_bits_source;
wire  fifo_clock;
wire  fifo_reset;
wire [1:0] fifo_io_ctrl_fmt_proto;
wire  fifo_io_ctrl_fmt_endian;
wire  fifo_io_ctrl_fmt_iodir;
wire [3:0] fifo_io_ctrl_fmt_len;
wire [1:0] fifo_io_ctrl_cs_mode;
wire [3:0] fifo_io_ctrl_wm_tx;
wire [3:0] fifo_io_ctrl_wm_rx;
wire  fifo_io_link_tx_ready;
wire  fifo_io_link_tx_valid;
wire [7:0] fifo_io_link_tx_bits;
wire  fifo_io_link_rx_valid;
wire [7:0] fifo_io_link_rx_bits;
wire [7:0] fifo_io_link_cnt;
wire [1:0] fifo_io_link_fmt_proto;
wire  fifo_io_link_fmt_endian;
wire  fifo_io_link_fmt_iodir;
wire  fifo_io_link_cs_set;
wire  fifo_io_link_cs_clear;
wire  fifo_io_link_lock;
wire  fifo_io_tx_ready;
wire  fifo_io_tx_valid;
wire [7:0] fifo_io_tx_bits;
wire  fifo_io_rx_ready;
wire  fifo_io_rx_valid;
wire [7:0] fifo_io_rx_bits;
wire  fifo_io_ip_txwm;
wire  fifo_io_ip_rxwm;
wire  mac_clock;
wire  mac_reset;
wire  mac_io_port_sck;
wire  mac_io_port_dq_0_i;
wire  mac_io_port_dq_0_o;
wire  mac_io_port_dq_0_oe;
wire  mac_io_port_dq_1_i;
wire  mac_io_port_dq_1_o;
wire  mac_io_port_dq_1_oe;
wire  mac_io_port_dq_2_i;
wire  mac_io_port_dq_2_o;
wire  mac_io_port_dq_2_oe;
wire  mac_io_port_dq_3_i;
wire  mac_io_port_dq_3_o;
wire  mac_io_port_dq_3_oe;
wire  mac_io_port_cs_0;
wire  mac_io_port_cs_2;
wire  mac_io_port_cs_3;
wire [11:0] mac_io_ctrl_sck_div;
wire  mac_io_ctrl_sck_pol;
wire  mac_io_ctrl_sck_pha;
wire [7:0] mac_io_ctrl_dla_cssck;
wire [7:0] mac_io_ctrl_dla_sckcs;
wire [7:0] mac_io_ctrl_dla_intercs;
wire [7:0] mac_io_ctrl_dla_interxfr;
wire [1:0] mac_io_ctrl_cs_id;
wire  mac_io_ctrl_cs_dflt_0;
wire  mac_io_ctrl_cs_dflt_1;
wire  mac_io_ctrl_cs_dflt_2;
wire  mac_io_ctrl_cs_dflt_3;
wire [11:0] mac_io_ctrl_extradel_coarse;
wire [4:0] mac_io_ctrl_sampledel_sd;
wire  mac_io_link_tx_ready;
wire  mac_io_link_tx_valid;
wire [7:0] mac_io_link_tx_bits;
wire  mac_io_link_rx_valid;
wire [7:0] mac_io_link_rx_bits;
wire [7:0] mac_io_link_cnt;
wire [1:0] mac_io_link_fmt_proto;
wire  mac_io_link_fmt_endian;
wire  mac_io_link_fmt_iodir;
wire  mac_io_link_cs_set;
wire  mac_io_link_cs_clear;
reg [1:0] ctrl_fmt_proto;

wire mac_io_port_cs_1;

reg  ctrl_fmt_endian;

reg  ctrl_fmt_iodir;

reg [3:0] ctrl_fmt_len;

reg [11:0] ctrl_sck_div;

reg  ctrl_sck_pol;

reg  ctrl_sck_pha;

reg [1:0] ctrl_cs_id;

reg  ctrl_cs_dflt_0;

reg  ctrl_cs_dflt_1;

reg  ctrl_cs_dflt_2;

reg  ctrl_cs_dflt_3;

reg [1:0] ctrl_cs_mode;

reg [7:0] ctrl_dla_cssck;

reg [7:0] ctrl_dla_sckcs;

reg [7:0] ctrl_dla_intercs;

reg [7:0] ctrl_dla_interxfr;

reg [3:0] ctrl_wm_tx;

reg [3:0] ctrl_wm_rx;

reg [11:0] ctrl_extradel_coarse;

reg [4:0] ctrl_sampledel_sd;

reg  ie_txwm;

reg  ie_rxwm;

wire  _T_410;
wire  _T_411;
wire  _T_415;
wire  _T_416;
wire [2:0] _T_108_a_bits_opcode;
wire  _T_424;
wire [28:0] _T_108_a_bits_address;
wire [26:0] _T_425;
wire [5:0] _T_108_a_bits_source;
wire [1:0] _T_108_a_bits_size;
wire [7:0] _T_426;
wire [9:0] _T_421_bits_index;
wire [9:0] _T_442;
wire  _T_444;
wire [3:0] _T_108_a_bits_mask;
wire  _T_624;
wire  _T_625;
wire  _T_626;
wire  _T_627;
wire [7:0] _T_629;
wire [7:0] _T_631;
wire [7:0] _T_633;
wire [7:0] _T_635;
wire [15:0] _T_636;
wire [15:0] _T_637;
wire [31:0] _T_638;
wire [11:0] _T_654;
wire [11:0] _T_657;
wire  _T_658;
wire  _T_108_a_valid;
wire  _T_108_d_ready;
wire  _T_1481;
wire  _T_1480;
wire [1:0] _T_1488;
wire  _T_1479;
wire [2:0] _T_1489;
wire  _T_1478;
wire  _T_1477;
wire [1:0] _T_1487;
wire [4:0] _T_1490;
wire  _T_1557;
wire  _T_1558;
wire [31:0] _T_1491;
wire  _T_1492;
wire  _T_1793;
wire  _T_1794;
wire  _T_1797;
wire  _T_1798;
wire  _T_666;
wire [31:0] _T_108_a_bits_data;
wire [11:0] _T_668;
wire  _T_679;
wire  _T_682;
wire  _T_683;
wire  _T_1497;
wire  _T_1827;
wire  _T_1828;
wire  _T_691;
wire  _T_693;
wire  _T_704;
wire  _T_707;
wire  _T_708;
wire  _T_716;
wire  _T_718;
wire [1:0] _T_728;
wire  _T_731;
wire  _T_734;
wire  _T_735;
wire  _T_743;
wire  _T_745;
wire [2:0] _T_755;
wire  _T_758;
wire  _T_761;
wire  _T_762;
wire  _T_770;
wire  _T_772;
wire [3:0] _T_782;
wire [7:0] _T_785;
wire  _T_786;
wire [7:0] _T_788;
wire  _T_789;
wire  _T_1502;
wire  _T_1857;
wire  _T_1858;
wire  _T_797;
wire [7:0] _T_799;
wire [7:0] _T_810;
wire [7:0] _T_813;
wire  _T_814;
wire  _T_822;
wire [7:0] _T_824;
wire [15:0] _T_833;
wire [23:0] _T_834;
wire  _T_1506;
wire  _T_1881;
wire  _T_1882;
wire  _T_849;
wire [3:0] _T_862;
wire [3:0] _T_865;
wire  _T_866;
wire  _T_1512;
wire  _T_1917;
wire  _T_1918;
wire  _T_874;
wire [3:0] _T_876;
wire  _T_910;
wire [1:0] _T_936;
wire  _T_1493;
wire  _T_1803;
wire  _T_1804;
wire  _T_951;
wire  _T_976;
wire [1:0] _T_988;
wire [1:0] _T_991;
wire [1:0] _T_994;
wire  _T_995;
wire  _T_1498;
wire  _T_1833;
wire  _T_1834;
wire  _T_1003;
wire [1:0] _T_1005;
wire  _T_1520;
wire  _T_1965;
wire  _T_1966;
wire  _T_1028;
wire  _T_1053;
wire [1:0] _T_1065;
wire  _T_1513;
wire  _T_1923;
wire  _T_1924;
wire  _T_1080;
wire  _T_1510;
wire  _T_1905;
wire  _T_1906;
wire  _T_1105;
wire  _T_1154;
wire  _T_1155;
wire  _T_1156;
wire  _T_1160;
wire  _T_1161;
wire  _T_1163;
wire  _T_1108;
wire [31:0] _T_1173;
wire  _T_1508;
wire  _T_1893;
wire  _T_1894;
wire  _T_1188;
wire  _T_1213;
wire [2:0] _T_1225;
wire  _T_1240;
wire [3:0] _T_1252;
wire [3:0] _T_1255;
wire [3:0] _T_1258;
wire  _T_1259;
wire  _T_1267;
wire [3:0] _T_1269;
wire [15:0] _T_1278;
wire [19:0] _T_1279;
wire  _T_1503;
wire  _T_1863;
wire  _T_1864;
wire  _T_1294;
wire  _T_1319;
wire [15:0] _T_1330;
wire [23:0] _T_1331;
wire  _T_1511;
wire  _T_1675;
wire  _T_1676;
wire [7:0] _T_1357;
wire [8:0] _T_1383;
wire [30:0] _T_1384;
wire [31:0] _T_1410;
wire  _T_1496;
wire  _T_1821;
wire  _T_1822;
wire  _T_1425;
wire [4:0] _T_1438;
wire [4:0] _T_1441;
wire  _T_1442;
wire  _T_1507;
wire  _T_1887;
wire  _T_1888;
wire  _T_1450;
wire [4:0] _T_1452;
wire  _GEN_152;
wire  _GEN_153;
wire  _GEN_154;
wire  _GEN_155;
wire  _GEN_156;
wire  _GEN_157;
wire  _GEN_158;
wire  _GEN_159;
wire  _GEN_160;
wire  _GEN_161;
wire  _GEN_162;
wire  _GEN_163;
wire  _GEN_164;
wire  _GEN_165;
wire  _GEN_166;
wire  _GEN_167;
wire  _GEN_168;
wire  _GEN_169;
wire  _GEN_170;
wire  _GEN_171;
wire  _GEN_172;
wire  _GEN_173;
wire  _GEN_174;
wire  _GEN_175;
wire  _GEN_176;
wire  _GEN_177;
wire  _GEN_178;
wire  _GEN_179;
wire  _GEN_180;
wire  _GEN_181;
wire  _GEN_182;
wire [31:0] _T_2550_0;
wire [31:0] _T_2550_1;
wire [31:0] _GEN_184;
wire [31:0] _GEN_185;
wire [31:0] _GEN_186;
wire [31:0] _T_2550_4;
wire [31:0] _GEN_187;
wire [31:0] _T_2550_5;
wire [31:0] _GEN_188;
wire [31:0] _T_2550_6;
wire [31:0] _GEN_189;
wire [31:0] _GEN_190;
wire [31:0] _GEN_191;
wire [31:0] _GEN_192;
wire [31:0] _T_2550_10;
wire [31:0] _GEN_193;
wire [31:0] _T_2550_11;
wire [31:0] _GEN_194;
wire [31:0] _GEN_195;
wire [31:0] _GEN_196;
wire [31:0] _T_2550_14;
wire [31:0] _GEN_197;
wire [31:0] _T_2550_15;
wire [31:0] _GEN_198;
wire [31:0] _T_2550_16;
wire [31:0] _GEN_199;
wire [31:0] _GEN_200;
wire [31:0] _GEN_201;
wire [31:0] _GEN_202;
wire [31:0] _T_2550_20;
wire [31:0] _GEN_203;
wire [31:0] _T_2550_21;
wire [31:0] _GEN_204;
wire [31:0] _GEN_205;
wire [31:0] _GEN_206;
wire [31:0] _GEN_207;
wire [31:0] _GEN_208;
wire [31:0] _GEN_209;
wire [31:0] _GEN_210;
wire [31:0] _T_2550_28;
wire [31:0] _GEN_211;
wire [31:0] _T_2550_29;
wire [31:0] _GEN_212;
wire [31:0] _GEN_213;
wire [31:0] _GEN_214;

frvp_spi_TLBuffer_22
buffer
(
	.clock(buffer_clock),
	.reset(buffer_reset),
	.auto_in_a_ready(buffer_auto_in_a_ready),
	.auto_in_a_valid(buffer_auto_in_a_valid),
	.auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
	.auto_in_a_bits_param(buffer_auto_in_a_bits_param),
	.auto_in_a_bits_size(buffer_auto_in_a_bits_size),
	.auto_in_a_bits_source(buffer_auto_in_a_bits_source),
	.auto_in_a_bits_address(buffer_auto_in_a_bits_address),
	.auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
	.auto_in_a_bits_data(buffer_auto_in_a_bits_data),
	.auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
	.auto_in_d_ready(buffer_auto_in_d_ready),
	.auto_in_d_valid(buffer_auto_in_d_valid),
	.auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
	.auto_in_d_bits_size(buffer_auto_in_d_bits_size),
	.auto_in_d_bits_source(buffer_auto_in_d_bits_source),
	.auto_in_d_bits_data(buffer_auto_in_d_bits_data),
	.auto_out_a_ready(buffer_auto_out_a_ready),
	.auto_out_a_valid(buffer_auto_out_a_valid),
	.auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
	.auto_out_a_bits_param(buffer_auto_out_a_bits_param),
	.auto_out_a_bits_size(buffer_auto_out_a_bits_size),
	.auto_out_a_bits_source(buffer_auto_out_a_bits_source),
	.auto_out_a_bits_address(buffer_auto_out_a_bits_address),
	.auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
	.auto_out_a_bits_data(buffer_auto_out_a_bits_data),
	.auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
	.auto_out_d_ready(buffer_auto_out_d_ready),
	.auto_out_d_valid(buffer_auto_out_d_valid),
	.auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
	.auto_out_d_bits_size(buffer_auto_out_d_bits_size),
	.auto_out_d_bits_source(buffer_auto_out_d_bits_source),
	.auto_out_d_bits_data(buffer_auto_out_d_bits_data)
);

frvp_spi_IntSyncCrossingSource_3
intsource
(
	.clock(intsource_clock),
	.reset(intsource_reset),
	.auto_in_0(intsource_auto_in_0),
	.auto_out_sync_0(intsource_auto_out_sync_0)
);

frvp_spi_SPIFIFO
fifo
(
	.clock(fifo_clock),
	.reset(fifo_reset),
	.io_ctrl_fmt_proto(fifo_io_ctrl_fmt_proto),
	.io_ctrl_fmt_endian(fifo_io_ctrl_fmt_endian),
	.io_ctrl_fmt_iodir(fifo_io_ctrl_fmt_iodir),
	.io_ctrl_fmt_len(fifo_io_ctrl_fmt_len),
	.io_ctrl_cs_mode(fifo_io_ctrl_cs_mode),
	.io_ctrl_wm_tx(fifo_io_ctrl_wm_tx),
	.io_ctrl_wm_rx(fifo_io_ctrl_wm_rx),
	.io_link_tx_ready(fifo_io_link_tx_ready),
	.io_link_tx_valid(fifo_io_link_tx_valid),
	.io_link_tx_bits(fifo_io_link_tx_bits),
	.io_link_rx_valid(fifo_io_link_rx_valid),
	.io_link_rx_bits(fifo_io_link_rx_bits),
	.io_link_cnt(fifo_io_link_cnt),
	.io_link_fmt_proto(fifo_io_link_fmt_proto),
	.io_link_fmt_endian(fifo_io_link_fmt_endian),
	.io_link_fmt_iodir(fifo_io_link_fmt_iodir),
	.io_link_cs_set(fifo_io_link_cs_set),
	.io_link_cs_clear(fifo_io_link_cs_clear),
	.io_link_lock(fifo_io_link_lock),
	.io_tx_ready(fifo_io_tx_ready),
	.io_tx_valid(fifo_io_tx_valid),
	.io_tx_bits(fifo_io_tx_bits),
	.io_rx_ready(fifo_io_rx_ready),
	.io_rx_valid(fifo_io_rx_valid),
	.io_rx_bits(fifo_io_rx_bits),
	.io_ip_txwm(fifo_io_ip_txwm),
	.io_ip_rxwm(fifo_io_ip_rxwm)
);

frvp_spi_SPIMedia_1
mac
(
	.clock(mac_clock),
	.reset(mac_reset),
	.io_port_sck(mac_io_port_sck),
	.io_port_dq_0_i(mac_io_port_dq_0_i),
	.io_port_dq_0_o(mac_io_port_dq_0_o),
	.io_port_dq_0_oe(mac_io_port_dq_0_oe),
	.io_port_dq_1_i(mac_io_port_dq_1_i),
	.io_port_dq_1_o(mac_io_port_dq_1_o),
	.io_port_dq_1_oe(mac_io_port_dq_1_oe),
	.io_port_dq_2_i(mac_io_port_dq_2_i),
	.io_port_dq_2_o(mac_io_port_dq_2_o),
	.io_port_dq_2_oe(mac_io_port_dq_2_oe),
	.io_port_dq_3_i(mac_io_port_dq_3_i),
	.io_port_dq_3_o(mac_io_port_dq_3_o),
	.io_port_dq_3_oe(mac_io_port_dq_3_oe),
	.io_port_cs_0(mac_io_port_cs_0),
	.io_port_cs_1(mac_io_port_cs_1),
	.io_port_cs_2(mac_io_port_cs_2),
	.io_port_cs_3(mac_io_port_cs_3),
	.io_ctrl_sck_div(mac_io_ctrl_sck_div),
	.io_ctrl_sck_pol(mac_io_ctrl_sck_pol),
	.io_ctrl_sck_pha(mac_io_ctrl_sck_pha),
	.io_ctrl_dla_cssck(mac_io_ctrl_dla_cssck),
	.io_ctrl_dla_sckcs(mac_io_ctrl_dla_sckcs),
	.io_ctrl_dla_intercs(mac_io_ctrl_dla_intercs),
	.io_ctrl_dla_interxfr(mac_io_ctrl_dla_interxfr),
	.io_ctrl_cs_id(mac_io_ctrl_cs_id),
	.io_ctrl_cs_dflt_0(mac_io_ctrl_cs_dflt_0),
	.io_ctrl_cs_dflt_1(mac_io_ctrl_cs_dflt_1),
	.io_ctrl_cs_dflt_2(mac_io_ctrl_cs_dflt_2),
	.io_ctrl_cs_dflt_3(mac_io_ctrl_cs_dflt_3),
	.io_ctrl_extradel_coarse(mac_io_ctrl_extradel_coarse),
	.io_ctrl_sampledel_sd(mac_io_ctrl_sampledel_sd),
	.io_link_tx_ready(mac_io_link_tx_ready),
	.io_link_tx_valid(mac_io_link_tx_valid),
	.io_link_tx_bits(mac_io_link_tx_bits),
	.io_link_rx_valid(mac_io_link_rx_valid),
	.io_link_rx_bits(mac_io_link_rx_bits),
	.io_link_cnt(mac_io_link_cnt),
	.io_link_fmt_proto(mac_io_link_fmt_proto),
	.io_link_fmt_endian(mac_io_link_fmt_endian),
	.io_link_fmt_iodir(mac_io_link_fmt_iodir),
	.io_link_cs_set(mac_io_link_cs_set),
	.io_link_cs_clear(mac_io_link_cs_clear)
);

assign _T_410 = fifo_io_ip_txwm & ie_txwm;
assign _T_411 = fifo_io_ip_rxwm & ie_rxwm;
assign _T_415 = fifo_io_tx_ready == 1'h0;
assign _T_416 = fifo_io_rx_valid == 1'h0;
assign _T_108_a_bits_opcode = buffer_auto_out_a_bits_opcode;
assign _T_424 = _T_108_a_bits_opcode == 3'h4;
assign _T_108_a_bits_address = buffer_auto_out_a_bits_address;
assign _T_425 = _T_108_a_bits_address[28:2];
assign _T_108_a_bits_source = buffer_auto_out_a_bits_source;
assign _T_108_a_bits_size = buffer_auto_out_a_bits_size;
assign _T_426 = {_T_108_a_bits_source,_T_108_a_bits_size};
assign _T_421_bits_index = _T_425[9:0];
assign _T_442 = _T_421_bits_index & 10'h3e0;
assign _T_444 = _T_442 == 10'h0;
assign _T_108_a_bits_mask = buffer_auto_out_a_bits_mask;
assign _T_624 = _T_108_a_bits_mask[0];
assign _T_625 = _T_108_a_bits_mask[1];
assign _T_626 = _T_108_a_bits_mask[2];
assign _T_627 = _T_108_a_bits_mask[3];
assign _T_629 = _T_624 ? 8'hff : 8'h0;
assign _T_631 = _T_625 ? 8'hff : 8'h0;
assign _T_633 = _T_626 ? 8'hff : 8'h0;
assign _T_635 = _T_627 ? 8'hff : 8'h0;
assign _T_636 = {_T_631,_T_629};
assign _T_637 = {_T_635,_T_633};
assign _T_638 = {_T_637,_T_636};
assign _T_654 = _T_638[11:0];
assign _T_657 = ~ _T_654;
assign _T_658 = _T_657 == 12'h0;
assign _T_108_a_valid = buffer_auto_out_a_valid;
assign _T_108_d_ready = buffer_auto_out_d_ready;
assign _T_1481 = _T_421_bits_index[4];
assign _T_1480 = _T_421_bits_index[3];
assign _T_1488 = {_T_1481,_T_1480};
assign _T_1479 = _T_421_bits_index[2];
assign _T_1489 = {_T_1488,_T_1479};
assign _T_1478 = _T_421_bits_index[1];
assign _T_1477 = _T_421_bits_index[0];
assign _T_1487 = {_T_1478,_T_1477};
assign _T_1490 = {_T_1489,_T_1487};
assign _T_1557 = _T_108_a_valid & _T_108_d_ready;
assign _T_1558 = _T_1557 & _T_424;
assign _T_1491 = 32'h1 << _T_1490;
assign _T_1492 = _T_1491[0];
assign _T_1793 = _T_424 == 1'h0;
assign _T_1794 = _T_1557 & _T_1793;
assign _T_1797 = _T_1794 & _T_1492;
assign _T_1798 = _T_1797 & _T_444;
assign _T_666 = _T_1798 & _T_658;
assign _T_108_a_bits_data = buffer_auto_out_a_bits_data;
assign _T_668 = _T_108_a_bits_data[11:0];
assign _T_679 = _T_638[0];
assign _T_682 = ~ _T_679;
assign _T_683 = _T_682 == 1'h0;
assign _T_1497 = _T_1491[5];
assign _T_1827 = _T_1794 & _T_1497;
assign _T_1828 = _T_1827 & _T_444;
assign _T_691 = _T_1828 & _T_683;
assign _T_693 = _T_108_a_bits_data[0];
assign _T_704 = _T_638[1];
assign _T_707 = ~ _T_704;
assign _T_708 = _T_707 == 1'h0;
assign _T_716 = _T_1828 & _T_708;
assign _T_718 = _T_108_a_bits_data[1];
assign _T_728 = {ctrl_cs_dflt_1,ctrl_cs_dflt_0};
assign _T_731 = _T_638[2];
assign _T_734 = ~ _T_731;
assign _T_735 = _T_734 == 1'h0;
assign _T_743 = _T_1828 & _T_735;
assign _T_745 = _T_108_a_bits_data[2];
assign _T_755 = {ctrl_cs_dflt_2,_T_728};
assign _T_758 = _T_638[3];
assign _T_761 = ~ _T_758;
assign _T_762 = _T_761 == 1'h0;
assign _T_770 = _T_1828 & _T_762;
assign _T_772 = _T_108_a_bits_data[3];
assign _T_782 = {ctrl_cs_dflt_3,_T_755};
assign _T_785 = _T_638[7:0];
assign _T_786 = _T_785 != 8'h0;
assign _T_788 = ~ _T_785;
assign _T_789 = _T_788 == 8'h0;
assign _T_1502 = _T_1491[10];
assign _T_1857 = _T_1794 & _T_1502;
assign _T_1858 = _T_1857 & _T_444;
assign _T_797 = _T_1858 & _T_789;
assign _T_799 = _T_108_a_bits_data[7:0];
assign _T_810 = _T_638[23:16];
assign _T_813 = ~ _T_810;
assign _T_814 = _T_813 == 8'h0;
assign _T_822 = _T_1858 & _T_814;
assign _T_824 = _T_108_a_bits_data[23:16];
assign _T_833 = {{8'd0}, ctrl_dla_cssck};
assign _T_834 = {ctrl_dla_sckcs,_T_833};
assign _T_1506 = _T_1491[14];
assign _T_1881 = _T_1794 & _T_1506;
assign _T_1882 = _T_1881 & _T_444;
assign _T_849 = _T_1882 & _T_658;
assign _T_862 = _T_638[3:0];
assign _T_865 = ~ _T_862;
assign _T_866 = _T_865 == 4'h0;
assign _T_1512 = _T_1491[20];
assign _T_1917 = _T_1794 & _T_1512;
assign _T_1918 = _T_1917 & _T_444;
assign _T_874 = _T_1918 & _T_866;
assign _T_876 = _T_108_a_bits_data[3:0];
assign _T_910 = fifo_io_ip_txwm;
assign _T_936 = {fifo_io_ip_rxwm,_T_910};
assign _T_1493 = _T_1491[1];
assign _T_1803 = _T_1794 & _T_1493;
assign _T_1804 = _T_1803 & _T_444;
assign _T_951 = _T_1804 & _T_683;
assign _T_976 = _T_1804 & _T_708;
assign _T_988 = {ctrl_sck_pol,ctrl_sck_pha};
assign _T_991 = _T_638[1:0];
assign _T_994 = ~ _T_991;
assign _T_995 = _T_994 == 2'h0;
assign _T_1498 = _T_1491[6];
assign _T_1833 = _T_1794 & _T_1498;
assign _T_1834 = _T_1833 & _T_444;
assign _T_1003 = _T_1834 & _T_995;
assign _T_1005 = _T_108_a_bits_data[1:0];
assign _T_1520 = _T_1491[28];
assign _T_1965 = _T_1794 & _T_1520;
assign _T_1966 = _T_1965 & _T_444;
assign _T_1028 = _T_1966 & _T_683;
assign _T_1053 = _T_1966 & _T_708;
assign _T_1065 = {ie_rxwm,ie_txwm};
assign _T_1513 = _T_1491[21];
assign _T_1923 = _T_1794 & _T_1513;
assign _T_1924 = _T_1923 & _T_444;
assign _T_1080 = _T_1924 & _T_866;
assign _T_1510 = _T_1491[18];
assign _T_1905 = _T_1794 & _T_1510;
assign _T_1906 = _T_1905 & _T_444;
assign _T_1105 = _T_1906 & _T_789;
assign _T_1154 = _T_638[31];
assign _T_1155 = ~ _T_1154;
assign _T_1156 = _T_1155 == 1'h0;
assign _T_1160 = _T_1906 & _T_1156;
assign _T_1161 = _T_108_a_bits_data[31];
assign _T_1163 = _T_1160 & _T_1161;
assign _T_1108 = _T_1163 == 1'h0;
assign _T_1173 = {_T_415,31'h0};
assign _T_1508 = _T_1491[16];
assign _T_1893 = _T_1794 & _T_1508;
assign _T_1894 = _T_1893 & _T_444;
assign _T_1188 = _T_1894 & _T_995;
assign _T_1213 = _T_1894 & _T_735;
assign _T_1225 = {ctrl_fmt_endian,ctrl_fmt_proto};
assign _T_1240 = _T_1894 & _T_762;
assign _T_1252 = {ctrl_fmt_iodir,_T_1225};
assign _T_1255 = _T_638[19:16];
assign _T_1258 = ~ _T_1255;
assign _T_1259 = _T_1258 == 4'h0;
assign _T_1267 = _T_1894 & _T_1259;
assign _T_1269 = _T_108_a_bits_data[19:16];
assign _T_1278 = {{12'd0}, _T_1252};
assign _T_1279 = {ctrl_fmt_len,_T_1278};
assign _T_1503 = _T_1491[11];
assign _T_1863 = _T_1794 & _T_1503;
assign _T_1864 = _T_1863 & _T_444;
assign _T_1294 = _T_1864 & _T_789;
assign _T_1319 = _T_1864 & _T_814;
assign _T_1330 = {{8'd0}, ctrl_dla_intercs};
assign _T_1331 = {ctrl_dla_interxfr,_T_1330};
assign _T_1511 = _T_1491[19];
assign _T_1675 = _T_1558 & _T_1511;
assign _T_1676 = _T_1675 & _T_444;
assign _T_1357 = fifo_io_rx_bits;
assign _T_1383 = {1'h0,_T_1357};
assign _T_1384 = {{22'd0}, _T_1383};
assign _T_1410 = {_T_416,_T_1384};
assign _T_1496 = _T_1491[4];
assign _T_1821 = _T_1794 & _T_1496;
assign _T_1822 = _T_1821 & _T_444;
assign _T_1425 = _T_1822 & _T_995;
assign _T_1438 = _T_638[4:0];
assign _T_1441 = ~ _T_1438;
assign _T_1442 = _T_1441 == 5'h0;
assign _T_1507 = _T_1491[15];
assign _T_1887 = _T_1794 & _T_1507;
assign _T_1888 = _T_1887 & _T_444;
assign _T_1450 = _T_1888 & _T_1442;
assign _T_1452 = _T_108_a_bits_data[4:0];
assign _GEN_152 = 5'h1 == _T_1490 ? _T_444 : _T_444;
assign _GEN_153 = 5'h2 == _T_1490 ? 1'h1 : _GEN_152;
assign _GEN_154 = 5'h3 == _T_1490 ? 1'h1 : _GEN_153;
assign _GEN_155 = 5'h4 == _T_1490 ? _T_444 : _GEN_154;
assign _GEN_156 = 5'h5 == _T_1490 ? _T_444 : _GEN_155;
assign _GEN_157 = 5'h6 == _T_1490 ? _T_444 : _GEN_156;
assign _GEN_158 = 5'h7 == _T_1490 ? 1'h1 : _GEN_157;
assign _GEN_159 = 5'h8 == _T_1490 ? 1'h1 : _GEN_158;
assign _GEN_160 = 5'h9 == _T_1490 ? 1'h1 : _GEN_159;
assign _GEN_161 = 5'ha == _T_1490 ? _T_444 : _GEN_160;
assign _GEN_162 = 5'hb == _T_1490 ? _T_444 : _GEN_161;
assign _GEN_163 = 5'hc == _T_1490 ? 1'h1 : _GEN_162;
assign _GEN_164 = 5'hd == _T_1490 ? 1'h1 : _GEN_163;
assign _GEN_165 = 5'he == _T_1490 ? _T_444 : _GEN_164;
assign _GEN_166 = 5'hf == _T_1490 ? _T_444 : _GEN_165;
assign _GEN_167 = 5'h10 == _T_1490 ? _T_444 : _GEN_166;
assign _GEN_168 = 5'h11 == _T_1490 ? 1'h1 : _GEN_167;
assign _GEN_169 = 5'h12 == _T_1490 ? _T_444 : _GEN_168;
assign _GEN_170 = 5'h13 == _T_1490 ? _T_444 : _GEN_169;
assign _GEN_171 = 5'h14 == _T_1490 ? _T_444 : _GEN_170;
assign _GEN_172 = 5'h15 == _T_1490 ? _T_444 : _GEN_171;
assign _GEN_173 = 5'h16 == _T_1490 ? 1'h1 : _GEN_172;
assign _GEN_174 = 5'h17 == _T_1490 ? 1'h1 : _GEN_173;
assign _GEN_175 = 5'h18 == _T_1490 ? 1'h1 : _GEN_174;
assign _GEN_176 = 5'h19 == _T_1490 ? 1'h1 : _GEN_175;
assign _GEN_177 = 5'h1a == _T_1490 ? 1'h1 : _GEN_176;
assign _GEN_178 = 5'h1b == _T_1490 ? 1'h1 : _GEN_177;
assign _GEN_179 = 5'h1c == _T_1490 ? _T_444 : _GEN_178;
assign _GEN_180 = 5'h1d == _T_1490 ? _T_444 : _GEN_179;
assign _GEN_181 = 5'h1e == _T_1490 ? 1'h1 : _GEN_180;
assign _GEN_182 = 5'h1f == _T_1490 ? 1'h1 : _GEN_181;
assign _T_2550_0 = {{20'd0}, ctrl_sck_div};
assign _T_2550_1 = {{30'd0}, _T_988};
assign _GEN_184 = 5'h1 == _T_1490 ? _T_2550_1 : _T_2550_0;
assign _GEN_185 = 5'h2 == _T_1490 ? 32'h0 : _GEN_184;
assign _GEN_186 = 5'h3 == _T_1490 ? 32'h0 : _GEN_185;
assign _T_2550_4 = {{30'd0}, ctrl_cs_id};
assign _GEN_187 = 5'h4 == _T_1490 ? _T_2550_4 : _GEN_186;
assign _T_2550_5 = {{28'd0}, _T_782};
assign _GEN_188 = 5'h5 == _T_1490 ? _T_2550_5 : _GEN_187;
assign _T_2550_6 = {{30'd0}, ctrl_cs_mode};
assign _GEN_189 = 5'h6 == _T_1490 ? _T_2550_6 : _GEN_188;
assign _GEN_190 = 5'h7 == _T_1490 ? 32'h0 : _GEN_189;
assign _GEN_191 = 5'h8 == _T_1490 ? 32'h0 : _GEN_190;
assign _GEN_192 = 5'h9 == _T_1490 ? 32'h0 : _GEN_191;
assign _T_2550_10 = {{8'd0}, _T_834};
assign _GEN_193 = 5'ha == _T_1490 ? _T_2550_10 : _GEN_192;
assign _T_2550_11 = {{8'd0}, _T_1331};
assign _GEN_194 = 5'hb == _T_1490 ? _T_2550_11 : _GEN_193;
assign _GEN_195 = 5'hc == _T_1490 ? 32'h0 : _GEN_194;
assign _GEN_196 = 5'hd == _T_1490 ? 32'h0 : _GEN_195;
assign _T_2550_14 = {{20'd0}, ctrl_extradel_coarse};
assign _GEN_197 = 5'he == _T_1490 ? _T_2550_14 : _GEN_196;
assign _T_2550_15 = {{27'd0}, ctrl_sampledel_sd};
assign _GEN_198 = 5'hf == _T_1490 ? _T_2550_15 : _GEN_197;
assign _T_2550_16 = {{12'd0}, _T_1279};
assign _GEN_199 = 5'h10 == _T_1490 ? _T_2550_16 : _GEN_198;
assign _GEN_200 = 5'h11 == _T_1490 ? 32'h0 : _GEN_199;
assign _GEN_201 = 5'h12 == _T_1490 ? _T_1173 : _GEN_200;
assign _GEN_202 = 5'h13 == _T_1490 ? _T_1410 : _GEN_201;
assign _T_2550_20 = {{28'd0}, ctrl_wm_tx};
assign _GEN_203 = 5'h14 == _T_1490 ? _T_2550_20 : _GEN_202;
assign _T_2550_21 = {{28'd0}, ctrl_wm_rx};
assign _GEN_204 = 5'h15 == _T_1490 ? _T_2550_21 : _GEN_203;
assign _GEN_205 = 5'h16 == _T_1490 ? 32'h0 : _GEN_204;
assign _GEN_206 = 5'h17 == _T_1490 ? 32'h0 : _GEN_205;
assign _GEN_207 = 5'h18 == _T_1490 ? 32'h0 : _GEN_206;
assign _GEN_208 = 5'h19 == _T_1490 ? 32'h0 : _GEN_207;
assign _GEN_209 = 5'h1a == _T_1490 ? 32'h0 : _GEN_208;
assign _GEN_210 = 5'h1b == _T_1490 ? 32'h0 : _GEN_209;
assign _T_2550_28 = {{30'd0}, _T_1065};
assign _GEN_211 = 5'h1c == _T_1490 ? _T_2550_28 : _GEN_210;
assign _T_2550_29 = {{30'd0}, _T_936};
assign _GEN_212 = 5'h1d == _T_1490 ? _T_2550_29 : _GEN_211;
assign _GEN_213 = 5'h1e == _T_1490 ? 32'h0 : _GEN_212;
assign _GEN_214 = 5'h1f == _T_1490 ? 32'h0 : _GEN_213;
assign auto_int_xing_out_sync_0 = intsource_auto_out_sync_0;
assign auto_control_xing_in_a_ready = buffer_auto_in_a_ready;
assign auto_control_xing_in_d_valid = buffer_auto_in_d_valid;
assign auto_control_xing_in_d_bits_opcode = buffer_auto_in_d_bits_opcode;
assign auto_control_xing_in_d_bits_size = buffer_auto_in_d_bits_size;
assign auto_control_xing_in_d_bits_source = buffer_auto_in_d_bits_source;
assign auto_control_xing_in_d_bits_data = buffer_auto_in_d_bits_data;
assign auto_io_out_sck = mac_io_port_sck;
assign auto_io_out_dq_0_o = mac_io_port_dq_0_o;
assign auto_io_out_dq_0_oe = mac_io_port_dq_0_oe;
assign auto_io_out_dq_1_o = mac_io_port_dq_1_o;
assign auto_io_out_dq_1_oe = mac_io_port_dq_1_oe;
assign auto_io_out_dq_2_o = mac_io_port_dq_2_o;
assign auto_io_out_dq_2_oe = mac_io_port_dq_2_oe;
assign auto_io_out_dq_3_o = mac_io_port_dq_3_o;
assign auto_io_out_dq_3_oe = mac_io_port_dq_3_oe;
assign auto_io_out_cs_0 = mac_io_port_cs_0;
assign buffer_clock = clock;
assign buffer_reset = reset;
assign buffer_auto_in_a_valid = auto_control_xing_in_a_valid;
assign buffer_auto_in_a_bits_opcode = auto_control_xing_in_a_bits_opcode;
assign buffer_auto_in_a_bits_param = auto_control_xing_in_a_bits_param;
assign buffer_auto_in_a_bits_size = auto_control_xing_in_a_bits_size;
assign buffer_auto_in_a_bits_source = auto_control_xing_in_a_bits_source;
assign buffer_auto_in_a_bits_address = auto_control_xing_in_a_bits_address;
assign buffer_auto_in_a_bits_mask = auto_control_xing_in_a_bits_mask;
assign buffer_auto_in_a_bits_data = auto_control_xing_in_a_bits_data;
assign buffer_auto_in_a_bits_corrupt = auto_control_xing_in_a_bits_corrupt;
assign buffer_auto_in_d_ready = auto_control_xing_in_d_ready;
assign buffer_auto_out_a_ready = buffer_auto_out_d_ready;
assign buffer_auto_out_d_valid = buffer_auto_out_a_valid;
assign buffer_auto_out_d_bits_opcode = {{2'd0}, _T_424};
assign buffer_auto_out_d_bits_size = _T_426[1:0];
assign buffer_auto_out_d_bits_source = _T_426[7:2];
assign buffer_auto_out_d_bits_data = _GEN_182 ? _GEN_214 : 32'h0;
assign intsource_clock = clock;
assign intsource_reset = reset;
assign intsource_auto_in_0 = _T_410 | _T_411;
assign TLMonitor_clock = clock;
assign TLMonitor_reset = reset;
assign TLMonitor_io_in_a_ready = buffer_auto_out_d_ready;
assign TLMonitor_io_in_a_valid = buffer_auto_out_a_valid;
assign TLMonitor_io_in_a_bits_opcode = buffer_auto_out_a_bits_opcode;
assign TLMonitor_io_in_a_bits_param = buffer_auto_out_a_bits_param;
assign TLMonitor_io_in_a_bits_size = buffer_auto_out_a_bits_size;
assign TLMonitor_io_in_a_bits_source = buffer_auto_out_a_bits_source;
assign TLMonitor_io_in_a_bits_address = buffer_auto_out_a_bits_address;
assign TLMonitor_io_in_a_bits_mask = buffer_auto_out_a_bits_mask;
assign TLMonitor_io_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt;
assign TLMonitor_io_in_d_ready = buffer_auto_out_d_ready;
assign TLMonitor_io_in_d_valid = buffer_auto_out_a_valid;
assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, _T_424};
assign TLMonitor_io_in_d_bits_size = _T_426[1:0];
assign TLMonitor_io_in_d_bits_source = _T_426[7:2];
assign fifo_clock = clock;
assign fifo_reset = reset;
assign fifo_io_ctrl_fmt_proto = ctrl_fmt_proto;
assign fifo_io_ctrl_fmt_endian = ctrl_fmt_endian;
assign fifo_io_ctrl_fmt_iodir = ctrl_fmt_iodir;
assign fifo_io_ctrl_fmt_len = ctrl_fmt_len;
assign fifo_io_ctrl_cs_mode = ctrl_cs_mode;
assign fifo_io_ctrl_wm_tx = ctrl_wm_tx;
assign fifo_io_ctrl_wm_rx = ctrl_wm_rx;
assign fifo_io_link_tx_ready = mac_io_link_tx_ready;
assign fifo_io_link_rx_valid = mac_io_link_rx_valid;
assign fifo_io_link_rx_bits = mac_io_link_rx_bits;
assign fifo_io_tx_valid = _T_1105 & _T_1108;
assign fifo_io_tx_bits = _T_108_a_bits_data[7:0];
assign fifo_io_rx_ready = _T_1676 & _T_786;
assign mac_clock = clock;
assign mac_reset = reset;
assign mac_io_port_dq_0_i = auto_io_out_dq_0_i;
assign mac_io_port_dq_1_i = auto_io_out_dq_1_i;
assign mac_io_port_dq_2_i = auto_io_out_dq_2_i;
assign mac_io_port_dq_3_i = auto_io_out_dq_3_i;
assign mac_io_ctrl_sck_div = ctrl_sck_div;
assign mac_io_ctrl_sck_pol = ctrl_sck_pol;
assign mac_io_ctrl_sck_pha = ctrl_sck_pha;
assign mac_io_ctrl_dla_cssck = ctrl_dla_cssck;
assign mac_io_ctrl_dla_sckcs = ctrl_dla_sckcs;
assign mac_io_ctrl_dla_intercs = ctrl_dla_intercs;
assign mac_io_ctrl_dla_interxfr = ctrl_dla_interxfr;
assign mac_io_ctrl_cs_id = ctrl_cs_id;
assign mac_io_ctrl_cs_dflt_0 = ctrl_cs_dflt_0;
assign mac_io_ctrl_cs_dflt_1 = ctrl_cs_dflt_1;
assign mac_io_ctrl_cs_dflt_2 = ctrl_cs_dflt_2;
assign mac_io_ctrl_cs_dflt_3 = ctrl_cs_dflt_3;
assign mac_io_ctrl_extradel_coarse = ctrl_extradel_coarse;
assign mac_io_ctrl_sampledel_sd = ctrl_sampledel_sd;
assign mac_io_link_tx_valid = fifo_io_link_tx_valid;
assign mac_io_link_tx_bits = fifo_io_link_tx_bits;
assign mac_io_link_cnt = fifo_io_link_cnt;
assign mac_io_link_fmt_proto = fifo_io_link_fmt_proto;
assign mac_io_link_fmt_endian = fifo_io_link_fmt_endian;
assign mac_io_link_fmt_iodir = fifo_io_link_fmt_iodir;
assign mac_io_link_cs_set = fifo_io_link_cs_set;
assign mac_io_link_cs_clear = fifo_io_link_cs_clear;

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_fmt_proto <= 2'h0;
	end else begin
		if (_T_1188) begin
			ctrl_fmt_proto <= _T_1005;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_fmt_endian <= 1'h0;
	end else begin
		if (_T_1213) begin
			ctrl_fmt_endian <= _T_745;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_fmt_iodir <= 1'h0;
	end else begin
		if (_T_1240) begin
			ctrl_fmt_iodir <= _T_772;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_fmt_len <= 4'h8;
	end else begin
		if (_T_1267) begin
			ctrl_fmt_len <= _T_1269;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_sck_div <= 12'h3;
	end else begin
		if (_T_666) begin
			ctrl_sck_div <= _T_668;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_sck_pol <= 1'h0;
	end else begin
		if (_T_976) begin
			ctrl_sck_pol <= _T_718;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_sck_pha <= 1'h0;
	end else begin
		if (_T_951) begin
			ctrl_sck_pha <= _T_693;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_cs_id <= 2'h0;
	end else begin
		if (_T_1425) begin
			ctrl_cs_id <= _T_1005;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_cs_dflt_0 <= 1'h1;
	end else begin
		if (_T_691) begin
			ctrl_cs_dflt_0 <= _T_693;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_cs_dflt_1 <= 1'h1;
	end else begin
		if (_T_716) begin
			ctrl_cs_dflt_1 <= _T_718;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_cs_dflt_2 <= 1'h1;
	end else begin
		if (_T_743) begin
			ctrl_cs_dflt_2 <= _T_745;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_cs_dflt_3 <= 1'h1;
	end else begin
		if (_T_770) begin
			ctrl_cs_dflt_3 <= _T_772;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_cs_mode <= 2'h0;
	end else begin
		if (_T_1003) begin
			ctrl_cs_mode <= _T_1005;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_dla_cssck <= 8'h1;
	end else begin
		if (_T_797) begin
			ctrl_dla_cssck <= _T_799;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_dla_sckcs <= 8'h1;
	end else begin
		if (_T_822) begin
			ctrl_dla_sckcs <= _T_824;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_dla_intercs <= 8'h1;
	end else begin
		if (_T_1294) begin
			ctrl_dla_intercs <= _T_799;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_dla_interxfr <= 8'h0;
	end else begin
		if (_T_1319) begin
			ctrl_dla_interxfr <= _T_824;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_wm_tx <= 4'h0;
	end else begin
		if (_T_874) begin
			ctrl_wm_tx <= _T_876;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_wm_rx <= 4'h0;
	end else begin
		if (_T_1080) begin
			ctrl_wm_rx <= _T_876;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_extradel_coarse <= 12'h0;
	end else begin
		if (_T_849) begin
			ctrl_extradel_coarse <= _T_668;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ctrl_sampledel_sd <= 5'h3;
	end else begin
		if (_T_1450) begin
			ctrl_sampledel_sd <= _T_1452;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ie_txwm <= 1'h0;
	end else begin
		if (_T_1028) begin
			ie_txwm <= _T_693;
		end
	end
end

always @(posedge clock, posedge reset)
begin
	if (reset) begin
		ie_rxwm <= 1'h0;
	end else begin
		if (_T_1053) begin
			ie_rxwm <= _T_718;
		end
	end
end

// User assignment
assign auto_io_out_cs_1 = mac_io_port_cs_1;
assign auto_io_out_cs_2 = mac_io_port_cs_2;
assign auto_io_out_cs_3 = mac_io_port_cs_3;

endmodule

