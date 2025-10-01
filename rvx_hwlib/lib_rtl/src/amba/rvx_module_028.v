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




module RVX_MODULE_028
(
	
	rvx_port_57,
	rvx_port_36,
	rvx_port_24,
	rvx_port_56,
	rvx_port_70,
	rvx_port_83,
	rvx_port_08,

	rvx_port_34,
	rvx_port_76,
	rvx_port_59,
	rvx_port_85,
	rvx_port_37,
	rvx_port_35, 

	rvx_port_16,
	rvx_port_45,
	rvx_port_61,
	rvx_port_23,

	rvx_port_71,
	rvx_port_38,
	rvx_port_04,
	rvx_port_81,
	rvx_port_15,
	rvx_port_77,
	rvx_port_89,

	rvx_port_17,
	rvx_port_55,
	rvx_port_67,
	rvx_port_88,
	rvx_port_40,
	rvx_port_75,

	
	rvx_port_22,
	rvx_port_78,
	rvx_port_62,
	rvx_port_10,
	rvx_port_54,
	rvx_port_74,
	rvx_port_25,

	rvx_port_42,
	rvx_port_14,
	rvx_port_03,
	rvx_port_01,
	rvx_port_19,
	rvx_port_65, 

	rvx_port_30,
	rvx_port_28,
	rvx_port_05,
	rvx_port_41,

	rvx_port_02,
	rvx_port_73,
	rvx_port_27,
	rvx_port_60,
	rvx_port_09,
	rvx_port_11,
	rvx_port_50,

	rvx_port_84,
	rvx_port_43,
	rvx_port_13,
	rvx_port_39,
	rvx_port_82,
	rvx_port_72,

	
	rvx_port_06,
	rvx_port_86,
	rvx_port_58,
	rvx_port_32,
	rvx_port_21,
	rvx_port_49,
	rvx_port_20,

	rvx_port_66,
	rvx_port_63,
	rvx_port_48,
	rvx_port_69,
	rvx_port_51,
	rvx_port_47, 

	rvx_port_33,
	rvx_port_44,
	rvx_port_46,
	rvx_port_53,

	rvx_port_64,
	rvx_port_68,
	rvx_port_29,
	rvx_port_52,
	rvx_port_79,
	rvx_port_31,
	rvx_port_18,

	rvx_port_26,
	rvx_port_12,
	rvx_port_80,
	rvx_port_87,
	rvx_port_00,
	rvx_port_07
);




parameter RVX_GPARA_2 = 32;
parameter RVX_GPARA_3 = 32;
parameter RVX_GPARA_1 = `DEFAULT_BW_AXI_TID;
parameter RVX_GPARA_0 = 0;

input wire [RVX_GPARA_1-1:0] rvx_port_57;
input wire [RVX_GPARA_2-1:0] rvx_port_36;
input wire [`BW_AXI_ALEN-1:0] rvx_port_24;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_56;
input wire [`BW_AXI_ABURST-1:0] rvx_port_70;
input wire rvx_port_83;
output wire rvx_port_08;

input wire [RVX_GPARA_1-1:0] rvx_port_34;
input wire [RVX_GPARA_3-1:0] rvx_port_76;
input wire [`BW_AXI_WSTRB(RVX_GPARA_3)-1:0] rvx_port_59;
input wire rvx_port_85;
input wire rvx_port_37;
output wire rvx_port_35;

output wire [RVX_GPARA_1-1:0] rvx_port_16;
output wire [`BW_AXI_BRESP-1:0] rvx_port_45;
output wire rvx_port_61;
input wire rvx_port_23;

input wire [RVX_GPARA_1-1:0] rvx_port_71;
input wire [RVX_GPARA_2-1:0] rvx_port_38;
input wire [`BW_AXI_ALEN-1:0] rvx_port_04;
input wire [`BW_AXI_ASIZE-1:0] rvx_port_81;
input wire [`BW_AXI_ABURST-1:0] rvx_port_15;
input wire rvx_port_77;
output wire rvx_port_89;

output wire [RVX_GPARA_1-1:0] rvx_port_17;
output wire [RVX_GPARA_3-1:0] rvx_port_55;
output wire [`BW_AXI_RRESP-1:0] rvx_port_67;
output wire rvx_port_88;
output wire rvx_port_40;
input wire rvx_port_75;

output wire [RVX_GPARA_1-1:0] rvx_port_22;
output wire [RVX_GPARA_2-1:0] rvx_port_78;
output wire [`BW_AXI_ALEN-1:0] rvx_port_62;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_10;
output wire [`BW_AXI_ABURST-1:0] rvx_port_54;
output wire rvx_port_74;
input wire rvx_port_25;

output wire [RVX_GPARA_1-1:0] rvx_port_42;
output wire [RVX_GPARA_3-1:0] rvx_port_14;
output wire [`BW_AXI_WSTRB(RVX_GPARA_3)-1:0] rvx_port_03;
output wire rvx_port_01;
output wire rvx_port_19;
input wire rvx_port_65;

input wire [RVX_GPARA_1-1:0] rvx_port_30;
input wire [`BW_AXI_BRESP-1:0] rvx_port_28;
input wire rvx_port_05;
output wire rvx_port_41;

output wire [RVX_GPARA_1-1:0] rvx_port_02;
output wire [RVX_GPARA_2-1:0] rvx_port_73;
output wire [`BW_AXI_ALEN-1:0] rvx_port_27;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_60;
output wire [`BW_AXI_ABURST-1:0] rvx_port_09;
output wire rvx_port_11;
input wire rvx_port_50;

input wire [RVX_GPARA_1-1:0] rvx_port_84;
input wire [RVX_GPARA_3-1:0] rvx_port_43;
input wire [`BW_AXI_RRESP-1:0] rvx_port_13;
input wire rvx_port_39;
input wire rvx_port_82;
output wire rvx_port_72;

output wire [RVX_GPARA_1-1:0] rvx_port_06;
output wire [RVX_GPARA_2-1:0] rvx_port_86;
output wire [`BW_AXI_ALEN-1:0] rvx_port_58;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_32;
output wire [`BW_AXI_ABURST-1:0] rvx_port_21;
output wire rvx_port_49;
input wire rvx_port_20;

output wire [RVX_GPARA_1-1:0] rvx_port_66;
output wire [RVX_GPARA_3-1:0] rvx_port_63;
output wire [`BW_AXI_WSTRB(RVX_GPARA_3)-1:0] rvx_port_48;
output wire rvx_port_69;
output wire rvx_port_51;
input wire rvx_port_47;

input wire [RVX_GPARA_1-1:0] rvx_port_33;
input wire [`BW_AXI_BRESP-1:0] rvx_port_44;
input wire rvx_port_46;
output wire rvx_port_53;

output wire [RVX_GPARA_1-1:0] rvx_port_64;
output wire [RVX_GPARA_2-1:0] rvx_port_68;
output wire [`BW_AXI_ALEN-1:0] rvx_port_29;
output wire [`BW_AXI_ASIZE-1:0] rvx_port_52;
output wire [`BW_AXI_ABURST-1:0] rvx_port_79;
output wire rvx_port_31;
input wire rvx_port_18;

input wire [RVX_GPARA_1-1:0] rvx_port_26;
input wire [RVX_GPARA_3-1:0] rvx_port_12;
input wire [`BW_AXI_RRESP-1:0] rvx_port_80;
input wire rvx_port_87;
input wire rvx_port_00;
output wire rvx_port_07;

