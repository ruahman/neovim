-- coloriz css color
-- show color in css
return {
	"norcalli/nvim-colorizer.lua",
	opts = {
		css = { css = true },
	},
	event = { "BufRead", "BufNewFile" },
	config = true,
}
