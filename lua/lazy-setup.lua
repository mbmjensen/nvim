local function install_lazy(opts)
	local system_out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		opts.lazy_repo,
		opts.lazy_path,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ system_out,                     "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

local function setup_lazy(opts)
	if not vim.uv.fs_stat(opts.lazy_path) then
		install_lazy(opts)
	end

	vim.opt.rtp:prepend(opts.lazy_path)

	require("lazy").setup(opts.lazy_opts)
end


setup_lazy({
	lazy_repo = "https://github.com/folke/lazy.nvim.git",
	lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
	branch = "stable", -- latest stable release
	lazy_opts = {
		spec = {
			{ import = "plugins" },
		},
		ui = {
			border = "rounded",
		},
		install = {
			colorscheme = {
				"habamax",
			},
		},
		change_detection = {
			enabled = false,
		},
	},
})
