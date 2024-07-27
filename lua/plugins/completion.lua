return {
	{
		"https://github.com/hrsh7th/nvim-cmp.git",
		event = "InsertEnter",
		dependencies = {
			"https://github.com/hrsh7th/cmp-nvim-lsp.git",
			"https://github.com/hrsh7th/cmp-buffer.git",
			"https://github.com/hrsh7th/cmp-path.git",
			"https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
			"https://github.com/onsails/lspkind.nvim.git"
		},
		opts = function()
			-- Ghost text is the preview text that appears in front of the cursor
			vim.api.nvim_set_hl(0, "CmpGhostText", {
				link = "Comment",
				default = true,
			})
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = 'nvim_lsp_signature_help' }
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind_cmp_formatter = lspkind.cmp_format({
							mode = "symbol_text",
							maxwidth = 50
						})

						local kind = kind_cmp_formatter(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"

						return kind
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
			}
		end,
	},
}
