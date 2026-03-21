return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			preset = {
				header = [[
 NEOVIM
        ]],
				keys = {
					{ icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
					{ icon = " ", key = "s", desc = "Settings", action = ":e $MYVIMRC | cd %:p:h" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
