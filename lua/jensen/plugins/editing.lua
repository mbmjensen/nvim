return {
	{
		"https://github.com/echasnovski/mini.ai.git",
		version = false,
		opts = {
			silent = true,
		},
	},
	{
		"https://github.com/echasnovski/mini.surround.git",
		opts = {
			-- Configure to use the same key bindings as tpope/surround
			mappings = {
				add = "ys",
				delete = "ds",
				find = "",
				find_left = "",
				highlight = "",
				replace = "cs",
				update_n_lines = "",

				-- Add this only if you don't want to use extended mappings
				suffix_last = "",
				suffix_next = "",
			},
			search_method = "cover_or_next",
		},
	},
}
