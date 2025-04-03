require("bootstrap").lazy({
	repo = "https://github.com/folke/lazy.nvim.git",
	dir = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
	branch = "stable", -- The latest stable release
})

require("options")
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	ui = {
		border = "rounded",
	},
	install = {
		colorscheme = {
			"github_light",
			"default",
		},
	},
	change_detection = {
		enabled = false,
	},
})
require("keymaps")

-- Change git gutter symbols for diagnostics
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
