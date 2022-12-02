
local export = {}

function export.config()
  vim.opt.termguicolors = true
  vim.cmd [[colorscheme nightfox]]
end

return export
