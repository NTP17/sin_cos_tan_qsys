	component firmware is
		port (
			clk_clk          : in  std_logic                     := 'X'; -- clk
			pio_out_export   : out std_logic_vector(31 downto 0);        -- export
			reset_reset_n    : in  std_logic                     := 'X'; -- reset_n
			sin_out_readdata : out std_logic_vector(31 downto 0);        -- readdata
			cos_out_readdata : out std_logic_vector(31 downto 0);        -- readdata
			tan_out_readdata : out std_logic_vector(31 downto 0)         -- readdata
		);
	end component firmware;

	u0 : component firmware
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --     clk.clk
			pio_out_export   => CONNECTED_TO_pio_out_export,   -- pio_out.export
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    --   reset.reset_n
			sin_out_readdata => CONNECTED_TO_sin_out_readdata, -- sin_out.readdata
			cos_out_readdata => CONNECTED_TO_cos_out_readdata, -- cos_out.readdata
			tan_out_readdata => CONNECTED_TO_tan_out_readdata  -- tan_out.readdata
		);

