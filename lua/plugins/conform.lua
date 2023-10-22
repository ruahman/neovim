local export = {}
local utils = require("utils")

local js_formater
if utils.file_exists("package.json") then
	js_formater = "prettierd"
else
	js_formater = "deno_fmt"
end

function export.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
			javascript = { js_formater },
			typescript = { js_formater },
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

return export
