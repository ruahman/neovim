local M = {}

function M.config()
    vim.g.vimwiki_list = {
      {
        path = 'C:\\Users\\dego_\\Google Drive\\Documents\\vimwiki',
        path_html = 'C:\\Users\\dego_\\Google Drive\\Documents\\vimwiki_html',
      },
      {
        path = 'C:\\Users\\dego_\\Google Drive\\Documents\\vimwiki_gtd',
        path_html = 'C:\\Users\\dego_\\Google Drive\\Documents\\vimwiki_gtd_html',
      }
    }
end

return M
