// ****************************************************************************
// ****************************************************************************
// Copyright SoC Design Research Group, All rights reservxd.
// Electronics and Telecommunications Research Institute (ETRI)
// 
// THESE DOCUMENTS CONTAIN CONFIDENTIAL INFORMATION AND KNOWLEDGE
// WHICH IS THE PROPERTY OF ETRI. NO PART OF THIS PUBLICATION IS
// TO BE USED FOR ANY OTHER PURPOSE, AND THESE ARE NOT TO BE
// REPRODUCED, COPIED, DISCLOSED, TRANSMITTED, STORED IN A RETRIEVAL
// SYSTEM OR TRANSLATED INTO ANY OTHER HUMAN OR COMPUTER LANGUAGE,
// IN ANY FORM, BY ANY MEANS, IN WHOLE OR IN PART, WITHOUT THE
// COMPLETE PRIOR WRITTEN PERMISSION OF ETRI.
// ****************************************************************************
// 2025-07-15
// Kyuseung Han (han@etri.re.kr)
// ****************************************************************************
// ****************************************************************************

`include "ervp_global.vh"
`include "ervp_axi_define.vh"
`include "rvx_include_06.vh"



module ERVP_DMA
(
	clk_axi,
	rstnn_axi,
  clk_apb,
	rstnn_apb,
	tick_1us,
	
	control_rpaddr,
	control_rpwrite,
	control_rpsel,
	control_rpenable,
	control_rpwdata,
	control_rprdata,
	control_rpready,
	control_rpslverr,
	
	sxawid,
	sxawaddr,
	sxawlen,
	sxawsize,
	sxawburst,
	sxawvalid,
	sxawready,
	
	sxwid,
	sxwdata,
	sxwstrb,
	sxwlast,
	sxwvalid,
	sxwready,
	
	sxbid,
	sxbresp,
	sxbvalid,
	sxbready,
	
	sxarid,
	sxaraddr,
	sxarlen,
	sxarsize,
	sxarburst,
	sxarvalid,
	sxarready,
	
	sxrid,
	sxrdata,
	sxrresp,
	sxrlast,
	sxrvalid,
	sxrready
);



parameter BW_ADDR = 32;
parameter BW_APB_DATA = 32;
parameter BW_AXI_DATA = 32;
parameter BW_AXI_TID = 4;
parameter NUM_TXN_BUFFER = 4;

`include "rvx_include_14.vh"

localparam  RVX_LPARA_0 = (MAX_AXI_LENGTH+1)*NUM_TXN_BUFFER;

input wire clk_axi;
input wire rstnn_axi;
input wire clk_apb;
input wire rstnn_apb;
input wire tick_1us;

input wire [BW_ADDR-1:0] control_rpaddr;
input wire control_rpwrite;
input wire control_rpsel;
input wire control_rpenable;
input wire [BW_APB_DATA-1:0] control_rpwdata;
output wire [BW_APB_DATA-1:0] control_rprdata;
output wire control_rpready;
output wire control_rpslverr;

output wire [BW_AXI_TID-1:0] sxawid;
output wire [BW_ADDR-1:0] sxawaddr;
output wire [`BW_AXI_ALEN-1:0] sxawlen;
output wire [`BW_AXI_ASIZE-1:0] sxawsize;
output wire [`BW_AXI_ABURST-1:0] sxawburst;
output wire sxawvalid;
input wire sxawready;

output wire [BW_AXI_TID-1:0] sxwid;
output wire [BW_AXI_DATA-1:0] sxwdata;
output wire [`BW_AXI_WSTRB(BW_AXI_DATA)-1:0] sxwstrb;
output wire sxwlast;
output wire sxwvalid;
input wire sxwready;

input wire [BW_AXI_TID-1:0] sxbid;
input wire [`BW_AXI_BRESP-1:0] sxbresp;
input wire sxbvalid;
output wire sxbready;

output wire [BW_AXI_TID-1:0] sxarid;
output wire [BW_ADDR-1:0] sxaraddr;
output wire [`BW_AXI_ALEN-1:0] sxarlen;
output wire [`BW_AXI_ASIZE-1:0] sxarsize;
output wire [`BW_AXI_ABURST-1:0] sxarburst;
output wire sxarvalid;
input wire sxarready;

