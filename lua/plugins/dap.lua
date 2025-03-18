-- debug adapter protocol

local function config()
	local dap = require("dap")

	dap.set_log_level("TRACE")

	--dap python
	require("dap-python").setup() -- must have debugpy installed globaly

	--dap go
	require("dap-go").setup() -- must have delve installed globaly

	require("dap-vscode-js").setup({
		debugger_path = vim.fn.getcwd() .. "/.vscode-js-debug", -- Path to the debugger
		adapters = { "pwa-node" },
	})

	dap.configurations.javascript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}

	dap.configurations.typescript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch TS file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			outFiles = { "${workspaceFolder}/dist/**/*.js" }, -- Adjust for your build output
		},
	}

	--javascript / typescript
	-- dap.adapters["pwa-node"] = {
	-- 	type = "server",
	-- 	host = "localhost",
	-- 	port = "${port}",
	-- 	executable = {
	-- 		command = "node",
	-- 		args = {
	-- 			vim.fn.getcwd() .. "/.vscode-js-debug/lib/node_modules/js-debug/dist/src/dapDebugServer.js",
	-- 			-- vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
	-- 			"${port}",
	-- 		},
	-- 	},
	-- }

	dap.configurations.javascript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch node",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
	}

	dap.configurations.typescript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch TS File",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			outFiles = { "${workspaceFolder}/dist/**/*.js" },
		},
	}

	-- c
	-- dap.configurations.c = {
	--   {
	--     name = "Debug",
	--     type = "lldb",
	--     request = "launch",
	--     program = function()
	--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	--     end,
	--     cwd = "${workspaceFolder}",
	--     stopOnEntry = false,
	--     args = {},
	--   },
	-- }

	-- cpp
	-- dap.configurations.cpp = dap.configurations.c

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
					"console",
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
