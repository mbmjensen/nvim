return {
	{
		'https://github.com/projekt0n/github-nvim-theme.git',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('github-theme').setup({
				options = {
					transparent = true,
				},
			})

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "github_light",
				callback = function()
					vim.cmd.highlight("LazyButton guifg=#444444 guibg=none")
					vim.cmd.highlight("LazyButtonActive gui=bold guifg=#d75f00 guibg=none")
					vim.cmd.highlight("LazyH1 gui=bold guifg=#d75f00 guibg=none")
					vim.cmd.highlight("LazyH2 guifg=#005faf guibg=none")

					-- Add a border underneath the treesitter context.
					vim.cmd.highlight("TreesitterContextBottom gui=underline guisp=Grey")
					vim.cmd.highlight("TreesitterContextLineNumberBottom gui=underline guisp=Grey")

					-- Mason Highlighting
					vim.cmd.highlight("MasonHighlight guifg=#0969da")
					vim.cmd.highlight("MasonHighlightBlockBold guifg=#fd8c73 gui=bold")
					vim.cmd.highlight("link MasonMutedBlock Normal")
					vim.cmd.highlight("link MasonHeader Bold")

					vim.api.nvim_set_hl(0, "IblIndent", {
						fg = "#afb8c1",
					})
					vim.api.nvim_set_hl(0, "IblScope", {
						fg = "#8c959f",
					})
				end,
			})

			vim.opt.background = "light"
			vim.cmd.colorscheme("github_light")
		end,
	},
}
