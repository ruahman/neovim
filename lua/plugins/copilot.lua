local M = {}

M.config = function()
	-- make sure copilot does not run in dap-repl
	vim.api.nvim_set_var("copilot_filetypes", {
		["dap-repl"] = false,
	})
end

return M
