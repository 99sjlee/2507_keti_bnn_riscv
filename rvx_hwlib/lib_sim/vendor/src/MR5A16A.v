/*********************************************************************

-- VERILOG Model for a 1M x 16 MRAM
-- Device Part Number: MR5A16A

-- Model Revision: 1.4
-- Model Release Date: 2021/03/30

---------------------------------------------------------------------
-- This Verilog models is provided "as is" without warranty of
-- any kind, included but not limited to, implied warranty of
-- merchant ability and fitness for a particular purpose.
-- Please refer to the datasheet for all specifications. 
-- Datasheet serves as the final arbiter of product performance
---------------------------------------------------------------------

Rev 1.1 June 2020
Rev 1.2 2021/03/09 -- Wes Chang
  Add 0.1ns delay on "bufdvad" input port to prevent wrong error message.
Rev 1.3 2021/03/09 -- Wes Chang
  Change time scale from 1ns/100ps to 1ns/10ps, change "bufdvad" delay from 100ps to 10ps
Rev 1.4 2021/03/31 -- Wes Chang
  Change output "data_temp" latch trigger signal
  fix timing parameters

***********************************************************************/

`timescale 1 ns/10 ps
`define MRAM35
`include "CONFIG_MR5A16A.vh"

/***********************************************************************
Top Level Signals

Address - 21 Bit Address Bus
DQ      - 16 Bit Data Bus
G_b	- Active Low Chip Select
E_b	- Active Low Output Enable
W_b	- Active Low Write Enable
UB_b	- Active Low High Byte Enable
LB_b	- Active Low Low Byte Enable

************************************************************************/
module MR5A16A (Address, DQ, G_b, E_b, W_b,UB_b, LB_b);

/* x16 Models are generated from same base using the following parameters */

parameter Bits_in_Address_Bus = 21;
parameter Bytes_in_Array = 2097152;
						
input [Bits_in_Address_Bus-1:0] Address;		
inout [15:0]  DQ;				
input E_b, W_b, G_b, UB_b, LB_b;

reg   [15:0] MRAM_Array [0:Bytes_in_Array-1];	//final mram_array
reg   [15:0] data_temp, wrdata, Read_Data; 	//Data Buffers
wire  [15:0] intwrdata;             		//Delayed Data
reg   [Bits_in_Address_Bus-1:0] wradd, rdadd;	//Address Buffers
wire   intwr1_eb2, intwr1_wb2, intwr1_ub2, intwr1_lb2, intwr1_add2;
wire   intwr1_eb, intwr1_wb, intwr1_ub, intwr1_lb, intwr1_add;
reg   atdb, ubwr, lbwr, wrset, dtranu, dtranl; 
wire  intuoe, intloe, intudv, intldv, intwrcmd, dtranudly, dtranldly;
wire  intoe1_gb, intoe1_eb, intoe1_wb, intoe1_ub, intoe1_lb;
wire  intdv_add, intdv1_add, intdv2_add, intdv3_add;
wire  intdv1_gb, intdv1_eb, intdv1_wb, intdv1_ub, intdv1_lb;



/************************************************************************************************

Model Start

*************************************************************************************************/

assign DQ[15:8] =  (intuoe) ?  Read_Data[15:8]  : 8'bz ;
assign DQ[7:0] =  (intloe) ?  Read_Data[7:0]  : 8'bz ;

always @(Address)
begin
  atdb=1'b0;
  #0.1;
  atdb=1'b1;
  ubwr=1'b0;
  lbwr=1'b0;
  wrset = 1'b0;
end

buf #(4.9,0) bufatd (intdv_add, atdb);

always @(negedge(intdv_add))
begin
if (intdv1_add === 1'b0)
   $display("  ERROR @%0d - tavav must be <%0dns (except for address skew <5ns)", $time, `tavav); 
end


/**********************************************************************************************

Write Routines

***********************************************************************************************/

buf #(`telwh,0) bufwreb (intwr1_eb, ~E_b);
buf #(`twlwh,0) bufwrwb (intwr1_wb, ~W_b);
buf #(`tblwh,0) bufwrub (intwr1_ub, ~UB_b);
buf #(`tblwh,0) bufwrlb (intwr1_lb, ~LB_b);
buf #(`tavwh-5,0) bufwradd1 (intwr1_add, intdv_add);
buf #(10,`twhax-0.1) bufwreb2 (intwr1_eb2, ~E_b);
buf #(10,`twhax-0.1) bufwrwb2 (intwr1_wb2, ~W_b);
buf #(10,`twhax-0.1) bufwrub2 (intwr1_ub2, ~UB_b);
buf #(10,`twhax-0.1) bufwrlb2 (intwr1_lb2, ~LB_b);
buf #(30,0) bufwradd2 (intwr1_add2, intdv_add);
buf #(0.1,`tdvwh-2) bufdtru (dtranudly, dtranu);
buf #(0.1,`tdvwh-2) bufdtrl (dtranldly, dtranl);
buf #(0.1,0.1) bufdint[15:0] (intwrdata, DQ);


