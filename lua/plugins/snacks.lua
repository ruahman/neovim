return {
	"folke/snacks.nvim",
	opts = {
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		indent = { enabled = true },
		lazygit = { enabled = true },
		picker = {
			sources = {
				lines = {
					layout = {
						preset = "telescope", -- or your custom layout
					},
				},
				explorer = {
					layout = {
						layout = {
							position = "right",
						},
					},
				},
			},
		},
		explorer = {
			enabled = true,
			layout = {
				layout = { position = "right" },
			},
		},
		notify = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		terminal = {
			enabled = true,
			win = {
				style = "float",
				height = 0.8,
				width = 0.8,
				border = "rounded",
			},
		},

		dashboard = {
			preset = {
				header = [[
                       _                                 _                           
 _ __   ___  _____   _(_)_ __ ___       _ __ _   _  __ _| |__  _ __ ___   __ _ _ __  
| '_ \ / _ \/ _ \ \ / / | '_ ` _ \     | '__| | | |/ _` | '_ \| '_ ` _ \ / _` | '_ \ 
| | | |  __/ (_) \ V /| | | | | | |    | |  | |_| | (_| | | | | | | | | | (_| | | | |
|_| |_|\___|\___/ \_/ |_|_| |_| |_|    |_|   \__,_|\__,_|_| |_|_| |_| |_|\__,_|_| |_|
        ]],
				keys = {
					{ icon = "", key = "n", desc = "New", action = ":enew" },
					{
						icon = "󰈞",
						key = "f",
						desc = "Find",
						action = function()
							Snacks.picker.files()
						end,
					},
					{
						icon = "",
						key = "r",
						desc = "Recent",
						action = function()
							Snacks.picker.recent()
						end,
					},
					{ icon = "", key = "s", desc = "Settings", action = ":e $MYVIMRC | cd %:p:h" },
					{ icon = "󰚰", key = "U", desc = "Update Plugins", action = ":lua vim.pack.update()" },
					{ icon = "󰩈", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys" },
				-- { section = "recent_files" },
				-- { section = "startup" }, -- shows startup time without lazy.stats
			},
		},
	},
	keys = {
		{
			"gbd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
			mode = "n",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>l",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<c-\\>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<leader>f",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>s",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>m",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Goto Implementation",
		},
		{
			"<leader>x",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
	},
}
