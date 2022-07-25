vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "nvim-tree",
        highlight = "Directory",
        text_align = "left"
      }
    },
    -- separator_style = "slant",
    diagnostics = "nvim_lsp",
    -- diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   if string.match(level, "error") then
    --     return "("..count..")"
    --   elseif string.match(level, "warning") then
    --     return "("..count..")"
    --   end
    -- end,
  }
}

-- vim.cmd [[autocmd! ColorScheme * highlight Debug guifg=green guibg=#1f2335]]
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
vim.cmd [[nnoremap <silent><C-f> :BufferLineCycleNext<CR>]]
vim.cmd [[nnoremap <silent><C-b> :BufferLineCyclePrev<CR>]]

-- These commands will move the current buffer backwards or forwards in the bufferline
vim.cmd [[nnoremap <silent><M-f> :BufferLineMoveNext<CR>]]
vim.cmd [[nnoremap <silent><M-b> :BufferLineMovePrev<CR>]]
