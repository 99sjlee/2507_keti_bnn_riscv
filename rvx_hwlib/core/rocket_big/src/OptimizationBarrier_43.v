`default_nettype wire
module OptimizationBarrier_43(
  input  [43:0] io_x_ppn,
  input         io_x_d,
  input         io_x_a,
  input         io_x_g,
  input         io_x_u,
  input         io_x_x,
  input         io_x_w,
  input         io_x_r,
  input         io_x_v,
  output [43:0] io_y_ppn,
  output        io_y_d,
  output        io_y_a,
  output        io_y_g,
  output        io_y_u,
  output        io_y_x,
  output        io_y_w,
  output        io_y_r,
  output        io_y_v
);
  assign io_y_ppn = io_x_ppn;
  assign io_y_d = io_x_d;
  assign io_y_a = io_x_a;
  assign io_y_g = io_x_g;
  assign io_y_u = io_x_u;
  assign io_y_x = io_x_x;
  assign io_y_w = io_x_w;
  assign io_y_r = io_x_r;
  assign io_y_v = io_x_v;
endmodule