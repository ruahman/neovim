local function config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "jq" },
			rust = { "rustfmt" },
			go = { "gofumpt", "goimports", "golines" },
			zig = { "zig fmt" },
		},
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
	})
end

return {
	"stevearc/conform.nvim",
	event = { "BufNewFile", "BufRead" },
	config = config,
}
