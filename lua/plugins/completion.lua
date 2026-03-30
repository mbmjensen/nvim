return {
	{
		"https://github.com/saghen/blink.cmp.git",
		version = "*", -- use a tagged release for version pinning
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"https://github.com/onsails/lspkind.nvim.git",
		},
		opts = {
			keymap = {
				preset = "none",
				["<C-n>"]   = { "select_next", "fallback" },
				["<C-p>"]   = { "select_prev", "fallback" },
				["<C-y>"]   = { "accept" },
				["<CR>"]    = { "fallback" },
				["<Tab>"]   = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<C-b>"]   = { "scroll_documentation_up", "fallback" },
				["<C-f>"]   = { "scroll_documentation_down", "fallback" },
			},
			appearance = {
				-- use lspkind icons to match the previous nvim-cmp icon set
				kind_icons = require("lspkind").symbol_map,
			},
			completion = {
				documentation = {
					auto_show = true,
					window = { border = "rounded" },
				},
				menu = {
					border = "rounded",
					draw = {
						columns = {
							{ "kind_icon", gap = 1 },
							{ "label", "label_description", gap = 1 },
							{ "kind" },
						},
					},
				},
				ghost_text = { enabled = true },
				list = {
					selection = {
						-- pre-select the first item so <C-y> always has something to accept,
						-- mirroring nvim-cmp's select = true behaviour
						preselect = true,
					},
				},
			},
			signature = {
				enabled = true,
				window = { border = "rounded" },
			},
			sources = {
				default = { "lazydev", "lsp", "buffer", "path", "snippets" },
				cmdline = { "cmdline" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- prioritize above LSP completions
					},
				},
			},
		},
		config = function(_, opts)
			-- link ghost text to the Comment highlight group (same as the old CmpGhostText)
			vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment", default = true })
			require("blink.cmp").setup(opts)
		end,
	},
}
