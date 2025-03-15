local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = false }
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

-- find /nix/store -type d -name "*vscode-extension-vadimcn-vscode-lldb-1.10.0"
function M.find_codelldb_path()
	-- Use vim.fn.system() to run the shell command and capture the output
	local result = vim.fn.system("find /nix/store -type d -name '*vscode-extension-vadimcn-vscode-lldb-1.10.0' 2>/dev/null")
  
	-- Check if result is non-empty
	if result ~= "" then
		-- Return the first line of the output
		return result:match("([^\n]+)")
	end
	return nil
end

return M
