ERVP_MEMORY_CELL_1R1WC
#(
	.DEPTH(I_NUM_LINES),
	.WIDTH(BW_ITAG_CELL),
	.BW_INDEX(LOG2RU(I_NUM_LINES)),
	.USE_SUBWORD_ENABLE(0)
)
i_cell_for_icache_tag
(
	.clk(clk),
	.rstnn(1'b 1),

	.windex(icache_tag_waddr),
	.wenable(icache_tag_wenable),
	.wpermit(1'b 0),
	.wdata(icache_tag_wdata),

	.rindex(icache_tag_raddr),
	.rdata_asynch(),
	.renable(icache_tag_renable),
	.rdata_synch(icache_tag_rdata)
);

ERVP_MEMORY_CELL_1R1WC
#(
	.DEPTH(ICACHE_SIZE/(ICACHE_EXTERNAL_WIDTH/8)),
	.WIDTH(ICACHE_EXTERNAL_WIDTH),
	.BW_INDEX(LOG2RU(ICACHE_SIZE/(ICACHE_EXTERNAL_WIDTH/8))),
	.USE_SUBWORD_ENABLE(1),
	.BW_SUBWORD(8)
)
i_cell_for_icache_data
(
	.clk(clk),
	.rstnn(1'b 1),

	.windex(icache_data_waddr),
	.wenable(icache_data_wenable),
	.wpermit(icache_data_wstrb),
	.wdata(icache_data_wdata),

	.rindex(icache_data_raddr),
	.rdata_asynch(),
	.renable(icache_data_renable),
	.rdata_synch(icache_data_rdata)
);

ERVP_MEMORY_CELL_1R1WC
#(
	.DEPTH(D_NUM_LINES),
	.WIDTH(BW_DTAG_CELL),
	.BW_INDEX(LOG2RU(D_NUM_LINES)),
	.USE_SUBWORD_ENABLE(0)
)
i_cell_for_dcache_tag
(
	.clk(clk),
	.rstnn(1'b 1),

	.windex(dcache_tag_waddr),
	.wenable(dcache_tag_wenable),
	.wpermit(1'b 0),
	.wdata(dcache_tag_wdata),

	.rindex(dcache_tag_raddr),
	.rdata_asynch(),
	.renable(dcache_tag_renable),
	.rdata_synch(dcache_tag_rdata)
);

ERVP_MEMORY_CELL_1R1WC
#(
	.DEPTH(DCACHE_SIZE/(DCACHE_EXTERNAL_WIDTH/8)),
	.WIDTH(DCACHE_EXTERNAL_WIDTH),
	.BW_INDEX(LOG2RU(DCACHE_SIZE/(DCACHE_EXTERNAL_WIDTH/8))),
	.USE_SUBWORD_ENABLE(1),
	.BW_SUBWORD(8)
)
i_cell_for_dcache_data
(
	.clk(clk),
	.rstnn(1'b 1),

	.windex(dcache_data_waddr),
	.wenable(dcache_data_wenable),
	.wpermit(dcache_data_wstrb),
	.wdata(dcache_data_wdata),

	.rindex(dcache_data_raddr),
	.rdata_asynch(),
	.renable(dcache_data_renable),
	.rdata_synch(dcache_data_rdata)
);
