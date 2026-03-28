local M = {}

local function install_lazy(opts)
	local system_out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		opts.repo,
		opts.dir,
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

M.lazy = function(opts)
	if not vim.uv.fs_stat(opts.dir) then
		install_lazy(opts)
	end

	vim.opt.rtp:prepend(opts.dir)
end

return M
