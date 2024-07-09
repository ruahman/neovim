-- autotag for html but doesn't seem to work
return {
	"windwp/nvim-ts-autotag",
	depends = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
