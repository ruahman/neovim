local export = {}
local utils = require("utils")

local formater
if utils.file_exists("package.json") then
	formater = "prettierd"
else
	formater = "deno_fmt"
end

function export.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
			javascript = { formater },
			typescript = { formater },
			rust = { "rustfmt" },
			go = { "gofumpt", "goimports", "golines" },
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
