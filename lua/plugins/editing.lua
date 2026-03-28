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
			search_method = "cover_or_next", -- match the surrounding covering the cursor, else the next one
		},
	},
	{ 'https://github.com/echasnovski/mini.bracketed.git', opts = {}, version = false },
	{ -- Highlight, edit, and navigate code
		'https://github.com/nvim-treesitter/nvim-treesitter.git',
		dependencies = {
			"https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git",
		},
		build = ':TSUpdate',
		opts = {
			ensure_installed = {
				'bash',
				'c',
				'diff',
				'html',
				'java',
				'lua',
				'luadoc',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'vim',
				'vimdoc',
			},
			auto_install = true, -- install missing parsers when opening a buffer
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for
				-- indent rules. If you are experiencing weird indenting issues, add the language
				-- to the list of additional_vim_regex_highlighting and disabled languages for
				-- indent.
				additional_vim_regex_highlighting = { 'ruby' },
			},
			indent = {
				enable = true,
				disable = { 'ruby' },
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- jump forward to the next textobject if the cursor isn't inside one
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = { query = "@function.outer", desc = "Select entire function" },
						["if"] = { query = "@function.inner", desc = "Select function contents" },
						["ac"] = { query = "@class.outer", desc = "Select entire class" },
						["ic"] = { query = "@class.inner", desc = "Select class contents" },
					},
					selection_modes = {
						['@function.inner'] = 'V', -- linewise for function bodies
						['@function.outer'] = 'V', -- linewise for whole functions
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- add motion positions to the jumplist
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
		},
		config = function(_, opts)
			-- Prefer git instead of curl in order to improve connectivity in some environments
			require('nvim-treesitter.install').prefer_git = true
			require('nvim-treesitter.configs').setup(opts)
		end,
	},
	{
		'https://github.com/windwp/nvim-autopairs.git',
		event = "InsertEnter",
		config = true
	},
}
