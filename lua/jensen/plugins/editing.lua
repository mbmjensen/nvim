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
	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			"https://github.com/nvim-treesitter/nvim-treesitter-context.git",
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
				'query',
				'vim',
				'vimdoc',
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { 'ruby' },
			},
			indent = {
				enable = true,
				disable = { 'ruby' },
			},
			incremental_selection = {
				enable = false,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			textobjects = {
				select = { --Configure https://github.com/nvim-treesitter/nvim-treesitter-context
					enable = true,

					-- Automatically jump forward to textobjects, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						-- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					},
					-- You can choose the select mode (default is charwise 'v')
					selection_modes = {
						['@function.inner'] = 'V',
						['@function.outer'] = 'V',
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
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
			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

			-- Prefer git instead of curl in order to improve connectivity in some environments
			require('nvim-treesitter.install').prefer_git = true
			require('nvim-treesitter.configs').setup(opts)
		end,
	},
}
