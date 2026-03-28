local language_servers = {
	"lua_ls",
	"pyright",
	"vimls",
}

return {
	{
		"https://github.com/neovim/nvim-lspconfig.git",
		dependencies = {
			"https://github.com/williamboman/mason.nvim.git",
			"https://github.com/williamboman/mason-lspconfig.nvim.git",
			{ "https://github.com/nvim-java/nvim-java.git", opts = {} },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- jdtls is managed by nvim-java; set it up separately to avoid conflicts
			require("lspconfig").jdtls.setup({ capabilities = capabilities })

			for _, server in ipairs(language_servers) do
				require("lspconfig")[server].setup({ capabilities = capabilities })
			end

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end

					map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
					map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
					map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
					map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
					map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
					map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
					map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
					map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
					map('K', function()
						vim.lsp.buf.hover({ border = "rounded" })
					end, 'Hover Documentation')
					map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
				end
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
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = false,
				ensure_installed = vim.list_extend({ "jdtls" }, language_servers),
			})
		end
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
