return {
	{
		"https://github.com/folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			picker = {
				layout = { preset = "ivy", fullscreen = true },
				ui_select = true,
				sources = {
					-- No preview needed for these; use a compact select layout
					command_history = { layout = { preset = "select" } },
					search_history = { layout = { preset = "select" } },
					commands = { layout = { preset = "select" } },
					pickers = { layout = { preset = "select" } },
				},
			},
		},
	},
}
