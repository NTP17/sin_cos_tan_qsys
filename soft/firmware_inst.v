	firmware u0 (
		.clk_clk          (<connected-to-clk_clk>),          //     clk.clk
		.pio_out_export   (<connected-to-pio_out_export>),   // pio_out.export
		.reset_reset_n    (<connected-to-reset_reset_n>),    //   reset.reset_n
		.sin_out_readdata (<connected-to-sin_out_readdata>), // sin_out.readdata
		.cos_out_readdata (<connected-to-cos_out_readdata>), // cos_out.readdata
		.tan_out_readdata (<connected-to-tan_out_readdata>)  // tan_out.readdata
	);

