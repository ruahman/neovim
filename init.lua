if vim.g.vscode then
	require("settings.vscode")
	print("vscode is using nvim...")
else
	require("settings")
	require("keys")
	require("commands")
	require("plugins")
end
