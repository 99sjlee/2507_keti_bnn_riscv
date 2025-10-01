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
wire record_start = pjtag_rfinished;
wire record_finish = simulation_stop;

initial
begin
	record_enable = 0;
	`ifndef USE_MODELSIM
	#1
	`ifdef RECORD_WAVE
		`ifndef DEBUG_INIT
			wait(record_start==1);
		`endif
		$recordsetup(
			{"design = ", `PLATFORM_NAME},
			"directory = wave",
			"version = 1",
			
			"run = 1"
		);
    `ifdef RECORD_TOP
    $recordvars(`RECORD_TOP);
    `else
		$recordvars("depth=20");
    `endif
		$display("[NCSIM:INFO] record start %d", $time);
		record_enable = 1;
	`endif
	#1
	wait(record_finish==1);
	#10;
	`ifdef RECORD_WAVE
		$display("record end %d", $time);
		$recordoff;
		$display("[NCSIM:INFO] record end %d", $time);
		record_enable = 0;
	`endif
	`endif
end
