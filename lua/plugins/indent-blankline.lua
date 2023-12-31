local function config()
	require("ibl").setup()
end

return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufRead", "BufNewFile" },
	main = "ibl",
	config = config,
}
