return {
	{
		"https://github.com/lukas-reineke/indent-blankline.nvim.git",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			whitespace = {
				remove_blankline_trail = false,
			},
			scope = {
				show_start = false,
				show_end = false,
			},
			exclude = {
				filetypes = {
					"help",
					"lazy",
				},
			},
		},
	},
	{
		"https://github.com/folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
}
