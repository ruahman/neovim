return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = true },
			panel = { enabled = false },
		},
	},
	{
		"fang2hou/blink-copilot",
		dependencies = { "zbirenbaum/copilot.lua" },
	},
}
