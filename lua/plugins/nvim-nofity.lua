-- A fancy, configurable, notification manager for NeoVim.

return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			-- Animation style (see below for details)
			stages = "fade_in_slide_out",

			-- Default timeout for notifications
			timeout = 2000,

			-- For stages that change opacity this is treated as the highlight behind the window
			background_colour = "#000000",

			-- Icons for the different levels
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
		})
	end,
}
