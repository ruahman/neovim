local M = {}

function M.config()
    vim.g.vimwiki_list = {
      {
        path = '~/vimwiki',
        -- path_html = '~/vimwiki_html',
        -- template_path = 'C:\\Users\\dego_\\Google Drive\\Documents\\vimwiki\\template',
        -- template_default = 'def_template',
        -- auto_toc = 1,
        -- template_ext = '.html'
      }
    }
end

return M
