-- Make commands
-- vim.api.nvim_create_user_command(
--   'Make',
--   function(input)
--     if string.match(input.args, "build") then
--       vim.cmd[[:! make build]]
--     elseif string.match(input.args, "clean") then
--       vim.cmd[[:! make clean]]
--     elseif string.match(input.args, "run") then
--       vim.cmd[[:! make run]]
--     else
--       vim.cmd[[:! make]]
--     end
--   end,
--   {nargs = '?'}
-- )

--Scratch
vim.api.nvim_create_user_command("Scratch", function()
	vim.api.nvim_command("enew")
	vim.bo[0].buftype = "nofile"
	vim.bo[0].bufhidden = "hide"
	vim.bo[0].swapfile = false
end, {})
