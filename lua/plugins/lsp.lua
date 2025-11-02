local utils = require("utils")

local function config()
	local lspconfig = require("lspconfig")
	-- local lspconfig = vim.lsp.config

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
			print("formating...")
			require("conform").format({ bufnr = bufopts.buffer })
		end, bufopts)

		-- lint
		vim.keymap.set("n", "gl", function()
			print("linting...")
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

		-- inline hints
		vim.keymap.set("n", "gH", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, bufopts)
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
				hint = { enable = true },
			},
		},
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
		settings = {
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all", -- 'none', 'literals', or 'all'
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
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

	-- rust
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		server = {
			settings = {
				["rust-analyzer"] = {
					-- checkOnSave = {
					-- 	command = "clippy",
					-- },
					inlayHints = {
						bindingModeHints = {
							enable = false,
						},
						chainingHints = {
							enable = true,
						},
						closingBraceHints = {
							enable = true,
							minLines = 25,
						},
						closureReturnTypeHints = {
							enable = "never",
						},
						lifetimeElisionHints = {
							enable = "never",
							useParameterNames = false,
						},
						maxLength = 25,
						parameterHints = {
							enable = true,
						},
						reborrowHints = {
							enable = "never",
						},
						renderColons = true,
						typeHints = {
							enable = true,
							hideClosureInitialization = false,
							hideNamedConstructor = false,
						},
					},
				},
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
				hints = {
					rangeVariableTypes = true,
					parameterNames = true,
					constantValues = true,
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					functionTypeParameters = true,
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
	-- config = config,
	-- enabled = false,
}
