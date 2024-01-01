local utils = require("utils")

local js_formater
if utils.file_exists("package.json") then
	js_formater = "prettier"
else
	js_formater = "deno_fmt"
end

local function config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			javascript = { js_formater },
			javascriptreact = { js_formater },
			typescript = { js_formater },
			typescriptreact = { js_formater },
			rust = { "rustfmt" },
			go = { "gofumpt", "goimports", "golines" },
			dart = { "dart_format" },
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

return {
	"stevearc/conform.nvim",
	event = { "BufNewFile", "BufRead" },
	config = config,
}
