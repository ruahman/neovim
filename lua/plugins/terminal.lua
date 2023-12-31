local function config()
	require("toggleterm").setup({
		open_mapping = [[<c-\>]],
		direction = "float",
	})
end

-- return export
return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<c-\\>", "ToggleTerm" },
	},
	config = config,
}
