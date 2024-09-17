local function config()
	require("lint").linters_by_ft = {
		typescript = { "eslint" },
		javascript = { "eslint" },
		lua = { "luacheck" },
		python = { "ruff" },
		go = { "golangcilint" },
		rust = { "clippy" },
	}

	-- lint after save
	-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	-- 	callback = function()
	-- 		require("lint").try_lint()
	-- 		-- require("lint").try_lint(nil, { ignore_errors = true })
	-- 	end,
	-- })
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufNewFile", "BufRead" },
	config = config,
}
