`default_nettype wire
module DCacheDataArray(
  input         clock,
  input         io_req_valid,
  input  [11:0] io_req_bits_addr,
  input         io_req_bits_write,
  input  [31:0] io_req_bits_wdata,
  input  [3:0]  io_req_bits_eccMask,
  input  [3:0]  io_req_bits_way_en,
  output [31:0] io_resp_0,
  output [31:0] io_resp_1,
  output [31:0] io_resp_2,
  output [31:0] io_resp_3
);
  wire [9:0] data_arrays_0_RW0_addr;
  wire  data_arrays_0_RW0_en;
  wire  data_arrays_0_RW0_clk;
  wire  data_arrays_0_RW0_wmode;
  wire [7:0] data_arrays_0_RW0_wdata_0;
  wire [7:0] data_arrays_0_RW0_wdata_1;
  wire [7:0] data_arrays_0_RW0_wdata_2;
  wire [7:0] data_arrays_0_RW0_wdata_3;
  wire [7:0] data_arrays_0_RW0_wdata_4;
  wire [7:0] data_arrays_0_RW0_wdata_5;
  wire [7:0] data_arrays_0_RW0_wdata_6;
  wire [7:0] data_arrays_0_RW0_wdata_7;
  wire [7:0] data_arrays_0_RW0_wdata_8;
  wire [7:0] data_arrays_0_RW0_wdata_9;
  wire [7:0] data_arrays_0_RW0_wdata_10;
  wire [7:0] data_arrays_0_RW0_wdata_11;
  wire [7:0] data_arrays_0_RW0_wdata_12;
  wire [7:0] data_arrays_0_RW0_wdata_13;
  wire [7:0] data_arrays_0_RW0_wdata_14;
  wire [7:0] data_arrays_0_RW0_wdata_15;
  wire [7:0] data_arrays_0_RW0_rdata_0;
  wire [7:0] data_arrays_0_RW0_rdata_1;
  wire [7:0] data_arrays_0_RW0_rdata_2;
  wire [7:0] data_arrays_0_RW0_rdata_3;
  wire [7:0] data_arrays_0_RW0_rdata_4;
  wire [7:0] data_arrays_0_RW0_rdata_5;
  wire [7:0] data_arrays_0_RW0_rdata_6;
  wire [7:0] data_arrays_0_RW0_rdata_7;
  wire [7:0] data_arrays_0_RW0_rdata_8;
  wire [7:0] data_arrays_0_RW0_rdata_9;
  wire [7:0] data_arrays_0_RW0_rdata_10;
  wire [7:0] data_arrays_0_RW0_rdata_11;
  wire [7:0] data_arrays_0_RW0_rdata_12;
  wire [7:0] data_arrays_0_RW0_rdata_13;
  wire [7:0] data_arrays_0_RW0_rdata_14;
  wire [7:0] data_arrays_0_RW0_rdata_15;
  wire  data_arrays_0_RW0_wmask_0;
  wire  data_arrays_0_RW0_wmask_1;
  wire  data_arrays_0_RW0_wmask_2;
  wire  data_arrays_0_RW0_wmask_3;
  wire  data_arrays_0_RW0_wmask_4;
  wire  data_arrays_0_RW0_wmask_5;
  wire  data_arrays_0_RW0_wmask_6;
  wire  data_arrays_0_RW0_wmask_7;
  wire  data_arrays_0_RW0_wmask_8;
  wire  data_arrays_0_RW0_wmask_9;
  wire  data_arrays_0_RW0_wmask_10;
  wire  data_arrays_0_RW0_wmask_11;
  wire  data_arrays_0_RW0_wmask_12;
  wire  data_arrays_0_RW0_wmask_13;
  wire  data_arrays_0_RW0_wmask_14;
  wire  data_arrays_0_RW0_wmask_15;
  wire  eccMask_0 = io_req_bits_eccMask[0];
  wire  eccMask_1 = io_req_bits_eccMask[1];
  wire  eccMask_2 = io_req_bits_eccMask[2];
  wire  eccMask_3 = io_req_bits_eccMask[3];
  wire  _rdata_T = io_req_valid & io_req_bits_write;
  wire  _rdata_data_T_1 = io_req_valid & ~io_req_bits_write;
  wire [15:0] rdata_lo = {data_arrays_0_RW0_rdata_1,data_arrays_0_RW0_rdata_0};
  wire [15:0] rdata_hi = {data_arrays_0_RW0_rdata_3,data_arrays_0_RW0_rdata_2};
  wire [15:0] lo = {data_arrays_0_RW0_rdata_5,data_arrays_0_RW0_rdata_4};
  wire [15:0] hi = {data_arrays_0_RW0_rdata_7,data_arrays_0_RW0_rdata_6};
  wire [15:0] lo_1 = {data_arrays_0_RW0_rdata_9,data_arrays_0_RW0_rdata_8};
  wire [15:0] hi_1 = {data_arrays_0_RW0_rdata_11,data_arrays_0_RW0_rdata_10};
  wire [15:0] lo_2 = {data_arrays_0_RW0_rdata_13,data_arrays_0_RW0_rdata_12};
  wire [15:0] hi_2 = {data_arrays_0_RW0_rdata_15,data_arrays_0_RW0_rdata_14};
  data_arrays_0 data_arrays_0 (
    .RW0_addr(data_arrays_0_RW0_addr),
    .RW0_en(data_arrays_0_RW0_en),
    .RW0_clk(data_arrays_0_RW0_clk),
    .RW0_wmode(data_arrays_0_RW0_wmode),
    .RW0_wdata_0(data_arrays_0_RW0_wdata_0),
    .RW0_wdata_1(data_arrays_0_RW0_wdata_1),
    .RW0_wdata_2(data_arrays_0_RW0_wdata_2),
    .RW0_wdata_3(data_arrays_0_RW0_wdata_3),
    .RW0_wdata_4(data_arrays_0_RW0_wdata_4),
    .RW0_wdata_5(data_arrays_0_RW0_wdata_5),
    .RW0_wdata_6(data_arrays_0_RW0_wdata_6),
    .RW0_wdata_7(data_arrays_0_RW0_wdata_7),
    .RW0_wdata_8(data_arrays_0_RW0_wdata_8),
    .RW0_wdata_9(data_arrays_0_RW0_wdata_9),
    .RW0_wdata_10(data_arrays_0_RW0_wdata_10),
    .RW0_wdata_11(data_arrays_0_RW0_wdata_11),
    .RW0_wdata_12(data_arrays_0_RW0_wdata_12),
    .RW0_wdata_13(data_arrays_0_RW0_wdata_13),
    .RW0_wdata_14(data_arrays_0_RW0_wdata_14),
    .RW0_wdata_15(data_arrays_0_RW0_wdata_15),
    .RW0_rdata_0(data_arrays_0_RW0_rdata_0),
    .RW0_rdata_1(data_arrays_0_RW0_rdata_1),
    .RW0_rdata_2(data_arrays_0_RW0_rdata_2),
    .RW0_rdata_3(data_arrays_0_RW0_rdata_3),
    .RW0_rdata_4(data_arrays_0_RW0_rdata_4),
    .RW0_rdata_5(data_arrays_0_RW0_rdata_5),
    .RW0_rdata_6(data_arrays_0_RW0_rdata_6),
    .RW0_rdata_7(data_arrays_0_RW0_rdata_7),
    .RW0_rdata_8(data_arrays_0_RW0_rdata_8),
    .RW0_rdata_9(data_arrays_0_RW0_rdata_9),
    .RW0_rdata_10(data_arrays_0_RW0_rdata_10),
    .RW0_rdata_11(data_arrays_0_RW0_rdata_11),
    .RW0_rdata_12(data_arrays_0_RW0_rdata_12),
    .RW0_rdata_13(data_arrays_0_RW0_rdata_13),
    .RW0_rdata_14(data_arrays_0_RW0_rdata_14),
    .RW0_rdata_15(data_arrays_0_RW0_rdata_15),
    .RW0_wmask_0(data_arrays_0_RW0_wmask_0),
    .RW0_wmask_1(data_arrays_0_RW0_wmask_1),
    .RW0_wmask_2(data_arrays_0_RW0_wmask_2),
    .RW0_wmask_3(data_arrays_0_RW0_wmask_3),
    .RW0_wmask_4(data_arrays_0_RW0_wmask_4),
    .RW0_wmask_5(data_arrays_0_RW0_wmask_5),
    .RW0_wmask_6(data_arrays_0_RW0_wmask_6),
    .RW0_wmask_7(data_arrays_0_RW0_wmask_7),
    .RW0_wmask_8(data_arrays_0_RW0_wmask_8),
    .RW0_wmask_9(data_arrays_0_RW0_wmask_9),
    .RW0_wmask_10(data_arrays_0_RW0_wmask_10),
    .RW0_wmask_11(data_arrays_0_RW0_wmask_11),
    .RW0_wmask_12(data_arrays_0_RW0_wmask_12),
    .RW0_wmask_13(data_arrays_0_RW0_wmask_13),
    .RW0_wmask_14(data_arrays_0_RW0_wmask_14),
    .RW0_wmask_15(data_arrays_0_RW0_wmask_15)
  );
  assign io_resp_0 = {rdata_hi,rdata_lo};
  assign io_resp_1 = {hi,lo};
  assign io_resp_2 = {hi_1,lo_1};
  assign io_resp_3 = {hi_2,lo_2};
  assign data_arrays_0_RW0_clk = clock;
  assign data_arrays_0_RW0_wdata_0 = io_req_bits_wdata[7:0];
  assign data_arrays_0_RW0_wdata_1 = io_req_bits_wdata[15:8];
  assign data_arrays_0_RW0_wdata_2 = io_req_bits_wdata[23:16];
  assign data_arrays_0_RW0_wdata_3 = io_req_bits_wdata[31:24];
  assign data_arrays_0_RW0_wdata_4 = io_req_bits_wdata[7:0];
  assign data_arrays_0_RW0_wdata_5 = io_req_bits_wdata[15:8];
  assign data_arrays_0_RW0_wdata_6 = io_req_bits_wdata[23:16];
  assign data_arrays_0_RW0_wdata_7 = io_req_bits_wdata[31:24];
  assign data_arrays_0_RW0_wdata_8 = io_req_bits_wdata[7:0];
  assign data_arrays_0_RW0_wdata_9 = io_req_bits_wdata[15:8];
  assign data_arrays_0_RW0_wdata_10 = io_req_bits_wdata[23:16];
  assign data_arrays_0_RW0_wdata_11 = io_req_bits_wdata[31:24];
  assign data_arrays_0_RW0_wdata_12 = io_req_bits_wdata[7:0];
  assign data_arrays_0_RW0_wdata_13 = io_req_bits_wdata[15:8];
  assign data_arrays_0_RW0_wdata_14 = io_req_bits_wdata[23:16];
  assign data_arrays_0_RW0_wdata_15 = io_req_bits_wdata[31:24];
  assign data_arrays_0_RW0_wmask_0 = eccMask_0 & io_req_bits_way_en[0];
  assign data_arrays_0_RW0_wmask_1 = eccMask_1 & io_req_bits_way_en[0];
  assign data_arrays_0_RW0_wmask_2 = eccMask_2 & io_req_bits_way_en[0];
  assign data_arrays_0_RW0_wmask_3 = eccMask_3 & io_req_bits_way_en[0];
  assign data_arrays_0_RW0_wmask_4 = eccMask_0 & io_req_bits_way_en[1];
  assign data_arrays_0_RW0_wmask_5 = eccMask_1 & io_req_bits_way_en[1];
  assign data_arrays_0_RW0_wmask_6 = eccMask_2 & io_req_bits_way_en[1];
  assign data_arrays_0_RW0_wmask_7 = eccMask_3 & io_req_bits_way_en[1];
  assign data_arrays_0_RW0_wmask_8 = eccMask_0 & io_req_bits_way_en[2];
  assign data_arrays_0_RW0_wmask_9 = eccMask_1 & io_req_bits_way_en[2];
  assign data_arrays_0_RW0_wmask_10 = eccMask_2 & io_req_bits_way_en[2];
  assign data_arrays_0_RW0_wmask_11 = eccMask_3 & io_req_bits_way_en[2];
  assign data_arrays_0_RW0_wmask_12 = eccMask_0 & io_req_bits_way_en[3];
  assign data_arrays_0_RW0_wmask_13 = eccMask_1 & io_req_bits_way_en[3];
  assign data_arrays_0_RW0_wmask_14 = eccMask_2 & io_req_bits_way_en[3];
  assign data_arrays_0_RW0_wmask_15 = eccMask_3 & io_req_bits_way_en[3];
  assign data_arrays_0_RW0_en = _rdata_data_T_1 | _rdata_T;
  assign data_arrays_0_RW0_wmode = io_req_bits_write;
  assign data_arrays_0_RW0_addr = io_req_bits_addr[11:2];
endmodule