
module firmware (
	clk_clk,
	pio_out_export,
	reset_reset_n,
	sin_out_readdata,
	cos_out_readdata,
	tan_out_readdata);	

	input		clk_clk;
	output	[31:0]	pio_out_export;
	input		reset_reset_n;
	output	[31:0]	sin_out_readdata;
	output	[31:0]	cos_out_readdata;
	output	[31:0]	tan_out_readdata;
endmodule
