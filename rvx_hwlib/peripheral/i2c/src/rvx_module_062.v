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


`include "i2c_master_defines.v"





module RVX_MODULE_062(

	rvx_port_07, 
        rvx_port_00,
        rvx_port_12,

        rvx_port_04,
        rvx_port_10,
        rvx_port_06,
        rvx_port_09,
        rvx_port_16,
        rvx_port_03,
        rvx_port_11,
        rvx_port_05,
        
        rvx_port_15,
        rvx_port_08,
        rvx_port_13,
        rvx_port_14,
        rvx_port_02,
        rvx_port_01
);





	
	parameter RVX_GPARA_0 = 1'b0; 

	
	
	
	
	input        rvx_port_07;     
	input        rvx_port_00;     
        output       rvx_port_12;    

        input wire rvx_port_04;
        input wire rvx_port_10;
        input wire [7:0] rvx_port_06;
        input wire rvx_port_09;
        input wire [7:0] rvx_port_16;
        output reg [7:0] rvx_port_03;
        output reg rvx_port_11;
        output wire rvx_port_05;

	
	
	reg rvx_port_12;

	
	
	input  rvx_port_15;       
	output rvx_port_08;       
	output rvx_port_13;    

	
	input  rvx_port_14;       
	output rvx_port_02;       
	output rvx_port_01;    

	
	
	

	
	reg  [15:0] rvx_signal_13; 
	reg  [ 7:0] rvx_signal_22;  
	reg  [ 7:0] rvx_signal_04;  
	wire [ 7:0] rvx_signal_14;  
	reg  [ 7:0] rvx_signal_15;   
	wire [ 7:0] rvx_signal_23;   

	
	wire rvx_signal_06;

	
	wire rvx_signal_03;
	wire rvx_signal_20;

	
	wire rvx_signal_10;
	reg  rvx_signal_09;       
	reg  rvx_signal_05;         
	reg  rvx_signal_07;    
	wire rvx_signal_01;    
	wire rvx_signal_17;      
	reg  rvx_signal_00;          

	
	
	

	
	

	
	
	wire wb_wacc =  rvx_port_09 & rvx_port_04 & rvx_port_10;
	wire wb_racc =  ~rvx_port_09 & rvx_port_04 & rvx_port_10;

	
	
	

        always @(posedge rvx_port_07 or negedge rvx_port_00)
        begin
        if(!rvx_port_00)
         rvx_port_11 <= 1'b0;
        else
         rvx_port_11  <= (rvx_port_04 & ~rvx_port_10);
        end

	
	
	always @(*)
	begin
          
	  case (rvx_port_06) 
	    
	    8'h00:  rvx_port_03 =  rvx_signal_13[ 7:0];
	    8'h04:  rvx_port_03 =  rvx_signal_13[15:8];
	    8'h08:  rvx_port_03 =  rvx_signal_22;
	    8'h0c:  rvx_port_03 =  rvx_signal_14; 
	    8'h10:  rvx_port_03 =  rvx_signal_23;  
	    8'h14:  rvx_port_03 =  rvx_signal_04;
	    8'h18:  rvx_port_03 =  rvx_signal_15;
	    8'h1c:  rvx_port_03 =  0;   
            default:  rvx_port_03 =  0;
	  endcase
        
        
	end
       

	
	always @(posedge rvx_port_07 or negedge rvx_port_00)
	  if (!rvx_port_00)
	    begin
	        rvx_signal_13 <= 16'hffff;
	        rvx_signal_22  <=  8'h0;
	        rvx_signal_04  <=  8'h0;
	    end
	  else
	    if (wb_wacc)
	      
	      case (rvx_port_06) 
	         
	         8'h00 : rvx_signal_13 [ 7:0] <=  rvx_port_16;
	         8'h04 : rvx_signal_13 [15:8] <=  rvx_port_16;
	         8'h08 : rvx_signal_22         <=  rvx_port_16;
	         8'h0c : rvx_signal_04         <=  rvx_port_16;
	         default: ;
	      endcase

	
	always @(posedge rvx_port_07 or negedge rvx_port_00)
	  if (!rvx_port_00)
	    rvx_signal_15 <=  8'h0;
	  else if (wb_wacc)
	    begin
	        
	        if (rvx_signal_03 & (rvx_port_06 == 8'h10) )
	          
	          rvx_signal_15 <=  rvx_port_16;
	    end
	  else
	    begin
	        if (rvx_signal_06 | rvx_signal_17)
	          rvx_signal_15[7:4] <=  4'h0;           
	                                        
	        rvx_signal_15[2:1] <=  2'b0;             
	        rvx_signal_15[0]   <=  1'b0;             
	    end

	
	wire sta  = rvx_signal_15[7];
	wire sto  = rvx_signal_15[6];
	wire rd   = rvx_signal_15[5];
	wire wr   = rvx_signal_15[4];
	wire ack  = rvx_signal_15[3];
	wire iack = rvx_signal_15[0];

	
	assign rvx_signal_03 = rvx_signal_22[7];
	assign rvx_signal_20 = rvx_signal_22[6];

	
	RVX_MODULE_086 i_rvx_instance_0 (
		.rvx_port_12( rvx_port_07     ),
		.rvx_port_17( rvx_port_00     ),
		.rvx_port_11( rvx_signal_03      ),
		.rvx_port_10( rvx_signal_13         ),
		.rvx_port_01( sta          ),
		.rvx_port_02( sto          ),
		.rvx_port_13( rd           ),
		.rvx_port_16( wr           ),
		.rvx_port_18( ack          ),
		.rvx_port_15( rvx_signal_04          ),
		.rvx_port_05( rvx_signal_06         ),
		.rvx_port_20( rvx_signal_10       ),
		.rvx_port_14( rvx_signal_14          ),
		.rvx_port_06( rvx_signal_01     ),
		.rvx_port_09( rvx_signal_17       ),
		.rvx_port_00( rvx_port_15    ),
		.rvx_port_03( rvx_port_08    ),
		.rvx_port_07( rvx_port_13 ),
		.rvx_port_08( rvx_port_14    ),
		.rvx_port_04( rvx_port_02    ),
		.rvx_port_19( rvx_port_01 )
	);

	
	always @(posedge rvx_port_07 or negedge rvx_port_00)
	  if (!rvx_port_00)
	    begin
	        rvx_signal_00       <= 1'b0;
	        rvx_signal_09    <= 1'b0;
	        rvx_signal_05      <= 1'b0;
	        rvx_signal_07 <= 1'b0;
	    end
	  else
	    begin
	        rvx_signal_00       <= rvx_signal_17 | (rvx_signal_00 & ~sta);
	        rvx_signal_09    <= rvx_signal_10;
	        rvx_signal_05      <= (rd | wr);
	        rvx_signal_07 <= (rvx_signal_06 | rvx_signal_17 | rvx_signal_07) & ~iack; 
	    end

	
	always @(posedge rvx_port_07 or negedge rvx_port_00)
	  if (!rvx_port_00)
	    rvx_port_12 <= 1'b0;
	  else
	    rvx_port_12 <= rvx_signal_07 && rvx_signal_20; 

	
	assign rvx_signal_23[7]   = rvx_signal_09;
	assign rvx_signal_23[6]   = rvx_signal_01;
	assign rvx_signal_23[5]   = rvx_signal_00;
	assign rvx_signal_23[4:2] = 3'h0; 
	assign rvx_signal_23[1]   = rvx_signal_05;
	assign rvx_signal_23[0]   = rvx_signal_07;

        assign rvx_port_05 = 1'b0;
endmodule
