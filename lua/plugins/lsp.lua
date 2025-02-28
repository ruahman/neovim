local utils = require("utils")

local function config()
	local lspconfig = require("lspconfig")

	-- share client capabilites to LSP
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	-- enable snippes for css and html support
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- run this code on_attach
	local on_attach = function(_, bufnr)
		-- setup keybindings for this buffer
		local bufopts = { noremap = true, silent = false, buffer = bufnr }

		-- hover
		vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)

		-- code actions
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)

		-- explain
		vim.keymap.set("n", "ge", vim.diagnostic.open_float, bufopts)

		-- format
		vim.keymap.set("n", "gf", function()
			require("conform").format({ bufnr = bufopts.buffer })
		end, bufopts)

		-- lint
		vim.keymap.set("n", "gl", function()
			require("lint").try_lint()
		end, bufopts)

		-- lsp restart
		utils.map("n", "gL", ":LspRestart<CR>")

		-- definitions
		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)

		-- references
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)

		-- implementations
		vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, bufopts)

		-- diagnostics
		vim.keymap.set("n", "<leader>x", require("telescope.builtin").diagnostics, bufopts)
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

	-- deno
	lspconfig.denols.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	})

	-- typescript-language-server
	lspconfig.ts_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = lspconfig.util.root_pattern("package.json"),
		single_file_support = false,
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

	-- ruby
	lspconfig.solargraph.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			solargraph = {
				diagnostics = false, -- Disable diagnostics from Solargraph
			},
		},
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

	-- c/cpp
	lspconfig.clangd.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	-- zig
	lspconfig.zls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufNewFile", "BufRead" },
	config = config,
}
