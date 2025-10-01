`default_nettype wire
module PLICFanIn(
  input  [1:0] io_prio_0,
  input  [1:0] io_prio_1,
  input  [1:0] io_ip,
  output [1:0] io_dev,
  output [1:0] io_max
);
  wire [2:0] effectivePriority_1 = {io_ip[0],io_prio_0};
  wire [2:0] effectivePriority_2 = {io_ip[1],io_prio_1};
  wire  _T = 3'h4 >= effectivePriority_1;
  wire [2:0] _T_2 = _T ? 3'h4 : effectivePriority_1;
  wire  _T_3 = _T ? 1'h0 : 1'h1;
  wire  _T_4 = _T_2 >= effectivePriority_2;
  wire [2:0] maxPri = _T_4 ? _T_2 : effectivePriority_2;
  assign io_dev = _T_4 ? {{1'd0}, _T_3} : 2'h2;
  assign io_max = maxPri[1:0];
endmodule