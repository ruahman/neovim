-- debug adapter protocol

local function config()
	local dap = require("dap")

	dap.set_log_level("TRACE")

	--dap python
	require("dap-python").setup() -- must have debugpy installed globaly

	--dap go
	require("dap-go").setup() -- must have delve installed globaly

	-- vscode-js-debug

	local vscode_js_debug = os.getenv("VSCODE_JS_DEBUG")

	if vscode_js_debug ~= nil then
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					vscode_js_debug .. "/lib/node_modules/js-debug/dist/src/dapDebugServer.js",
					"${port}",
				},
			},
		}

		local attach_configuration =
			{ -- attaches to a node process that has been started with --inspect or --inspect-bkr
				-- for long running tasks (like a http server) usually just use --inspect
				-- but for short lived tasks (like one-off scripts) --inspect-brk,
				-- it will delay execution until the debugger has attached.
				type = "pwa-node",
				-- attach to an already running node process with --inspect flag
				-- default port: 9222
				request = "attach",
				name = "Attach debugger to existing `node --inspect` process",
				-- allows us to pick the process using a picker
				processId = require("dap.utils").pick_process,
				-- for compiled languages like typescript or svelte
				sourceMaps = true,
				-- path to src in vite based projects (and most other projects as well)
				cwd = "${workspaceFolder}/src",
				-- resolve source maps in nested locations while ignoring node_modules
				resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
				-- we don't want to debug code inside node_modules, so skip it!
				skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
			}

		-- javascript
		dap.configurations.javascript = {
			{ -- this will only work for javascript
				type = "pwa-node",
				-- launch a new process to attach debugger to
				request = "launch",
				name = "Launch file",
				-- launch current file
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			attach_configuration,
		}

		-- typescript
		dap.configurations.typescript = {
			-- can only attach can't launch typescript
			attach_configuration,
		}
	end

	-- codelldb
	local codelldb = os.getenv("CODELLDB")

	if codelldb ~= nil then
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb .. "/adapter/codelldb",
				args = { "--port", "${port}" },
			},
		}

		-- Configuration for Rust
		dap.configurations.rust = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
			{
				name = "Attach to Process",
				type = "codelldb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				pid = function()
					-- Prompt for PID or use a function to select it
					local pid = vim.fn.input("Enter PID: ")
					return tonumber(pid)
				end,
				args = {},
			},
		}
	end

	vim.keymap.set("n", "gt", require("dap").toggle_breakpoint, { desc = "Toogle Breakpoint" })
	vim.keymap.set("n", "gB", function()
		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end)
	vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "Continue" })
	vim.keymap.set("n", "<F6>", require("dap").terminate, { desc = "Terminate" })
	vim.keymap.set("n", "<F10>", require("dap").step_over, { desc = "Step Over" })
	vim.keymap.set("n", "<F11>", require("dap").step_into, { desc = "Step Into" })
	vim.keymap.set("n", "<F12>", require("dap").step_out, { desc = "Step Out" })

	-- dap virtual-text: show variable values
	require("nvim-dap-virtual-text").setup()

	--DAPUI
	local dapui = require("dapui")
	dapui.setup({
		layouts = {
			{
				elements = {
					"scopes",
					"watches",
					{ id = "stacks", size = 0.15 },
				},
				size = 40, -- 40 columns
				position = "left",
			},
			{
				elements = {
					-- "console",
					"repl",
				},
				size = 0.25, -- 25% of total lines
				position = "bottom",
			},
		},
	})

	-- dap-ui toogle
	vim.keymap.set("n", "gu", dapui.toggle)

	-- dap-ui auto load
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

return {
	"mfussenegger/nvim-dap",
	-- lazy = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = config,
}
