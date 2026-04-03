return {
	{
		"https://github.com/folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			picker = {
				layout = { preset = "ivy" },
				ui_select = true,
				sources = {
					-- No preview needed for these; use a compact select layout
					command_history = { layout = { preset = "select" } },
					search_history = { layout = { preset = "select" } },
					commands = { layout = { preset = "select" } },
					pickers = { layout = { preset = "select" } },
				},
				actions = {
					readline_bol = function()
						vim.api.nvim_feedkeys(
							vim.api.nvim_replace_termcodes("<Home>", true, false, true), "n", false
						)
					end,
					readline_eol = function()
						vim.api.nvim_feedkeys(
							vim.api.nvim_replace_termcodes("<End>", true, false, true), "n", false
						)
					end,
					readline_kill_eol = function()
						local col = vim.api.nvim_win_get_cursor(0)[2]
						local line = vim.api.nvim_get_current_line()
						vim.api.nvim_set_current_line(line:sub(1, col))
					end,
					readline_kill_bol = function()
						local col = vim.api.nvim_win_get_cursor(0)[2]
						local line = vim.api.nvim_get_current_line()
						vim.api.nvim_set_current_line(line:sub(col + 1))
						vim.api.nvim_win_set_cursor(0, { 1, 0 })
					end,
				},
				win = {
					input = {
						keys = {
							["<C-a>"] = { "readline_bol", mode = { "i" } },
							["<C-e>"] = { "readline_eol", mode = { "i" } },
							["<C-k>"] = { "readline_kill_eol", mode = { "i" } },
							["<C-u>"] = { "readline_kill_bol", mode = { "i" } },
						},
					},
				},
			},
		},
	},
}
