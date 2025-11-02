-- this gets setup in lsp-config
-- vim.lsp.config("lua_ls", {
-- 	cmd = { "lua-language-server" },
-- 	filetypes = { "lua" },
-- 	root_markers = {
-- 		".luarc.json",
-- 		".luacheckrc",
-- 		".git",
-- 	},
-- })

-- :checkhealth vim.lsp
vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("solargraph")
