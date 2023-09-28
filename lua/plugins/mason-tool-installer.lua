local M = {}

M.config = function()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"pyright",
			"debugpy",
			"mypy",
			"flake8",
			"black",
			"isort",
			"lua-language-server",
			"luacheck",
			"stylua",
			"gopls",
			"gofumpt",
			"goimports",
			"golines",
			"golangci-lint",
			"delve",
			"typescript-language-server",
			"css-lsp",
			"html-lsp",
			"csharp-language-server",
			"prettierd",
			"js-debug-adapter",
			"rust-analyzer",
			"codelldb",
		},
	})
end

return M
