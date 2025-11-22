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

	-- c/cpp
	lspconfig.clangd.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufNewFile", "BufRead" },
	-- config = function()
	-- 	-- vim.lsp.enable("lua_ls")
	-- 	-- vim.lsp.enable("ts_ls")
	-- 	-- vim.lsp.enable("pyright")
	-- 	-- vim.lsp.enable("solargraph")
	-- 	-- vim.lsp.enable("zls")
	-- 	-- vim.lsp.enable("rust_analyzer")
	-- end,
	-- enabled = false,
}
