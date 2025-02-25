local function config()
	require("lint").linters_by_ft = {
		typescript = { "eslint" },
		javascript = { "eslint" },
		lua = { "luacheck" },
		python = { "ruff" },
		go = { "golangcilint" },
		rust = { "clippy" },
		-- ruby = { "rubocop" },
	}

	-- lint after save
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		pattern = { "*.go", "*.py", "*js", "*.ts" }, -- List of file patterns
		callback = function()
			require("lint").try_lint()
		end,
	})
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufNewFile", "BufRead" },
	config = config,
}
