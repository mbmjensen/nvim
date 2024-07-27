return {
	{
		"https://github.com/NLKNguyen/papercolor-theme.git",
		lazy = true, -- Ensure that the colorscheme loads before other plugins
		-- priority = 100, -- which might set their colors using the colorscheme.
		config = function()
			-- Always run before loading PaperColor to properly configure colors
			vim.api.nvim_create_autocmd("ColorSchemePre", {
				pattern = "PaperColor",
				callback = function(ev)
					vim.opt.termguicolors = true
					vim.opt.background = "light"
				end,
			})

			-- Apply custom color overrides immediately after loading PaperColor
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "PaperColor",
				callback = function(ev)
					vim.cmd.highlight("CursorLineNr guibg=none")
					vim.cmd.highlight("Conceal guibg=none")
					vim.cmd.highlight("EndOfBuffer guifg=#b2b2b2 guibg=none")
					vim.cmd.highlight("LineNr guibg=none")
					vim.cmd.highlight("NonText guibg=none")
					vim.cmd.highlight("Normal guibg=none")
					vim.cmd.highlight("NormalFloat guibg=none")
					vim.cmd.highlight("NormalNC guibg=none")
					vim.cmd.highlight("SignColumn guibg=none")
					vim.cmd.highlight("Whitespace guibg=none")

					vim.cmd.highlight("IncSearch gui=reverse guifg=none guibg=none")
					vim.cmd.highlight("Search gui=reverse guifg=none guibg=none")

					vim.cmd.highlight("LazyButton guifg=#444444 guibg=none")
					vim.cmd.highlight("LazyButtonActive gui=bold guifg=#d75f00 guibg=none")
					vim.cmd.highlight("LazyH1 gui=bold guifg=#d75f00 guibg=none")
					vim.cmd.highlight("LazyH2 guifg=#005faf guibg=none")

					vim.cmd.highlight("DiagnosticError guibg=none")
					vim.cmd.highlight("DiagnosticWarn gui=bold guifg=green guibg=none")
					vim.cmd.highlight("DiagnosticHint gui=bold guifg=green guibg=none")
					vim.cmd.highlight("LspDiagnosticsDefaultInformation guibg=none")

					-- Add a border underneath the treesitter context.
					vim.cmd.highlight("TreesitterContextBottom gui=underline guisp=Grey")
					vim.cmd.highlight("TreesitterContextLineNumberBottom gui=underline guisp=Grey")
				end,
			})

			-- Use PaperColor as the default colorscheme
			-- vim.cmd.colorscheme("PaperColor")
		end,
	},
	{
		'projekt0n/github-nvim-theme',
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
				callback = function(ev)
					-- vim.cmd.highlight("LazyButton guifg=#444444 guibg=none")
					-- vim.cmd.highlight("LazyButtonActive gui=bold guifg=#d75f00 guibg=none")
					-- vim.cmd.highlight("LazyH1 gui=bold guifg=#d75f00 guibg=none")
					-- vim.cmd.highlight("LazyH2 guifg=#005faf guibg=none")

					-- Add a border underneath the treesitter context.
					vim.cmd.highlight("TreesitterContextBottom gui=underline guisp=Grey")
					vim.cmd.highlight("TreesitterContextLineNumberBottom gui=underline guisp=Grey")

					-- Mason Highlighting
					vim.cmd.highlight("MasonHighlight guifg=#0969da")
					vim.cmd.highlight("MasonHighlightBlockBold guifg=#fd8c73 gui=bold")
					vim.cmd.highlight("link MasonMutedBlock Normal")
					vim.cmd.highlight("link MasonHeader Bold")

					-- vim.api.nvim_set_hl(0, "@ibl.indent.char.1", {
					-- 	fg = "#d0d7de",
					-- })
					-- vim.api.nvim_set_hl(0, "@ibl.whitespace.char.1", {
					-- 	fg = "#d0d7de",
					-- })
					vim.api.nvim_set_hl(0, "IblIndent", {
						fg = "#afb8c1",
					})
					vim.api.nvim_set_hl(0, "IblScope", {
						fg = "#8c959f",
					})
				end,
			})

			-- Use Github light as the default theme
			vim.opt.termguicolors = true
			vim.opt.background = "light"
			vim.cmd.colorscheme("github_light")
		end,
	},
}
