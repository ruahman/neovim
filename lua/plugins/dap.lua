-- debug adapter protocol

local function config()
	local dap = require("dap")

	dap.set_log_level("TRACE")

	--dap python
	require("dap-python").setup() -- must have debugpy installed globaly

	--dap go
	require("dap-go").setup() -- must have delve installed globaly

	--javascript/typescript
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = {
				vim.fn.getcwd() .. "/.vscode-js-debug/lib/node_modules/js-debug/src/dapDebugServer.js",
				-- vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
				"${port}",
			},
		},
	}

	dap.adapters.bun = {
		type = "server",
		host = "localhost",
		port = 6499, -- Default Bun inspect port
	}

	dap.configurations.javascript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch node",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
	}

	dap.configurations.typescript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch node",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch deno",
			runtimeExecutable = "deno",
			runtimeArgs = {
				"run",
				"--inspect-wait",
				"--allow-all",
			},
			program = "${file}",
			cwd = "${workspaceFolder}",
			attachSimplePort = 9229,
		},
		{
			type = "bun",
			request = "launch",
			name = "Launch bun.js",
			runtimeExecutable = "bun",
			runtimeArgs = {
				"run",
				"--inspect",
			},
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true, -- For TypeScript
		},
		{
			type = "bun",
			request = "attach",
			name = "Attach to Bun.js",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
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

	require("nvim-dap-virtual-text").setup()

	--DAPUI
	require("dapui").setup({
		layouts = {
			{
				elements = {
					"scopes",
					{ id = "stacks", size = 0.45 },
				},
				size = 40, -- 40 columns
				position = "left",
			},
			{
				elements = {
					-- "console",
					"watches",
				},
				size = 0.45, -- 25% of total lines
				position = "bottom",
			},
		},
	})

	-- this start debuging and continues
	vim.keymap.set("n", "<F5>", require("dap").continue)
	vim.keymap.set("n", "<F6>", require("dap").terminate)
	vim.keymap.set("n", "<F9>", require("dap").toggle_breakpoint)
	vim.keymap.set("n", "<F10>", require("dap").step_over)
	vim.keymap.set("n", "<F11>", require("dap").step_into)
	vim.keymap.set("n", "<F12>", require("dap").step_out)
	-- vim.keymap.set("n", "<leader>B", function()
	-- 	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	-- end)
	vim.keymap.set("n", "gu", require("dapui").toggle)
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
		-- "microsoft/vscode-js-debug",
	},
	config = config,
}
