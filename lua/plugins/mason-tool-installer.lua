local M = {}

M.config = function()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"pyright",
			"solargraph",
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
			"omnisharp",
			"eslint_d",
			"prettierd",
			"deno",
			"js-debug-adapter",
			"rust-analyzer",
			"codelldb",
			"clangd",
			"zls",
		},
	})
end

return M
