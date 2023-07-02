local M = {}

function M.config()
  require("indent_blankline").setup({
    space_char_blankline = " ",
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = true,
  })
end

return M
