return {
	{
		"https://github.com/folke/which-key.nvim.git",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			triggers = {
				{ "<auto>", mode = "nixsotc" },
				{ "s",      mode = { "n", "v", name = "+search" } }
			},
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			wo = {
				winblend = 50,
			},
		},
	},
}
