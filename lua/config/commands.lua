--Scratch
vim.api.nvim_create_user_command("Scratch", function()
	vim.api.nvim_command("enew")
	vim.bo[0].buftype = "nofile"
	vim.bo[0].bufhidden = "hide"
	vim.bo[0].swapfile = false
end, {})
