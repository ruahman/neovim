local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.file_exists(filename)
	local current_directory = vim.fn.getcwd()
	local full_path = current_directory .. "/" .. filename
	return vim.fn.filereadable(full_path) == 1
end

return M
