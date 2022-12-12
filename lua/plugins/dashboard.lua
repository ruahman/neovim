local export = {}

function export.config()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	}

	-- Set menu
	dashboard.section.buttons.val = {
		dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
		dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
		dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
		dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
	}

	dashboard.config.opts.noautocmd = true

	-- vim.cmd([[autocmd User AlphaReady echo 'ready']])

	alpha.setup(dashboard.config)
end

return export
