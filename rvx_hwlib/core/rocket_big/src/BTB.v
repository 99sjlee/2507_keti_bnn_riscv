`default_nettype wire
module BTB(
  input         clock,
  input         reset,
  input  [31:0] io_req_bits_addr,
  output        io_resp_valid,
  output        io_resp_bits_taken,
  output        io_resp_bits_bridx,
  output [31:0] io_resp_bits_target,
  output [4:0]  io_resp_bits_entry,
  output [7:0]  io_resp_bits_bht_history,
  output        io_resp_bits_bht_value,
  input         io_btb_update_valid,
  input  [4:0]  io_btb_update_bits_prediction_entry,
  input  [31:0] io_btb_update_bits_pc,
  input         io_btb_update_bits_isValid,
  input  [31:0] io_btb_update_bits_br_pc,
  input  [1:0]  io_btb_update_bits_cfiType,
  input         io_bht_update_valid,
  input  [7:0]  io_bht_update_bits_prediction_history,
  input  [31:0] io_bht_update_bits_pc,
  input         io_bht_update_bits_branch,
  input         io_bht_update_bits_taken,
  input         io_bht_update_bits_mispredict,
  input         io_bht_advance_valid,
  input         io_bht_advance_bits_bht_value,
  input         io_ras_update_valid,
  input  [1:0]  io_ras_update_bits_cfiType,
  input  [31:0] io_ras_update_bits_returnAddr,
  output        io_ras_head_valid,
  output [31:0] io_ras_head_bits,
  input         io_flush
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
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
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
`endif // RANDOMIZE_REG_INIT
  reg  table_ [0:511];
  wire  table__res_res_value_MPORT_en;
  wire [8:0] table__res_res_value_MPORT_addr;
  wire  table__res_res_value_MPORT_data;
  wire  table__MPORT_data;
  wire [8:0] table__MPORT_addr;
  wire  table__MPORT_mask;
  wire  table__MPORT_en;
  reg [12:0] idxs_0;
  reg [12:0] idxs_1;
  reg [12:0] idxs_2;
  reg [12:0] idxs_3;
  reg [12:0] idxs_4;
  reg [12:0] idxs_5;
  reg [12:0] idxs_6;
  reg [12:0] idxs_7;
  reg [12:0] idxs_8;
  reg [12:0] idxs_9;
  reg [12:0] idxs_10;
  reg [12:0] idxs_11;
  reg [12:0] idxs_12;
  reg [12:0] idxs_13;
  reg [12:0] idxs_14;
  reg [12:0] idxs_15;
  reg [12:0] idxs_16;
  reg [12:0] idxs_17;
  reg [12:0] idxs_18;
  reg [12:0] idxs_19;
  reg [12:0] idxs_20;
  reg [12:0] idxs_21;
  reg [12:0] idxs_22;
  reg [12:0] idxs_23;
  reg [12:0] idxs_24;
  reg [12:0] idxs_25;
  reg [12:0] idxs_26;
  reg [12:0] idxs_27;
  reg [2:0] idxPages_0;
  reg [2:0] idxPages_1;
  reg [2:0] idxPages_2;
  reg [2:0] idxPages_3;
  reg [2:0] idxPages_4;
  reg [2:0] idxPages_5;
  reg [2:0] idxPages_6;
  reg [2:0] idxPages_7;
  reg [2:0] idxPages_8;
  reg [2:0] idxPages_9;
  reg [2:0] idxPages_10;
  reg [2:0] idxPages_11;
  reg [2:0] idxPages_12;
  reg [2:0] idxPages_13;
  reg [2:0] idxPages_14;
  reg [2:0] idxPages_15;
  reg [2:0] idxPages_16;
  reg [2:0] idxPages_17;
  reg [2:0] idxPages_18;
  reg [2:0] idxPages_19;
  reg [2:0] idxPages_20;
  reg [2:0] idxPages_21;
  reg [2:0] idxPages_22;
  reg [2:0] idxPages_23;
  reg [2:0] idxPages_24;
  reg [2:0] idxPages_25;
  reg [2:0] idxPages_26;
  reg [2:0] idxPages_27;
  reg [12:0] tgts_0;
  reg [12:0] tgts_1;
  reg [12:0] tgts_2;
  reg [12:0] tgts_3;
  reg [12:0] tgts_4;
  reg [12:0] tgts_5;
  reg [12:0] tgts_6;
  reg [12:0] tgts_7;
  reg [12:0] tgts_8;
  reg [12:0] tgts_9;
  reg [12:0] tgts_10;
  reg [12:0] tgts_11;
  reg [12:0] tgts_12;
  reg [12:0] tgts_13;
  reg [12:0] tgts_14;
  reg [12:0] tgts_15;
  reg [12:0] tgts_16;
  reg [12:0] tgts_17;
  reg [12:0] tgts_18;
  reg [12:0] tgts_19;
  reg [12:0] tgts_20;
  reg [12:0] tgts_21;
  reg [12:0] tgts_22;
  reg [12:0] tgts_23;
  reg [12:0] tgts_24;
  reg [12:0] tgts_25;
  reg [12:0] tgts_26;
  reg [12:0] tgts_27;
  reg [2:0] tgtPages_0;
  reg [2:0] tgtPages_1;
  reg [2:0] tgtPages_2;
  reg [2:0] tgtPages_3;
  reg [2:0] tgtPages_4;
  reg [2:0] tgtPages_5;
  reg [2:0] tgtPages_6;
  reg [2:0] tgtPages_7;
  reg [2:0] tgtPages_8;
  reg [2:0] tgtPages_9;
  reg [2:0] tgtPages_10;
  reg [2:0] tgtPages_11;
  reg [2:0] tgtPages_12;
  reg [2:0] tgtPages_13;
  reg [2:0] tgtPages_14;
  reg [2:0] tgtPages_15;
  reg [2:0] tgtPages_16;
  reg [2:0] tgtPages_17;
  reg [2:0] tgtPages_18;
  reg [2:0] tgtPages_19;
  reg [2:0] tgtPages_20;
  reg [2:0] tgtPages_21;
  reg [2:0] tgtPages_22;
  reg [2:0] tgtPages_23;
  reg [2:0] tgtPages_24;
  reg [2:0] tgtPages_25;
  reg [2:0] tgtPages_26;
  reg [2:0] tgtPages_27;
  reg [17:0] pages_0;
  reg [17:0] pages_1;
  reg [17:0] pages_2;
  reg [17:0] pages_3;
  reg [17:0] pages_4;
  reg [17:0] pages_5;
  reg [5:0] pageValid;
  wire [17:0] pagesMasked_0 = pageValid[0] ? pages_0 : 18'h0;
  wire [17:0] pagesMasked_1 = pageValid[1] ? pages_1 : 18'h0;
  wire [17:0] pagesMasked_2 = pageValid[2] ? pages_2 : 18'h0;
  wire [17:0] pagesMasked_3 = pageValid[3] ? pages_3 : 18'h0;
  wire [17:0] pagesMasked_4 = pageValid[4] ? pages_4 : 18'h0;
  wire [17:0] pagesMasked_5 = pageValid[5] ? pages_5 : 18'h0;
  reg [27:0] isValid;
  reg [1:0] cfiType_0;
  reg [1:0] cfiType_1;
  reg [1:0] cfiType_2;
  reg [1:0] cfiType_3;
  reg [1:0] cfiType_4;
  reg [1:0] cfiType_5;
  reg [1:0] cfiType_6;
  reg [1:0] cfiType_7;
  reg [1:0] cfiType_8;
  reg [1:0] cfiType_9;
  reg [1:0] cfiType_10;
  reg [1:0] cfiType_11;
  reg [1:0] cfiType_12;
  reg [1:0] cfiType_13;
  reg [1:0] cfiType_14;
  reg [1:0] cfiType_15;
  reg [1:0] cfiType_16;
  reg [1:0] cfiType_17;
  reg [1:0] cfiType_18;
  reg [1:0] cfiType_19;
  reg [1:0] cfiType_20;
  reg [1:0] cfiType_21;
  reg [1:0] cfiType_22;
  reg [1:0] cfiType_23;
  reg [1:0] cfiType_24;
  reg [1:0] cfiType_25;
  reg [1:0] cfiType_26;
  reg [1:0] cfiType_27;
  reg  brIdx_0;
  reg  brIdx_1;
  reg  brIdx_2;
  reg  brIdx_3;
  reg  brIdx_4;
  reg  brIdx_5;
  reg  brIdx_6;
  reg  brIdx_7;
  reg  brIdx_8;
  reg  brIdx_9;
  reg  brIdx_10;
  reg  brIdx_11;
  reg  brIdx_12;
  reg  brIdx_13;
  reg  brIdx_14;
  reg  brIdx_15;
  reg  brIdx_16;
  reg  brIdx_17;
  reg  brIdx_18;
  reg  brIdx_19;
  reg  brIdx_20;
  reg  brIdx_21;
  reg  brIdx_22;
  reg  brIdx_23;
  reg  brIdx_24;
  reg  brIdx_25;
  reg  brIdx_26;
  reg  brIdx_27;
  reg  r_btb_updatePipe_valid;
  reg [4:0] r_btb_updatePipe_bits_prediction_entry;
  reg [31:0] r_btb_updatePipe_bits_pc;
  reg  r_btb_updatePipe_bits_isValid;
  reg [31:0] r_btb_updatePipe_bits_br_pc;
  reg [1:0] r_btb_updatePipe_bits_cfiType;
  wire [17:0] pageHit_p = io_req_bits_addr[31:14];
  wire  _pageHit_T = pages_0 == pageHit_p;
  wire  _pageHit_T_1 = pages_1 == pageHit_p;
  wire  _pageHit_T_2 = pages_2 == pageHit_p;
  wire  _pageHit_T_3 = pages_3 == pageHit_p;
  wire  _pageHit_T_4 = pages_4 == pageHit_p;
  wire  _pageHit_T_5 = pages_5 == pageHit_p;
  wire [5:0] _pageHit_T_6 = {_pageHit_T_5,_pageHit_T_4,_pageHit_T_3,_pageHit_T_2,_pageHit_T_1,_pageHit_T};
  wire [5:0] pageHit = pageValid & _pageHit_T_6;
  wire [12:0] idxHit_idx = io_req_bits_addr[13:1];
  wire  _idxHit_T = idxs_0 == idxHit_idx;
  wire  _idxHit_T_1 = idxs_1 == idxHit_idx;
  wire  _idxHit_T_2 = idxs_2 == idxHit_idx;
  wire  _idxHit_T_3 = idxs_3 == idxHit_idx;
  wire  _idxHit_T_4 = idxs_4 == idxHit_idx;
  wire  _idxHit_T_5 = idxs_5 == idxHit_idx;
  wire  _idxHit_T_6 = idxs_6 == idxHit_idx;
  wire  _idxHit_T_7 = idxs_7 == idxHit_idx;
  wire  _idxHit_T_8 = idxs_8 == idxHit_idx;
  wire  _idxHit_T_9 = idxs_9 == idxHit_idx;
  wire  _idxHit_T_10 = idxs_10 == idxHit_idx;
  wire  _idxHit_T_11 = idxs_11 == idxHit_idx;
  wire  _idxHit_T_12 = idxs_12 == idxHit_idx;
  wire  _idxHit_T_13 = idxs_13 == idxHit_idx;
  wire  _idxHit_T_14 = idxs_14 == idxHit_idx;
  wire  _idxHit_T_15 = idxs_15 == idxHit_idx;
  wire  _idxHit_T_16 = idxs_16 == idxHit_idx;
  wire  _idxHit_T_17 = idxs_17 == idxHit_idx;
  wire  _idxHit_T_18 = idxs_18 == idxHit_idx;
  wire  _idxHit_T_19 = idxs_19 == idxHit_idx;
  wire  _idxHit_T_20 = idxs_20 == idxHit_idx;
  wire  _idxHit_T_21 = idxs_21 == idxHit_idx;
  wire  _idxHit_T_22 = idxs_22 == idxHit_idx;
  wire  _idxHit_T_23 = idxs_23 == idxHit_idx;
  wire  _idxHit_T_24 = idxs_24 == idxHit_idx;
  wire  _idxHit_T_25 = idxs_25 == idxHit_idx;
  wire  _idxHit_T_26 = idxs_26 == idxHit_idx;
  wire  _idxHit_T_27 = idxs_27 == idxHit_idx;
  wire [6:0] idxHit_lo_lo = {_idxHit_T_6,_idxHit_T_5,_idxHit_T_4,_idxHit_T_3,_idxHit_T_2,_idxHit_T_1,_idxHit_T};
  wire [13:0] idxHit_lo = {_idxHit_T_13,_idxHit_T_12,_idxHit_T_11,_idxHit_T_10,_idxHit_T_9,_idxHit_T_8,_idxHit_T_7,
    idxHit_lo_lo};
  wire [6:0] idxHit_hi_lo = {_idxHit_T_20,_idxHit_T_19,_idxHit_T_18,_idxHit_T_17,_idxHit_T_16,_idxHit_T_15,_idxHit_T_14}
    ;
  wire [27:0] _idxHit_T_28 = {_idxHit_T_27,_idxHit_T_26,_idxHit_T_25,_idxHit_T_24,_idxHit_T_23,_idxHit_T_22,_idxHit_T_21
    ,idxHit_hi_lo,idxHit_lo};
  wire [27:0] idxHit = _idxHit_T_28 & isValid;
  wire [17:0] updatePageHit_p = r_btb_updatePipe_bits_pc[31:14];
  wire  _updatePageHit_T = pages_0 == updatePageHit_p;
  wire  _updatePageHit_T_1 = pages_1 == updatePageHit_p;
  wire  _updatePageHit_T_2 = pages_2 == updatePageHit_p;
  wire  _updatePageHit_T_3 = pages_3 == updatePageHit_p;
  wire  _updatePageHit_T_4 = pages_4 == updatePageHit_p;
  wire  _updatePageHit_T_5 = pages_5 == updatePageHit_p;
  wire [5:0] _updatePageHit_T_6 = {_updatePageHit_T_5,_updatePageHit_T_4,_updatePageHit_T_3,_updatePageHit_T_2,
    _updatePageHit_T_1,_updatePageHit_T};
  wire [5:0] updatePageHit = pageValid & _updatePageHit_T_6;
  wire  updateHit = r_btb_updatePipe_bits_prediction_entry < 5'h1c;
  wire  useUpdatePageHit = |updatePageHit;
  wire  usePageHit = |pageHit;
  wire  doIdxPageRepl = ~useUpdatePageHit;
  reg [2:0] nextPageRepl;
  wire [5:0] _idxPageRepl_T_2 = {pageHit[4:0],pageHit[5]};
  wire [7:0] _idxPageRepl_T_3 = 8'h1 << nextPageRepl;
  wire [7:0] _idxPageRepl_T_4 = usePageHit ? 8'h0 : _idxPageRepl_T_3;
  wire [7:0] _GEN_430 = {{2'd0}, _idxPageRepl_T_2};
  wire [7:0] idxPageRepl = _GEN_430 | _idxPageRepl_T_4;
  wire [7:0] idxPageUpdateOH = useUpdatePageHit ? {{2'd0}, updatePageHit} : idxPageRepl;
  wire [3:0] idxPageUpdate_hi = idxPageUpdateOH[7:4];
  wire [3:0] idxPageUpdate_lo = idxPageUpdateOH[3:0];
  wire  _idxPageUpdate_T = |idxPageUpdate_hi;
  wire [3:0] _idxPageUpdate_T_1 = idxPageUpdate_hi | idxPageUpdate_lo;
  wire [1:0] idxPageUpdate_hi_1 = _idxPageUpdate_T_1[3:2];
  wire [1:0] idxPageUpdate_lo_1 = _idxPageUpdate_T_1[1:0];
  wire  _idxPageUpdate_T_2 = |idxPageUpdate_hi_1;
  wire [1:0] _idxPageUpdate_T_3 = idxPageUpdate_hi_1 | idxPageUpdate_lo_1;
  wire [2:0] idxPageUpdate = {_idxPageUpdate_T,_idxPageUpdate_T_2,_idxPageUpdate_T_3[1]};
  wire [7:0] idxPageReplEn = doIdxPageRepl ? idxPageRepl : 8'h0;
  wire  samePage = updatePageHit_p == pageHit_p;
  wire  doTgtPageRepl = ~samePage & ~usePageHit;
  wire [5:0] _tgtPageRepl_T_2 = {idxPageUpdateOH[4:0],idxPageUpdateOH[5]};
  wire [7:0] tgtPageRepl = samePage ? idxPageUpdateOH : {{2'd0}, _tgtPageRepl_T_2};
  wire [7:0] _tgtPageUpdate_T = usePageHit ? 8'h0 : tgtPageRepl;
  wire [7:0] _GEN_431 = {{2'd0}, pageHit};
  wire [7:0] _tgtPageUpdate_T_1 = _GEN_431 | _tgtPageUpdate_T;
  wire [3:0] tgtPageUpdate_hi = _tgtPageUpdate_T_1[7:4];
  wire [3:0] tgtPageUpdate_lo = _tgtPageUpdate_T_1[3:0];
  wire  _tgtPageUpdate_T_2 = |tgtPageUpdate_hi;
  wire [3:0] _tgtPageUpdate_T_3 = tgtPageUpdate_hi | tgtPageUpdate_lo;
  wire [1:0] tgtPageUpdate_hi_1 = _tgtPageUpdate_T_3[3:2];
  wire [1:0] tgtPageUpdate_lo_1 = _tgtPageUpdate_T_3[1:0];
  wire  _tgtPageUpdate_T_4 = |tgtPageUpdate_hi_1;
  wire [1:0] _tgtPageUpdate_T_5 = tgtPageUpdate_hi_1 | tgtPageUpdate_lo_1;
  wire [2:0] tgtPageUpdate = {_tgtPageUpdate_T_2,_tgtPageUpdate_T_4,_tgtPageUpdate_T_5[1]};
  wire [7:0] tgtPageReplEn = doTgtPageRepl ? tgtPageRepl : 8'h0;
  wire  both = doIdxPageRepl & doTgtPageRepl;
  wire [1:0] _next_T = both ? 2'h2 : 2'h1;
  wire [2:0] _GEN_432 = {{1'd0}, _next_T};
  wire [2:0] next = nextPageRepl + _GEN_432;
  reg [26:0] state_reg;
  wire  waddr_left_subtree_older = state_reg[26];
  wire [10:0] waddr_left_subtree_state = state_reg[25:15];
  wire [14:0] waddr_right_subtree_state = state_reg[14:0];
  wire  waddr_left_subtree_older_1 = waddr_left_subtree_state[10];
  wire [2:0] waddr_left_subtree_state_1 = waddr_left_subtree_state[9:7];
  wire [6:0] waddr_right_subtree_state_1 = waddr_left_subtree_state[6:0];
  wire  waddr_left_subtree_older_2 = waddr_left_subtree_state_1[2];
  wire  waddr_left_subtree_state_2 = waddr_left_subtree_state_1[1];
  wire  waddr_right_subtree_state_2 = waddr_left_subtree_state_1[0];
  wire  _waddr_T_2 = waddr_left_subtree_older_2 ? waddr_left_subtree_state_2 : waddr_right_subtree_state_2;
  wire [1:0] _waddr_T_3 = {waddr_left_subtree_older_2,_waddr_T_2};
  wire  waddr_left_subtree_older_3 = waddr_right_subtree_state_1[6];
  wire [2:0] waddr_left_subtree_state_3 = waddr_right_subtree_state_1[5:3];
  wire [2:0] waddr_right_subtree_state_3 = waddr_right_subtree_state_1[2:0];
  wire  waddr_left_subtree_older_4 = waddr_left_subtree_state_3[2];
  wire  waddr_left_subtree_state_4 = waddr_left_subtree_state_3[1];
  wire  waddr_right_subtree_state_4 = waddr_left_subtree_state_3[0];
  wire  _waddr_T_6 = waddr_left_subtree_older_4 ? waddr_left_subtree_state_4 : waddr_right_subtree_state_4;
  wire [1:0] _waddr_T_7 = {waddr_left_subtree_older_4,_waddr_T_6};
  wire  waddr_left_subtree_older_5 = waddr_right_subtree_state_3[2];
  wire  waddr_left_subtree_state_5 = waddr_right_subtree_state_3[1];
  wire  waddr_right_subtree_state_5 = waddr_right_subtree_state_3[0];
  wire  _waddr_T_10 = waddr_left_subtree_older_5 ? waddr_left_subtree_state_5 : waddr_right_subtree_state_5;
  wire [1:0] _waddr_T_11 = {waddr_left_subtree_older_5,_waddr_T_10};
  wire [1:0] _waddr_T_12 = waddr_left_subtree_older_3 ? _waddr_T_7 : _waddr_T_11;
  wire [2:0] _waddr_T_13 = {waddr_left_subtree_older_3,_waddr_T_12};
  wire [2:0] _waddr_T_14 = waddr_left_subtree_older_1 ? {{1'd0}, _waddr_T_3} : _waddr_T_13;
  wire [3:0] _waddr_T_15 = {waddr_left_subtree_older_1,_waddr_T_14};
  wire  waddr_left_subtree_older_6 = waddr_right_subtree_state[14];
  wire [6:0] waddr_left_subtree_state_6 = waddr_right_subtree_state[13:7];
  wire [6:0] waddr_right_subtree_state_6 = waddr_right_subtree_state[6:0];
  wire  waddr_left_subtree_older_7 = waddr_left_subtree_state_6[6];
  wire [2:0] waddr_left_subtree_state_7 = waddr_left_subtree_state_6[5:3];
  wire [2:0] waddr_right_subtree_state_7 = waddr_left_subtree_state_6[2:0];
  wire  waddr_left_subtree_older_8 = waddr_left_subtree_state_7[2];
  wire  waddr_left_subtree_state_8 = waddr_left_subtree_state_7[1];
  wire  waddr_right_subtree_state_8 = waddr_left_subtree_state_7[0];
  wire  _waddr_T_18 = waddr_left_subtree_older_8 ? waddr_left_subtree_state_8 : waddr_right_subtree_state_8;
  wire [1:0] _waddr_T_19 = {waddr_left_subtree_older_8,_waddr_T_18};
  wire  waddr_left_subtree_older_9 = waddr_right_subtree_state_7[2];
  wire  waddr_left_subtree_state_9 = waddr_right_subtree_state_7[1];
  wire  waddr_right_subtree_state_9 = waddr_right_subtree_state_7[0];
  wire  _waddr_T_22 = waddr_left_subtree_older_9 ? waddr_left_subtree_state_9 : waddr_right_subtree_state_9;
  wire [1:0] _waddr_T_23 = {waddr_left_subtree_older_9,_waddr_T_22};
  wire [1:0] _waddr_T_24 = waddr_left_subtree_older_7 ? _waddr_T_19 : _waddr_T_23;
  wire [2:0] _waddr_T_25 = {waddr_left_subtree_older_7,_waddr_T_24};
  wire  waddr_left_subtree_older_10 = waddr_right_subtree_state_6[6];
  wire [2:0] waddr_left_subtree_state_10 = waddr_right_subtree_state_6[5:3];
  wire [2:0] waddr_right_subtree_state_10 = waddr_right_subtree_state_6[2:0];
  wire  waddr_left_subtree_older_11 = waddr_left_subtree_state_10[2];
  wire  waddr_left_subtree_state_11 = waddr_left_subtree_state_10[1];
  wire  waddr_right_subtree_state_11 = waddr_left_subtree_state_10[0];
  wire  _waddr_T_28 = waddr_left_subtree_older_11 ? waddr_left_subtree_state_11 : waddr_right_subtree_state_11;
  wire [1:0] _waddr_T_29 = {waddr_left_subtree_older_11,_waddr_T_28};
  wire  waddr_left_subtree_older_12 = waddr_right_subtree_state_10[2];
  wire  waddr_left_subtree_state_12 = waddr_right_subtree_state_10[1];
  wire  waddr_right_subtree_state_12 = waddr_right_subtree_state_10[0];
  wire  _waddr_T_32 = waddr_left_subtree_older_12 ? waddr_left_subtree_state_12 : waddr_right_subtree_state_12;
  wire [1:0] _waddr_T_33 = {waddr_left_subtree_older_12,_waddr_T_32};
  wire [1:0] _waddr_T_34 = waddr_left_subtree_older_10 ? _waddr_T_29 : _waddr_T_33;
  wire [2:0] _waddr_T_35 = {waddr_left_subtree_older_10,_waddr_T_34};
  wire [2:0] _waddr_T_36 = waddr_left_subtree_older_6 ? _waddr_T_25 : _waddr_T_35;
  wire [3:0] _waddr_T_37 = {waddr_left_subtree_older_6,_waddr_T_36};
  wire [3:0] _waddr_T_38 = waddr_left_subtree_older ? _waddr_T_15 : _waddr_T_37;
  wire [4:0] _waddr_T_39 = {waddr_left_subtree_older,_waddr_T_38};
  wire [4:0] waddr = updateHit ? r_btb_updatePipe_bits_prediction_entry : _waddr_T_39;
  reg  r_respPipe_valid;
  reg  r_respPipe_bits_taken;
  reg [4:0] r_respPipe_bits_entry;
  wire [4:0] state_reg_touch_way_sized = r_btb_updatePipe_valid ? waddr : r_respPipe_bits_entry;
  wire  state_reg_set_left_older = ~state_reg_touch_way_sized[4];
  wire  state_reg_set_left_older_1 = ~state_reg_touch_way_sized[3];
  wire  state_reg_set_left_older_2 = ~state_reg_touch_way_sized[1];
  wire  _state_reg_T_4 = ~state_reg_touch_way_sized[0];
  wire  _state_reg_T_5 = state_reg_set_left_older_2 ? waddr_left_subtree_state_2 : _state_reg_T_4;
  wire  _state_reg_T_9 = state_reg_set_left_older_2 ? _state_reg_T_4 : waddr_right_subtree_state_2;
  wire [2:0] _state_reg_T_10 = {state_reg_set_left_older_2,_state_reg_T_5,_state_reg_T_9};
  wire [2:0] _state_reg_T_11 = state_reg_set_left_older_1 ? waddr_left_subtree_state_1 : _state_reg_T_10;
  wire  state_reg_set_left_older_3 = ~state_reg_touch_way_sized[2];
  wire  state_reg_set_left_older_4 = ~state_reg_touch_way_sized[1];
  wire  _state_reg_T_16 = ~state_reg_touch_way_sized[0];
  wire  _state_reg_T_17 = state_reg_set_left_older_4 ? waddr_left_subtree_state_4 : _state_reg_T_16;
  wire  _state_reg_T_21 = state_reg_set_left_older_4 ? _state_reg_T_16 : waddr_right_subtree_state_4;
  wire [2:0] _state_reg_T_22 = {state_reg_set_left_older_4,_state_reg_T_17,_state_reg_T_21};
  wire [2:0] _state_reg_T_23 = state_reg_set_left_older_3 ? waddr_left_subtree_state_3 : _state_reg_T_22;
  wire  _state_reg_T_28 = state_reg_set_left_older_4 ? waddr_left_subtree_state_5 : _state_reg_T_16;
  wire  _state_reg_T_32 = state_reg_set_left_older_4 ? _state_reg_T_16 : waddr_right_subtree_state_5;
  wire [2:0] _state_reg_T_33 = {state_reg_set_left_older_4,_state_reg_T_28,_state_reg_T_32};
  wire [2:0] _state_reg_T_34 = state_reg_set_left_older_3 ? _state_reg_T_33 : waddr_right_subtree_state_3;
  wire [6:0] _state_reg_T_35 = {state_reg_set_left_older_3,_state_reg_T_23,_state_reg_T_34};
  wire [6:0] _state_reg_T_36 = state_reg_set_left_older_1 ? _state_reg_T_35 : waddr_right_subtree_state_1;
  wire [10:0] _state_reg_T_37 = {state_reg_set_left_older_1,_state_reg_T_11,_state_reg_T_36};
  wire [10:0] _state_reg_T_38 = state_reg_set_left_older ? waddr_left_subtree_state : _state_reg_T_37;
  wire  _state_reg_T_45 = state_reg_set_left_older_4 ? waddr_left_subtree_state_8 : _state_reg_T_16;
  wire  _state_reg_T_49 = state_reg_set_left_older_4 ? _state_reg_T_16 : waddr_right_subtree_state_8;
  wire [2:0] _state_reg_T_50 = {state_reg_set_left_older_4,_state_reg_T_45,_state_reg_T_49};
  wire [2:0] _state_reg_T_51 = state_reg_set_left_older_3 ? waddr_left_subtree_state_7 : _state_reg_T_50;
  wire  _state_reg_T_56 = state_reg_set_left_older_4 ? waddr_left_subtree_state_9 : _state_reg_T_16;
  wire  _state_reg_T_60 = state_reg_set_left_older_4 ? _state_reg_T_16 : waddr_right_subtree_state_9;
  wire [2:0] _state_reg_T_61 = {state_reg_set_left_older_4,_state_reg_T_56,_state_reg_T_60};
  wire [2:0] _state_reg_T_62 = state_reg_set_left_older_3 ? _state_reg_T_61 : waddr_right_subtree_state_7;
  wire [6:0] _state_reg_T_63 = {state_reg_set_left_older_3,_state_reg_T_51,_state_reg_T_62};
  wire [6:0] _state_reg_T_64 = state_reg_set_left_older_1 ? waddr_left_subtree_state_6 : _state_reg_T_63;
  wire  _state_reg_T_70 = state_reg_set_left_older_4 ? waddr_left_subtree_state_11 : _state_reg_T_16;
  wire  _state_reg_T_74 = state_reg_set_left_older_4 ? _state_reg_T_16 : waddr_right_subtree_state_11;
  wire [2:0] _state_reg_T_75 = {state_reg_set_left_older_4,_state_reg_T_70,_state_reg_T_74};
  wire [2:0] _state_reg_T_76 = state_reg_set_left_older_3 ? waddr_left_subtree_state_10 : _state_reg_T_75;
  wire  _state_reg_T_81 = state_reg_set_left_older_4 ? waddr_left_subtree_state_12 : _state_reg_T_16;
  wire  _state_reg_T_85 = state_reg_set_left_older_4 ? _state_reg_T_16 : waddr_right_subtree_state_12;
  wire [2:0] _state_reg_T_86 = {state_reg_set_left_older_4,_state_reg_T_81,_state_reg_T_85};
  wire [2:0] _state_reg_T_87 = state_reg_set_left_older_3 ? _state_reg_T_86 : waddr_right_subtree_state_10;
  wire [6:0] _state_reg_T_88 = {state_reg_set_left_older_3,_state_reg_T_76,_state_reg_T_87};
  wire [6:0] _state_reg_T_89 = state_reg_set_left_older_1 ? _state_reg_T_88 : waddr_right_subtree_state_6;
  wire [14:0] _state_reg_T_90 = {state_reg_set_left_older_1,_state_reg_T_64,_state_reg_T_89};
  wire [14:0] _state_reg_T_91 = state_reg_set_left_older ? _state_reg_T_90 : waddr_right_subtree_state;
  wire [26:0] _state_reg_T_92 = {state_reg_set_left_older,_state_reg_T_38,_state_reg_T_91};
  wire [31:0] mask = 32'h1 << waddr;
  wire [3:0] _idxPages_T = idxPageUpdate + 3'h1;
  wire [31:0] _GEN_433 = {{4'd0}, isValid};
  wire [31:0] _isValid_T = _GEN_433 | mask;
  wire [31:0] _isValid_T_1 = ~mask;
  wire [31:0] _isValid_T_2 = _GEN_433 & _isValid_T_1;
  wire [31:0] _isValid_T_3 = r_btb_updatePipe_bits_isValid ? _isValid_T : _isValid_T_2;
  wire  idxWritesEven = ~idxPageUpdate[0];
  wire [7:0] _T_5 = idxWritesEven ? idxPageReplEn : tgtPageReplEn;
  wire [7:0] _T_12 = idxWritesEven ? tgtPageReplEn : idxPageReplEn;
  wire [7:0] _GEN_435 = {{2'd0}, pageValid};
  wire [7:0] _pageValid_T = _GEN_435 | tgtPageReplEn;
  wire [7:0] _pageValid_T_1 = _pageValid_T | idxPageReplEn;
  wire [31:0] _GEN_338 = r_btb_updatePipe_valid ? _isValid_T_3 : {{4'd0}, isValid};
  wire [7:0] _GEN_373 = r_btb_updatePipe_valid ? _pageValid_T_1 : {{2'd0}, pageValid};
  wire [6:0] _io_resp_valid_T = {pageHit, 1'h0};
  wire [2:0] _io_resp_valid_T_29 = idxHit[0] ? idxPages_0 : 3'h0;
  wire [2:0] _io_resp_valid_T_30 = idxHit[1] ? idxPages_1 : 3'h0;
  wire [2:0] _io_resp_valid_T_31 = idxHit[2] ? idxPages_2 : 3'h0;
  wire [2:0] _io_resp_valid_T_32 = idxHit[3] ? idxPages_3 : 3'h0;
  wire [2:0] _io_resp_valid_T_33 = idxHit[4] ? idxPages_4 : 3'h0;
  wire [2:0] _io_resp_valid_T_34 = idxHit[5] ? idxPages_5 : 3'h0;
  wire [2:0] _io_resp_valid_T_35 = idxHit[6] ? idxPages_6 : 3'h0;
  wire [2:0] _io_resp_valid_T_36 = idxHit[7] ? idxPages_7 : 3'h0;
  wire [2:0] _io_resp_valid_T_37 = idxHit[8] ? idxPages_8 : 3'h0;
  wire [2:0] _io_resp_valid_T_38 = idxHit[9] ? idxPages_9 : 3'h0;
  wire [2:0] _io_resp_valid_T_39 = idxHit[10] ? idxPages_10 : 3'h0;
  wire [2:0] _io_resp_valid_T_40 = idxHit[11] ? idxPages_11 : 3'h0;
  wire [2:0] _io_resp_valid_T_41 = idxHit[12] ? idxPages_12 : 3'h0;
  wire [2:0] _io_resp_valid_T_42 = idxHit[13] ? idxPages_13 : 3'h0;
  wire [2:0] _io_resp_valid_T_43 = idxHit[14] ? idxPages_14 : 3'h0;
  wire [2:0] _io_resp_valid_T_44 = idxHit[15] ? idxPages_15 : 3'h0;
  wire [2:0] _io_resp_valid_T_45 = idxHit[16] ? idxPages_16 : 3'h0;
  wire [2:0] _io_resp_valid_T_46 = idxHit[17] ? idxPages_17 : 3'h0;
  wire [2:0] _io_resp_valid_T_47 = idxHit[18] ? idxPages_18 : 3'h0;
  wire [2:0] _io_resp_valid_T_48 = idxHit[19] ? idxPages_19 : 3'h0;
  wire [2:0] _io_resp_valid_T_49 = idxHit[20] ? idxPages_20 : 3'h0;
  wire [2:0] _io_resp_valid_T_50 = idxHit[21] ? idxPages_21 : 3'h0;
  wire [2:0] _io_resp_valid_T_51 = idxHit[22] ? idxPages_22 : 3'h0;
  wire [2:0] _io_resp_valid_T_52 = idxHit[23] ? idxPages_23 : 3'h0;
  wire [2:0] _io_resp_valid_T_53 = idxHit[24] ? idxPages_24 : 3'h0;
  wire [2:0] _io_resp_valid_T_54 = idxHit[25] ? idxPages_25 : 3'h0;
  wire [2:0] _io_resp_valid_T_55 = idxHit[26] ? idxPages_26 : 3'h0;
  wire [2:0] _io_resp_valid_T_56 = idxHit[27] ? idxPages_27 : 3'h0;
  wire [2:0] _io_resp_valid_T_57 = _io_resp_valid_T_29 | _io_resp_valid_T_30;
  wire [2:0] _io_resp_valid_T_58 = _io_resp_valid_T_57 | _io_resp_valid_T_31;
  wire [2:0] _io_resp_valid_T_59 = _io_resp_valid_T_58 | _io_resp_valid_T_32;
  wire [2:0] _io_resp_valid_T_60 = _io_resp_valid_T_59 | _io_resp_valid_T_33;
  wire [2:0] _io_resp_valid_T_61 = _io_resp_valid_T_60 | _io_resp_valid_T_34;
  wire [2:0] _io_resp_valid_T_62 = _io_resp_valid_T_61 | _io_resp_valid_T_35;
  wire [2:0] _io_resp_valid_T_63 = _io_resp_valid_T_62 | _io_resp_valid_T_36;
  wire [2:0] _io_resp_valid_T_64 = _io_resp_valid_T_63 | _io_resp_valid_T_37;
  wire [2:0] _io_resp_valid_T_65 = _io_resp_valid_T_64 | _io_resp_valid_T_38;
  wire [2:0] _io_resp_valid_T_66 = _io_resp_valid_T_65 | _io_resp_valid_T_39;
  wire [2:0] _io_resp_valid_T_67 = _io_resp_valid_T_66 | _io_resp_valid_T_40;
  wire [2:0] _io_resp_valid_T_68 = _io_resp_valid_T_67 | _io_resp_valid_T_41;
  wire [2:0] _io_resp_valid_T_69 = _io_resp_valid_T_68 | _io_resp_valid_T_42;
  wire [2:0] _io_resp_valid_T_70 = _io_resp_valid_T_69 | _io_resp_valid_T_43;
  wire [2:0] _io_resp_valid_T_71 = _io_resp_valid_T_70 | _io_resp_valid_T_44;
  wire [2:0] _io_resp_valid_T_72 = _io_resp_valid_T_71 | _io_resp_valid_T_45;
  wire [2:0] _io_resp_valid_T_73 = _io_resp_valid_T_72 | _io_resp_valid_T_46;
  wire [2:0] _io_resp_valid_T_74 = _io_resp_valid_T_73 | _io_resp_valid_T_47;
  wire [2:0] _io_resp_valid_T_75 = _io_resp_valid_T_74 | _io_resp_valid_T_48;
  wire [2:0] _io_resp_valid_T_76 = _io_resp_valid_T_75 | _io_resp_valid_T_49;
  wire [2:0] _io_resp_valid_T_77 = _io_resp_valid_T_76 | _io_resp_valid_T_50;
  wire [2:0] _io_resp_valid_T_78 = _io_resp_valid_T_77 | _io_resp_valid_T_51;
  wire [2:0] _io_resp_valid_T_79 = _io_resp_valid_T_78 | _io_resp_valid_T_52;
  wire [2:0] _io_resp_valid_T_80 = _io_resp_valid_T_79 | _io_resp_valid_T_53;
  wire [2:0] _io_resp_valid_T_81 = _io_resp_valid_T_80 | _io_resp_valid_T_54;
  wire [2:0] _io_resp_valid_T_82 = _io_resp_valid_T_81 | _io_resp_valid_T_55;
  wire [2:0] _io_resp_valid_T_83 = _io_resp_valid_T_82 | _io_resp_valid_T_56;
  wire [6:0] _io_resp_valid_T_84 = _io_resp_valid_T >> _io_resp_valid_T_83;
  wire [2:0] _io_resp_bits_target_T_28 = idxHit[0] ? tgtPages_0 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_29 = idxHit[1] ? tgtPages_1 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_30 = idxHit[2] ? tgtPages_2 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_31 = idxHit[3] ? tgtPages_3 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_32 = idxHit[4] ? tgtPages_4 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_33 = idxHit[5] ? tgtPages_5 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_34 = idxHit[6] ? tgtPages_6 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_35 = idxHit[7] ? tgtPages_7 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_36 = idxHit[8] ? tgtPages_8 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_37 = idxHit[9] ? tgtPages_9 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_38 = idxHit[10] ? tgtPages_10 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_39 = idxHit[11] ? tgtPages_11 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_40 = idxHit[12] ? tgtPages_12 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_41 = idxHit[13] ? tgtPages_13 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_42 = idxHit[14] ? tgtPages_14 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_43 = idxHit[15] ? tgtPages_15 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_44 = idxHit[16] ? tgtPages_16 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_45 = idxHit[17] ? tgtPages_17 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_46 = idxHit[18] ? tgtPages_18 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_47 = idxHit[19] ? tgtPages_19 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_48 = idxHit[20] ? tgtPages_20 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_49 = idxHit[21] ? tgtPages_21 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_50 = idxHit[22] ? tgtPages_22 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_51 = idxHit[23] ? tgtPages_23 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_52 = idxHit[24] ? tgtPages_24 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_53 = idxHit[25] ? tgtPages_25 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_54 = idxHit[26] ? tgtPages_26 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_55 = idxHit[27] ? tgtPages_27 : 3'h0;
  wire [2:0] _io_resp_bits_target_T_56 = _io_resp_bits_target_T_28 | _io_resp_bits_target_T_29;
  wire [2:0] _io_resp_bits_target_T_57 = _io_resp_bits_target_T_56 | _io_resp_bits_target_T_30;
  wire [2:0] _io_resp_bits_target_T_58 = _io_resp_bits_target_T_57 | _io_resp_bits_target_T_31;
  wire [2:0] _io_resp_bits_target_T_59 = _io_resp_bits_target_T_58 | _io_resp_bits_target_T_32;
  wire [2:0] _io_resp_bits_target_T_60 = _io_resp_bits_target_T_59 | _io_resp_bits_target_T_33;
  wire [2:0] _io_resp_bits_target_T_61 = _io_resp_bits_target_T_60 | _io_resp_bits_target_T_34;
  wire [2:0] _io_resp_bits_target_T_62 = _io_resp_bits_target_T_61 | _io_resp_bits_target_T_35;
  wire [2:0] _io_resp_bits_target_T_63 = _io_resp_bits_target_T_62 | _io_resp_bits_target_T_36;
  wire [2:0] _io_resp_bits_target_T_64 = _io_resp_bits_target_T_63 | _io_resp_bits_target_T_37;
  wire [2:0] _io_resp_bits_target_T_65 = _io_resp_bits_target_T_64 | _io_resp_bits_target_T_38;
  wire [2:0] _io_resp_bits_target_T_66 = _io_resp_bits_target_T_65 | _io_resp_bits_target_T_39;
  wire [2:0] _io_resp_bits_target_T_67 = _io_resp_bits_target_T_66 | _io_resp_bits_target_T_40;
  wire [2:0] _io_resp_bits_target_T_68 = _io_resp_bits_target_T_67 | _io_resp_bits_target_T_41;
  wire [2:0] _io_resp_bits_target_T_69 = _io_resp_bits_target_T_68 | _io_resp_bits_target_T_42;
  wire [2:0] _io_resp_bits_target_T_70 = _io_resp_bits_target_T_69 | _io_resp_bits_target_T_43;
  wire [2:0] _io_resp_bits_target_T_71 = _io_resp_bits_target_T_70 | _io_resp_bits_target_T_44;
  wire [2:0] _io_resp_bits_target_T_72 = _io_resp_bits_target_T_71 | _io_resp_bits_target_T_45;
  wire [2:0] _io_resp_bits_target_T_73 = _io_resp_bits_target_T_72 | _io_resp_bits_target_T_46;
  wire [2:0] _io_resp_bits_target_T_74 = _io_resp_bits_target_T_73 | _io_resp_bits_target_T_47;
  wire [2:0] _io_resp_bits_target_T_75 = _io_resp_bits_target_T_74 | _io_resp_bits_target_T_48;
  wire [2:0] _io_resp_bits_target_T_76 = _io_resp_bits_target_T_75 | _io_resp_bits_target_T_49;
  wire [2:0] _io_resp_bits_target_T_77 = _io_resp_bits_target_T_76 | _io_resp_bits_target_T_50;
  wire [2:0] _io_resp_bits_target_T_78 = _io_resp_bits_target_T_77 | _io_resp_bits_target_T_51;
  wire [2:0] _io_resp_bits_target_T_79 = _io_resp_bits_target_T_78 | _io_resp_bits_target_T_52;
  wire [2:0] _io_resp_bits_target_T_80 = _io_resp_bits_target_T_79 | _io_resp_bits_target_T_53;
  wire [2:0] _io_resp_bits_target_T_81 = _io_resp_bits_target_T_80 | _io_resp_bits_target_T_54;
  wire [2:0] _io_resp_bits_target_T_82 = _io_resp_bits_target_T_81 | _io_resp_bits_target_T_55;
  wire [17:0] _io_resp_bits_target_T_84 = _io_resp_bits_target_T_82 == 3'h1 ? pagesMasked_1 : pagesMasked_0;
  wire [17:0] _io_resp_bits_target_T_86 = _io_resp_bits_target_T_82 == 3'h2 ? pagesMasked_2 : _io_resp_bits_target_T_84;
  wire [17:0] _io_resp_bits_target_T_88 = _io_resp_bits_target_T_82 == 3'h3 ? pagesMasked_3 : _io_resp_bits_target_T_86;
  wire [17:0] _io_resp_bits_target_T_90 = _io_resp_bits_target_T_82 == 3'h4 ? pagesMasked_4 : _io_resp_bits_target_T_88;
  wire [17:0] _io_resp_bits_target_T_92 = _io_resp_bits_target_T_82 == 3'h5 ? pagesMasked_5 : _io_resp_bits_target_T_90;
  wire [17:0] _io_resp_bits_target_T_94 = _io_resp_bits_target_T_82 == 3'h6 ? pagesMasked_4 : _io_resp_bits_target_T_92;
  wire [17:0] _io_resp_bits_target_T_96 = _io_resp_bits_target_T_82 == 3'h7 ? pagesMasked_5 : _io_resp_bits_target_T_94;
  wire [12:0] _io_resp_bits_target_T_125 = idxHit[0] ? tgts_0 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_126 = idxHit[1] ? tgts_1 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_127 = idxHit[2] ? tgts_2 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_128 = idxHit[3] ? tgts_3 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_129 = idxHit[4] ? tgts_4 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_130 = idxHit[5] ? tgts_5 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_131 = idxHit[6] ? tgts_6 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_132 = idxHit[7] ? tgts_7 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_133 = idxHit[8] ? tgts_8 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_134 = idxHit[9] ? tgts_9 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_135 = idxHit[10] ? tgts_10 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_136 = idxHit[11] ? tgts_11 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_137 = idxHit[12] ? tgts_12 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_138 = idxHit[13] ? tgts_13 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_139 = idxHit[14] ? tgts_14 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_140 = idxHit[15] ? tgts_15 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_141 = idxHit[16] ? tgts_16 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_142 = idxHit[17] ? tgts_17 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_143 = idxHit[18] ? tgts_18 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_144 = idxHit[19] ? tgts_19 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_145 = idxHit[20] ? tgts_20 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_146 = idxHit[21] ? tgts_21 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_147 = idxHit[22] ? tgts_22 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_148 = idxHit[23] ? tgts_23 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_149 = idxHit[24] ? tgts_24 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_150 = idxHit[25] ? tgts_25 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_151 = idxHit[26] ? tgts_26 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_152 = idxHit[27] ? tgts_27 : 13'h0;
  wire [12:0] _io_resp_bits_target_T_153 = _io_resp_bits_target_T_125 | _io_resp_bits_target_T_126;
  wire [12:0] _io_resp_bits_target_T_154 = _io_resp_bits_target_T_153 | _io_resp_bits_target_T_127;
  wire [12:0] _io_resp_bits_target_T_155 = _io_resp_bits_target_T_154 | _io_resp_bits_target_T_128;
  wire [12:0] _io_resp_bits_target_T_156 = _io_resp_bits_target_T_155 | _io_resp_bits_target_T_129;
  wire [12:0] _io_resp_bits_target_T_157 = _io_resp_bits_target_T_156 | _io_resp_bits_target_T_130;
  wire [12:0] _io_resp_bits_target_T_158 = _io_resp_bits_target_T_157 | _io_resp_bits_target_T_131;
  wire [12:0] _io_resp_bits_target_T_159 = _io_resp_bits_target_T_158 | _io_resp_bits_target_T_132;
  wire [12:0] _io_resp_bits_target_T_160 = _io_resp_bits_target_T_159 | _io_resp_bits_target_T_133;
  wire [12:0] _io_resp_bits_target_T_161 = _io_resp_bits_target_T_160 | _io_resp_bits_target_T_134;
  wire [12:0] _io_resp_bits_target_T_162 = _io_resp_bits_target_T_161 | _io_resp_bits_target_T_135;
  wire [12:0] _io_resp_bits_target_T_163 = _io_resp_bits_target_T_162 | _io_resp_bits_target_T_136;
  wire [12:0] _io_resp_bits_target_T_164 = _io_resp_bits_target_T_163 | _io_resp_bits_target_T_137;
  wire [12:0] _io_resp_bits_target_T_165 = _io_resp_bits_target_T_164 | _io_resp_bits_target_T_138;
  wire [12:0] _io_resp_bits_target_T_166 = _io_resp_bits_target_T_165 | _io_resp_bits_target_T_139;
  wire [12:0] _io_resp_bits_target_T_167 = _io_resp_bits_target_T_166 | _io_resp_bits_target_T_140;
  wire [12:0] _io_resp_bits_target_T_168 = _io_resp_bits_target_T_167 | _io_resp_bits_target_T_141;
  wire [12:0] _io_resp_bits_target_T_169 = _io_resp_bits_target_T_168 | _io_resp_bits_target_T_142;
  wire [12:0] _io_resp_bits_target_T_170 = _io_resp_bits_target_T_169 | _io_resp_bits_target_T_143;
  wire [12:0] _io_resp_bits_target_T_171 = _io_resp_bits_target_T_170 | _io_resp_bits_target_T_144;
  wire [12:0] _io_resp_bits_target_T_172 = _io_resp_bits_target_T_171 | _io_resp_bits_target_T_145;
  wire [12:0] _io_resp_bits_target_T_173 = _io_resp_bits_target_T_172 | _io_resp_bits_target_T_146;
  wire [12:0] _io_resp_bits_target_T_174 = _io_resp_bits_target_T_173 | _io_resp_bits_target_T_147;
  wire [12:0] _io_resp_bits_target_T_175 = _io_resp_bits_target_T_174 | _io_resp_bits_target_T_148;
  wire [12:0] _io_resp_bits_target_T_176 = _io_resp_bits_target_T_175 | _io_resp_bits_target_T_149;
  wire [12:0] _io_resp_bits_target_T_177 = _io_resp_bits_target_T_176 | _io_resp_bits_target_T_150;
  wire [12:0] _io_resp_bits_target_T_178 = _io_resp_bits_target_T_177 | _io_resp_bits_target_T_151;
  wire [12:0] _io_resp_bits_target_T_179 = _io_resp_bits_target_T_178 | _io_resp_bits_target_T_152;
  wire [13:0] _io_resp_bits_target_T_180 = {_io_resp_bits_target_T_179, 1'h0};
  wire [31:0] _io_resp_bits_target_T_181 = {_io_resp_bits_target_T_96,_io_resp_bits_target_T_180};
  wire [11:0] io_resp_bits_entry_hi = idxHit[27:16];
  wire [15:0] io_resp_bits_entry_lo = idxHit[15:0];
  wire  _io_resp_bits_entry_T = |io_resp_bits_entry_hi;
  wire [15:0] _GEN_436 = {{4'd0}, io_resp_bits_entry_hi};
  wire [15:0] _io_resp_bits_entry_T_1 = _GEN_436 | io_resp_bits_entry_lo;
  wire [7:0] io_resp_bits_entry_hi_1 = _io_resp_bits_entry_T_1[15:8];
  wire [7:0] io_resp_bits_entry_lo_1 = _io_resp_bits_entry_T_1[7:0];
  wire  _io_resp_bits_entry_T_2 = |io_resp_bits_entry_hi_1;
  wire [7:0] _io_resp_bits_entry_T_3 = io_resp_bits_entry_hi_1 | io_resp_bits_entry_lo_1;
  wire [3:0] io_resp_bits_entry_hi_2 = _io_resp_bits_entry_T_3[7:4];
  wire [3:0] io_resp_bits_entry_lo_2 = _io_resp_bits_entry_T_3[3:0];
  wire  _io_resp_bits_entry_T_4 = |io_resp_bits_entry_hi_2;
  wire [3:0] _io_resp_bits_entry_T_5 = io_resp_bits_entry_hi_2 | io_resp_bits_entry_lo_2;
  wire [1:0] io_resp_bits_entry_hi_3 = _io_resp_bits_entry_T_5[3:2];
  wire [1:0] io_resp_bits_entry_lo_3 = _io_resp_bits_entry_T_5[1:0];
  wire  _io_resp_bits_entry_T_6 = |io_resp_bits_entry_hi_3;
  wire [1:0] _io_resp_bits_entry_T_7 = io_resp_bits_entry_hi_3 | io_resp_bits_entry_lo_3;
  wire [3:0] _io_resp_bits_entry_T_11 = {_io_resp_bits_entry_T_2,_io_resp_bits_entry_T_4,_io_resp_bits_entry_T_6,
    _io_resp_bits_entry_T_7[1]};
  wire  _io_resp_bits_bridx_T_43 = idxHit[15] & brIdx_15;
  wire  _io_resp_bits_bridx_T_70 = idxHit[0] & brIdx_0 | idxHit[1] & brIdx_1 | idxHit[2] & brIdx_2 | idxHit[3] & brIdx_3
     | idxHit[4] & brIdx_4 | idxHit[5] & brIdx_5 | idxHit[6] & brIdx_6 | idxHit[7] & brIdx_7 | idxHit[8] & brIdx_8 |
    idxHit[9] & brIdx_9 | idxHit[10] & brIdx_10 | idxHit[11] & brIdx_11 | idxHit[12] & brIdx_12 | idxHit[13] & brIdx_13
     | idxHit[14] & brIdx_14 | _io_resp_bits_bridx_T_43;
  wire  leftOne = idxHit[0];
  wire  leftOne_1 = idxHit[1];
  wire  rightOne = idxHit[2];
  wire  rightOne_1 = leftOne_1 | rightOne;
  wire  rightTwo = leftOne_1 & rightOne;
  wire  leftOne_2 = leftOne | rightOne_1;
  wire  leftTwo = rightTwo | leftOne & rightOne_1;
  wire  leftOne_3 = idxHit[3];
  wire  rightOne_2 = idxHit[4];
  wire  leftOne_4 = leftOne_3 | rightOne_2;
  wire  leftTwo_1 = leftOne_3 & rightOne_2;
  wire  leftOne_5 = idxHit[5];
  wire  rightOne_3 = idxHit[6];
  wire  rightOne_4 = leftOne_5 | rightOne_3;
  wire  rightTwo_1 = leftOne_5 & rightOne_3;
  wire  rightOne_5 = leftOne_4 | rightOne_4;
  wire  rightTwo_2 = leftTwo_1 | rightTwo_1 | leftOne_4 & rightOne_4;
  wire  leftOne_6 = leftOne_2 | rightOne_5;
  wire  leftTwo_2 = leftTwo | rightTwo_2 | leftOne_2 & rightOne_5;
  wire  leftOne_7 = idxHit[7];
  wire  leftOne_8 = idxHit[8];
  wire  rightOne_6 = idxHit[9];
  wire  rightOne_7 = leftOne_8 | rightOne_6;
  wire  rightTwo_3 = leftOne_8 & rightOne_6;
  wire  leftOne_9 = leftOne_7 | rightOne_7;
  wire  leftTwo_3 = rightTwo_3 | leftOne_7 & rightOne_7;
  wire  leftOne_10 = idxHit[10];
  wire  rightOne_8 = idxHit[11];
  wire  leftOne_11 = leftOne_10 | rightOne_8;
  wire  leftTwo_4 = leftOne_10 & rightOne_8;
  wire  leftOne_12 = idxHit[12];
  wire  rightOne_9 = idxHit[13];
  wire  rightOne_10 = leftOne_12 | rightOne_9;
  wire  rightTwo_4 = leftOne_12 & rightOne_9;
  wire  rightOne_11 = leftOne_11 | rightOne_10;
  wire  rightTwo_5 = leftTwo_4 | rightTwo_4 | leftOne_11 & rightOne_10;
  wire  rightOne_12 = leftOne_9 | rightOne_11;
  wire  rightTwo_6 = leftTwo_3 | rightTwo_5 | leftOne_9 & rightOne_11;
  wire  leftOne_13 = leftOne_6 | rightOne_12;
  wire  leftTwo_5 = leftTwo_2 | rightTwo_6 | leftOne_6 & rightOne_12;
  wire  leftOne_14 = idxHit[14];
  wire  leftOne_15 = idxHit[15];
  wire  rightOne_13 = idxHit[16];
  wire  rightOne_14 = leftOne_15 | rightOne_13;
  wire  rightTwo_7 = leftOne_15 & rightOne_13;
  wire  leftOne_16 = leftOne_14 | rightOne_14;
  wire  leftTwo_6 = rightTwo_7 | leftOne_14 & rightOne_14;
  wire  leftOne_17 = idxHit[17];
  wire  rightOne_15 = idxHit[18];
  wire  leftOne_18 = leftOne_17 | rightOne_15;
  wire  leftTwo_7 = leftOne_17 & rightOne_15;
  wire  leftOne_19 = idxHit[19];
  wire  rightOne_16 = idxHit[20];
  wire  rightOne_17 = leftOne_19 | rightOne_16;
  wire  rightTwo_8 = leftOne_19 & rightOne_16;
  wire  rightOne_18 = leftOne_18 | rightOne_17;
  wire  rightTwo_9 = leftTwo_7 | rightTwo_8 | leftOne_18 & rightOne_17;
  wire  leftOne_20 = leftOne_16 | rightOne_18;
  wire  leftTwo_8 = leftTwo_6 | rightTwo_9 | leftOne_16 & rightOne_18;
  wire  leftOne_21 = idxHit[21];
  wire  leftOne_22 = idxHit[22];
  wire  rightOne_19 = idxHit[23];
  wire  rightOne_20 = leftOne_22 | rightOne_19;
  wire  rightTwo_10 = leftOne_22 & rightOne_19;
  wire  leftOne_23 = leftOne_21 | rightOne_20;
  wire  leftTwo_9 = rightTwo_10 | leftOne_21 & rightOne_20;
  wire  leftOne_24 = idxHit[24];
  wire  rightOne_21 = idxHit[25];
  wire  leftOne_25 = leftOne_24 | rightOne_21;
  wire  leftTwo_10 = leftOne_24 & rightOne_21;
  wire  leftOne_26 = idxHit[26];
  wire  rightOne_22 = idxHit[27];
  wire  rightOne_23 = leftOne_26 | rightOne_22;
  wire  rightTwo_11 = leftOne_26 & rightOne_22;
  wire  rightOne_24 = leftOne_25 | rightOne_23;
  wire  rightTwo_12 = leftTwo_10 | rightTwo_11 | leftOne_25 & rightOne_23;
  wire  rightOne_25 = leftOne_23 | rightOne_24;
  wire  rightTwo_13 = leftTwo_9 | rightTwo_12 | leftOne_23 & rightOne_24;
  wire  rightOne_26 = leftOne_20 | rightOne_25;
  wire  rightTwo_14 = leftTwo_8 | rightTwo_13 | leftOne_20 & rightOne_25;
  wire  _T_128 = leftTwo_5 | rightTwo_14 | leftOne_13 & rightOne_26;
  wire [27:0] _isValid_T_4 = ~idxHit;
  wire [27:0] _isValid_T_5 = isValid & _isValid_T_4;
  wire [31:0] _GEN_374 = _T_128 ? {{4'd0}, _isValid_T_5} : _GEN_338;
  wire [31:0] _GEN_375 = io_flush ? 32'h0 : _GEN_374;
  reg [7:0] history;
  reg [9:0] reset_waddr;
  wire  resetting = ~reset_waddr[9];
  wire [9:0] _reset_waddr_T_1 = reset_waddr + 10'h1;
  wire [29:0] waddr_hi = io_bht_update_bits_pc[31:2];
  wire [8:0] _GEN_437 = {{7'd0}, waddr_hi[10:9]};
  wire [8:0] _waddr_T_43 = waddr_hi[8:0] ^ _GEN_437;
  wire [15:0] _waddr_T_44 = 8'hdd * io_bht_update_bits_prediction_history;
  wire [8:0] _waddr_T_46 = {_waddr_T_44[7:5], 6'h0};
  wire [8:0] _waddr_T_47 = _waddr_T_43 ^ _waddr_T_46;
  wire [9:0] _GEN_383 = ~resetting ? {{1'd0}, _waddr_T_47} : reset_waddr;
  wire [9:0] _GEN_388 = io_bht_update_bits_branch ? _GEN_383 : reset_waddr;
  wire [9:0] waddr_1 = io_bht_update_valid ? _GEN_388 : reset_waddr;
  wire  _GEN_387 = io_bht_update_bits_branch | resetting;
  wire  _GEN_384 = ~resetting & io_bht_update_bits_taken;
  wire  _GEN_389 = io_bht_update_bits_branch & _GEN_384;
  wire  _isBranch_T = cfiType_0 == 2'h0;
  wire  _isBranch_T_1 = cfiType_1 == 2'h0;
  wire  _isBranch_T_2 = cfiType_2 == 2'h0;
  wire  _isBranch_T_3 = cfiType_3 == 2'h0;
  wire  _isBranch_T_4 = cfiType_4 == 2'h0;
  wire  _isBranch_T_5 = cfiType_5 == 2'h0;
  wire  _isBranch_T_6 = cfiType_6 == 2'h0;
  wire  _isBranch_T_7 = cfiType_7 == 2'h0;
  wire  _isBranch_T_8 = cfiType_8 == 2'h0;
  wire  _isBranch_T_9 = cfiType_9 == 2'h0;
  wire  _isBranch_T_10 = cfiType_10 == 2'h0;
  wire  _isBranch_T_11 = cfiType_11 == 2'h0;
  wire  _isBranch_T_12 = cfiType_12 == 2'h0;
  wire  _isBranch_T_13 = cfiType_13 == 2'h0;
  wire  _isBranch_T_14 = cfiType_14 == 2'h0;
  wire  _isBranch_T_15 = cfiType_15 == 2'h0;
  wire  _isBranch_T_16 = cfiType_16 == 2'h0;
  wire  _isBranch_T_17 = cfiType_17 == 2'h0;
  wire  _isBranch_T_18 = cfiType_18 == 2'h0;
  wire  _isBranch_T_19 = cfiType_19 == 2'h0;
  wire  _isBranch_T_20 = cfiType_20 == 2'h0;
  wire  _isBranch_T_21 = cfiType_21 == 2'h0;
  wire  _isBranch_T_22 = cfiType_22 == 2'h0;
  wire  _isBranch_T_23 = cfiType_23 == 2'h0;
  wire  _isBranch_T_24 = cfiType_24 == 2'h0;
  wire  _isBranch_T_25 = cfiType_25 == 2'h0;
  wire  _isBranch_T_26 = cfiType_26 == 2'h0;
  wire  _isBranch_T_27 = cfiType_27 == 2'h0;
  wire [6:0] isBranch_lo_lo = {_isBranch_T_6,_isBranch_T_5,_isBranch_T_4,_isBranch_T_3,_isBranch_T_2,_isBranch_T_1,
    _isBranch_T};
  wire [13:0] isBranch_lo = {_isBranch_T_13,_isBranch_T_12,_isBranch_T_11,_isBranch_T_10,_isBranch_T_9,_isBranch_T_8,
    _isBranch_T_7,isBranch_lo_lo};
  wire [6:0] isBranch_hi_lo = {_isBranch_T_20,_isBranch_T_19,_isBranch_T_18,_isBranch_T_17,_isBranch_T_16,_isBranch_T_15
    ,_isBranch_T_14};
  wire [27:0] _isBranch_T_28 = {_isBranch_T_27,_isBranch_T_26,_isBranch_T_25,_isBranch_T_24,_isBranch_T_23,
    _isBranch_T_22,_isBranch_T_21,isBranch_hi_lo,isBranch_lo};
  wire [27:0] _isBranch_T_29 = idxHit & _isBranch_T_28;
  wire  isBranch = |_isBranch_T_29;
  wire [29:0] res_res_value_hi = io_req_bits_addr[31:2];
  wire [8:0] _GEN_438 = {{7'd0}, res_res_value_hi[10:9]};
  wire [8:0] _res_res_value_T_3 = res_res_value_hi[8:0] ^ _GEN_438;
  wire [15:0] _res_res_value_T_4 = 8'hdd * history;
  wire [8:0] _res_res_value_T_6 = {_res_res_value_T_4[7:5], 6'h0};
  wire  res_value = resetting ? 1'h0 : table__res_res_value_MPORT_data;
  wire [7:0] _history_T_1 = {io_bht_advance_bits_bht_value,history[7:1]};
  wire [7:0] _GEN_382 = io_bht_advance_valid ? _history_T_1 : history;
  wire [7:0] _history_T_3 = {io_bht_update_bits_taken,io_bht_update_bits_prediction_history[7:1]};
  reg [2:0] count;
  reg [2:0] pos;
  reg [31:0] stack_0;
  reg [31:0] stack_1;
  reg [31:0] stack_2;
  reg [31:0] stack_3;
  reg [31:0] stack_4;
  reg [31:0] stack_5;
  wire  _doPeek_T = cfiType_0 == 2'h3;
  wire  _doPeek_T_1 = cfiType_1 == 2'h3;
  wire  _doPeek_T_2 = cfiType_2 == 2'h3;
  wire  _doPeek_T_3 = cfiType_3 == 2'h3;
  wire  _doPeek_T_4 = cfiType_4 == 2'h3;
  wire  _doPeek_T_5 = cfiType_5 == 2'h3;
  wire  _doPeek_T_6 = cfiType_6 == 2'h3;
  wire  _doPeek_T_7 = cfiType_7 == 2'h3;
  wire  _doPeek_T_8 = cfiType_8 == 2'h3;
  wire  _doPeek_T_9 = cfiType_9 == 2'h3;
  wire  _doPeek_T_10 = cfiType_10 == 2'h3;
  wire  _doPeek_T_11 = cfiType_11 == 2'h3;
  wire  _doPeek_T_12 = cfiType_12 == 2'h3;
  wire  _doPeek_T_13 = cfiType_13 == 2'h3;
  wire  _doPeek_T_14 = cfiType_14 == 2'h3;
  wire  _doPeek_T_15 = cfiType_15 == 2'h3;
  wire  _doPeek_T_16 = cfiType_16 == 2'h3;
  wire  _doPeek_T_17 = cfiType_17 == 2'h3;
  wire  _doPeek_T_18 = cfiType_18 == 2'h3;
  wire  _doPeek_T_19 = cfiType_19 == 2'h3;
  wire  _doPeek_T_20 = cfiType_20 == 2'h3;
  wire  _doPeek_T_21 = cfiType_21 == 2'h3;
  wire  _doPeek_T_22 = cfiType_22 == 2'h3;
  wire  _doPeek_T_23 = cfiType_23 == 2'h3;
  wire  _doPeek_T_24 = cfiType_24 == 2'h3;
  wire  _doPeek_T_25 = cfiType_25 == 2'h3;
  wire  _doPeek_T_26 = cfiType_26 == 2'h3;
  wire  _doPeek_T_27 = cfiType_27 == 2'h3;
  wire [6:0] doPeek_lo_lo = {_doPeek_T_6,_doPeek_T_5,_doPeek_T_4,_doPeek_T_3,_doPeek_T_2,_doPeek_T_1,_doPeek_T};
  wire [13:0] doPeek_lo = {_doPeek_T_13,_doPeek_T_12,_doPeek_T_11,_doPeek_T_10,_doPeek_T_9,_doPeek_T_8,_doPeek_T_7,
    doPeek_lo_lo};
  wire [6:0] doPeek_hi_lo = {_doPeek_T_20,_doPeek_T_19,_doPeek_T_18,_doPeek_T_17,_doPeek_T_16,_doPeek_T_15,_doPeek_T_14}
    ;
  wire [27:0] _doPeek_T_28 = {_doPeek_T_27,_doPeek_T_26,_doPeek_T_25,_doPeek_T_24,_doPeek_T_23,_doPeek_T_22,_doPeek_T_21
    ,doPeek_hi_lo,doPeek_lo};
  wire [27:0] _doPeek_T_29 = idxHit & _doPeek_T_28;
  wire  doPeek = |_doPeek_T_29;
  wire  _io_ras_head_valid_T = count == 3'h0;
  wire  _io_ras_head_valid_T_1 = ~_io_ras_head_valid_T;
  wire [31:0] _GEN_397 = 3'h1 == pos ? stack_1 : stack_0;
  wire [31:0] _GEN_398 = 3'h2 == pos ? stack_2 : _GEN_397;
  wire [31:0] _GEN_399 = 3'h3 == pos ? stack_3 : _GEN_398;
  wire [31:0] _GEN_400 = 3'h4 == pos ? stack_4 : _GEN_399;
  wire [31:0] _GEN_401 = 3'h5 == pos ? stack_5 : _GEN_400;
  wire [2:0] _count_T_1 = count + 3'h1;
  wire [2:0] _nextPos_T_3 = pos + 3'h1;
  wire [2:0] nextPos = pos < 3'h5 ? _nextPos_T_3 : 3'h0;
  wire [2:0] _count_T_3 = count - 3'h1;
  wire [2:0] _pos_T_3 = pos - 3'h1;
  wire [2:0] _pos_T_4 = pos > 3'h0 ? _pos_T_3 : 3'h5;
  wire [2:0] _GEN_410 = _io_ras_head_valid_T_1 ? _count_T_3 : count;
  wire [2:0] _GEN_411 = _io_ras_head_valid_T_1 ? _pos_T_4 : pos;
  assign table__res_res_value_MPORT_en = 1'h1;
  assign table__res_res_value_MPORT_addr = _res_res_value_T_3 ^ _res_res_value_T_6;
  assign table__res_res_value_MPORT_data = table_[table__res_res_value_MPORT_addr];
  assign table__MPORT_data = io_bht_update_valid & _GEN_389;
  assign table__MPORT_addr = waddr_1[8:0];
  assign table__MPORT_mask = 1'h1;
  assign table__MPORT_en = io_bht_update_valid ? _GEN_387 : resetting;
  assign io_resp_valid = _io_resp_valid_T_84[0];
  assign io_resp_bits_taken = ~res_value & isBranch ? 1'h0 : 1'h1;
  assign io_resp_bits_bridx = _io_resp_bits_bridx_T_70 | idxHit[16] & brIdx_16 | idxHit[17] & brIdx_17 | idxHit[18] &
    brIdx_18 | idxHit[19] & brIdx_19 | idxHit[20] & brIdx_20 | idxHit[21] & brIdx_21 | idxHit[22] & brIdx_22 | idxHit[23
    ] & brIdx_23 | idxHit[24] & brIdx_24 | idxHit[25] & brIdx_25 | idxHit[26] & brIdx_26 | idxHit[27] & brIdx_27;
  assign io_resp_bits_target = _io_ras_head_valid_T_1 & doPeek ? _GEN_401 : _io_resp_bits_target_T_181;
  assign io_resp_bits_entry = {_io_resp_bits_entry_T,_io_resp_bits_entry_T_11};
  assign io_resp_bits_bht_history = history;
  assign io_resp_bits_bht_value = resetting ? 1'h0 : table__res_res_value_MPORT_data;
  assign io_ras_head_valid = ~_io_ras_head_valid_T;
  assign io_ras_head_bits = 3'h5 == pos ? stack_5 : _GEN_400;
  always @(posedge clock) begin
    if (table__MPORT_en & table__MPORT_mask) begin
      table_[table__MPORT_addr] <= table__MPORT_data;
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h0 == waddr) begin
        idxs_0 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1 == waddr) begin
        idxs_1 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h2 == waddr) begin
        idxs_2 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h3 == waddr) begin
        idxs_3 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h4 == waddr) begin
        idxs_4 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h5 == waddr) begin
        idxs_5 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h6 == waddr) begin
        idxs_6 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h7 == waddr) begin
        idxs_7 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h8 == waddr) begin
        idxs_8 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h9 == waddr) begin
        idxs_9 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'ha == waddr) begin
        idxs_10 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hb == waddr) begin
        idxs_11 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hc == waddr) begin
        idxs_12 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hd == waddr) begin
        idxs_13 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'he == waddr) begin
        idxs_14 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hf == waddr) begin
        idxs_15 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h10 == waddr) begin
        idxs_16 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h11 == waddr) begin
        idxs_17 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h12 == waddr) begin
        idxs_18 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h13 == waddr) begin
        idxs_19 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h14 == waddr) begin
        idxs_20 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h15 == waddr) begin
        idxs_21 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h16 == waddr) begin
        idxs_22 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h17 == waddr) begin
        idxs_23 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h18 == waddr) begin
        idxs_24 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h19 == waddr) begin
        idxs_25 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1a == waddr) begin
        idxs_26 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1b == waddr) begin
        idxs_27 <= r_btb_updatePipe_bits_pc[13:1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h0 == waddr) begin
        idxPages_0 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1 == waddr) begin
        idxPages_1 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h2 == waddr) begin
        idxPages_2 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h3 == waddr) begin
        idxPages_3 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h4 == waddr) begin
        idxPages_4 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h5 == waddr) begin
        idxPages_5 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h6 == waddr) begin
        idxPages_6 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h7 == waddr) begin
        idxPages_7 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h8 == waddr) begin
        idxPages_8 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h9 == waddr) begin
        idxPages_9 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'ha == waddr) begin
        idxPages_10 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hb == waddr) begin
        idxPages_11 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hc == waddr) begin
        idxPages_12 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hd == waddr) begin
        idxPages_13 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'he == waddr) begin
        idxPages_14 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hf == waddr) begin
        idxPages_15 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h10 == waddr) begin
        idxPages_16 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h11 == waddr) begin
        idxPages_17 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h12 == waddr) begin
        idxPages_18 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h13 == waddr) begin
        idxPages_19 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h14 == waddr) begin
        idxPages_20 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h15 == waddr) begin
        idxPages_21 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h16 == waddr) begin
        idxPages_22 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h17 == waddr) begin
        idxPages_23 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h18 == waddr) begin
        idxPages_24 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h19 == waddr) begin
        idxPages_25 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1a == waddr) begin
        idxPages_26 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1b == waddr) begin
        idxPages_27 <= _idxPages_T[2:0];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h0 == waddr) begin
        tgts_0 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1 == waddr) begin
        tgts_1 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h2 == waddr) begin
        tgts_2 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h3 == waddr) begin
        tgts_3 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h4 == waddr) begin
        tgts_4 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h5 == waddr) begin
        tgts_5 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h6 == waddr) begin
        tgts_6 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h7 == waddr) begin
        tgts_7 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h8 == waddr) begin
        tgts_8 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h9 == waddr) begin
        tgts_9 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'ha == waddr) begin
        tgts_10 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hb == waddr) begin
        tgts_11 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hc == waddr) begin
        tgts_12 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hd == waddr) begin
        tgts_13 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'he == waddr) begin
        tgts_14 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hf == waddr) begin
        tgts_15 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h10 == waddr) begin
        tgts_16 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h11 == waddr) begin
        tgts_17 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h12 == waddr) begin
        tgts_18 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h13 == waddr) begin
        tgts_19 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h14 == waddr) begin
        tgts_20 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h15 == waddr) begin
        tgts_21 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h16 == waddr) begin
        tgts_22 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h17 == waddr) begin
        tgts_23 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h18 == waddr) begin
        tgts_24 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h19 == waddr) begin
        tgts_25 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1a == waddr) begin
        tgts_26 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1b == waddr) begin
        tgts_27 <= idxHit_idx;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h0 == waddr) begin
        tgtPages_0 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1 == waddr) begin
        tgtPages_1 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h2 == waddr) begin
        tgtPages_2 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h3 == waddr) begin
        tgtPages_3 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h4 == waddr) begin
        tgtPages_4 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h5 == waddr) begin
        tgtPages_5 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h6 == waddr) begin
        tgtPages_6 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h7 == waddr) begin
        tgtPages_7 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h8 == waddr) begin
        tgtPages_8 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h9 == waddr) begin
        tgtPages_9 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'ha == waddr) begin
        tgtPages_10 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hb == waddr) begin
        tgtPages_11 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hc == waddr) begin
        tgtPages_12 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hd == waddr) begin
        tgtPages_13 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'he == waddr) begin
        tgtPages_14 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hf == waddr) begin
        tgtPages_15 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h10 == waddr) begin
        tgtPages_16 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h11 == waddr) begin
        tgtPages_17 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h12 == waddr) begin
        tgtPages_18 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h13 == waddr) begin
        tgtPages_19 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h14 == waddr) begin
        tgtPages_20 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h15 == waddr) begin
        tgtPages_21 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h16 == waddr) begin
        tgtPages_22 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h17 == waddr) begin
        tgtPages_23 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h18 == waddr) begin
        tgtPages_24 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h19 == waddr) begin
        tgtPages_25 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1a == waddr) begin
        tgtPages_26 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1b == waddr) begin
        tgtPages_27 <= tgtPageUpdate;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (_T_5[0]) begin
        if (idxWritesEven) begin
          pages_0 <= updatePageHit_p;
        end else begin
          pages_0 <= pageHit_p;
        end
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (_T_12[1]) begin
        if (idxWritesEven) begin
          pages_1 <= pageHit_p;
        end else begin
          pages_1 <= updatePageHit_p;
        end
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (_T_5[2]) begin
        if (idxWritesEven) begin
          pages_2 <= updatePageHit_p;
        end else begin
          pages_2 <= pageHit_p;
        end
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (_T_12[3]) begin
        if (idxWritesEven) begin
          pages_3 <= pageHit_p;
        end else begin
          pages_3 <= updatePageHit_p;
        end
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (_T_5[4]) begin
        if (idxWritesEven) begin
          pages_4 <= updatePageHit_p;
        end else begin
          pages_4 <= pageHit_p;
        end
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (_T_12[5]) begin
        if (idxWritesEven) begin
          pages_5 <= pageHit_p;
        end else begin
          pages_5 <= updatePageHit_p;
        end
      end
    end
    if (reset) begin
      pageValid <= 6'h0;
    end else begin
      pageValid <= _GEN_373[5:0];
    end
    if (reset) begin
      isValid <= 28'h0;
    end else begin
      isValid <= _GEN_375[27:0];
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h0 == waddr) begin
        cfiType_0 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1 == waddr) begin
        cfiType_1 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h2 == waddr) begin
        cfiType_2 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h3 == waddr) begin
        cfiType_3 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h4 == waddr) begin
        cfiType_4 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h5 == waddr) begin
        cfiType_5 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h6 == waddr) begin
        cfiType_6 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h7 == waddr) begin
        cfiType_7 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h8 == waddr) begin
        cfiType_8 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h9 == waddr) begin
        cfiType_9 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'ha == waddr) begin
        cfiType_10 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hb == waddr) begin
        cfiType_11 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hc == waddr) begin
        cfiType_12 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hd == waddr) begin
        cfiType_13 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'he == waddr) begin
        cfiType_14 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hf == waddr) begin
        cfiType_15 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h10 == waddr) begin
        cfiType_16 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h11 == waddr) begin
        cfiType_17 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h12 == waddr) begin
        cfiType_18 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h13 == waddr) begin
        cfiType_19 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h14 == waddr) begin
        cfiType_20 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h15 == waddr) begin
        cfiType_21 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h16 == waddr) begin
        cfiType_22 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h17 == waddr) begin
        cfiType_23 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h18 == waddr) begin
        cfiType_24 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h19 == waddr) begin
        cfiType_25 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1a == waddr) begin
        cfiType_26 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1b == waddr) begin
        cfiType_27 <= r_btb_updatePipe_bits_cfiType;
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h0 == waddr) begin
        brIdx_0 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1 == waddr) begin
        brIdx_1 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h2 == waddr) begin
        brIdx_2 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h3 == waddr) begin
        brIdx_3 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h4 == waddr) begin
        brIdx_4 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h5 == waddr) begin
        brIdx_5 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h6 == waddr) begin
        brIdx_6 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h7 == waddr) begin
        brIdx_7 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h8 == waddr) begin
        brIdx_8 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h9 == waddr) begin
        brIdx_9 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'ha == waddr) begin
        brIdx_10 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hb == waddr) begin
        brIdx_11 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hc == waddr) begin
        brIdx_12 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hd == waddr) begin
        brIdx_13 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'he == waddr) begin
        brIdx_14 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'hf == waddr) begin
        brIdx_15 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h10 == waddr) begin
        brIdx_16 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h11 == waddr) begin
        brIdx_17 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h12 == waddr) begin
        brIdx_18 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h13 == waddr) begin
        brIdx_19 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h14 == waddr) begin
        brIdx_20 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h15 == waddr) begin
        brIdx_21 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h16 == waddr) begin
        brIdx_22 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h17 == waddr) begin
        brIdx_23 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h18 == waddr) begin
        brIdx_24 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h19 == waddr) begin
        brIdx_25 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1a == waddr) begin
        brIdx_26 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (r_btb_updatePipe_valid) begin
      if (5'h1b == waddr) begin
        brIdx_27 <= r_btb_updatePipe_bits_br_pc[1];
      end
    end
    if (reset) begin
      r_btb_updatePipe_valid <= 1'h0;
    end else begin
      r_btb_updatePipe_valid <= io_btb_update_valid;
    end
    if (io_btb_update_valid) begin
      r_btb_updatePipe_bits_prediction_entry <= io_btb_update_bits_prediction_entry;
    end
    if (io_btb_update_valid) begin
      r_btb_updatePipe_bits_pc <= io_btb_update_bits_pc;
    end
    if (io_btb_update_valid) begin
      r_btb_updatePipe_bits_isValid <= io_btb_update_bits_isValid;
    end
    if (io_btb_update_valid) begin
      r_btb_updatePipe_bits_br_pc <= io_btb_update_bits_br_pc;
    end
    if (io_btb_update_valid) begin
      r_btb_updatePipe_bits_cfiType <= io_btb_update_bits_cfiType;
    end
    if (reset) begin
      nextPageRepl <= 3'h0;
    end else if (r_btb_updatePipe_valid & (doIdxPageRepl | doTgtPageRepl)) begin
      if (next >= 3'h6) begin
        nextPageRepl <= {{2'd0}, next[0]};
      end else begin
        nextPageRepl <= next;
      end
    end
    if (reset) begin
      state_reg <= 27'h0;
    end else if (r_respPipe_valid & r_respPipe_bits_taken | r_btb_updatePipe_valid) begin
      state_reg <= _state_reg_T_92;
    end
    if (reset) begin
      r_respPipe_valid <= 1'h0;
    end else begin
      r_respPipe_valid <= io_resp_valid;
    end
    if (io_resp_valid) begin
      r_respPipe_bits_taken <= io_resp_bits_taken;
    end
    if (io_resp_valid) begin
      r_respPipe_bits_entry <= io_resp_bits_entry;
    end
    if (reset) begin
      history <= 8'h0;
    end else if (io_bht_update_valid) begin
      if (io_bht_update_bits_branch) begin
        if (io_bht_update_bits_mispredict) begin
          history <= _history_T_3;
        end else begin
          history <= _GEN_382;
        end
      end else if (io_bht_update_bits_mispredict) begin
        history <= io_bht_update_bits_prediction_history;
      end else begin
        history <= _GEN_382;
      end
    end else begin
      history <= _GEN_382;
    end
    if (reset) begin
      reset_waddr <= 10'h0;
    end else if (resetting) begin
      reset_waddr <= _reset_waddr_T_1;
    end
    if (reset) begin
      count <= 3'h0;
    end else if (io_ras_update_valid) begin
      if (io_ras_update_bits_cfiType == 2'h2) begin
        if (count < 3'h6) begin
          count <= _count_T_1;
        end
      end else if (io_ras_update_bits_cfiType == 2'h3) begin
        count <= _GEN_410;
      end
    end
    if (reset) begin
      pos <= 3'h0;
    end else if (io_ras_update_valid) begin
      if (io_ras_update_bits_cfiType == 2'h2) begin
        if (pos < 3'h5) begin
          pos <= _nextPos_T_3;
        end else begin
          pos <= 3'h0;
        end
      end else if (io_ras_update_bits_cfiType == 2'h3) begin
        pos <= _GEN_411;
      end
    end
    if (io_ras_update_valid) begin
      if (io_ras_update_bits_cfiType == 2'h2) begin
        if (3'h0 == nextPos) begin
          stack_0 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (io_ras_update_bits_cfiType == 2'h2) begin
        if (3'h1 == nextPos) begin
          stack_1 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (io_ras_update_bits_cfiType == 2'h2) begin
        if (3'h2 == nextPos) begin
          stack_2 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (io_ras_update_bits_cfiType == 2'h2) begin
        if (3'h3 == nextPos) begin
          stack_3 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (io_ras_update_bits_cfiType == 2'h2) begin
        if (3'h4 == nextPos) begin
          stack_4 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (io_ras_update_bits_cfiType == 2'h2) begin
        if (3'h5 == nextPos) begin
          stack_5 <= io_ras_update_bits_returnAddr;
        end
      end
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    table_[initvar] = _RAND_0[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  idxs_0 = _RAND_1[12:0];
  _RAND_2 = {1{`RANDOM}};
  idxs_1 = _RAND_2[12:0];
  _RAND_3 = {1{`RANDOM}};
  idxs_2 = _RAND_3[12:0];
  _RAND_4 = {1{`RANDOM}};
  idxs_3 = _RAND_4[12:0];
  _RAND_5 = {1{`RANDOM}};
  idxs_4 = _RAND_5[12:0];
  _RAND_6 = {1{`RANDOM}};
  idxs_5 = _RAND_6[12:0];
  _RAND_7 = {1{`RANDOM}};
  idxs_6 = _RAND_7[12:0];
  _RAND_8 = {1{`RANDOM}};
  idxs_7 = _RAND_8[12:0];
  _RAND_9 = {1{`RANDOM}};
  idxs_8 = _RAND_9[12:0];
  _RAND_10 = {1{`RANDOM}};
  idxs_9 = _RAND_10[12:0];
  _RAND_11 = {1{`RANDOM}};
  idxs_10 = _RAND_11[12:0];
  _RAND_12 = {1{`RANDOM}};
  idxs_11 = _RAND_12[12:0];
  _RAND_13 = {1{`RANDOM}};
  idxs_12 = _RAND_13[12:0];
  _RAND_14 = {1{`RANDOM}};
  idxs_13 = _RAND_14[12:0];
  _RAND_15 = {1{`RANDOM}};
  idxs_14 = _RAND_15[12:0];
  _RAND_16 = {1{`RANDOM}};
  idxs_15 = _RAND_16[12:0];
  _RAND_17 = {1{`RANDOM}};
  idxs_16 = _RAND_17[12:0];
  _RAND_18 = {1{`RANDOM}};
  idxs_17 = _RAND_18[12:0];
  _RAND_19 = {1{`RANDOM}};
  idxs_18 = _RAND_19[12:0];
  _RAND_20 = {1{`RANDOM}};
  idxs_19 = _RAND_20[12:0];
  _RAND_21 = {1{`RANDOM}};
  idxs_20 = _RAND_21[12:0];
  _RAND_22 = {1{`RANDOM}};
  idxs_21 = _RAND_22[12:0];
  _RAND_23 = {1{`RANDOM}};
  idxs_22 = _RAND_23[12:0];
  _RAND_24 = {1{`RANDOM}};
  idxs_23 = _RAND_24[12:0];
  _RAND_25 = {1{`RANDOM}};
  idxs_24 = _RAND_25[12:0];
  _RAND_26 = {1{`RANDOM}};
  idxs_25 = _RAND_26[12:0];
  _RAND_27 = {1{`RANDOM}};
  idxs_26 = _RAND_27[12:0];
  _RAND_28 = {1{`RANDOM}};
  idxs_27 = _RAND_28[12:0];
  _RAND_29 = {1{`RANDOM}};
  idxPages_0 = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  idxPages_1 = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  idxPages_2 = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  idxPages_3 = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  idxPages_4 = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  idxPages_5 = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  idxPages_6 = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  idxPages_7 = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  idxPages_8 = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  idxPages_9 = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  idxPages_10 = _RAND_39[2:0];
  _RAND_40 = {1{`RANDOM}};
  idxPages_11 = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  idxPages_12 = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  idxPages_13 = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  idxPages_14 = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  idxPages_15 = _RAND_44[2:0];
  _RAND_45 = {1{`RANDOM}};
  idxPages_16 = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  idxPages_17 = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  idxPages_18 = _RAND_47[2:0];
  _RAND_48 = {1{`RANDOM}};
  idxPages_19 = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  idxPages_20 = _RAND_49[2:0];
  _RAND_50 = {1{`RANDOM}};
  idxPages_21 = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  idxPages_22 = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  idxPages_23 = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  idxPages_24 = _RAND_53[2:0];
  _RAND_54 = {1{`RANDOM}};
  idxPages_25 = _RAND_54[2:0];
  _RAND_55 = {1{`RANDOM}};
  idxPages_26 = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  idxPages_27 = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  tgts_0 = _RAND_57[12:0];
  _RAND_58 = {1{`RANDOM}};
  tgts_1 = _RAND_58[12:0];
  _RAND_59 = {1{`RANDOM}};
  tgts_2 = _RAND_59[12:0];
  _RAND_60 = {1{`RANDOM}};
  tgts_3 = _RAND_60[12:0];
  _RAND_61 = {1{`RANDOM}};
  tgts_4 = _RAND_61[12:0];
  _RAND_62 = {1{`RANDOM}};
  tgts_5 = _RAND_62[12:0];
  _RAND_63 = {1{`RANDOM}};
  tgts_6 = _RAND_63[12:0];
  _RAND_64 = {1{`RANDOM}};
  tgts_7 = _RAND_64[12:0];
  _RAND_65 = {1{`RANDOM}};
  tgts_8 = _RAND_65[12:0];
  _RAND_66 = {1{`RANDOM}};
  tgts_9 = _RAND_66[12:0];
  _RAND_67 = {1{`RANDOM}};
  tgts_10 = _RAND_67[12:0];
  _RAND_68 = {1{`RANDOM}};
  tgts_11 = _RAND_68[12:0];
  _RAND_69 = {1{`RANDOM}};
  tgts_12 = _RAND_69[12:0];
  _RAND_70 = {1{`RANDOM}};
  tgts_13 = _RAND_70[12:0];
  _RAND_71 = {1{`RANDOM}};
  tgts_14 = _RAND_71[12:0];
  _RAND_72 = {1{`RANDOM}};
  tgts_15 = _RAND_72[12:0];
  _RAND_73 = {1{`RANDOM}};
  tgts_16 = _RAND_73[12:0];
  _RAND_74 = {1{`RANDOM}};
  tgts_17 = _RAND_74[12:0];
  _RAND_75 = {1{`RANDOM}};
  tgts_18 = _RAND_75[12:0];
  _RAND_76 = {1{`RANDOM}};
  tgts_19 = _RAND_76[12:0];
  _RAND_77 = {1{`RANDOM}};
  tgts_20 = _RAND_77[12:0];
  _RAND_78 = {1{`RANDOM}};
  tgts_21 = _RAND_78[12:0];
  _RAND_79 = {1{`RANDOM}};
  tgts_22 = _RAND_79[12:0];
  _RAND_80 = {1{`RANDOM}};
  tgts_23 = _RAND_80[12:0];
  _RAND_81 = {1{`RANDOM}};
  tgts_24 = _RAND_81[12:0];
  _RAND_82 = {1{`RANDOM}};
  tgts_25 = _RAND_82[12:0];
  _RAND_83 = {1{`RANDOM}};
  tgts_26 = _RAND_83[12:0];
  _RAND_84 = {1{`RANDOM}};
  tgts_27 = _RAND_84[12:0];
  _RAND_85 = {1{`RANDOM}};
  tgtPages_0 = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  tgtPages_1 = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  tgtPages_2 = _RAND_87[2:0];
  _RAND_88 = {1{`RANDOM}};
  tgtPages_3 = _RAND_88[2:0];
  _RAND_89 = {1{`RANDOM}};
  tgtPages_4 = _RAND_89[2:0];
  _RAND_90 = {1{`RANDOM}};
  tgtPages_5 = _RAND_90[2:0];
  _RAND_91 = {1{`RANDOM}};
  tgtPages_6 = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  tgtPages_7 = _RAND_92[2:0];
  _RAND_93 = {1{`RANDOM}};
  tgtPages_8 = _RAND_93[2:0];
  _RAND_94 = {1{`RANDOM}};
  tgtPages_9 = _RAND_94[2:0];
  _RAND_95 = {1{`RANDOM}};
  tgtPages_10 = _RAND_95[2:0];
  _RAND_96 = {1{`RANDOM}};
  tgtPages_11 = _RAND_96[2:0];
  _RAND_97 = {1{`RANDOM}};
  tgtPages_12 = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  tgtPages_13 = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  tgtPages_14 = _RAND_99[2:0];
  _RAND_100 = {1{`RANDOM}};
  tgtPages_15 = _RAND_100[2:0];
  _RAND_101 = {1{`RANDOM}};
  tgtPages_16 = _RAND_101[2:0];
  _RAND_102 = {1{`RANDOM}};
  tgtPages_17 = _RAND_102[2:0];
  _RAND_103 = {1{`RANDOM}};
  tgtPages_18 = _RAND_103[2:0];
  _RAND_104 = {1{`RANDOM}};
  tgtPages_19 = _RAND_104[2:0];
  _RAND_105 = {1{`RANDOM}};
  tgtPages_20 = _RAND_105[2:0];
  _RAND_106 = {1{`RANDOM}};
  tgtPages_21 = _RAND_106[2:0];
  _RAND_107 = {1{`RANDOM}};
  tgtPages_22 = _RAND_107[2:0];
  _RAND_108 = {1{`RANDOM}};
  tgtPages_23 = _RAND_108[2:0];
  _RAND_109 = {1{`RANDOM}};
  tgtPages_24 = _RAND_109[2:0];
  _RAND_110 = {1{`RANDOM}};
  tgtPages_25 = _RAND_110[2:0];
  _RAND_111 = {1{`RANDOM}};
  tgtPages_26 = _RAND_111[2:0];
  _RAND_112 = {1{`RANDOM}};
  tgtPages_27 = _RAND_112[2:0];
  _RAND_113 = {1{`RANDOM}};
  pages_0 = _RAND_113[17:0];
  _RAND_114 = {1{`RANDOM}};
  pages_1 = _RAND_114[17:0];
  _RAND_115 = {1{`RANDOM}};
  pages_2 = _RAND_115[17:0];
  _RAND_116 = {1{`RANDOM}};
  pages_3 = _RAND_116[17:0];
  _RAND_117 = {1{`RANDOM}};
  pages_4 = _RAND_117[17:0];
  _RAND_118 = {1{`RANDOM}};
  pages_5 = _RAND_118[17:0];
  _RAND_119 = {1{`RANDOM}};
  pageValid = _RAND_119[5:0];
  _RAND_120 = {1{`RANDOM}};
  isValid = _RAND_120[27:0];
  _RAND_121 = {1{`RANDOM}};
  cfiType_0 = _RAND_121[1:0];
  _RAND_122 = {1{`RANDOM}};
  cfiType_1 = _RAND_122[1:0];
  _RAND_123 = {1{`RANDOM}};
  cfiType_2 = _RAND_123[1:0];
  _RAND_124 = {1{`RANDOM}};
  cfiType_3 = _RAND_124[1:0];
  _RAND_125 = {1{`RANDOM}};
  cfiType_4 = _RAND_125[1:0];
  _RAND_126 = {1{`RANDOM}};
  cfiType_5 = _RAND_126[1:0];
  _RAND_127 = {1{`RANDOM}};
  cfiType_6 = _RAND_127[1:0];
  _RAND_128 = {1{`RANDOM}};
  cfiType_7 = _RAND_128[1:0];
  _RAND_129 = {1{`RANDOM}};
  cfiType_8 = _RAND_129[1:0];
  _RAND_130 = {1{`RANDOM}};
  cfiType_9 = _RAND_130[1:0];
  _RAND_131 = {1{`RANDOM}};
  cfiType_10 = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  cfiType_11 = _RAND_132[1:0];
  _RAND_133 = {1{`RANDOM}};
  cfiType_12 = _RAND_133[1:0];
  _RAND_134 = {1{`RANDOM}};
  cfiType_13 = _RAND_134[1:0];
  _RAND_135 = {1{`RANDOM}};
  cfiType_14 = _RAND_135[1:0];
  _RAND_136 = {1{`RANDOM}};
  cfiType_15 = _RAND_136[1:0];
  _RAND_137 = {1{`RANDOM}};
  cfiType_16 = _RAND_137[1:0];
  _RAND_138 = {1{`RANDOM}};
  cfiType_17 = _RAND_138[1:0];
  _RAND_139 = {1{`RANDOM}};
  cfiType_18 = _RAND_139[1:0];
  _RAND_140 = {1{`RANDOM}};
  cfiType_19 = _RAND_140[1:0];
  _RAND_141 = {1{`RANDOM}};
  cfiType_20 = _RAND_141[1:0];
  _RAND_142 = {1{`RANDOM}};
  cfiType_21 = _RAND_142[1:0];
  _RAND_143 = {1{`RANDOM}};
  cfiType_22 = _RAND_143[1:0];
  _RAND_144 = {1{`RANDOM}};
  cfiType_23 = _RAND_144[1:0];
  _RAND_145 = {1{`RANDOM}};
  cfiType_24 = _RAND_145[1:0];
  _RAND_146 = {1{`RANDOM}};
  cfiType_25 = _RAND_146[1:0];
  _RAND_147 = {1{`RANDOM}};
  cfiType_26 = _RAND_147[1:0];
  _RAND_148 = {1{`RANDOM}};
  cfiType_27 = _RAND_148[1:0];
  _RAND_149 = {1{`RANDOM}};
  brIdx_0 = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  brIdx_1 = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  brIdx_2 = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  brIdx_3 = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  brIdx_4 = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  brIdx_5 = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  brIdx_6 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  brIdx_7 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  brIdx_8 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  brIdx_9 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  brIdx_10 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  brIdx_11 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  brIdx_12 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  brIdx_13 = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  brIdx_14 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  brIdx_15 = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  brIdx_16 = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  brIdx_17 = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  brIdx_18 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  brIdx_19 = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  brIdx_20 = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  brIdx_21 = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  brIdx_22 = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  brIdx_23 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  brIdx_24 = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  brIdx_25 = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  brIdx_26 = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  brIdx_27 = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  r_btb_updatePipe_valid = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  r_btb_updatePipe_bits_prediction_entry = _RAND_178[4:0];
  _RAND_179 = {1{`RANDOM}};
  r_btb_updatePipe_bits_pc = _RAND_179[31:0];
  _RAND_180 = {1{`RANDOM}};
  r_btb_updatePipe_bits_isValid = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  r_btb_updatePipe_bits_br_pc = _RAND_181[31:0];
  _RAND_182 = {1{`RANDOM}};
  r_btb_updatePipe_bits_cfiType = _RAND_182[1:0];
  _RAND_183 = {1{`RANDOM}};
  nextPageRepl = _RAND_183[2:0];
  _RAND_184 = {1{`RANDOM}};
  state_reg = _RAND_184[26:0];
  _RAND_185 = {1{`RANDOM}};
  r_respPipe_valid = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  r_respPipe_bits_taken = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  r_respPipe_bits_entry = _RAND_187[4:0];
  _RAND_188 = {1{`RANDOM}};
  history = _RAND_188[7:0];
  _RAND_189 = {1{`RANDOM}};
  reset_waddr = _RAND_189[9:0];
  _RAND_190 = {1{`RANDOM}};
  count = _RAND_190[2:0];
  _RAND_191 = {1{`RANDOM}};
  pos = _RAND_191[2:0];
  _RAND_192 = {1{`RANDOM}};
  stack_0 = _RAND_192[31:0];
  _RAND_193 = {1{`RANDOM}};
  stack_1 = _RAND_193[31:0];
  _RAND_194 = {1{`RANDOM}};
  stack_2 = _RAND_194[31:0];
  _RAND_195 = {1{`RANDOM}};
  stack_3 = _RAND_195[31:0];
  _RAND_196 = {1{`RANDOM}};
  stack_4 = _RAND_196[31:0];
  _RAND_197 = {1{`RANDOM}};
  stack_5 = _RAND_197[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule