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


`include "ervp_uart_defines.vh"




module RVX_MODULE_085 (
	rvx_port_02, 
	rvx_port_07,
	rvx_port_12, 
	rvx_port_04, 
	rvx_port_08, 
	rvx_port_09, 
	rvx_port_05, 

	rvx_port_13, 
	rvx_port_11,

	rvx_port_06,
	rvx_port_10, 
	rvx_port_00, 
	rvx_port_03, 
	rvx_port_01

	);




`include "rvx_include_22.vh"

input wire rvx_port_02;
input wire rvx_port_07;
input wire [`BW_UART_REG_INDEX-1:0] rvx_port_12;
input wire [7:0] rvx_port_04;
output reg [7:0] rvx_port_08;
input wire rvx_port_09;
input wire rvx_port_05;

output wire rvx_port_13;
input wire rvx_port_11;

input wire [3:0] rvx_port_06;
output wire rvx_port_10;
output wire rvx_port_00;
output reg rvx_port_03;
output wire rvx_port_01;

reg						rvx_signal_073;

reg 					rvx_signal_003;

assign rvx_port_01 = rvx_signal_003; 

wire 					rvx_signal_017;

reg 	[3:0] 			rvx_signal_051;
reg 	[3:0] 			rvx_signal_058;
reg 	[1:0] 			rvx_signal_038;  
reg 	[4:0] 			rvx_signal_090;
reg 	[7:0] 			rvx_signal_007;
reg 	[7:0] 			rvx_signal_036;
reg 	[15:0]			rvx_signal_099;  
reg 	[7:0] 			rvx_signal_048; 
reg 					rvx_signal_054; 
reg 					rvx_signal_035; 
reg 					rvx_signal_013; 
reg 	[15:0] 			rvx_signal_022;  

reg		 [3:0] 			rvx_signal_065; 
reg 					rvx_signal_040;
reg 					rvx_signal_037;

wire 					rvx_signal_039;			   
wire 					rvx_signal_014, rvx_signal_082, rvx_signal_055, rvx_signal_047; 
wire 					rvx_signal_096;		   
wire 					rvx_signal_079, rvx_signal_049, rvx_signal_076, rvx_signal_033;	   
wire                    rvx_signal_088, rvx_signal_094, rvx_signal_060, rvx_signal_071; 

wire [7:0] 				rvx_signal_083;
wire 					rvx_signal_021, rvx_signal_001, rvx_signal_045, rvx_signal_030, rvx_signal_069, rvx_signal_078, rvx_signal_064, rvx_signal_077;
reg						rvx_signal_029, rvx_signal_012, rvx_signal_006, rvx_signal_052, rvx_signal_000, rvx_signal_018, rvx_signal_085, rvx_signal_044;
wire 					rvx_signal_086; 

reg						rvx_signal_100, rvx_signal_081;

wire 					rvx_signal_028;  
wire 					rvx_signal_062;  
wire 					rvx_signal_019;   
wire					rvx_signal_041; 
wire 					rvx_signal_091;   

reg 					rvx_signal_034;
reg		[7:0]			rvx_signal_068;
reg 					rvx_signal_101;
wire [`UART_FIFO_REC_WIDTH-1:0] 	rvx_signal_050;
wire 								rvx_signal_043; 
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_011;
wire [FIFO_COUNTER_W-1:0] 	rvx_signal_009;
wire [2:0] 				rvx_signal_070;
wire [3:0] 				rvx_signal_031;
wire [9:0] 				rvx_signal_074;

wire					rvx_signal_080; 
reg  	[7:0]			rvx_signal_026;   
reg  	[7:0]			rvx_signal_023; 

wire					rvx_signal_002;
wire					rvx_signal_061;

wire rvx_signal_015;

assign rvx_signal_083[7:0] = { rvx_signal_044, rvx_signal_085, rvx_signal_018, rvx_signal_000, rvx_signal_052, rvx_signal_006, rvx_signal_012, rvx_signal_029 };

assign {rvx_signal_014, rvx_signal_082, rvx_signal_055, rvx_signal_047} = rvx_port_06;
assign {rvx_signal_079, rvx_signal_049, rvx_signal_076, rvx_signal_033} = ~{rvx_signal_014,rvx_signal_082,rvx_signal_055,rvx_signal_047};

assign {rvx_signal_088, rvx_signal_094, rvx_signal_060, rvx_signal_071} = rvx_signal_096 ? {rvx_signal_090[`UART_MC_RTS],rvx_signal_090[`UART_MC_DTR],rvx_signal_090[`UART_MC_OUT1],rvx_signal_090[`UART_MC_OUT2]} :	{rvx_signal_014,rvx_signal_082,rvx_signal_055,rvx_signal_047};

assign rvx_signal_039 = rvx_signal_007[`UART_LC_DL];
assign rvx_signal_096 = rvx_signal_090[4];

assign rvx_port_10 = rvx_signal_090[`UART_MC_RTS];
assign rvx_port_00 = rvx_signal_090[`UART_MC_DTR];

RVX_MODULE_036 i_rvx_instance_0(
	.rvx_port_05(rvx_port_02), 
	.rvx_port_08(rvx_port_07), 
	.rvx_port_09(rvx_signal_007), 
	.rvx_port_02(rvx_signal_034), 
	.rvx_port_04(rvx_signal_068), 
	.rvx_port_06(rvx_signal_003), 
	.rvx_port_00(rvx_signal_015), 
	.rvx_port_10(rvx_signal_070), 
	.rvx_port_07(rvx_signal_009), 
	.rvx_port_01(rvx_signal_037), 
	.rvx_port_03(rvx_signal_086)
);

always @ (posedge rvx_port_02 or posedge rvx_port_07)
begin
	if (rvx_port_02) begin
		rvx_signal_100 <= 1'b1;
		rvx_signal_081 <= 1'b1;
	end
	else begin
		rvx_signal_100 <= rvx_port_11;    
		rvx_signal_081 <= rvx_signal_100;    
	end
end

assign rvx_signal_017 = (rvx_signal_073 == 0) ? 1'b1 : rvx_signal_081;

wire 	serial_in	= rvx_signal_096 ? rvx_signal_015 : rvx_signal_017;
assign	rvx_port_13 	= (rvx_signal_096 || (rvx_signal_073 == 0)) ? 1'b1 : rvx_signal_015;

RVX_MODULE_026 i_rvx_instance_1(
	.rvx_port_05(rvx_port_02), 
	.rvx_port_10(rvx_port_07), 
	.rvx_port_04(rvx_signal_007), 
	.rvx_port_13(rvx_signal_101), 
	.rvx_port_03(serial_in), 
	.rvx_port_02(rvx_signal_003), 
	.rvx_port_07(rvx_signal_074), 
	.rvx_port_06(rvx_signal_011), 
	.rvx_port_00(rvx_signal_050), 
	.rvx_port_14(rvx_signal_043), 
	.rvx_port_12(rvx_signal_002), 
	.rvx_port_11(rvx_signal_040), 
	.rvx_port_09(rvx_signal_086), 
	.rvx_port_08(rvx_signal_031), 
	.rvx_port_01(rvx_signal_061)
);

always @*
begin
	case (rvx_port_12)
	`UART_REG_RB   	: rvx_port_08 = rvx_signal_039 ? rvx_signal_099[7:0] : rvx_signal_050[10:3];
	`UART_REG_IE	: rvx_port_08 = rvx_signal_039 ? rvx_signal_099[15:8] : rvx_signal_051;
	`UART_REG_II	: rvx_port_08 = {4'b1100,rvx_signal_058};
	`UART_REG_LC	: rvx_port_08 = rvx_signal_007;
	`UART_REG_LS	: rvx_port_08 = rvx_signal_083;
	`UART_REG_MS	: rvx_port_08 = rvx_signal_036;
	`UART_REG_SR	: rvx_port_08 = rvx_signal_048;
	`UART_REG_EN	: rvx_port_08 = {7'b0, rvx_signal_073};
	`UART_REG_TC	: rvx_port_08 = {{(8-FIFO_COUNTER_W){1'b0}}, rvx_signal_009};
	default			: rvx_port_08 = 8'b0; 
	endcase
end 

always @(posedge rvx_port_02 or posedge rvx_port_07)
begin
	if (rvx_port_02) begin
		rvx_signal_073 <=  0; 
	end
	else begin
		if(rvx_port_09 && (rvx_port_12==`UART_REG_EN)) begin
			rvx_signal_073 <= rvx_port_04[0];
		end
	end
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
		rvx_signal_101 <=  0; 
	else
	if (rvx_signal_101)	
		rvx_signal_101 <=  0;
	else
	if (rvx_port_05 && (rvx_port_12 == `UART_REG_RB) && !rvx_signal_039)
		rvx_signal_101 <=  1; 
end

wire 	rvx_signal_059;
wire 	rvx_signal_102;
wire  	rvx_signal_056;
wire	rvx_signal_093;
wire	rvx_signal_004;

assign rvx_signal_059 = (rvx_port_05 && (rvx_port_12 == `UART_REG_LS) && !rvx_signal_039);
assign rvx_signal_102 	= (rvx_port_05 && (rvx_port_12 == `UART_REG_II) && !rvx_signal_039);
assign rvx_signal_056 	= (rvx_port_05 && (rvx_port_12 == `UART_REG_MS) && !rvx_signal_039);
assign rvx_signal_093 	= (rvx_port_05 && (rvx_port_12 == `UART_REG_RB) && !rvx_signal_039);
assign rvx_signal_004 	= (rvx_port_09 && (rvx_port_12 == `UART_REG_TR) && !rvx_signal_039);

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
		rvx_signal_035 <=  0;
	else 
		rvx_signal_035 <=  rvx_signal_059;
end

assign rvx_signal_086 = rvx_signal_059 && ~rvx_signal_035;

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
		rvx_signal_013 <=  1;
	else
	if (rvx_signal_013)
		rvx_signal_013 <=  0;
	else
	if (rvx_signal_056)
		rvx_signal_013 <=  1; 
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
		rvx_signal_007 <=  8'b00000011; 
	else
	if (rvx_port_09 && (rvx_port_12==`UART_REG_LC))
		rvx_signal_007 <=  rvx_port_04;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
	begin
		rvx_signal_051 <=  4'b0000; 
		rvx_signal_099[15:8] <=  8'b0;
	end
	else
	if (rvx_port_09 && (rvx_port_12==`UART_REG_IE))
		if (rvx_signal_039)
		begin
			rvx_signal_099[15:8] <=  rvx_port_04;
		end
		else
			rvx_signal_051 <=  rvx_port_04[3:0]; 
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) begin
		rvx_signal_038 <=  2'b11; 
		rvx_signal_040 <=  0;
		rvx_signal_037 <=  0;
	end else
	if (rvx_port_09 && (rvx_port_12==`UART_REG_FC)) begin
		rvx_signal_038 <=  rvx_port_04[7:6];
		rvx_signal_040 <=  rvx_port_04[1];
		rvx_signal_037 <=  rvx_port_04[2];
	end else begin
		rvx_signal_040 <=  0;
		rvx_signal_037 <=  0;
	end
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
		rvx_signal_090 <=  5'b0; 
	else
	if (rvx_port_09 && (rvx_port_12==`UART_REG_MC))
			rvx_signal_090 <=  rvx_port_04[4:0];
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
		rvx_signal_048 <=  0; 
	else
	if (rvx_port_09 && (rvx_port_12==`UART_REG_SR))
		rvx_signal_048 <=  rvx_port_04;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
	begin
		rvx_signal_099[7:0]  	<=  8'b0;
		rvx_signal_034   	<=  1'b0;
		rvx_signal_054 	<=  1'b0;
		rvx_signal_068	<= 0;
	end
	else
	if (rvx_port_09 && (rvx_port_12==`UART_REG_TR))
		if (rvx_signal_039)
		begin
			rvx_signal_099[7:0] <=  rvx_port_04;
			rvx_signal_054 <=  1'b1; 
			rvx_signal_034 <=  1'b0;
		end
		else
		begin
			rvx_signal_034   <=  1'b1;
			rvx_signal_054 <=  1'b0;
			rvx_signal_068 <= rvx_port_04;
		end 
	else
	begin
		rvx_signal_054 <=  1'b0;
		rvx_signal_034   <=  1'b0;
	end 
end

always @(rvx_signal_038)
begin
	case (rvx_signal_038[`UART_FC_TL])
		2'b00 : rvx_signal_065 = 1;
		2'b01 : rvx_signal_065 = 4;
		2'b10 : rvx_signal_065 = 8;
		2'b11 : rvx_signal_065 = 14;
	endcase 
end
	

reg [3:0] rvx_signal_095;
always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
	  begin
  		rvx_signal_036 <=  0;
	  	rvx_signal_095[3:0] <=  0;
	  end
	else begin
		rvx_signal_036[`UART_MS_DDCD:`UART_MS_DCTS] <=  rvx_signal_013 ? 4'b0 :
			rvx_signal_036[`UART_MS_DDCD:`UART_MS_DCTS] | ({rvx_signal_033, rvx_signal_076, rvx_signal_049, rvx_signal_079} ^ rvx_signal_095[3:0]);
		rvx_signal_036[`UART_MS_CDCD:`UART_MS_CCTS] <=  {rvx_signal_071, rvx_signal_060, rvx_signal_094, rvx_signal_088};
		rvx_signal_095[3:0] <=  {rvx_signal_033, rvx_signal_076, rvx_signal_049, rvx_signal_079};
	end
end

assign rvx_signal_021 = (rvx_signal_011==0 && rvx_signal_061);  
assign rvx_signal_001 = rvx_signal_002;     
assign rvx_signal_045 = rvx_signal_050[1]; 
assign rvx_signal_030 = rvx_signal_050[0]; 
assign rvx_signal_069 = rvx_signal_050[2]; 
assign rvx_signal_078 = ((rvx_signal_009==5'b0) && rvx_signal_080);  
assign rvx_signal_064 = ((rvx_signal_009==5'b0) && rvx_signal_080 && (rvx_signal_070 ==  0)); 
assign rvx_signal_077 = rvx_signal_043 | rvx_signal_002;

reg 	 rvx_signal_097;

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_097 <=  0;
	else rvx_signal_097 <=  rvx_signal_021;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_029 <=  0;
	else rvx_signal_029 <=  (rvx_signal_011==1 && rvx_signal_101 && !rvx_signal_061 || rvx_signal_040) ? 0 : 
					  rvx_signal_029 || (rvx_signal_021 && ~rvx_signal_097); 
end

reg rvx_signal_066; 

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_066 <=  0;
	else rvx_signal_066 <=  rvx_signal_001;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_012 <=  0;
	else	rvx_signal_012 <= 	rvx_signal_086 ? 0 : rvx_signal_012 || (rvx_signal_001 && ~rvx_signal_066); 
end

reg rvx_signal_027; 

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_027 <=  0;
	else rvx_signal_027 <=  rvx_signal_045;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_006 <=  0;
	else rvx_signal_006 <=  rvx_signal_086 ? 0 : rvx_signal_006 || (rvx_signal_045 && ~rvx_signal_027); 
end

reg rvx_signal_032; 

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_032 <=  0;
	else rvx_signal_032 <=  rvx_signal_030;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_052 <=  0;
	else rvx_signal_052 <=  rvx_signal_086 ? 0 : rvx_signal_052 || (rvx_signal_030 && ~rvx_signal_032); 
end

reg rvx_signal_010; 

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_010 <=  0;
	else rvx_signal_010 <=  rvx_signal_069;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_000 <=  0;
	else rvx_signal_000 <=  rvx_signal_086 ? 0 : rvx_signal_000 || (rvx_signal_069 && ~rvx_signal_010);
end

reg rvx_signal_057;

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_057 <=  1;
	else rvx_signal_057 <=  rvx_signal_078;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_018 <=  1;
	else rvx_signal_018 <=  (rvx_signal_004) ? 0 :  rvx_signal_018 || (rvx_signal_078 && ~rvx_signal_057);
end

reg rvx_signal_084;

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_084 <=  1;
	else rvx_signal_084 <=  rvx_signal_064;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_085 <=  1;
	else rvx_signal_085 <=  (rvx_signal_004) ? 0 : rvx_signal_085 || (rvx_signal_064 && ~rvx_signal_084);
end

reg rvx_signal_008;

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_008 <=  0;
	else rvx_signal_008 <=  rvx_signal_077;
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_044 <=  0;
	else rvx_signal_044 <=  rvx_signal_086 ? 0 : rvx_signal_044 || (rvx_signal_077 && ~rvx_signal_008);
end

always @(posedge rvx_port_07 or posedge rvx_port_02) 
begin
	if (rvx_port_02)
		rvx_signal_022 <=  0;
	else
		if (rvx_signal_054 | ~ (|rvx_signal_022))
  			rvx_signal_022 <=  rvx_signal_099 - 1;               
		else
			rvx_signal_022 <=  rvx_signal_022 - 1;              
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
		rvx_signal_003 <=  1'b0;
	else
		if (|rvx_signal_099 & ~(|rvx_signal_022))     
			rvx_signal_003 <=  1'b1;
		else
			rvx_signal_003 <=  1'b0;
end

always @(rvx_signal_007)
begin
  case (rvx_signal_007[3:0])
    4'b0000                             : rvx_signal_023 =  95; 
    4'b0100                             : rvx_signal_023 = 103; 
    4'b0001, 4'b1000                    : rvx_signal_023 = 111; 
    4'b1100                             : rvx_signal_023 = 119; 
    4'b0010, 4'b0101, 4'b1001           : rvx_signal_023 = 127; 
    4'b0011, 4'b0110, 4'b1010, 4'b1101  : rvx_signal_023 = 143; 
    4'b0111, 4'b1011, 4'b1110           : rvx_signal_023 = 159; 
    4'b1111                             : rvx_signal_023 = 175; 
  endcase 
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
  if (rvx_port_02)
    rvx_signal_026 <=  8'd0;
  else
  if(rvx_signal_018 & rvx_signal_004)  
    rvx_signal_026 <=  rvx_signal_023;
  else
  if (rvx_signal_003 & rvx_signal_026 != 8'b0)  
    rvx_signal_026 <=  rvx_signal_026 - 1;  
end 

assign rvx_signal_080 = ~(|rvx_signal_026);

assign rvx_signal_028  = rvx_signal_051[`UART_IE_RLS] && (rvx_signal_083[`UART_LS_OE] || rvx_signal_083[`UART_LS_PE] || rvx_signal_083[`UART_LS_FE] || rvx_signal_083[`UART_LS_BI]);
assign rvx_signal_062  = rvx_signal_051[`UART_IE_RDA] && (rvx_signal_011 >= {1'b0,rvx_signal_065});
assign rvx_signal_041 = rvx_signal_051[`UART_IE_THRE] && rvx_signal_083[`UART_LS_TFE];
assign rvx_signal_091   = rvx_signal_051[`UART_IE_MS] && (| rvx_signal_036[3:0]);
assign rvx_signal_019   = rvx_signal_051[`UART_IE_RDA] && (rvx_signal_074 == 10'b0) && (|rvx_signal_011);

reg 	 rvx_signal_025;
reg 	 rvx_signal_020;
reg 	 rvx_signal_024;
reg 	 rvx_signal_046;
reg 	 rvx_signal_075;

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_025 <=  0;
	else rvx_signal_025 <=  rvx_signal_028;
end

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_075 <=  0;
	else rvx_signal_075 <=  rvx_signal_062;
end

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_020 <=  0;
	else rvx_signal_020 <=  rvx_signal_041;
end

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_024 <=  0;
	else rvx_signal_024 <=  rvx_signal_091;
end

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_046 <=  0;
	else rvx_signal_046 <=  rvx_signal_019;
end

wire 	 rvx_signal_087;
wire 	 rvx_signal_089;
wire 	 rvx_signal_016;
wire 	 rvx_signal_092;
wire 	 rvx_signal_072;

assign rvx_signal_072    = rvx_signal_062 & ~rvx_signal_075;
assign rvx_signal_087 	  = rvx_signal_028 & ~rvx_signal_025;
assign rvx_signal_089   = rvx_signal_041 & ~rvx_signal_020;
assign rvx_signal_016 	  = rvx_signal_091 & ~rvx_signal_024;
assign rvx_signal_092 	  = rvx_signal_019 & ~rvx_signal_046;

reg 	rvx_signal_053;
reg		rvx_signal_063;
reg 	rvx_signal_098;
reg 	rvx_signal_042;
reg 	rvx_signal_067;

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_053 <=  0; 
	else 
		rvx_signal_053 <=  rvx_signal_086 ? 0 :  						
							rvx_signal_087 ? 1 :						
							rvx_signal_053 && rvx_signal_051[`UART_IE_RLS];	
end

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_063 <=  0; 
	else 
		rvx_signal_063 <=  ((rvx_signal_011 == {1'b0,rvx_signal_065}) && rvx_signal_093) ? 0 :  	
							rvx_signal_072 ? 1 :						
							rvx_signal_063 && rvx_signal_051[`UART_IE_RDA];	
end

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_098 <=  0; 
	else 
		rvx_signal_098 <=  rvx_signal_004 || (rvx_signal_102 & ~rvx_signal_058[`UART_II_IP] & rvx_signal_058[`UART_II_II] == `UART_II_THRE)? 0 : 
							rvx_signal_089 ? 1 :
							rvx_signal_098 && rvx_signal_051[`UART_IE_THRE];
end

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_042 <=  0; 
	else 
		rvx_signal_042 <=  rvx_signal_056 ? 0 : 
							rvx_signal_016 ? 1 :
							rvx_signal_042 && rvx_signal_051[`UART_IE_MS];
end

always  @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02) rvx_signal_067 <=  0; 
	else 
		rvx_signal_067 <=  rvx_signal_093 ? 0 : 
							rvx_signal_092 ? 1 :
							rvx_signal_067 && rvx_signal_051[`UART_IE_RDA];
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)	
		rvx_port_03 <=  1'b0;
	else
		rvx_port_03 <= rvx_signal_053? ~rvx_signal_086 : (rvx_signal_063? 1 : (rvx_signal_067? ~rvx_signal_093 : (rvx_signal_098? !(rvx_signal_004 & rvx_signal_102) : (rvx_signal_042? ~rvx_signal_056 : 0))));
end

always @(posedge rvx_port_07 or posedge rvx_port_02)
begin
	if (rvx_port_02)
		rvx_signal_058 <=  1;
	else
	if (rvx_signal_053)  
	begin
		rvx_signal_058[`UART_II_II] <=  `UART_II_RLS;	
		rvx_signal_058[`UART_II_IP] <=  1'b0;		
	end else 
	if (rvx_signal_062)
	begin
		rvx_signal_058[`UART_II_II] <=  `UART_II_RDA;
		rvx_signal_058[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_067)
	begin
		rvx_signal_058[`UART_II_II] <=  `UART_II_TI;
		rvx_signal_058[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_098)
	begin
		rvx_signal_058[`UART_II_II] <=  `UART_II_THRE;
		rvx_signal_058[`UART_II_IP] <=  1'b0;
	end
	else if (rvx_signal_042)
	begin
		rvx_signal_058[`UART_II_II] <=  `UART_II_MS;
		rvx_signal_058[`UART_II_IP] <=  1'b0;
	end else	
	begin
		rvx_signal_058[`UART_II_II] <=  0;
		rvx_signal_058[`UART_II_IP] <=  1'b1;
	end
end

endmodule

