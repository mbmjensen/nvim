require("bootstrap").lazy({
	repo = "https://github.com/folke/lazy.nvim.git",
	dir = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
	branch = "stable", -- The latest stable release
})

require("options")

if vim.g.vscode then
	-- Neovim is running in the background via the VSCode extension, vscode-neovim. With Neovim is
	-- running in the background, many settings, commands, or plugins that control Neovim's UI may
	-- not work as expected. In addition, many commands and key mappings need to be modified to use
	-- VSCode's API. As a result, limit settings and plugins to those that focus on text editing
	-- and text objects. For more information on the VSCode API, which can be used to trigger
	-- commands and set keymaps for VSCode, refer to the extension documentation here:
	--
	-- https://github.com/vscode-neovim/vscode-neovim documentation expected.
	require("lazy").setup({
		spec = {
			{ import = "plugins.editing" }
		},
		change_detection = {
			enabled = false,
		},
	})
else
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
	require("diagnostics")
end
