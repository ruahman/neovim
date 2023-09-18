local export = {}

function export.config()
	require("lint").linters_by_ft = {
		typescript = { "eslint_d" },
		javascript = { "eslint_d" },
		lua = { "luacheck" },
		python = { "flake8", "mypy" },
		rust = { "cargo" },
		go = { "golangcilint" },
	}

	-- lint after save
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end

return export
