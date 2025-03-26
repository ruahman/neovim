return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	config = function()
		local adapter_path = vim.fn.getcwd() .. "/.vadimcn.vscode-lldb/adapter/codelldb"
		local liblldb_path = vim.fn.getcwd() .. "/.vadimcn.vscode-lldb/lldb/lib/liblldb.so"

		-- Adjust liblldb path for macOS if needed
		if vim.fn.has("mac") == 1 then
			liblldb_path = vim.fn.getcwd() .. "/.vadimcn.vscode-lldb/lldb/lib/liblldb.dylib"
		end

		local codelldb_adapter = require("rustaceanvim.config").get_codelldb_adapter(adapter_path, liblldb_path)

		vim.g.rustaceanvim = {
			dap = {
				adapter = codelldb_adapter,
			},
			server = {
				on_attach = function(_, bufnr)
					-- setup keybindings for this buffer
					local bufopts = { noremap = true, silent = false, buffer = bufnr }

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
					vim.keymap.set("n", "ge", function()
						-- vim.diagnostic.open_float()
						print("explain errro...")
						vim.cmd.RustLsp("explainError")
					end, bufopts)

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

					-- debuggables: opens a prompt to select from available targets.
					-- displays all possible targets
					-- :RustLsp debuggables will only load debug configurations created by rust-analyzer
					vim.keymap.set("n", "<leader>D", function()
						print("debuggables")
						vim.cmd.RustLsp("debuggables")
					end, bufopts)

					-- debug: searches for a target at the current cursor position.
					vim.keymap.set("n", "<leader>d", function()
						print("debug")
						vim.cmd.RustLsp("debug")
					end, bufopts)

					-- vim.keymap.set(
					-- 	"n",
					-- 	"gt",
					-- 	vim.cmd.RustToggleBreakpoint,
					-- 	{ buffer = bufnr, desc = "Toggle Breakpoint" }
					-- )
					vim.keymap.set("n", "gt", require("dap").toggle_breakpoint, { desc = "Toogle Breakpoint" })
					vim.keymap.set("n", "gB", function()
						require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
					end)
					-- require('dap').continue() will load all Rust debug configurations,
					-- including those specified in a .vscode/launch.json
					vim.keymap.set("n", "<F5>", function()
						print("continue")
						require("dap").continue()
					end, { desc = "Continue" })

					vim.keymap.set("n", "<F6>", function()
						print("terminate")
						require("dap").terminate()
					end, { desc = "Terminate" })

					vim.keymap.set("n", "<F10>", function()
						print("step_over")
						require("dap").step_over()
					end, { desc = "Step Over" })

					vim.keymap.set("n", "<F11>", function()
						print("step into")
						require("dap").step_into()
					end, { desc = "Step Into" })

					vim.keymap.set("n", "<F12>", function()
						print("step out")
						require("dap").step_out()
					end, { desc = "Step Out" })

					-- dkapui
					vim.keymap.set("n", "gu", require("dapui").toggle)
				end,
			},
		}
	end,
}
