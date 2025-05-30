-- run liter for files
local function config()
	require("lint").linters_by_ft = {
		typescript = { "biomejs" },
		javascript = { "biomejs" },
		lua = { "luacheck" },
		python = { "ruff", "mypy" },
		go = { "golangcilint" },
		rust = { "clippy" },
	}

	-- lint after save
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		pattern = { "*.go", "*.py", "*js", "*.ts", "*.lua" }, -- List of file patterns
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
