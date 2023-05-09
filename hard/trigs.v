module trigs (
	input CLOCK_50
);

firmware (
	.clk_clk(CLOCK_50),
	.reset_reset_n(1'b1)
);

endmodule