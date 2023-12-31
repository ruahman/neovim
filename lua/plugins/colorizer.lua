local function config()
	require("colorizer").setup({
		css = { css = true },
	})
end

return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufRead", "BufNewFile" },
	config = config,
}
