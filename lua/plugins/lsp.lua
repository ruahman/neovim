local M = {}

function M.config()
	local lspconfig = require("lspconfig")
	local map = require("utils").map

	-- share client capabilites to LSP
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- enable snippes for css and html support
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- run this code on_attach
	local on_attach = function(_, bufnr)
		-- setup keybindings for this buffer
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		-- diagnostics
		vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "ge", vim.diagnostic.open_float, bufopts)

		-- format
		vim.keymap.set("n", "gf", function()
			require("conform").format({ bufnr = bufopts.buffer })
		end, bufopts)

		-- lint
		vim.keymap.set("n", "gl", function()
			require("lint").try_lint()
		end, bufopts)

		-- telescope
		vim.keymap.set("n", "<leader>d", require("telescope.builtin").lsp_definitions, bufopts)
		vim.keymap.set("n", "<leader>r", require("telescope.builtin").lsp_references, bufopts)
		vim.keymap.set("n", "<leader>i", require("telescope.builtin").lsp_implementations, bufopts)
		vim.keymap.set("n", "<leader>x", require("telescope.builtin").diagnostics, bufopts)

		-- refresh lsp
		map("n", "gr", ":LspRestart<CR>")
	end

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					enable = false,
				},
			},
		},
	})

	-- javascript/typescript
	lspconfig.tsserver.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		-- single_file_support = false,
		init_options = {
			preferences = {
				disableSuggestions = true,
			},
		},
	})

	-- css
	lspconfig.cssls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- html
	lspconfig.html.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- golang
	lspconfig.gopls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	})

	-- rust
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- csharp
	lspconfig.csharp_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- c/cpp
	-- lspconfig.clangd.setup({
	-- 	cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" .. ext },
	-- 	on_attach = on_attach,
	-- 	capabilities = capabilities,
	-- 	-- root_dir = lspconfig.util.root_pattern("*.c", "*.cpp"),
	-- })

	-- zig
	-- lspconfig.zls.setup({
	-- 	cmd = { vim.fn.stdpath("data") .. "/mason/bin/zls" .. ext },
	-- 	on_attach = on_attach,
	-- 	capabilities = capabilities,
	-- })
end

return M
