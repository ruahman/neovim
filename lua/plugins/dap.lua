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
				vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
				"${port}",
			},
		},
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
	}
	-- dap.configurations.typescript = {
	-- 	{
	-- 		type = "pwa-node",
	-- 		request = "launch",
	-- 		name = "Launch deno",
	-- 		runtimeExecutable = "deno",
	-- 		runtimeArgs = {
	-- 			"run",
	-- 			"--inspect-wait",
	-- 			"--allow-all",
	-- 		},
	-- 		program = "${file}",
	-- 		cwd = "${workspaceFolder}",
	-- 		attachSimplePort = 9229,
	-- 	},
	-- }

	-- rust
	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = "codelldb",
			args = { "--port", "${port}" },
		},
	}

	dap.configurations.rust = {
		{
			name = "Debug",
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
			name = "Debug Test",
			type = "lldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/deps/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
		},
	}

	-- setup lldb for c/c++/rust
	-- dap.adapters.lldb = {
	--   type = "executable",
	--   command = "/usr/bin/lldb-vscode-14", -- comes with install of lldb
	--   name = "lldb",
	-- }

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

	-- rust
	-- dap.configurations.rust = {
	--   {
	--     name = "Debug",
	--     type = "lldb",
	--     request = "launch",
	--     program = function()
	--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
	--     end,
	--     cwd = "${workspaceFolder}",
	--     stopOnEntry = false,
	--     args = {},
	--   },
	--   {
	--     name = "Debug Test",
	--     type = "lldb",
	--     request = "launch",
	--     program = function()
	--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/deps/", "file")
	--     end,
	--     cwd = "${workspaceFolder}",
	--     stopOnEntry = false,
	--     args = {},
	--   },
	-- }

	-- csharp
	-- vim.g.dotnet_build_project = function()
	--     local default_path = vim.fn.getcwd() .. '/'
	--     if vim.g['dotnet_last_proj_path'] ~= nil then
	--         default_path = vim.g['dotnet_last_proj_path']
	--     end
	--     local path = vim.fn.input('Path to your *proj file', default_path, 'file')
	--     vim.g['dotnet_last_proj_path'] = path
	--     local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
	--     print('')
	--     print('Cmd to execute: ' .. cmd)
	--     local f = os.execute(cmd)
	--     if f == 0 then
	--         print('\nBuild: ✓')
	--     else
	--         print('\nBuild: x (code: ' .. f .. ')')
	--     end
	-- end

	-- vim.g.dotnet_get_dll_path = function()
	--     local request = function()
	--         return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
	--     end
	--
	--     if vim.g['dotnet_last_dll_path'] == nil then
	--         vim.g['dotnet_last_dll_path'] = request()
	--     else
	--         if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
	--             vim.g['dotnet_last_dll_path'] = request()
	--         end
	--     end
	--
	--     return vim.g['dotnet_last_dll_path']
	-- end

	-- dap.adapters.netcoredbg = {
	--   type = 'executable',
	--   command = vim.fn.stdpath("data") .. '/mason/bin/netcoredbg',
	--   args = { '--interpreter=vscode' },
	-- }

	-- dap.configurations.cs = {
	--   {
	--     type = "netcoredbg",
	--     name = "launch - netcoredbg",
	--     request = "launch",
	--     program = function()
	--         if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
	--             vim.g.dotnet_build_project()
	--         end
	--         return vim.g.dotnet_get_dll_path()
	--     end,
	--   },
	-- }

	require("nvim-dap-virtual-text").setup()

	--DAPUI
	require("dapui").setup({
		layouts = {
			{
				elements = {
					-- Elements can be strings or table with id and size keys.
					{ id = "scopes", size = 0.25 },
					"watches",
					"stacks",
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

	-- this start debuging and continues
	vim.keymap.set("n", "<F5>", require("dap").continue)
	vim.keymap.set("n", "<F10>", require("dap").step_over)
	vim.keymap.set("n", "<F11>", require("dap").step_into)
	vim.keymap.set("n", "<F12>", require("dap").step_out)
	vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
	vim.keymap.set("n", "<leader>B", function()
		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end)
	vim.keymap.set("n", "gu", require("dapui").toggle)
end

return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
		"leoluz/nvim-dap-go",
		-- "microsoft/vscode-js-debug",
	},
	config = config,
}
