return {
	{
		"https://github.com/stevearc/oil.nvim.git",
		lazy = false,
		dependencies = { "https://github.com/nvim-tree/nvim-web-devicons" },
		opts = {
			default_file_explorer = true,
			columns = {},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return vim.startswith(name, "..")
				end,
			},
			git = { -- Return true to automatically git add/mv/rm files
				add = function()
					return false
				end,
				mv = function()
					return true
				end,
				-- rm = function() -- currently not working
				--     return true
				-- end,
			},
		},
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "Open parent director" },
		},
	},
}
