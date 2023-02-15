local M = {}

function M.config()
  vim.opt.termguicolors = true

  require'indent_blankline'.setup {
    space_char_blankline = " ",
    use_treesitter = true,
    show_current_context = true,
    show_trailing_blankline_indent = true
  }
end

return M