always @(posedge(intwr1_eb && intwr1_wb && (intwr1_ub || intwr1_lb) && intwr1_add))
begin
  wrdata = MRAM_Array[Address];
  wradd  = Address;
  MRAM_Array[wradd] = 16'hxxxx;
  ubwr = intwr1_ub;
  lbwr = intwr1_lb;
end

always @(DQ[15:8])
begin
  dtranu = 1'b1;
  #2;
  dtranu = 1'b0;
end

always @(DQ[7:0])
begin
  dtranl = 1'b1;
  #2;
  dtranl = 1'b0;
end

always @(negedge(intwr1_eb && intwr1_wb && intwr1_ub && intwr1_add && ubwr))
fork 
   if (~dtranudly)
    begin
     #(`twhdx);
     wrdata[15:8] = intwrdata[15:8];
    end
   #2 lbwr <= 1'b0;
join 

always @(negedge(intwr1_eb && intwr1_wb && intwr1_lb && intwr1_add && lbwr))
fork  
   if (~dtranldly)
    begin
     #(`twhdx);
     wrdata[7:0] = intwrdata[7:0];
    end
   #2 ubwr <= 1'b0;
join 

always @(negedge(intwr1_eb2 && intwr1_wb2 && (intwr1_ub2 || intwr1_lb2)))
begin
  wrset <= 1'b1;
end

always @(posedge(intwr1_add2 && wrset))
begin
   MRAM_Array[wradd] <= wrdata;
   wrset = 1'b0;
end

always @(posedge(intwr1_eb2 || intwr1_wb2 || intwr1_ub2 || intwr1_lb2))
begin
  ubwr <= 0;
  lbwr <= 0;
  wrset = 1'b0;
end

buf #(`tavwl+0.1,`tavwl+0.1) bufavw[15:0] (intwrcmd, (~W_b && ~E_b && (~UB_b || ~LB_b)));

always @(Address)
begin
  if (intwrcmd)
    $display("  ERROR @%0d - tAVWL/tAVEL/tAVBL must be >=%0dns", $time, `tavwl);
end

/**********************************************************************************************

Read Routines

***********************************************************************************************/
buf #(`tglqv-0.1,`tghqx) bufdvgb (intdv1_gb, ~G_b);//tghqx
buf #(`telqv-0.1,`tehqx) bufdveb (intdv1_eb, ~E_b);//tehqx
buf #(`tavqv-0.1,`twlqz) bufdvwb (intdv1_wb, W_b);
buf #(`tblqv-0.1,`tbhqx) bufdvub (intdv1_ub, ~UB_b);//tbhqx
buf #(`tblqv-0.1,`tbhqx) bufdvlb (intdv1_lb, ~LB_b);//tbhqx
buf #(`tavqv-`tavav,0) bufdvad3 (intdv3_add, intdv2_add);
buf #(0,`taxqx) bufdvad2 (intdv2_add, intdv1_add);
buf #(`tavav-5.1,0.01) bufdvad (intdv1_add, intdv_add);
buf #(`tglqx,`tghqz-0.1) bufoegb (intoe1_gb, ~G_b);//
buf #(`telqx,`tehqz-0.1) bufoeeb (intoe1_eb, ~E_b);//
buf #(`twhqx,`twlqz-0.1) bufoewb (intoe1_wb, W_b);//
buf #(`tblqx,`tbhqz-0.1) bufoeub (intoe1_ub, ~UB_b);//
buf #(`tblqx,`tbhqz-0.1) bufoelb (intoe1_lb, ~LB_b);//

assign intudv = (intdv1_gb && intdv1_eb && intdv1_wb && intdv3_add && intdv1_ub);
assign intldv = (intdv1_gb && intdv1_eb && intdv1_wb && intdv3_add && intdv1_lb);
assign intuoe = (intoe1_gb && intoe1_eb && intoe1_wb && intoe1_ub);
assign intloe = (intoe1_gb && intoe1_eb && intoe1_wb && intoe1_lb);

always @(posedge (intdv1_add && ~G_b/*intdv1_wb*/))
begin
  data_temp = MRAM_Array[Address];
end


always @(posedge intudv)
begin
  Read_Data[15:8] = data_temp[15:8];
end 

always @(negedge intudv)
begin
  Read_Data[15:8] = 8'bx;
end

always @(posedge intldv)
begin
  Read_Data[7:0] = data_temp[7:0];
end 

always @(negedge intldv)
begin
  Read_Data[7:0] = 8'bx;
end

endmodule
