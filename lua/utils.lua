local utils = {}

utils.set = vim.opt
utils.global = vim.g
utils.cmd = vim.cmd

function utils.set_keymap(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = false}
  )
end

return utils
