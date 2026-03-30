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
			local capabilities = require("blink.cmp").get_lsp_capabilities()

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

					map('gd', function() Snacks.picker.lsp_definitions() end, '[G]oto [D]efinition')
					map('gr', function() Snacks.picker.lsp_references() end, '[G]oto [R]eferences')
					map('gI', function() Snacks.picker.lsp_implementations() end, '[G]oto [I]mplementation')
					map('<leader>D', function() Snacks.picker.lsp_type_definitions() end, 'Type [D]efinition')
					map('<leader>ds', function() Snacks.picker.lsp_symbols() end, '[D]ocument [S]ymbols')
					map('<leader>ws', function() Snacks.picker.lsp_workspace_symbols() end, '[W]orkspace [S]ymbols')
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
				automatic_installation = false, -- only install servers listed in ensure_installed
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
					words = { "vim%.uv" }, -- load typings only when vim.uv is referenced
				},
			},
			integrations = {
				-- expose lazydev completions as a blink source (configured in completion.lua)
				blink = true,
			},
		},
	},
	{ -- optional `vim.uv` typings
		"Bilal2453/luvit-meta",
		lazy = true,
	},
}
