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

	-- format before save
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function()
			require("conform").format({ async = false })
		end,
	})
end

return export
