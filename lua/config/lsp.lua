-- gri implementation
-- grr refrence
-- gra code action
-- grt type information

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("solargraph")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("gopls")
vim.lsp.enable("zls")
vim.lsp.enable("clangd")
vim.lsp.enable("html")
vim.lsp.enable("cssls")

vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "ge", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>x", require("telescope.builtin").diagnostics)
vim.keymap.set("n", "gH", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
