vim.lsp.config("copilot", {
	settings = {
		telemetry = {
			telemetryLevel = "off",
		},
	},
})

vim.lsp.enable("copilot")

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("solargraph")
-- vim.lsp.enable("rust_analyzer")
vim.lsp.enable("gopls")
vim.lsp.enable("zls")
vim.lsp.enable("clangd")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
-- C# (roslyn) is enabled by roslyn.nvim itself; see lua/plugins/roslyn.lua