input wire [BW_AXI_TID-1:0] sxrid;
input wire [BW_AXI_DATA-1:0] sxrdata;
input wire [`BW_AXI_RRESP-1:0] sxrresp;
input wire sxrlast;
input wire sxrvalid;
output wire sxrready;

wire rvx_signal_72;
wire [3-1:0] rvx_signal_61;
wire rvx_signal_23;
wire [32-1:0] rvx_signal_80;

wire rvx_signal_49;
wire rvx_signal_15;
wire [32-1:0] rvx_signal_63;
wire rvx_signal_39;
wire rvx_signal_38;
wire [32-1:0] rvx_signal_48;
wire rvx_signal_14;
wire [32-1:0] rvx_signal_71;

wire rvx_signal_57;
wire rvx_signal_53;
wire [32-1:0] rvx_signal_55;
wire rvx_signal_30;
wire rvx_signal_13;
wire [32-1:0] rvx_signal_29;
wire rvx_signal_02;
wire [32-1:0] rvx_signal_45;

wire rvx_signal_51;
wire rvx_signal_19;
wire [32-1:0] rvx_signal_04;
wire rvx_signal_83;
wire rvx_signal_66;
wire [32-1:0] rvx_signal_18;
wire rvx_signal_07;
wire [32-1:0] rvx_signal_43;

wire rvx_signal_65;
wire rvx_signal_05;
wire [32-1:0] rvx_signal_11;
wire rvx_signal_60;
wire rvx_signal_75;
wire [32-1:0] rvx_signal_74;
wire rvx_signal_47;
wire [32-1:0] rvx_signal_32;

wire rvx_signal_08;
wire rvx_signal_27;
wire [32-1:0] rvx_signal_36;
wire rvx_signal_42;
wire rvx_signal_31;
wire [32-1:0] rvx_signal_09;
wire rvx_signal_20;
wire [32-1:0] rvx_signal_40;

wire [BW_LINE_SIZE-1:0] rvx_signal_68;
wire [BW_NUM_LINES-1:0] rvx_signal_88;
wire [`RVX_GDEF_143-1:0] rvx_signal_50;
wire rvx_signal_77;

