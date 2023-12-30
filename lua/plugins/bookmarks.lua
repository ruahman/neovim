local M = {}

function M.config()
	require("bookmarks").setup()
	require("telescope").load_extension("bookmarks")
end

return M
