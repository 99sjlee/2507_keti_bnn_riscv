`default_nettype wire
module Arbiter(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [19:0] io_in_0_bits_bits_addr,
  input         io_in_0_bits_bits_need_gpa,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input         io_in_1_bits_valid,
  input  [19:0] io_in_1_bits_bits_addr,
  input         io_in_1_bits_bits_need_gpa,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_valid,
  output [19:0] io_out_bits_bits_addr,
  output        io_out_bits_bits_need_gpa,
  output        io_chosen
);
  wire  grant_1 = ~io_in_0_valid;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = grant_1 & io_out_ready;
  assign io_out_valid = ~grant_1 | io_in_1_valid;
  assign io_out_bits_valid = io_in_0_valid | io_in_1_bits_valid;
  assign io_out_bits_bits_addr = io_in_0_valid ? io_in_0_bits_bits_addr : io_in_1_bits_bits_addr;
  assign io_out_bits_bits_need_gpa = io_in_0_valid ? io_in_0_bits_bits_need_gpa : io_in_1_bits_bits_need_gpa;
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1;
endmodule