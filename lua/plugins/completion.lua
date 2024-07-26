return {
	{
		"https://github.com/hrsh7th/nvim-cmp.git",
		event = "InsertEnter",
		dependencies = {
			"https://github.com/hrsh7th/cmp-nvim-lsp.git",
			"https://github.com/hrsh7th/cmp-buffer.git",
			"https://github.com/hrsh7th/cmp-path.git",
			"https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
		},
		opts = function()
			-- Ghost text is the preview text that appears in front of the cursor
			vim.api.nvim_set_hl(0, "CmpGhostText", {
				link = "Comment",
				default = true,
			})
			local cmp = require("cmp")

			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = 'nvim_lsp_signature_help' }
				}),
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
			}
		end,
	},
}
