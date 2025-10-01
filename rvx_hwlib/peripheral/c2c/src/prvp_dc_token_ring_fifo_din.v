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



module prvp_dc_token_ring_fifo_din(clk, rstn, data, valid, ready, write_token, read_pointer, data_async);



    parameter                   DATA_WIDTH = 10;
    parameter                   BUFFER_DEPTH = 8;

    input                       clk;
    input                       rstn;
    input [DATA_WIDTH - 1 : 0]  data;
    input                       valid;
    output                      ready;

    output [BUFFER_DEPTH - 1 : 0] write_token;
    input  [BUFFER_DEPTH - 1 : 0] read_pointer;

    output [DATA_WIDTH - 1 : 0] data_async;

    wire                        rvx_signal_0;
    wire                        rvx_signal_1;
    wire [BUFFER_DEPTH - 1 : 0] rvx_signal_2;

    assign ready = ~rvx_signal_0;

    
    assign rvx_signal_1 = (valid & ready);

    
    prvp_dc_data_buffer
    #(
      .DATA_WIDTH   ( DATA_WIDTH   ),
      .BUFFER_DEPTH ( BUFFER_DEPTH )
    )
    i_rvx_instance_2
    (
      .clk           ( clk           ),
      .rstn          ( rstn          ),
      .write_pointer ( rvx_signal_2 ),
      .write_data    ( data          ),
      .read_pointer  ( read_pointer  ),
      .read_data     ( data_async    )
    );

    
    prvp_dc_token_ring
    #(
      .BUFFER_DEPTH ( BUFFER_DEPTH ),
      .RESET_VALUE  ( 'hc          )
    )
    i_rvx_instance_0
    (
      .clk    ( clk          ),
      .rstn   ( rstn         ),
      .enable ( rvx_signal_1 ),
      .state  ( write_token  )
    );

    
    assign rvx_signal_2 = {write_token[BUFFER_DEPTH - 2 : 0], write_token[BUFFER_DEPTH - 1]} & write_token;

    
    prvp_dc_full_detector
    #(
      .BUFFER_DEPTH ( BUFFER_DEPTH )
    )
    i_rvx_instance_1
    (
      .clk           ( clk           ),
      .rstn          ( rstn          ),
      .read_pointer  ( read_pointer  ),
      .write_pointer ( rvx_signal_2 ),
      .valid         ( valid         ),
      .full          ( rvx_signal_0         )
    );

endmodule
