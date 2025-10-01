`default_nettype wire
module IBuf(
  input         clock,
  input         reset,
  output        io_imem_ready,
  input         io_imem_valid,
  input         io_imem_bits_btb_taken,
  input         io_imem_bits_btb_bridx,
  input  [4:0]  io_imem_bits_btb_entry,
  input  [7:0]  io_imem_bits_btb_bht_history,
  input  [31:0] io_imem_bits_pc,
  input  [31:0] io_imem_bits_data,
  input         io_imem_bits_xcpt_pf_inst,
  input         io_imem_bits_xcpt_ae_inst,
  input         io_imem_bits_replay,
  input         io_kill,
  output [31:0] io_pc,
  output [4:0]  io_btb_resp_entry,
  output [7:0]  io_btb_resp_bht_history,
  input         io_inst_0_ready,
  output        io_inst_0_valid,
  output        io_inst_0_bits_xcpt0_pf_inst,
  output        io_inst_0_bits_xcpt0_ae_inst,
  output        io_inst_0_bits_xcpt1_pf_inst,
  output        io_inst_0_bits_xcpt1_gf_inst,
  output        io_inst_0_bits_xcpt1_ae_inst,
  output        io_inst_0_bits_replay,
  output        io_inst_0_bits_rvc,
  output [31:0] io_inst_0_bits_inst_bits,
  output [4:0]  io_inst_0_bits_inst_rd,
  output [4:0]  io_inst_0_bits_inst_rs1,
  output [4:0]  io_inst_0_bits_inst_rs2,
  output [4:0]  io_inst_0_bits_inst_rs3,
  output [31:0] io_inst_0_bits_raw
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] exp_io_in;
  wire [31:0] exp_io_out_bits;
  wire [4:0] exp_io_out_rd;
  wire [4:0] exp_io_out_rs1;
  wire [4:0] exp_io_out_rs2;
  wire [4:0] exp_io_out_rs3;
  wire  exp_io_rvc;
  reg  nBufValid;
  reg [31:0] buf__pc;
  reg [31:0] buf__data;
  reg  buf__xcpt_pf_inst;
  reg  buf__xcpt_ae_inst;
  reg  buf__replay;
  reg [4:0] ibufBTBResp_entry;
  reg [7:0] ibufBTBResp_bht_history;
  wire  pcWordBits = io_imem_bits_pc[1];
  wire [1:0] _nIC_T = io_imem_bits_btb_bridx + 1'h1;
  wire [1:0] _nIC_T_1 = io_imem_bits_btb_taken ? _nIC_T : 2'h2;
  wire [1:0] _GEN_58 = {{1'd0}, pcWordBits};
  wire [1:0] nIC = _nIC_T_1 - _GEN_58;
  wire [1:0] _nValid_T = io_imem_valid ? nIC : 2'h0;
  wire [1:0] _GEN_59 = {{1'd0}, nBufValid};
  wire [1:0] nValid = _nValid_T + _GEN_59;
  wire [3:0] _valid_T = 4'h1 << nValid;
  wire [3:0] _valid_T_2 = _valid_T - 4'h1;
  wire [1:0] valid = _valid_T_2[1:0];
  wire [1:0] _full_insn_T_2 = {{1'd0}, valid[1]};
  wire [1:0] _bufMask_T = 2'h1 << nBufValid;
  wire [1:0] bufMask = _bufMask_T - 2'h1;
  wire [1:0] buf_replay = buf__replay ? bufMask : 2'h0;
  wire  full_insn = exp_io_rvc | _full_insn_T_2[0] | buf_replay[0];
  wire [1:0] _nReady_T_4 = exp_io_rvc ? 2'h1 : 2'h2;
  wire [1:0] nReady = full_insn ? _nReady_T_4 : 2'h0;
  wire [1:0] nICReady = nReady - _GEN_59;
  wire  _io_imem_ready_T = nReady >= _GEN_59;
  wire [1:0] _io_imem_ready_T_4 = nIC - nICReady;
  wire  _io_imem_ready_T_5 = 2'h1 >= _io_imem_ready_T_4;
  wire  _nBufValid_T_2 = _io_imem_ready_T | ~nBufValid;
  wire [1:0] _nBufValid_T_4 = _GEN_59 - nReady;
  wire [1:0] _nBufValid_T_5 = _nBufValid_T_2 ? 2'h0 : _nBufValid_T_4;
  wire [1:0] shamt = _GEN_58 + nICReady;
  wire [63:0] buf_data_data = {io_imem_bits_data[31:16],io_imem_bits_data[31:16],io_imem_bits_data};
  wire [5:0] _buf_data_T = {shamt, 4'h0};
  wire [63:0] _buf_data_T_1 = buf_data_data >> _buf_data_T;
  wire [31:0] _buf_pc_T_1 = io_imem_bits_pc & 32'hfffffffc;
  wire [2:0] _buf_pc_T_2 = {nICReady, 1'h0};
  wire [31:0] _GEN_67 = {{29'd0}, _buf_pc_T_2};
  wire [31:0] _buf_pc_T_4 = io_imem_bits_pc + _GEN_67;
  wire [31:0] _buf_pc_T_5 = _buf_pc_T_4 & 32'h3;
  wire [31:0] _buf_pc_T_6 = _buf_pc_T_1 | _buf_pc_T_5;
  wire [1:0] _GEN_0 = io_imem_valid & _io_imem_ready_T & nICReady < nIC & _io_imem_ready_T_5 ? _io_imem_ready_T_4 :
    _nBufValid_T_5;
  wire [1:0] _GEN_24 = io_inst_0_ready ? _GEN_0 : {{1'd0}, nBufValid};
  wire [1:0] _GEN_48 = io_kill ? 2'h0 : _GEN_24;
  wire [1:0] _icShiftAmt_T_1 = 2'h2 + _GEN_59;
  wire [1:0] icShiftAmt = _icShiftAmt_T_1 - _GEN_58;
  wire [63:0] _icData_T_2 = {io_imem_bits_data,io_imem_bits_data[15:0],io_imem_bits_data[15:0]};
  wire [127:0] icData_data = {_icData_T_2[63:48],_icData_T_2[63:48],_icData_T_2[63:48],_icData_T_2[63:48],
    io_imem_bits_data,io_imem_bits_data[15:0],io_imem_bits_data[15:0]};
  wire [5:0] _icData_T_3 = {icShiftAmt, 4'h0};
  wire [190:0] _GEN_1 = {{63'd0}, icData_data};
  wire [190:0] _icData_T_4 = _GEN_1 << _icData_T_3;
  wire [31:0] icData = _icData_T_4[95:64];
  wire [4:0] _icMask_T_1 = {nBufValid, 4'h0};
  wire [62:0] _icMask_T_2 = 63'hffffffff << _icMask_T_1;
  wire [31:0] icMask = _icMask_T_2[31:0];
  wire [31:0] _inst_T = icData & icMask;
  wire [31:0] _inst_T_1 = ~icMask;
  wire [31:0] _inst_T_2 = buf__data & _inst_T_1;
  wire  xcpt_1_pf_inst = bufMask[1] ? buf__xcpt_pf_inst : io_imem_bits_xcpt_pf_inst;
  wire  xcpt_1_ae_inst = bufMask[1] ? buf__xcpt_ae_inst : io_imem_bits_xcpt_ae_inst;
  wire [1:0] _ic_replay_T = ~bufMask;
  wire [1:0] _ic_replay_T_1 = valid & _ic_replay_T;
  wire [1:0] _ic_replay_T_2 = io_imem_bits_replay ? _ic_replay_T_1 : 2'h0;
  wire [1:0] ic_replay = buf_replay | _ic_replay_T_2;
  wire [1:0] _replay_T_5 = {{1'd0}, ic_replay[1]};
  wire [2:0] _io_inst_0_bits_xcpt1_T_4 = {xcpt_1_pf_inst,1'h0,xcpt_1_ae_inst};
  wire [2:0] _io_inst_0_bits_xcpt1_T_5 = exp_io_rvc ? 3'h0 : _io_inst_0_bits_xcpt1_T_4;
  wire [1:0] _T_21 = {{1'd0}, bufMask[1]};
  RVCExpander exp (
    .io_in(exp_io_in),
    .io_out_bits(exp_io_out_bits),
    .io_out_rd(exp_io_out_rd),
    .io_out_rs1(exp_io_out_rs1),
    .io_out_rs2(exp_io_out_rs2),
    .io_out_rs3(exp_io_out_rs3),
    .io_rvc(exp_io_rvc)
  );
  assign io_imem_ready = io_inst_0_ready & nReady >= _GEN_59 & (nICReady >= nIC | 2'h1 >= _io_imem_ready_T_4);
  assign io_pc = nBufValid > 1'h0 ? buf__pc : io_imem_bits_pc;
  assign io_btb_resp_entry = bufMask[0] & exp_io_rvc | _T_21[0] ? ibufBTBResp_entry : io_imem_bits_btb_entry;
  assign io_btb_resp_bht_history = bufMask[0] & exp_io_rvc | _T_21[0] ? ibufBTBResp_bht_history :
    io_imem_bits_btb_bht_history;
  assign io_inst_0_valid = valid[0] & full_insn;
  assign io_inst_0_bits_xcpt0_pf_inst = bufMask[0] ? buf__xcpt_pf_inst : io_imem_bits_xcpt_pf_inst;
  assign io_inst_0_bits_xcpt0_ae_inst = bufMask[0] ? buf__xcpt_ae_inst : io_imem_bits_xcpt_ae_inst;
  assign io_inst_0_bits_xcpt1_pf_inst = _io_inst_0_bits_xcpt1_T_5[2];
  assign io_inst_0_bits_xcpt1_gf_inst = _io_inst_0_bits_xcpt1_T_5[1];
  assign io_inst_0_bits_xcpt1_ae_inst = _io_inst_0_bits_xcpt1_T_5[0];
  assign io_inst_0_bits_replay = ic_replay[0] | ~exp_io_rvc & _replay_T_5[0];
  assign io_inst_0_bits_rvc = exp_io_rvc;
  assign io_inst_0_bits_inst_bits = exp_io_out_bits;
  assign io_inst_0_bits_inst_rd = exp_io_out_rd;
  assign io_inst_0_bits_inst_rs1 = exp_io_out_rs1;
  assign io_inst_0_bits_inst_rs2 = exp_io_out_rs2;
  assign io_inst_0_bits_inst_rs3 = exp_io_out_rs3;
  assign io_inst_0_bits_raw = _inst_T | _inst_T_2;
  assign exp_io_in = _inst_T | _inst_T_2;
  always @(posedge clock) begin
    if (reset) begin
      nBufValid <= 1'h0;
    end else begin
      nBufValid <= _GEN_48[0];
    end
    if (io_inst_0_ready) begin
      if (io_imem_valid & _io_imem_ready_T & nICReady < nIC & _io_imem_ready_T_5) begin
        buf__pc <= _buf_pc_T_6;
      end
    end
    if (io_inst_0_ready) begin
      if (io_imem_valid & _io_imem_ready_T & nICReady < nIC & _io_imem_ready_T_5) begin
        buf__data <= {{16'd0}, _buf_data_T_1[15:0]};
      end
    end
    if (io_inst_0_ready) begin
      if (io_imem_valid & _io_imem_ready_T & nICReady < nIC & _io_imem_ready_T_5) begin
        buf__xcpt_pf_inst <= io_imem_bits_xcpt_pf_inst;
      end
    end
    if (io_inst_0_ready) begin
      if (io_imem_valid & _io_imem_ready_T & nICReady < nIC & _io_imem_ready_T_5) begin
        buf__xcpt_ae_inst <= io_imem_bits_xcpt_ae_inst;
      end
    end
    if (io_inst_0_ready) begin
      if (io_imem_valid & _io_imem_ready_T & nICReady < nIC & _io_imem_ready_T_5) begin
        buf__replay <= io_imem_bits_replay;
      end
    end
    if (io_inst_0_ready) begin
      if (io_imem_valid & _io_imem_ready_T & nICReady < nIC & _io_imem_ready_T_5) begin
        ibufBTBResp_entry <= io_imem_bits_btb_entry;
      end
    end
    if (io_inst_0_ready) begin
      if (io_imem_valid & _io_imem_ready_T & nICReady < nIC & _io_imem_ready_T_5) begin
        ibufBTBResp_bht_history <= io_imem_bits_btb_bht_history;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~io_imem_valid | ~io_imem_bits_btb_taken | io_imem_bits_btb_bridx >= pcWordBits) & ~reset) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~io_imem_valid | ~io_imem_bits_btb_taken | io_imem_bits_btb_bridx >= pcWordBits)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at IBuf.scala:79 assert(!io.imem.valid || !io.imem.bits.btb.taken || io.imem.bits.btb.bridx >= pcWordBits)\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  nBufValid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  buf__pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  buf__data = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  buf__xcpt_pf_inst = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  buf__xcpt_ae_inst = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  buf__replay = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ibufBTBResp_entry = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  ibufBTBResp_bht_history = _RAND_7[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule