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
	{
		'https://github.com/monaqa/dial.nvim',
		keys = {
			{ "<C-a>",  mode = { "n", "v" } },
			{ "<C-x>",  mode = { "n", "v" } },
			{ "g<C-a>", mode = { "n", "v" } },
			{ "g<C-x>", mode = { "n", "v" } },
		},
		config = function()
			local augend = require("dial.augend")

			local defaults = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.integer.alias.binary,
				augend.integer.alias.octal,
				augend.date.alias["%Y-%m-%d"],
				augend.date.alias["%Y/%m/%d"],
				augend.date.alias["%m/%d/%Y"],
				augend.date.alias["%d/%m/%Y"],
				augend.date.alias["%H:%M:%S"],
				augend.date.alias["%H:%M"],
				augend.hexcolor.new({ case = "lower" }),
				augend.constant.alias.bool,
				augend.markup.alias.markdown_header,
			}

			require("dial.config").augends:register_group({
				default = defaults,
				python = vim.list_extend(vim.deepcopy(defaults), {
					augend.constant.new({ elements = { "True", "False" } }),
					augend.constant.new({ elements = { "and", "or" } }),
					augend.constant.new({ elements = { "==", "!=" }, word = false }),
					augend.constant.new({ elements = { "in", "not in" } }),
					augend.constant.new({ elements = { "is", "is not" } }),
				}),
				java = vim.list_extend(vim.deepcopy(defaults), {
					augend.constant.new({ elements = { "public", "private", "protected" } }),
					augend.constant.new({ elements = { "int", "long" } }),
					augend.constant.new({ elements = { "&&", "||" }, word = false }),
					augend.constant.new({ elements = { "==", "!=" }, word = false }),
				}),
				markdown = vim.list_extend(vim.deepcopy(defaults), {
					augend.constant.new({ elements = { "- [ ]", "- [x]" }, word = false }),
				}),
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "python",
				callback = function() vim.b.dial_group = "python" end,
			})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function() vim.b.dial_group = "java" end,
			})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function() vim.b.dial_group = "markdown" end,
			})

			vim.keymap.set("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal", vim.b.dial_group) end)
			vim.keymap.set("n", "<C-x>", function() require("dial.map").manipulate("decrement", "normal", vim.b.dial_group) end)
			vim.keymap.set("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal", vim.b.dial_group) end)
			vim.keymap.set("n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal", vim.b.dial_group) end)
			vim.keymap.set("v", "<C-a>", function() require("dial.map").manipulate("increment", "visual", vim.b.dial_group) end)
			vim.keymap.set("v", "<C-x>", function() require("dial.map").manipulate("decrement", "visual", vim.b.dial_group) end)
			vim.keymap.set("v", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual", vim.b.dial_group) end)
			vim.keymap.set("v", "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual", vim.b.dial_group) end)
		end,
	},
}
