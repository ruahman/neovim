require("settings")
require("keys")
require("commands")
require("plugins")

if vim.g.neovide then
	vim.opt.guifont = { "FiraCode Nerd Font Mono", "h18" }

	-- vim.g.neovide_profiler=true
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_cursor_trail_size = 0.8
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
