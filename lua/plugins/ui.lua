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
				remove_blankline_trail = false, -- preserve trailing whitespace on blank lines
			},
			scope = {
				show_start = false, -- don't underline the opening line of the current scope
				show_end = false,   -- don't underline the closing line of the current scope
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
		'https://github.com/nvim-treesitter/nvim-treesitter-context.git',
		opts = {
			enable = false, -- off by default; toggle with <Leader>tc
		},
	},
	{
		"https://github.com/folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
}
