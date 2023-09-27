local export = {}

function export.config()
	require("lint").linters_by_ft = {
		typescript = { "eslint" },
		javascript = { "eslint" },
		lua = { "luacheck" },
		python = { "flake8", "mypy" },
		rust = { "cargo" },
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
