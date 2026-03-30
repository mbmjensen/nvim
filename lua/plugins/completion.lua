return {
	{
		"https://github.com/saghen/blink.cmp.git",
		version = "*", -- use a tagged release for version pinning
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"https://github.com/onsails/lspkind.nvim.git",
		},
		opts = function()
			return {
				-- preset = "none" disables all default bindings so only the keys
				-- listed here are active; blink actions fall through to normal
				-- Neovim behaviour when not applicable (e.g. Tab indents normally
				-- when no snippet or menu is active)
				keymap = {
					preset = "none",
					["<C-n>"]   = { "select_next", "fallback" },
					["<C-p>"]   = { "select_prev", "fallback" },
					["<C-y>"]   = { "accept" },
					["<CR>"]    = { "fallback" }, -- Enter always inserts a newline
					["<Tab>"]   = { "snippet_forward", "fallback" },
					["<S-Tab>"] = { "snippet_backward", "fallback" },
					["<C-b>"]   = { "scroll_documentation_up", "fallback" },
					["<C-f>"]   = { "scroll_documentation_down", "fallback" },
				},
				appearance = {
					-- lspkind supplies the icon set for completion item kinds
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
							-- three-column layout: kind icon | label + description | kind name
							columns = {
								{ "kind_icon", gap = 1 },
								{ "label", "label_description", gap = 1 },
								{ "kind" },
							},
						},
					},
					-- ghost text shows a preview of the top suggestion inline
					ghost_text = { enabled = true },
					list = {
						selection = {
							-- pre-select the first item so <C-y> always has something
							-- ready to accept without needing to navigate first
							preselect = true,
						},
					},
				},
				-- signature help shows a dedicated floating window with the current
				-- function signature; the active parameter is highlighted as you
				-- move through arguments
				signature = {
					enabled = true,
					window = { border = "rounded" },
				},
				sources = {
					-- lazydev is listed first so Lua API completions are prioritised
					default = { "lazydev", "lsp", "buffer", "path", "snippets" },
					cmdline = { "cmdline" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100, -- rank above LSP completions for Lua files
						},
					},
				},
			}
		end,
		config = function(_, opts)
			-- style ghost text the same as comments so it is clearly non-intrusive
			vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment", default = true })
			require("blink.cmp").setup(opts)
		end,
	},
}
