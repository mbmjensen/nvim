return {
	{
		"https://github.com/neovim/nvim-lspconfig.git",
		dependencies = {
			"https://github.com/williamboman/mason.nvim.git",
			"https://github.com/williamboman/mason-lspconfig.nvim.git",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
			})

			require("lspconfig").pyright.setup({
				capabilities = capabilities,
			})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
		end,
	},
	{
		"https://github.com/williamboman/mason.nvim.git",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"https://github.com/williamboman/mason-lspconfig.nvim.git",
		opts = {},
	},
	{
		"https://github.com/folke/lazydev.nvim.git",
		ft = "lua",
		opts = {
			library = {
				{
					path = "luvit-meta/library",
					words = { "vim%.uv" },
				},
			},
		},
	},
	{ -- optional `vim.uv` typings
		"Bilal2453/luvit-meta",
		lazy = true,
	},
	{ -- optional completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
}