RVX_MODULE_098
#(
	.RVX_GPARA_2(2),
	.RVX_GPARA_1(RVX_GPARA_0),
	.RVX_GPARA_0(RVX_GPARA_1+RVX_GPARA_2+`BW_AXI_ALEN+`BW_AXI_ASIZE+`BW_AXI_ABURST+1),
	.RVX_GPARA_3(1)
)
i_rvx_instance_4
(
	.rvx_port_2({rvx_port_57,rvx_port_36,rvx_port_24,rvx_port_56,rvx_port_70,rvx_port_83}),
	.rvx_port_3({{rvx_port_22,rvx_port_78,rvx_port_62,rvx_port_10,rvx_port_54,rvx_port_74},{rvx_port_06,rvx_port_86,rvx_port_58,rvx_port_32,rvx_port_21,rvx_port_49}}),
	.rvx_port_0({rvx_port_25,rvx_port_20}),
	.rvx_port_1(rvx_port_08)
);

RVX_MODULE_098
#(
	.RVX_GPARA_2(2),
	.RVX_GPARA_1(RVX_GPARA_0),
	.RVX_GPARA_0(RVX_GPARA_1+RVX_GPARA_3+`BW_AXI_WSTRB(RVX_GPARA_3)+1+1),
	.RVX_GPARA_3(1)
)
i_rvx_instance_2
(
	.rvx_port_2({rvx_port_34,rvx_port_76,rvx_port_59,rvx_port_85,rvx_port_37}),
	.rvx_port_3({{rvx_port_42,rvx_port_14,rvx_port_03,rvx_port_01,rvx_port_19},{rvx_port_66,rvx_port_63,rvx_port_48,rvx_port_69,rvx_port_51}}),
	.rvx_port_0({rvx_port_65,rvx_port_47}),
	.rvx_port_1(rvx_port_35)
);

RVX_MODULE_098
#(
	.RVX_GPARA_2(2),
	.RVX_GPARA_1(RVX_GPARA_0),
	.RVX_GPARA_0(1),
	.RVX_GPARA_3(RVX_GPARA_1+`BW_AXI_BRESP+1)
)
i_rvx_instance_0
(
	.rvx_port_2(rvx_port_23),
	.rvx_port_3({rvx_port_41,rvx_port_53}),
	.rvx_port_0({{rvx_port_30,rvx_port_28,rvx_port_05},{rvx_port_33,rvx_port_44,rvx_port_46}}),
	.rvx_port_1({rvx_port_16,rvx_port_45,rvx_port_61})
);

RVX_MODULE_098
#(
	.RVX_GPARA_2(2),
	.RVX_GPARA_1(RVX_GPARA_0),
	.RVX_GPARA_0(RVX_GPARA_1+RVX_GPARA_2+`BW_AXI_ALEN+`BW_AXI_ASIZE+`BW_AXI_ABURST+1),
	.RVX_GPARA_3(1)
)
i_rvx_instance_1
(
	.rvx_port_2({rvx_port_71,rvx_port_38,rvx_port_04,rvx_port_81,rvx_port_15,rvx_port_77}),
	.rvx_port_3({{rvx_port_02,rvx_port_73,rvx_port_27,rvx_port_60,rvx_port_09,rvx_port_11},{rvx_port_64,rvx_port_68,rvx_port_29,rvx_port_52,rvx_port_79,rvx_port_31}}),
	.rvx_port_0({rvx_port_50,rvx_port_18}),
	.rvx_port_1(rvx_port_89)
);

RVX_MODULE_098
#(
	.RVX_GPARA_2(2),
	.RVX_GPARA_1(RVX_GPARA_0),
	.RVX_GPARA_0(1),
	.RVX_GPARA_3(RVX_GPARA_1+RVX_GPARA_3+1+`BW_AXI_RRESP+1)
)
i_rvx_instance_3
(
	.rvx_port_2(rvx_port_75),
	.rvx_port_3({rvx_port_72,rvx_port_07}),
	.rvx_port_0({{rvx_port_84,rvx_port_43,rvx_port_39,rvx_port_13,rvx_port_82},{rvx_port_26,rvx_port_12,rvx_port_87,rvx_port_80,rvx_port_00}}),
	.rvx_port_1({rvx_port_17,rvx_port_55,rvx_port_88,rvx_port_67,rvx_port_40})
);

endmodule
