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
					{ icon = " ", key = "s", desc = "Settings", action = ":e $MYVIMRC | cd %:p:h" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
