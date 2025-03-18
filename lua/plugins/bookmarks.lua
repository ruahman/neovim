return {
	"crusj/bookmarks.nvim",
	keys = {
		{ "<tab><tab>", mode = { "n" } },
	},
	enabled = false,
	branch = "main",
	dependencies = { "nvim-web-devicons" },
	config = function()
		require("bookmarks").setup({
			-- keymaps = {
			-- 	toggle = "<tab><tab>", -- Toggle bookmarks(global keymap)
			-- 	order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
			-- 	add = "\\z", -- Add bookmarks(global keymap)
			-- 	add_global = "\\g", -- Add to global bookmarks
			-- 	delete = "dd", -- Delete bookmarks(buf keymap)
			-- 	close = "q", -- close bookmarks (buf keymap)
			-- },
		})

		require("telescope").load_extension("bookmarks")
	end,
}
-- toogle: <tab><tab>
-- close: q
-- add: \\z
-- delete: dd
