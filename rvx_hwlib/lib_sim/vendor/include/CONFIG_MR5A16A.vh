/**********************************************************************

-- Configuration file for the M x 16 MRAM
-- Device Part Number: MR5A16A

-- This configuration file is used to define timing parameters for the end product,
-- To set new parameters, update this file

-- Model Revision: 1.0
-- Model Release Date: June 2020

---------------------------------------------------------------------
-- This Verilog models is provided "as is" without warranty of
-- any kind, included but not limited to, implied warranty of
-- merchant ability and fitness for a particular purpose.
-- Please refer to the datasheet for all specifications. 
-- Datasheet serves as the final arbiter of product performance
---------------------------------------------------------------------
*************************************************************************/

`ifdef MRAM35	
  `define tavav  35  //write cycle time
  `define twlwh  15  //write pulse width	
  `define teleh  20  //chip enable to end of write
  `define tdvwh  10  //data set-up to end of write
  `define twlqz  15  //write enable to output disable
  `define tehqz  15  //write enable to chip disable   
  `define tghqz  10  //write enable to output disable   
  `define tavwl   0  //address  set-up to start of write
  `define twhax  12  //address hold after end of write 
  `define tavav  35  //read cycle time
  `define tglqv  15  //output enable to data valid
  `define tavqv  35  //Address Access Time
  `define taxqx   3  //Output Hold After Address Change
  `define tbleh  15  //Byte Enable to end of write  - Chip Enable controlled
  `define tblwh  15  //Byte enable to end of write - WE Controlled
  `define tbhqz  10  //Byte Disable to Output Inactive
  `define telwh  15  //Enable end to write //by Wes Chang
  `define tavwh  20  //Address valid to end of write //by Wes Chang
  `define twhdx   0  //Data hold time //by Wes Chang
  `define tghqx  15  //???? //by Wes Chang
  `define telqv  35  //Enable access time //by Wes Chang
  `define tehqx  15  //????
  `define tblqv  15  //Byte enable access time //by Wes Chang
  `define tglqx  15  //Output enable low to output active //by Wes Chang
  `define telqx   3  //Enable low to output active //by Wes Chang
  `define twhqx   3  //Write high to output active //by Wes Chang
  `define tbhqx  10  //High byte enable to DQ hold time
  `define tblqx  10  //LOW  byte enable to DQ hold time
`endif 
