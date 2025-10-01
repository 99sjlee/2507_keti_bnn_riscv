`default_nettype wire
module FPU(
  input         clock,
  input         reset,
  input  [31:0] io_inst,
  input  [31:0] io_fromint_data,
  input  [2:0]  io_fcsr_rm,
  output        io_fcsr_flags_valid,
  output [4:0]  io_fcsr_flags_bits,
  output [31:0] io_store_data,
  output [31:0] io_toint_data,
  input         io_dmem_resp_val,
  input  [4:0]  io_dmem_resp_tag,
  input  [31:0] io_dmem_resp_data,
  input         io_valid,
  output        io_fcsr_rdy,
  output        io_nack_mem,
  output        io_illegal_rm,
  input         io_killx,
  input         io_killm,
  output        io_dec_wen,
  output        io_dec_ren1,
  output        io_dec_ren2,
  output        io_dec_ren3,
  output        io_sboard_set,
  output        io_sboard_clr,
  output [4:0]  io_sboard_clra
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] fp_decoder_io_inst;
  wire  fp_decoder_io_sigs_wen;
  wire  fp_decoder_io_sigs_ren1;
  wire  fp_decoder_io_sigs_ren2;
  wire  fp_decoder_io_sigs_ren3;
  wire  fp_decoder_io_sigs_swap12;
  wire  fp_decoder_io_sigs_swap23;
  wire [1:0] fp_decoder_io_sigs_typeTagOut;
  wire  fp_decoder_io_sigs_fromint;
  wire  fp_decoder_io_sigs_toint;
  wire  fp_decoder_io_sigs_fastpipe;
  wire  fp_decoder_io_sigs_fma;
  wire  fp_decoder_io_sigs_div;
  wire  fp_decoder_io_sigs_sqrt;
  wire  fp_decoder_io_sigs_wflags;
  reg [32:0] regfile [0:31];
  wire  regfile_ex_rs_0_en;
  wire [4:0] regfile_ex_rs_0_addr;
  wire [32:0] regfile_ex_rs_0_data;
  wire  regfile_ex_rs_1_en;
  wire [4:0] regfile_ex_rs_1_addr;
  wire [32:0] regfile_ex_rs_1_data;
  wire  regfile_ex_rs_2_en;
  wire [4:0] regfile_ex_rs_2_addr;
  wire [32:0] regfile_ex_rs_2_data;
  wire [32:0] regfile_MPORT_data;
  wire [4:0] regfile_MPORT_addr;
  wire  regfile_MPORT_mask;
  wire  regfile_MPORT_en;
  wire [32:0] regfile_MPORT_1_data;
  wire [4:0] regfile_MPORT_1_addr;
  wire  regfile_MPORT_1_mask;
  wire  regfile_MPORT_1_en;
  wire  sfma_clock;
  wire  sfma_reset;
  wire  sfma_io_in_valid;
  wire  sfma_io_in_bits_ren3;
  wire  sfma_io_in_bits_swap23;
  wire [2:0] sfma_io_in_bits_rm;
  wire [1:0] sfma_io_in_bits_fmaCmd;
  wire [32:0] sfma_io_in_bits_in1;
  wire [32:0] sfma_io_in_bits_in2;
  wire [32:0] sfma_io_in_bits_in3;
  wire [32:0] sfma_io_out_bits_data;
  wire [4:0] sfma_io_out_bits_exc;
  wire  fpiu_clock;
  wire  fpiu_io_in_valid;
  wire  fpiu_io_in_bits_ren2;
  wire  fpiu_io_in_bits_wflags;
  wire [2:0] fpiu_io_in_bits_rm;
  wire [1:0] fpiu_io_in_bits_typ;
  wire [32:0] fpiu_io_in_bits_in1;
  wire [32:0] fpiu_io_in_bits_in2;
  wire [2:0] fpiu_io_out_bits_in_rm;
  wire [32:0] fpiu_io_out_bits_in_in1;
  wire [32:0] fpiu_io_out_bits_in_in2;
  wire  fpiu_io_out_bits_lt;
  wire [31:0] fpiu_io_out_bits_store;
  wire [31:0] fpiu_io_out_bits_toint;
  wire [4:0] fpiu_io_out_bits_exc;
  wire  ifpu_clock;
  wire  ifpu_reset;
  wire  ifpu_io_in_valid;
  wire  ifpu_io_in_bits_wflags;
  wire [2:0] ifpu_io_in_bits_rm;
  wire [1:0] ifpu_io_in_bits_typ;
  wire [31:0] ifpu_io_in_bits_in1;
  wire [32:0] ifpu_io_out_bits_data;
  wire [4:0] ifpu_io_out_bits_exc;
  wire  fpmu_clock;
  wire  fpmu_reset;
  wire  fpmu_io_in_valid;
  wire  fpmu_io_in_bits_wflags;
  wire [2:0] fpmu_io_in_bits_rm;
  wire [32:0] fpmu_io_in_bits_in1;
  wire [32:0] fpmu_io_in_bits_in2;
  wire [32:0] fpmu_io_out_bits_data;
  wire [4:0] fpmu_io_out_bits_exc;
  wire  fpmu_io_lt;
  wire  divSqrt_clock;
  wire  divSqrt_reset;
  wire  divSqrt_io_inReady;
  wire  divSqrt_io_inValid;
  wire  divSqrt_io_sqrtOp;
  wire [32:0] divSqrt_io_a;
  wire [32:0] divSqrt_io_b;
  wire [2:0] divSqrt_io_roundingMode;
  wire  divSqrt_io_outValid_div;
  wire  divSqrt_io_outValid_sqrt;
  wire [32:0] divSqrt_io_out;
  wire [4:0] divSqrt_io_exceptionFlags;
  reg  ex_reg_valid;
  reg [31:0] ex_reg_inst;
  reg  ex_reg_ctrl_ren2;
  reg  ex_reg_ctrl_ren3;
  reg  ex_reg_ctrl_swap23;
  reg [1:0] ex_reg_ctrl_typeTagOut;
  reg  ex_reg_ctrl_fromint;
  reg  ex_reg_ctrl_toint;
  reg  ex_reg_ctrl_fastpipe;
  reg  ex_reg_ctrl_fma;
  reg  ex_reg_ctrl_div;
  reg  ex_reg_ctrl_sqrt;
  reg  ex_reg_ctrl_wflags;
  reg [4:0] ex_ra_0;
  reg [4:0] ex_ra_1;
  reg [4:0] ex_ra_2;
  reg  load_wb;
  reg [31:0] load_wb_data;
  reg [4:0] load_wb_tag;
  reg  mem_reg_valid;
  wire  killm = io_killm | io_nack_mem;
  wire  killx = io_killx | mem_reg_valid & killm;
  reg [31:0] mem_reg_inst;
  wire  _wb_reg_valid_x8_T = ~killm;
  wire  wb_reg_valid_x8 = mem_reg_valid & ~killm;
  reg  wb_reg_valid;
  reg [1:0] mem_ctrl_typeTagOut;
  reg  mem_ctrl_fromint;
  reg  mem_ctrl_toint;
  reg  mem_ctrl_fastpipe;
  reg  mem_ctrl_fma;
  reg  mem_ctrl_div;
  reg  mem_ctrl_sqrt;
  reg  mem_ctrl_wflags;
  reg  wb_ctrl_toint;
  wire  wdata_rawIn_sign = load_wb_data[31];
  wire [7:0] wdata_rawIn_expIn = load_wb_data[30:23];
  wire [22:0] wdata_rawIn_fractIn = load_wb_data[22:0];
  wire  wdata_rawIn_isZeroExpIn = wdata_rawIn_expIn == 8'h0;
  wire  wdata_rawIn_isZeroFractIn = wdata_rawIn_fractIn == 23'h0;
  wire [4:0] _wdata_rawIn_normDist_T_23 = wdata_rawIn_fractIn[1] ? 5'h15 : 5'h16;
  wire [4:0] _wdata_rawIn_normDist_T_24 = wdata_rawIn_fractIn[2] ? 5'h14 : _wdata_rawIn_normDist_T_23;
  wire [4:0] _wdata_rawIn_normDist_T_25 = wdata_rawIn_fractIn[3] ? 5'h13 : _wdata_rawIn_normDist_T_24;
  wire [4:0] _wdata_rawIn_normDist_T_26 = wdata_rawIn_fractIn[4] ? 5'h12 : _wdata_rawIn_normDist_T_25;
  wire [4:0] _wdata_rawIn_normDist_T_27 = wdata_rawIn_fractIn[5] ? 5'h11 : _wdata_rawIn_normDist_T_26;
  wire [4:0] _wdata_rawIn_normDist_T_28 = wdata_rawIn_fractIn[6] ? 5'h10 : _wdata_rawIn_normDist_T_27;
  wire [4:0] _wdata_rawIn_normDist_T_29 = wdata_rawIn_fractIn[7] ? 5'hf : _wdata_rawIn_normDist_T_28;
  wire [4:0] _wdata_rawIn_normDist_T_30 = wdata_rawIn_fractIn[8] ? 5'he : _wdata_rawIn_normDist_T_29;
  wire [4:0] _wdata_rawIn_normDist_T_31 = wdata_rawIn_fractIn[9] ? 5'hd : _wdata_rawIn_normDist_T_30;
  wire [4:0] _wdata_rawIn_normDist_T_32 = wdata_rawIn_fractIn[10] ? 5'hc : _wdata_rawIn_normDist_T_31;
  wire [4:0] _wdata_rawIn_normDist_T_33 = wdata_rawIn_fractIn[11] ? 5'hb : _wdata_rawIn_normDist_T_32;
  wire [4:0] _wdata_rawIn_normDist_T_34 = wdata_rawIn_fractIn[12] ? 5'ha : _wdata_rawIn_normDist_T_33;
  wire [4:0] _wdata_rawIn_normDist_T_35 = wdata_rawIn_fractIn[13] ? 5'h9 : _wdata_rawIn_normDist_T_34;
  wire [4:0] _wdata_rawIn_normDist_T_36 = wdata_rawIn_fractIn[14] ? 5'h8 : _wdata_rawIn_normDist_T_35;
  wire [4:0] _wdata_rawIn_normDist_T_37 = wdata_rawIn_fractIn[15] ? 5'h7 : _wdata_rawIn_normDist_T_36;
  wire [4:0] _wdata_rawIn_normDist_T_38 = wdata_rawIn_fractIn[16] ? 5'h6 : _wdata_rawIn_normDist_T_37;
  wire [4:0] _wdata_rawIn_normDist_T_39 = wdata_rawIn_fractIn[17] ? 5'h5 : _wdata_rawIn_normDist_T_38;
  wire [4:0] _wdata_rawIn_normDist_T_40 = wdata_rawIn_fractIn[18] ? 5'h4 : _wdata_rawIn_normDist_T_39;
  wire [4:0] _wdata_rawIn_normDist_T_41 = wdata_rawIn_fractIn[19] ? 5'h3 : _wdata_rawIn_normDist_T_40;
  wire [4:0] _wdata_rawIn_normDist_T_42 = wdata_rawIn_fractIn[20] ? 5'h2 : _wdata_rawIn_normDist_T_41;
  wire [4:0] _wdata_rawIn_normDist_T_43 = wdata_rawIn_fractIn[21] ? 5'h1 : _wdata_rawIn_normDist_T_42;
  wire [4:0] wdata_rawIn_normDist = wdata_rawIn_fractIn[22] ? 5'h0 : _wdata_rawIn_normDist_T_43;
  wire [53:0] _GEN_0 = {{31'd0}, wdata_rawIn_fractIn};
  wire [53:0] _wdata_rawIn_subnormFract_T = _GEN_0 << wdata_rawIn_normDist;
  wire [22:0] wdata_rawIn_subnormFract = {_wdata_rawIn_subnormFract_T[21:0], 1'h0};
  wire [8:0] _GEN_145 = {{4'd0}, wdata_rawIn_normDist};
  wire [8:0] _wdata_rawIn_adjustedExp_T = _GEN_145 ^ 9'h1ff;
  wire [8:0] _wdata_rawIn_adjustedExp_T_1 = wdata_rawIn_isZeroExpIn ? _wdata_rawIn_adjustedExp_T : {{1'd0},
    wdata_rawIn_expIn};
  wire [1:0] _wdata_rawIn_adjustedExp_T_2 = wdata_rawIn_isZeroExpIn ? 2'h2 : 2'h1;
  wire [7:0] _GEN_146 = {{6'd0}, _wdata_rawIn_adjustedExp_T_2};
  wire [7:0] _wdata_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_146;
  wire [8:0] _GEN_147 = {{1'd0}, _wdata_rawIn_adjustedExp_T_3};
  wire [8:0] wdata_rawIn_adjustedExp = _wdata_rawIn_adjustedExp_T_1 + _GEN_147;
  wire  wdata_rawIn_isZero = wdata_rawIn_isZeroExpIn & wdata_rawIn_isZeroFractIn;
  wire  wdata_rawIn_isSpecial = wdata_rawIn_adjustedExp[8:7] == 2'h3;
  wire  wdata_rawIn__isNaN = wdata_rawIn_isSpecial & ~wdata_rawIn_isZeroFractIn;
  wire [9:0] wdata_rawIn__sExp = {1'b0,$signed(wdata_rawIn_adjustedExp)};
  wire  _wdata_rawIn_out_sig_T = ~wdata_rawIn_isZero;
  wire [22:0] _wdata_rawIn_out_sig_T_1 = wdata_rawIn_isZeroExpIn ? wdata_rawIn_subnormFract : wdata_rawIn_fractIn;
  wire [24:0] wdata_rawIn__sig = {1'h0,_wdata_rawIn_out_sig_T,_wdata_rawIn_out_sig_T_1};
  wire [2:0] _wdata_T_2 = wdata_rawIn_isZero ? 3'h0 : wdata_rawIn__sExp[8:6];
  wire [2:0] _GEN_148 = {{2'd0}, wdata_rawIn__isNaN};
  wire [2:0] _wdata_T_4 = _wdata_T_2 | _GEN_148;
  wire [28:0] wdata_lo = {wdata_rawIn__sExp[5:0],wdata_rawIn__sig[22:0]};
  wire [3:0] wdata_hi = {wdata_rawIn_sign,_wdata_T_4};
  wire  _T_3 = ~fp_decoder_io_sigs_swap12;
  wire [4:0] _GEN_59 = ~fp_decoder_io_sigs_swap12 ? io_inst[19:15] : ex_ra_0;
  wire [4:0] _GEN_60 = fp_decoder_io_sigs_swap12 ? io_inst[19:15] : ex_ra_1;
  wire [4:0] _GEN_61 = fp_decoder_io_sigs_ren1 ? _GEN_59 : ex_ra_0;
  wire [4:0] _GEN_62 = fp_decoder_io_sigs_ren1 ? _GEN_60 : ex_ra_1;
  wire  _sfma_io_in_valid_T_1 = ex_reg_ctrl_typeTagOut == 2'h0;
  wire  _sfma_io_in_bits_req_fmaCmd_T_3 = ~ex_reg_ctrl_ren3 & ex_reg_inst[27];
  wire [1:0] _GEN_149 = {{1'd0}, _sfma_io_in_bits_req_fmaCmd_T_3};
  wire [32:0] _ifpu_io_in_bits_in1_T = {{1'd0}, io_fromint_data};
  reg [4:0] divSqrt_waddr;
  wire  _memLatencyMask_T_2 = mem_ctrl_typeTagOut == 2'h0;
  wire  _memLatencyMask_T_3 = mem_ctrl_fma & mem_ctrl_typeTagOut == 2'h0;
  wire [1:0] _memLatencyMask_T_4 = _memLatencyMask_T_3 ? 2'h2 : 2'h0;
  wire  _memLatencyMask_T_5 = mem_ctrl_fastpipe | mem_ctrl_fromint;
  wire [1:0] _GEN_151 = {{1'd0}, _memLatencyMask_T_5};
  wire [1:0] memLatencyMask = _GEN_151 | _memLatencyMask_T_4;
  reg [1:0] wen;
  reg [4:0] wbInfo_0_rd;
  reg [1:0] wbInfo_0_pipeid;
  reg [4:0] wbInfo_1_rd;
  reg [1:0] wbInfo_1_pipeid;
  wire  mem_wen = mem_reg_valid & (mem_ctrl_fma | mem_ctrl_fastpipe | mem_ctrl_fromint);
  wire [1:0] _write_port_busy_T = ex_reg_ctrl_fastpipe ? 2'h2 : 2'h0;
  wire [1:0] _write_port_busy_T_1 = ex_reg_ctrl_fromint ? 2'h2 : 2'h0;
  wire  _write_port_busy_T_3 = ex_reg_ctrl_fma & _sfma_io_in_valid_T_1;
  wire [2:0] _write_port_busy_T_4 = _write_port_busy_T_3 ? 3'h4 : 3'h0;
  wire [1:0] _write_port_busy_T_5 = _write_port_busy_T | _write_port_busy_T_1;
  wire [2:0] _GEN_152 = {{1'd0}, _write_port_busy_T_5};
  wire [2:0] _write_port_busy_T_6 = _GEN_152 | _write_port_busy_T_4;
  wire [2:0] _GEN_153 = {{1'd0}, memLatencyMask};
  wire [2:0] _write_port_busy_T_7 = _GEN_153 & _write_port_busy_T_6;
  wire [2:0] _write_port_busy_T_10 = ex_reg_ctrl_fastpipe ? 3'h4 : 3'h0;
  wire [2:0] _write_port_busy_T_11 = ex_reg_ctrl_fromint ? 3'h4 : 3'h0;
  wire [3:0] _write_port_busy_T_14 = _write_port_busy_T_3 ? 4'h8 : 4'h0;
  wire [2:0] _write_port_busy_T_15 = _write_port_busy_T_10 | _write_port_busy_T_11;
  wire [3:0] _GEN_154 = {{1'd0}, _write_port_busy_T_15};
  wire [3:0] _write_port_busy_T_16 = _GEN_154 | _write_port_busy_T_14;
  wire [3:0] _GEN_155 = {{2'd0}, wen};
  wire [3:0] _write_port_busy_T_17 = _GEN_155 & _write_port_busy_T_16;
  wire  _write_port_busy_T_19 = mem_wen & |_write_port_busy_T_7 | _write_port_busy_T_17;
  reg  write_port_busy;
  wire [4:0] _GEN_107 = wen[1] ? wbInfo_1_rd : wbInfo_0_rd;
  wire [1:0] _GEN_110 = wen[1] ? wbInfo_1_pipeid : wbInfo_0_pipeid;
  wire [1:0] _GEN_156 = {{1'd0}, wen[1]};
  wire [1:0] _wen_T_2 = _GEN_156 | memLatencyMask;
  wire [1:0] _GEN_157 = {{1'd0}, mem_ctrl_fromint};
  wire [1:0] _wbInfo_0_pipeid_T_6 = _GEN_157 | _memLatencyMask_T_4;
  reg  divSqrt_killed;
  wire  divSqrt_wen = (divSqrt_io_outValid_div | divSqrt_io_outValid_sqrt) & ~divSqrt_killed;
  wire [32:0] _wdata_T_8 = wbInfo_0_pipeid == 2'h1 ? ifpu_io_out_bits_data : fpmu_io_out_bits_data;
  wire [32:0] _wdata_T_10 = wbInfo_0_pipeid == 2'h2 ? sfma_io_out_bits_data : _wdata_T_8;
  wire [32:0] _wdata_T_12 = wbInfo_0_pipeid == 2'h3 ? sfma_io_out_bits_data : _wdata_T_10;
  wire [32:0] divSqrt_wdata = divSqrt_io_out;
  wire [4:0] _wexc_T_1 = wbInfo_0_pipeid == 2'h1 ? ifpu_io_out_bits_exc : fpmu_io_out_bits_exc;
  wire [4:0] _wexc_T_3 = wbInfo_0_pipeid == 2'h2 ? sfma_io_out_bits_exc : _wexc_T_1;
  wire [4:0] wexc = wbInfo_0_pipeid == 2'h3 ? sfma_io_out_bits_exc : _wexc_T_3;
  wire  wb_toint_valid = wb_reg_valid & wb_ctrl_toint;
  reg [4:0] wb_toint_exc;
  wire [4:0] _io_fcsr_flags_bits_T = wb_toint_valid ? wb_toint_exc : 5'h0;
  wire [4:0] divSqrt_flags = divSqrt_io_exceptionFlags;
  wire [4:0] _io_fcsr_flags_bits_T_1 = divSqrt_wen ? divSqrt_flags : 5'h0;
  wire [4:0] _io_fcsr_flags_bits_T_2 = _io_fcsr_flags_bits_T | _io_fcsr_flags_bits_T_1;
  wire [4:0] _io_fcsr_flags_bits_T_4 = wen[0] ? wexc : 5'h0;
  wire  _divSqrt_write_port_busy_T = mem_ctrl_div | mem_ctrl_sqrt;
  wire  _divSqrt_write_port_busy_T_1 = |wen;
  wire  divSqrt_write_port_busy = (mem_ctrl_div | mem_ctrl_sqrt) & |wen;
  wire  _T_33 = ~divSqrt_io_inReady;
  wire  divSqrt_inFlight = divSqrt_killed ? 1'h0 : _T_33;
  reg  io_sboard_set_REG;
  wire  _io_illegal_rm_T_1 = io_inst[14:12] == 3'h5;
  wire  _io_illegal_rm_T_2 = io_inst[14:12] == 3'h6;
  wire  _io_illegal_rm_T_3 = _io_illegal_rm_T_1 | _io_illegal_rm_T_2;
  wire  divSqrt_inValid = mem_reg_valid & _divSqrt_write_port_busy_T & ~divSqrt_inFlight;
  FPUDecoder fp_decoder (
    .io_inst(fp_decoder_io_inst),
    .io_sigs_wen(fp_decoder_io_sigs_wen),
    .io_sigs_ren1(fp_decoder_io_sigs_ren1),
    .io_sigs_ren2(fp_decoder_io_sigs_ren2),
    .io_sigs_ren3(fp_decoder_io_sigs_ren3),
    .io_sigs_swap12(fp_decoder_io_sigs_swap12),
    .io_sigs_swap23(fp_decoder_io_sigs_swap23),
    .io_sigs_typeTagOut(fp_decoder_io_sigs_typeTagOut),
    .io_sigs_fromint(fp_decoder_io_sigs_fromint),
    .io_sigs_toint(fp_decoder_io_sigs_toint),
    .io_sigs_fastpipe(fp_decoder_io_sigs_fastpipe),
    .io_sigs_fma(fp_decoder_io_sigs_fma),
    .io_sigs_div(fp_decoder_io_sigs_div),
    .io_sigs_sqrt(fp_decoder_io_sigs_sqrt),
    .io_sigs_wflags(fp_decoder_io_sigs_wflags)
  );
  FPUFMAPipe sfma (
    .clock(sfma_clock),
    .reset(sfma_reset),
    .io_in_valid(sfma_io_in_valid),
    .io_in_bits_ren3(sfma_io_in_bits_ren3),
    .io_in_bits_swap23(sfma_io_in_bits_swap23),
    .io_in_bits_rm(sfma_io_in_bits_rm),
    .io_in_bits_fmaCmd(sfma_io_in_bits_fmaCmd),
    .io_in_bits_in1(sfma_io_in_bits_in1),
    .io_in_bits_in2(sfma_io_in_bits_in2),
    .io_in_bits_in3(sfma_io_in_bits_in3),
    .io_out_bits_data(sfma_io_out_bits_data),
    .io_out_bits_exc(sfma_io_out_bits_exc)
  );
  FPToInt fpiu (
    .clock(fpiu_clock),
    .io_in_valid(fpiu_io_in_valid),
    .io_in_bits_ren2(fpiu_io_in_bits_ren2),
    .io_in_bits_wflags(fpiu_io_in_bits_wflags),
    .io_in_bits_rm(fpiu_io_in_bits_rm),
    .io_in_bits_typ(fpiu_io_in_bits_typ),
    .io_in_bits_in1(fpiu_io_in_bits_in1),
    .io_in_bits_in2(fpiu_io_in_bits_in2),
    .io_out_bits_in_rm(fpiu_io_out_bits_in_rm),
    .io_out_bits_in_in1(fpiu_io_out_bits_in_in1),
    .io_out_bits_in_in2(fpiu_io_out_bits_in_in2),
    .io_out_bits_lt(fpiu_io_out_bits_lt),
    .io_out_bits_store(fpiu_io_out_bits_store),
    .io_out_bits_toint(fpiu_io_out_bits_toint),
    .io_out_bits_exc(fpiu_io_out_bits_exc)
  );
  IntToFP ifpu (
    .clock(ifpu_clock),
    .reset(ifpu_reset),
    .io_in_valid(ifpu_io_in_valid),
    .io_in_bits_wflags(ifpu_io_in_bits_wflags),
    .io_in_bits_rm(ifpu_io_in_bits_rm),
    .io_in_bits_typ(ifpu_io_in_bits_typ),
    .io_in_bits_in1(ifpu_io_in_bits_in1),
    .io_out_bits_data(ifpu_io_out_bits_data),
    .io_out_bits_exc(ifpu_io_out_bits_exc)
  );
  FPToFP fpmu (
    .clock(fpmu_clock),
    .reset(fpmu_reset),
    .io_in_valid(fpmu_io_in_valid),
    .io_in_bits_wflags(fpmu_io_in_bits_wflags),
    .io_in_bits_rm(fpmu_io_in_bits_rm),
    .io_in_bits_in1(fpmu_io_in_bits_in1),
    .io_in_bits_in2(fpmu_io_in_bits_in2),
    .io_out_bits_data(fpmu_io_out_bits_data),
    .io_out_bits_exc(fpmu_io_out_bits_exc),
    .io_lt(fpmu_io_lt)
  );
  DivSqrtRecFN_small divSqrt (
    .clock(divSqrt_clock),
    .reset(divSqrt_reset),
    .io_inReady(divSqrt_io_inReady),
    .io_inValid(divSqrt_io_inValid),
    .io_sqrtOp(divSqrt_io_sqrtOp),
    .io_a(divSqrt_io_a),
    .io_b(divSqrt_io_b),
    .io_roundingMode(divSqrt_io_roundingMode),
    .io_outValid_div(divSqrt_io_outValid_div),
    .io_outValid_sqrt(divSqrt_io_outValid_sqrt),
    .io_out(divSqrt_io_out),
    .io_exceptionFlags(divSqrt_io_exceptionFlags)
  );
  assign regfile_ex_rs_0_en = 1'h1;
  assign regfile_ex_rs_0_addr = ex_ra_0;
  assign regfile_ex_rs_0_data = regfile[regfile_ex_rs_0_addr];
  assign regfile_ex_rs_1_en = 1'h1;
  assign regfile_ex_rs_1_addr = ex_ra_1;
  assign regfile_ex_rs_1_data = regfile[regfile_ex_rs_1_addr];
  assign regfile_ex_rs_2_en = 1'h1;
  assign regfile_ex_rs_2_addr = ex_ra_2;
  assign regfile_ex_rs_2_data = regfile[regfile_ex_rs_2_addr];
  assign regfile_MPORT_data = {wdata_hi,wdata_lo};
  assign regfile_MPORT_addr = load_wb_tag;
  assign regfile_MPORT_mask = 1'h1;
  assign regfile_MPORT_en = load_wb;
  assign regfile_MPORT_1_data = divSqrt_wen ? divSqrt_wdata : _wdata_T_12;
  assign regfile_MPORT_1_addr = divSqrt_wen ? divSqrt_waddr : wbInfo_0_rd;
  assign regfile_MPORT_1_mask = 1'h1;
  assign regfile_MPORT_1_en = wen[0] | divSqrt_wen;
  assign io_fcsr_flags_valid = wb_toint_valid | divSqrt_wen | wen[0];
  assign io_fcsr_flags_bits = _io_fcsr_flags_bits_T_2 | _io_fcsr_flags_bits_T_4;
  assign io_store_data = fpiu_io_out_bits_store;
  assign io_toint_data = fpiu_io_out_bits_toint;
  assign io_fcsr_rdy = ~(ex_reg_valid & ex_reg_ctrl_wflags | mem_reg_valid & mem_ctrl_wflags | wb_toint_valid |
    _divSqrt_write_port_busy_T_1 | divSqrt_inFlight);
  assign io_nack_mem = write_port_busy | divSqrt_write_port_busy | divSqrt_inFlight;
  assign io_illegal_rm = _io_illegal_rm_T_3 | io_inst[14:12] == 3'h7 & io_fcsr_rm >= 3'h5;
  assign io_dec_wen = fp_decoder_io_sigs_wen;
  assign io_dec_ren1 = fp_decoder_io_sigs_ren1;
  assign io_dec_ren2 = fp_decoder_io_sigs_ren2;
  assign io_dec_ren3 = fp_decoder_io_sigs_ren3;
  assign io_sboard_set = wb_reg_valid & io_sboard_set_REG;
  assign io_sboard_clr = (divSqrt_io_outValid_div | divSqrt_io_outValid_sqrt) & ~divSqrt_killed;
  assign io_sboard_clra = divSqrt_wen ? divSqrt_waddr : wbInfo_0_rd;
  assign fp_decoder_io_inst = io_inst;
  assign sfma_clock = clock;
  assign sfma_reset = reset;
  assign sfma_io_in_valid = ex_reg_valid & ex_reg_ctrl_fma & ex_reg_ctrl_typeTagOut == 2'h0;
  assign sfma_io_in_bits_ren3 = ex_reg_ctrl_ren3;
  assign sfma_io_in_bits_swap23 = ex_reg_ctrl_swap23;
  assign sfma_io_in_bits_rm = ex_reg_inst[14:12] == 3'h7 ? io_fcsr_rm : ex_reg_inst[14:12];
  assign sfma_io_in_bits_fmaCmd = ex_reg_inst[3:2] | _GEN_149;
  assign sfma_io_in_bits_in1 = regfile_ex_rs_0_data;
  assign sfma_io_in_bits_in2 = regfile_ex_rs_1_data;
  assign sfma_io_in_bits_in3 = regfile_ex_rs_2_data;
  assign fpiu_clock = clock;
  assign fpiu_io_in_valid = ex_reg_valid & (ex_reg_ctrl_toint | ex_reg_ctrl_div | ex_reg_ctrl_sqrt |
    ex_reg_ctrl_fastpipe & ex_reg_ctrl_wflags);
  assign fpiu_io_in_bits_ren2 = ex_reg_ctrl_ren2;
  assign fpiu_io_in_bits_wflags = ex_reg_ctrl_wflags;
  assign fpiu_io_in_bits_rm = ex_reg_inst[14:12] == 3'h7 ? io_fcsr_rm : ex_reg_inst[14:12];
  assign fpiu_io_in_bits_typ = ex_reg_inst[21:20];
  assign fpiu_io_in_bits_in1 = regfile_ex_rs_0_data;
  assign fpiu_io_in_bits_in2 = regfile_ex_rs_1_data;
  assign ifpu_clock = clock;
  assign ifpu_reset = reset;
  assign ifpu_io_in_valid = ex_reg_valid & ex_reg_ctrl_fromint;
  assign ifpu_io_in_bits_wflags = fpiu_io_in_bits_wflags;
  assign ifpu_io_in_bits_rm = fpiu_io_in_bits_rm;
  assign ifpu_io_in_bits_typ = fpiu_io_in_bits_typ;
  assign ifpu_io_in_bits_in1 = _ifpu_io_in_bits_in1_T[31:0];
  assign fpmu_clock = clock;
  assign fpmu_reset = reset;
  assign fpmu_io_in_valid = ex_reg_valid & ex_reg_ctrl_fastpipe;
  assign fpmu_io_in_bits_wflags = fpiu_io_in_bits_wflags;
  assign fpmu_io_in_bits_rm = fpiu_io_in_bits_rm;
  assign fpmu_io_in_bits_in1 = fpiu_io_in_bits_in1;
  assign fpmu_io_in_bits_in2 = fpiu_io_in_bits_in2;
  assign fpmu_io_lt = fpiu_io_out_bits_lt;
  assign divSqrt_clock = clock;
  assign divSqrt_reset = divSqrt_killed;
  assign divSqrt_io_inValid = divSqrt_inValid & _memLatencyMask_T_2;
  assign divSqrt_io_sqrtOp = mem_ctrl_sqrt;
  assign divSqrt_io_a = fpiu_io_out_bits_in_in1;
  assign divSqrt_io_b = fpiu_io_out_bits_in_in2;
  assign divSqrt_io_roundingMode = fpiu_io_out_bits_in_rm;
  always @(posedge clock) begin
    if (regfile_MPORT_en & regfile_MPORT_mask) begin
      regfile[regfile_MPORT_addr] <= regfile_MPORT_data;
    end
    if (regfile_MPORT_1_en & regfile_MPORT_1_mask) begin
      regfile[regfile_MPORT_1_addr] <= regfile_MPORT_1_data;
    end
    if (reset) begin
      ex_reg_valid <= 1'h0;
    end else begin
      ex_reg_valid <= io_valid;
    end
    if (io_valid) begin
      ex_reg_inst <= io_inst;
    end
    if (io_valid) begin
      ex_reg_ctrl_ren2 <= fp_decoder_io_sigs_ren2;
    end
    if (io_valid) begin
      ex_reg_ctrl_ren3 <= fp_decoder_io_sigs_ren3;
    end
    if (io_valid) begin
      ex_reg_ctrl_swap23 <= fp_decoder_io_sigs_swap23;
    end
    if (io_valid) begin
      ex_reg_ctrl_typeTagOut <= fp_decoder_io_sigs_typeTagOut;
    end
    if (io_valid) begin
      ex_reg_ctrl_fromint <= fp_decoder_io_sigs_fromint;
    end
    if (io_valid) begin
      ex_reg_ctrl_toint <= fp_decoder_io_sigs_toint;
    end
    if (io_valid) begin
      ex_reg_ctrl_fastpipe <= fp_decoder_io_sigs_fastpipe;
    end
    if (io_valid) begin
      ex_reg_ctrl_fma <= fp_decoder_io_sigs_fma;
    end
    if (io_valid) begin
      ex_reg_ctrl_div <= fp_decoder_io_sigs_div;
    end
    if (io_valid) begin
      ex_reg_ctrl_sqrt <= fp_decoder_io_sigs_sqrt;
    end
    if (io_valid) begin
      ex_reg_ctrl_wflags <= fp_decoder_io_sigs_wflags;
    end
    if (io_valid) begin
      if (fp_decoder_io_sigs_ren2) begin
        if (fp_decoder_io_sigs_swap12) begin
          ex_ra_0 <= io_inst[24:20];
        end else begin
          ex_ra_0 <= _GEN_61;
        end
      end else begin
        ex_ra_0 <= _GEN_61;
      end
    end
    if (io_valid) begin
      if (fp_decoder_io_sigs_ren2) begin
        if (_T_3 & ~fp_decoder_io_sigs_swap23) begin
          ex_ra_1 <= io_inst[24:20];
        end else begin
          ex_ra_1 <= _GEN_62;
        end
      end else begin
        ex_ra_1 <= _GEN_62;
      end
    end
    if (io_valid) begin
      if (fp_decoder_io_sigs_ren3) begin
        ex_ra_2 <= io_inst[31:27];
      end else if (fp_decoder_io_sigs_ren2) begin
        if (fp_decoder_io_sigs_swap23) begin
          ex_ra_2 <= io_inst[24:20];
        end
      end
    end
    load_wb <= io_dmem_resp_val;
    if (io_dmem_resp_val) begin
      load_wb_data <= io_dmem_resp_data;
    end
    if (io_dmem_resp_val) begin
      load_wb_tag <= io_dmem_resp_tag;
    end
    if (reset) begin
      mem_reg_valid <= 1'h0;
    end else begin
      mem_reg_valid <= ex_reg_valid & ~killx;
    end
    if (ex_reg_valid) begin
      mem_reg_inst <= ex_reg_inst;
    end
    if (reset) begin
      wb_reg_valid <= 1'h0;
    end else begin
      wb_reg_valid <= wb_reg_valid_x8;
    end
    if (ex_reg_valid) begin
      mem_ctrl_typeTagOut <= ex_reg_ctrl_typeTagOut;
    end
    if (ex_reg_valid) begin
      mem_ctrl_fromint <= ex_reg_ctrl_fromint;
    end
    if (ex_reg_valid) begin
      mem_ctrl_toint <= ex_reg_ctrl_toint;
    end
    if (ex_reg_valid) begin
      mem_ctrl_fastpipe <= ex_reg_ctrl_fastpipe;
    end
    if (ex_reg_valid) begin
      mem_ctrl_fma <= ex_reg_ctrl_fma;
    end
    if (ex_reg_valid) begin
      mem_ctrl_div <= ex_reg_ctrl_div;
    end
    if (ex_reg_valid) begin
      mem_ctrl_sqrt <= ex_reg_ctrl_sqrt;
    end
    if (ex_reg_valid) begin
      mem_ctrl_wflags <= ex_reg_ctrl_wflags;
    end
    if (mem_reg_valid) begin
      wb_ctrl_toint <= mem_ctrl_toint;
    end
    if (divSqrt_inValid) begin
      divSqrt_waddr <= mem_reg_inst[11:7];
    end
    if (reset) begin
      wen <= 2'h0;
    end else if (mem_wen) begin
      if (_wb_reg_valid_x8_T) begin
        wen <= _wen_T_2;
      end else begin
        wen <= {{1'd0}, wen[1]};
      end
    end else begin
      wen <= {{1'd0}, wen[1]};
    end
    if (mem_wen) begin
      if (~write_port_busy & memLatencyMask[0]) begin
        wbInfo_0_rd <= mem_reg_inst[11:7];
      end else begin
        wbInfo_0_rd <= _GEN_107;
      end
    end else begin
      wbInfo_0_rd <= _GEN_107;
    end
    if (mem_wen) begin
      if (~write_port_busy & memLatencyMask[0]) begin
        wbInfo_0_pipeid <= _wbInfo_0_pipeid_T_6;
      end else begin
        wbInfo_0_pipeid <= _GEN_110;
      end
    end else begin
      wbInfo_0_pipeid <= _GEN_110;
    end
    if (mem_wen) begin
      if (~write_port_busy & memLatencyMask[1]) begin
        wbInfo_1_rd <= mem_reg_inst[11:7];
      end
    end
    if (mem_wen) begin
      if (~write_port_busy & memLatencyMask[1]) begin
        wbInfo_1_pipeid <= _wbInfo_0_pipeid_T_6;
      end
    end
    if (ex_reg_valid) begin
      write_port_busy <= _write_port_busy_T_19;
    end
    divSqrt_killed <= reset | divSqrt_inValid & killm;
    if (mem_ctrl_toint) begin
      wb_toint_exc <= fpiu_io_out_bits_exc;
    end
    io_sboard_set_REG <= mem_ctrl_div | mem_ctrl_sqrt;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_0[32:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ex_reg_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ex_reg_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  ex_reg_ctrl_ren2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ex_reg_ctrl_ren3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ex_reg_ctrl_swap23 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ex_reg_ctrl_typeTagOut = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  ex_reg_ctrl_fromint = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ex_reg_ctrl_toint = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  ex_reg_ctrl_fastpipe = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ex_reg_ctrl_fma = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ex_reg_ctrl_div = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ex_reg_ctrl_sqrt = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  ex_reg_ctrl_wflags = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  ex_ra_0 = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  ex_ra_1 = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  ex_ra_2 = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  load_wb = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  load_wb_data = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  load_wb_tag = _RAND_19[4:0];
  _RAND_20 = {1{`RANDOM}};
  mem_reg_valid = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  mem_reg_inst = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  wb_reg_valid = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  mem_ctrl_typeTagOut = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  mem_ctrl_fromint = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  mem_ctrl_toint = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  mem_ctrl_fastpipe = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mem_ctrl_fma = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  mem_ctrl_div = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  mem_ctrl_sqrt = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  mem_ctrl_wflags = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  wb_ctrl_toint = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  divSqrt_waddr = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  wen = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  wbInfo_0_rd = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  wbInfo_0_pipeid = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  wbInfo_1_rd = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  wbInfo_1_pipeid = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  write_port_busy = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  divSqrt_killed = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  wb_toint_exc = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  io_sboard_set_REG = _RAND_41[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule