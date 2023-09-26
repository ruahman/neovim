local M = {}

function M.config()
	require("colorizer").setup({
		css = { css = true },
	})
end

return M
