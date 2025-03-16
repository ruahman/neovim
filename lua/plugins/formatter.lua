local function config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "isort" },
			javascript = { "biome" },
			javascriptreact = { "biome" },
			typescript = { "biome" },
			typescriptreact = { "biome" },
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
