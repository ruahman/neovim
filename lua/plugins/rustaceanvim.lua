return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			dap = {
				adapter = require("rustaceanvim.config").get_codelldb_adapter(
					vim.fn.getcwd() .. "/.vadimcn.vscode-lldb/adapter/codelldb",
					vim.fn.getcwd() .. "/.vadimcn.vscode-lldb/lldb/lib/liblldb.so"
				),
			},
			server = {
				on_attach = function(client, bufnr)
					-- vim.keymap.set("n", "<leader>dr", function()
					-- 	vim.cmd.RustLsp("debuggables")
					-- end, { buffer = bufnr, desc = "Rust Debuggables" })

					-- setup keybindings for this buffer
					local bufopts = { noremap = true, silent = false, buffer = bufnr }
					--
					vim.keymap.set("n", "ga", function()
						vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
						-- or vim.lsp.buf.codeAction() if you don't want grouping.
					end, bufopts)

					vim.keymap.set(
						"n",
						"gh", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
						function()
							vim.cmd.RustLsp({ "hover", "actions" })
						end,
						bufopts
					)

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
					-- utils.map("n", "gL", ":LspRestart<CR>")
					--
					-- definitions
					vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)

					-- references
					vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)

					-- implementations
					vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, bufopts)

					-- diagnostics
					vim.keymap.set("n", "<leader>x", require("telescope.builtin").diagnostics, bufopts)
				end,
			},
		}
	end,
}