reg [`RVX_GDEF_195-1:0] rvx_signal_12;
reg rvx_signal_70;
reg rvx_signal_56;

wire rvx_signal_82;
wire rvx_signal_44;
wire rvx_signal_21;

localparam  RVX_LPARA_1 = `RVX_GDEF_143;
localparam  RVX_LPARA_2 = 2;

wire rvx_signal_00;
wire rvx_signal_54;
wire [RVX_LPARA_1-1:0] rvx_signal_73;
wire rvx_signal_64;
wire [RVX_LPARA_2-1:0] rvx_signal_85;
wire rvx_signal_81;

reg [`RVX_GDEF_120-1:0] rvx_signal_22;
wire rvx_signal_41;
wire rvx_signal_28;
wire rvx_signal_69;

wire rvx_signal_46;
wire rvx_signal_26;
wire rvx_signal_62;
wire rvx_signal_86;

wire rvx_signal_33;
wire rvx_signal_24;
wire rvx_signal_03;
wire rvx_signal_25;

wire rvx_signal_34;
wire rvx_signal_59;
wire rvx_signal_16;
wire rvx_signal_06;

wire rvx_signal_84;
wire rvx_signal_17;
wire rvx_signal_52;
wire rvx_signal_76;
wire rvx_signal_37;

wire rvx_signal_87;
wire [BW_DATA_BUFFER-1:0] rvx_signal_01;
wire rvx_signal_78;
wire rvx_signal_10;
wire [BW_DATA_BUFFER-1:0] rvx_signal_79;
wire rvx_signal_67;

wire rvx_signal_35;
wire rvx_signal_58;

RVX_MODULE_049
#(
  .RVX_GPARA_0(BW_ADDR),
  .RVX_GPARA_1(BW_APB_DATA)
)
i_rvx_instance_8
(
	.rvx_port_34(clk_apb),
	.rvx_port_07(rstnn_apb),

	.rvx_port_35(control_rpsel),
	.rvx_port_10(control_rpenable),
	.rvx_port_28(control_rpaddr),
	.rvx_port_19(control_rpwrite),
	.rvx_port_41(control_rpwdata),
	.rvx_port_45(control_rprdata),
	.rvx_port_27(control_rpready),
	.rvx_port_09(control_rpslverr),

	.rvx_port_54(1'b 0),
	.rvx_port_06(rvx_signal_72),
	.rvx_port_43(rvx_signal_61),
	.rvx_port_11(rvx_signal_23),
	.rvx_port_17(rvx_signal_80),
	.rvx_port_26(rvx_signal_39),
	.rvx_port_44(rvx_signal_38),
	.rvx_port_48(rvx_signal_48),
	.rvx_port_15(rvx_signal_14),
	.rvx_port_42(rvx_signal_71),
	.rvx_port_50(rvx_signal_49),
	.rvx_port_52(rvx_signal_15),
	.rvx_port_12(rvx_signal_63),
	.rvx_port_32(rvx_signal_30),
	.rvx_port_38(rvx_signal_13),
	.rvx_port_01(rvx_signal_29),
	.rvx_port_24(rvx_signal_02),
	.rvx_port_25(rvx_signal_45),
	.rvx_port_13(rvx_signal_57),
	.rvx_port_47(rvx_signal_53),
	.rvx_port_31(rvx_signal_55),
	.rvx_port_23(rvx_signal_83),
	.rvx_port_14(rvx_signal_66),
	.rvx_port_08(rvx_signal_18),
	.rvx_port_29(rvx_signal_07),
	.rvx_port_18(rvx_signal_43),
	.rvx_port_33(rvx_signal_51),
	.rvx_port_22(rvx_signal_19),
	.rvx_port_21(rvx_signal_04),
	.rvx_port_39(rvx_signal_60),
	.rvx_port_04(rvx_signal_75),
	.rvx_port_53(rvx_signal_74),
	.rvx_port_03(rvx_signal_47),
	.rvx_port_46(rvx_signal_32),
	.rvx_port_30(rvx_signal_65),
	.rvx_port_02(rvx_signal_05),
	.rvx_port_36(rvx_signal_11),
	.rvx_port_40(rvx_signal_42),
	.rvx_port_20(rvx_signal_31),
	.rvx_port_37(rvx_signal_09),
	.rvx_port_51(rvx_signal_20),
	.rvx_port_49(rvx_signal_40),
	.rvx_port_16(rvx_signal_08),
	.rvx_port_00(rvx_signal_27),
	.rvx_port_05(rvx_signal_36)
);

assign rvx_signal_61 = rvx_signal_12;
assign {rvx_signal_68,rvx_signal_88} = rvx_signal_40;
assign {rvx_signal_50,rvx_signal_77} = rvx_signal_80;

assign rvx_signal_14 = rvx_signal_56;
assign rvx_signal_02 = rvx_signal_56;
assign rvx_signal_07 = rvx_signal_56;
assign rvx_signal_47 = rvx_signal_56;
assign rvx_signal_20 = rvx_signal_56;

ERVP_ASYNCH_CONTROL_SIGNAL
i_rvx_instance_6
(
	.wclk(clk_apb),
	.wrstnn(rstnn_apb),
	.wcontrol(rvx_signal_82),
	.wready(rvx_signal_44),

	.rclk(clk_axi),
	.rrstnn(rstnn_axi),
	.rcontrol(rvx_signal_41),
	.rready(rvx_signal_28)
);

always@(posedge clk_apb, negedge rstnn_apb)
begin
	if(rstnn_apb == 0)
  begin
		rvx_signal_12 <= `RVX_GDEF_223;
    rvx_signal_70 <= 0;
  end
  else
		case(rvx_signal_12)
      `RVX_GDEF_223:
        if(rvx_signal_23)
          rvx_signal_12 <= `RVX_GDEF_097;
      `RVX_GDEF_097:
      begin
        if(rvx_signal_60)
          rvx_signal_12 <= `RVX_GDEF_087;
        else
          rvx_signal_12 <= `RVX_GDEF_223;
        rvx_signal_70 <= rvx_signal_77;
      end
      `RVX_GDEF_087:
				if(rvx_signal_44)
					rvx_signal_12 <= `RVX_GDEF_197;
			`RVX_GDEF_197:
				if(~rvx_signal_21)
        begin
          if(rvx_signal_77)
            rvx_signal_12 <= `RVX_GDEF_178;
          else
            rvx_signal_12 <= `RVX_GDEF_097;
        end
      `RVX_GDEF_178:
        if(~rvx_signal_77)
          rvx_signal_12 <= `RVX_GDEF_097;
        else if(rvx_signal_81)
          rvx_signal_12 <= `RVX_GDEF_097;
		endcase
end

always@(*)
begin
  rvx_signal_56 = 0;
  case(rvx_signal_12)
    `RVX_GDEF_197,
    `RVX_GDEF_178:
      if((~rvx_signal_21) && (~rvx_signal_77))
        rvx_signal_56 = 1;
  endcase
end
assign rvx_signal_82 = (rvx_signal_12==`RVX_GDEF_097) & rvx_signal_60;

ERVP_SYNCHRONIZER
#(
	.BW_DATA(1)
)
i_rvx_instance_2
(
	.clk(clk_apb),
	.rstnn(rstnn_apb),
	.enable(1'b 1),
	.asynch_value(rvx_signal_69),
	.synch_value(rvx_signal_21)
);

ERVP_RECONFIGURABLE_COUNTER
#(
  .BW_COUNTER(RVX_LPARA_1),
  .BW_COUNT_AMOUNT(RVX_LPARA_2),
  .LAST_NUMBER(1)
)
i_rvx_instance_7
(
	.clk(clk_apb),
  .rstnn(rstnn_apb),
	.enable(rvx_signal_00),

  .init(1'b 0),
	.write(rvx_signal_54),
	.wvalue(rvx_signal_73),
	.count(rvx_signal_64),
	.count_amount(rvx_signal_85),
	.value(),
	.is_first_count(),
	.is_last_count(rvx_signal_81)
);

assign rvx_signal_00 = (rvx_signal_12!=`RVX_GDEF_223);
assign rvx_signal_54 = rvx_signal_77 & rvx_signal_82;
assign rvx_signal_73 = rvx_signal_50;
assign rvx_signal_64 = rvx_signal_70 & tick_1us;
assign rvx_signal_85 = -1;

always@(posedge clk_axi, negedge rstnn_axi)
begin
	if(rstnn_axi == 0)
		rvx_signal_22 <= `RVX_GDEF_090;
	else
		case(rvx_signal_22)
			`RVX_GDEF_090:
        if(rvx_signal_41)
          rvx_signal_22 <= `RVX_GDEF_119;
			`RVX_GDEF_119:
				if(rvx_signal_84)
					rvx_signal_22 <= `RVX_GDEF_018;
			`RVX_GDEF_018:
				if(rvx_signal_17)
					rvx_signal_22 <= `RVX_GDEF_244;
			`RVX_GDEF_244:
				if(rvx_signal_52)
          rvx_signal_22 <= `RVX_GDEF_090;
		endcase
end

assign rvx_signal_28 = (rvx_signal_22==`RVX_GDEF_090) & rvx_signal_41;
assign rvx_signal_69 = (rvx_signal_22!=`RVX_GDEF_090);

assign rvx_signal_37 = (rvx_signal_22 == `RVX_GDEF_119);
assign rvx_signal_76 = (rvx_signal_22 == `RVX_GDEF_119) | (rvx_signal_22 == `RVX_GDEF_018);

assign rvx_signal_46 = sxarready & sxarvalid;
assign rvx_signal_26 = sxrlast & sxrvalid & sxrready;
assign rvx_signal_62 = sxawready & sxawvalid;
assign rvx_signal_86 = sxwlast & sxwvalid & sxwready;

ERVP_UPDOWN_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(NUM_TXN_BUFFER)
)
i_rvx_instance_0
(
	.clk(clk_axi),
  .rstnn(rstnn_axi),
	.enable(rvx_signal_33),
	.init(1'b 0),
  .up(rvx_signal_24),
  .down(rvx_signal_03),
	.value(),
  .is_first_count(),
	.is_last_count(rvx_signal_25)
);

assign rvx_signal_33 = rvx_signal_69;
assign rvx_signal_24 = rvx_signal_46;
assign rvx_signal_03 = rvx_signal_86;

ERVP_UPDOWN_COUNTER_WITH_ONEHOT_ENCODING
#(
  .COUNT_LENGTH(NUM_TXN_BUFFER)
)
i_rvx_instance_1
(
	.clk(clk_axi),
  .rstnn(rstnn_axi),
	.enable(rvx_signal_34),
	.init(1'b 0),
  .up(rvx_signal_59),
  .down(rvx_signal_16),
	.value(),
  .is_first_count(rvx_signal_06),
	.is_last_count()
);

assign rvx_signal_34 = rvx_signal_69;
assign rvx_signal_59 = rvx_signal_26;
assign rvx_signal_16 = rvx_signal_62;

RVX_MODULE_001
#(
	.RVX_GPARA_0(BW_ADDR),
	.BW_AXI_DATA(BW_AXI_DATA),
	.RVX_GPARA_1(BW_AXI_TID),
	.MAX_AXI_LENGTH(MAX_AXI_LENGTH)
)
i_rvx_instance_5
(
	.rvx_port_10(clk_axi),
	.rvx_port_18(rstnn_axi),

	.rvx_port_06(rvx_signal_71),
	.rvx_port_05(rvx_signal_68),
	.rvx_port_17(rvx_signal_88),
	.rvx_port_03(rvx_signal_45),
	.rvx_port_04(rvx_signal_37),

	.rvx_port_16(rvx_signal_35),
	.rvx_port_20(rvx_signal_84),

	.rvx_port_08(rvx_signal_87),
	.rvx_port_12(rvx_signal_01),
	.rvx_port_02(rvx_signal_78),

	.rvx_port_15(sxarid),
	.rvx_port_14(sxaraddr),
	.rvx_port_22(sxarvalid),
	.rvx_port_09(sxarready),
	.rvx_port_23(sxarlen),
	.rvx_port_19(sxarburst),
	.rvx_port_01(sxarsize),
	
	.rvx_port_07(sxrid),
	.rvx_port_13(sxrdata),
	.rvx_port_11(sxrlast),
	.rvx_port_00(sxrvalid),
	.rvx_port_21(sxrready),
	.rvx_port_24(sxrresp)
);

assign rvx_signal_35 = rvx_signal_25;

RVX_MODULE_081
#(
  .RVX_GPARA_0(BW_ADDR),
	.BW_AXI_DATA(BW_AXI_DATA),
	.RVX_GPARA_2(BW_AXI_TID),
	.MAX_AXI_LENGTH(MAX_AXI_LENGTH)
)
i_rvx_instance_4
(
	.rvx_port_18(clk_axi),
	.rvx_port_16(tick_1us),
	.rvx_port_27(rstnn_axi),

	.rvx_port_01(rvx_signal_43),
	.rvx_port_17(rvx_signal_68),
	.rvx_port_15(rvx_signal_88),
	.rvx_port_14(rvx_signal_32),
	.rvx_port_10(rvx_signal_76),

	.rvx_port_11(rvx_signal_58),
	.rvx_port_22(rvx_signal_17),
	.rvx_port_09(rvx_signal_52),

	.rvx_port_26(rvx_signal_10),
	.rvx_port_02(rvx_signal_79),
	.rvx_port_20(rvx_signal_67),

	.rvx_port_07(sxawid),
	.rvx_port_21(sxawaddr),
	.rvx_port_19(sxawvalid),
	.rvx_port_08(sxawready),
	.rvx_port_24(sxawlen),
	.rvx_port_05(sxawburst),
	.rvx_port_30(sxawsize),
	
	.rvx_port_03(sxwid),
	.rvx_port_12(sxwdata),
	.rvx_port_25(sxwstrb),
	.rvx_port_06(sxwlast),
	.rvx_port_04(sxwvalid),
	.rvx_port_23(sxwready),

	.rvx_port_00(sxbid),
	.rvx_port_13(sxbresp),
	.rvx_port_28(sxbvalid),
	.rvx_port_29(sxbready)
);

assign rvx_signal_58 = rvx_signal_06;

ERVP_FIFO
#(
	.BW_DATA(BW_DATA_BUFFER),
	.DEPTH(RVX_LPARA_0)
 )
i_rvx_instance_3
(
	.clk(clk_axi),
	.rstnn(rstnn_axi),
	.enable(1'b 1),
  .clear(1'b 0),

	.wready(rvx_signal_78),
	.wrequest(rvx_signal_87),
	.wfull(),
	.wdata(rvx_signal_01),
	.wnum(),

	.rready(rvx_signal_10),
	.rrequest(rvx_signal_67),
	.rempty(),
	.rdata(rvx_signal_79),
	.rnum()
);

endmodule
