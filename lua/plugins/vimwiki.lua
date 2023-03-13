local M = {}

function M.config()
    vim.g.vimwiki_list = {
      {
        path = '~/vimwiki',
      }
    }
end

return M
