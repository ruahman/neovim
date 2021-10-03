require'lualine'.setup{
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', file_status=true, path=1 }},
    lualine_x = {'encoding', 'fileformat', 'filetype', require'lsp-status'.status },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
