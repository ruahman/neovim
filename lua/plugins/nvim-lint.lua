local export = {}
local utils = require("utils")

local js_linter
if utils.file_exists("package.json") then
	js_linter = "eslint"
else
	js_linter = "deno"
end

function export.config()
	require("lint").linters_by_ft = {
		typescript = { js_linter },
		javascript = { js_linter },
		lua = { "luacheck" },
		python = { "flake8", "mypy" },
		go = { "golangcilint" },
	}

	-- lint after save
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
			-- require("lint").try_lint(nil, { ignore_errors = true })
		end,
	})
end

return export
