`ifdef INCLUDE_UART
	,
	.uart_rx(uart_rx),
	.uart_tx(uart_tx)
`endif

`ifdef INCLUDE_SPI
	,
	.spi_clk(spi_clk),
	.spi_cs(spi_cs),
	.spi_dq0_in(spi_dq0_in),
	.spi_dq0_out(spi_dq0_out),
	.spi_dq0_oe(spi_dq0_oe),
	.spi_dq1_in(spi_dq1_in),
	.spi_dq1_out(spi_dq1_out),
	.spi_dq1_oe(spi_dq1_oe),
	.spi_dq2_in(spi_dq2_in),
	.spi_dq2_out(spi_dq2_out),
	.spi_dq2_oe(spi_dq2_oe),
	.spi_dq3_in(spi_dq3_in),
	.spi_dq3_out(spi_dq3_out),
	.spi_dq3_oe(spi_dq3_oe)
`endif

`ifdef INCLUDE_I2C
	,
	.i2c_clk_in(i2c_clk_in),
	.i2c_clk_out(i2c_clk_out),
	.i2c_clk_oe(i2c_clk_oe),
	.i2c_data_in(i2c_data_in),
	.i2c_data_out(i2c_data_out),
	.i2c_data_oe(i2c_data_oe)
`endif

`ifdef INCLUDE_OLED
	,
	.oled_dc_sel(oled_dc_sel),
	.oled_rstnn(oled_rstnn),
	.oled_vbat(oled_vbat),
	.oled_vdd(oled_vdd)
`endif

`ifdef INCLUDE_GPIO
	,
	.gpio_od(gpio_oe), 
	.gpio_oval(gpio_oval), 
	.gpio_ival(gpio_ival)
`endif

