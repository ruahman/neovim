return {
	"tomasky/bookmarks.nvim",
	opts = {
		sign_priority = 8, --set bookmark sign priority to cover other sign
		save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
		keywords = {
			["@m"] = "󰃃",
			["@f"] = "󰉀",
			["@h"] = "󰣐",
			["@t"] = "",
			["@w"] = "",
			["@x"] = "󱁤",
		},
		on_attach = function(bufnr)
			local bm = require("bookmarks")
			local bookmarks = require("telescope").extensions.bookmarks
			require("telescope").load_extension("bookmarks")

			local map = vim.keymap.set
			map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
			map("n", "me", bm.bookmark_ann) -- add or edit mark annotation at current line
			map("n", "ml", bookmarks.list) -- marks
			-- map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
			-- map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
			-- map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
			-- map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
		end,
	},
	config = true,
}
