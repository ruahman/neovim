local map = require("utils").map

local function config()
	-- make sure copilot does not run in dap-repl
	vim.api.nvim_set_var("copilot_filetypes", {
		["dap-repl"] = false,
	})

	map("n", "<C-[>", ":Copilot disable<CR>")
	map("n", "<C-]>", ":Copilot enable<CR>")

	map("i", "<C-[>", "<Plug>(copilot-dismiss)")
	map("i", "<C-]>", "<Plug>(copilot-suggest)")

	vim.api.nvim_set_hl(0, "CopilotSuggestion", {
		fg = "#00FF00",
		ctermfg = 8,
	})
end

return { "github/copilot.vim", config = config, enabled = false }
