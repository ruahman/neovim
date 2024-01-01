return {
	"hoob3rt/lualine.nvim",
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", file_status = true, path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		options = {
			-- theme = 'tokyonight'
			theme = "nightfox",
		},
	},
	config = true,
}
