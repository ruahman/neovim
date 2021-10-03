local utils = {}

utils.set = vim.opt
utils.global = vim.g
utils.cmd = vim.cmd

function utils.map(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = false}
  )
end

return utils
