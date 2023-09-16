local export = {}

function export.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			rust = { "rustfmt" },
			go = { "gofumpt", "goimports" },
		},
	})
end

return export
