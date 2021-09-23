local utils = {}

local scopes = {opt = vim.opt, g = vim.g, o = vim.o, b = vim.bo, w = vim.wo }

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    -- if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.key_mapper(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = false}
  )
end

return utils
