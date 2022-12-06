

-- vim.cmd[[command! -nargs=+ Go :! go <args> .]]
-- Go commands
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

-- Make commands
vim.api.nvim_create_user_command(
  'Make',
  function(input)
    if string.match(input.args, "build") then
      vim.cmd[[:! make build]]
    elseif string.match(input.args, "clean") then
      vim.cmd[[:! make clean]]
    elseif string.match(input.args, "run") then
      vim.cmd[[:! make run]]
    else
      vim.cmd[[:! make]]
    end
  end,
  {nargs = '?'}
)

-- Cargo
vim.api.nvim_create_user_command(
  'Cargo',
  function(input)
    if string.match(input.args, "build") then
      vim.cmd[[:! cargo build]]
    elseif string.match(input.args, "clean") then
      vim.cmd[[:! cargo clean]]
    elseif string.match(input.args, "run") then
      vim.cmd[[:! cargo run]]
    elseif string.match(input.args, "check") then
      vim.cmd[[:! cargo check]]
    elseif string.match(input.args, "test") then
      vim.cmd[[:! cargo test]]
    end
  end,
  {nargs = 1}
)

