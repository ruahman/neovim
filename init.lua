if vim.g.vscode then
	require("settings.vscode")
	require("plugins.vscode")
else
	require("settings")
	require("keys")
	require("commands")
	require("plugins")
end
