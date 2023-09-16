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
end

return export
