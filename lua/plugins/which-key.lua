return {
	{
		"https://github.com/folke/which-key.nvim.git",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			triggers = {
				{ "<auto>", mode = "nixsotc" },            -- auto-trigger for most modes
				{ "s",      mode = { "n", "v", name = "+search" } } -- manual trigger for s (remapped as search prefix)
			},
			plugins = {
				marks = true,     -- show marks on ' and `
				registers = true, -- show registers on " (normal) and <C-r> (insert)
				spelling = {
					enabled = true,   -- show WhichKey on z= to pick spelling suggestions
					suggestions = 20, -- number of spelling suggestions to show
				},
			},
			wo = {
				winblend = 50, -- semi-transparent popup window
			},
		},
	},
}
