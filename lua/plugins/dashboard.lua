
local export = {}

function export.config()
  require'alpha'.setup(require'alpha.themes.dashboard'.config)
end

return export
