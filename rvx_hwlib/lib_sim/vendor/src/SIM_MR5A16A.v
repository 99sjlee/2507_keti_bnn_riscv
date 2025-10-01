`timescale 1 ns/1 ns

module SIM_MR5A16A;

reg  [20:0] Address;
tri  [15:0] DQ;
reg         E_b, W_b, G_b, UB_b, LB_b;

MR5A16A MR5A16A(Address, DQ, G_b, E_b, W_b,UB_b, LB_b);

initial
begin
  Address = 0;
  E_b     = 1;
  W_b     = 1;
  G_b     = 1;
  UB_b    = 0;
  LB_b    = 0;
  force DQ = 0;

  #100;
  //write
  Address = 21'h0_0001;
  G_b = 1;  E_b = 0;  W_b = 0;  //#1;
  force DQ = 16'h0011;
  #24;
  //release DQ;
  G_b = 1;  E_b = 1;  W_b = 1;  #16;

  G_b = 1;  E_b = 0;  W_b = 1;
  release DQ;
  
  G_b = 0;  E_b = 0;  W_b = 1;
  #56;

  
  Address = 21'h0_0000;
  G_b = 1;  E_b = 0;  W_b = 0;  //#1;
  force DQ = 16'h5544;
  #24;
  //release DQ;
  G_b = 1;  E_b = 0;  W_b = 1;  #20;
  
  //Address = 21'h0_0003;
  //G_b = 1;  E_b = 0;  W_b = 0;  //#1;
  //force DQ = 16'h3003;
  //#35;
  ////release DQ;
  //G_b = 1;  E_b = 1;  W_b = 1;  #15;
  //
  //Address = 21'h0_0004;
  //G_b = 1;  E_b = 0;  W_b = 0;  //#1;
  //force DQ = 16'h4004;
  //#35;
  ////release DQ;
  //G_b = 1;  E_b = 1;  W_b = 1;  #15;

  
  //--------------------------------------------------------------------------//
  G_b = 1;  E_b = 0;  W_b = 1;
  release DQ;
  //#5;
  //Address = 21'h0_0000;
  //#5;
  //--------------------------------------------------------------------------//
  
  //read
  //Address = 21'h0_0001;
  G_b = 0;  E_b = 0;  W_b = 1;
  #56;
  //Address = 21'h0_0002;
  //#55;
  //Address = 21'h0_0003;
  //#55;
  //Address = 21'h0_0004;
  //#55;
  
  Address = 0;
  E_b     = 1;
  W_b     = 1;
  G_b     = 1;
  UB_b    = 0;
  LB_b    = 0;
  #200
  
  $stop;
  

end

endmodule