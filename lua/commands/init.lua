

-- vim.cmd[[command! -nargs=+ Go :! go <args> .]]

vim.api.nvim_create_user_command(
  'Go',
  function(input)
    if string.match(input.args, "build") then
      vim.cmd[[:! go build]]
    elseif string.match(input.args, "check") then
      vim.cmd[[:! go build -o /dev/null]]
    elseif string.match(input.args, "run") then
      vim.cmd[[:! go run .]]
    else
      print(" go does not recognize command...")
    end
  end,
  {nargs = 1}
)
