local M = {}

M.config = function()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"pyright",
			"debugpy",
			"mypy",
			"ruff",
			"black",
			"lua-language-server",
			"luacheck",
			"stylua",
			"gopls",
			"gofumpt",
			"goimports",
			"golines",
			"delve",
			"typescript-language-server",
			"eslint_d",
			"prettierd",
			"js-debug-adapter",
		},
	})
end

return M
