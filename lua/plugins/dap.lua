-- debug adapter protocol
local utils = require("utils")

local function config()
	local dap = require("dap")

	dap.set_log_level("TRACE")

	-- dap python
	require("dap-python").setup() -- must have debugpy installed globaly

	-- dap ruby
	require("dap-ruby").setup()

	-- dap go
	require("dap-go").setup() -- must have delve installed globaly

	vim.keymap.set("n", "gt", require("dap").toggle_breakpoint, { desc = "Toogle Breakpoint" })
	vim.keymap.set("n", "gB", function()
		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end)
	vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "Continue" })
	vim.keymap.set("n", "<F6>", require("dap").terminate, { desc = "Terminate" })
	vim.keymap.set("n", "<F9>", require("dap").step_into, { desc = "Step Into" })
	vim.keymap.set("n", "<F10>", require("dap").step_over, { desc = "Step Over" })
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
		"suketa/nvim-dap-ruby",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = config,
}
