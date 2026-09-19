-- C# LSP via Microsoft's Roslyn language server
-- The plugin registers and enables the `roslyn` LSP config itself (during
-- setup, called by pack.lua as require("roslyn").setup(opts)), so there is no
-- vim.lsp.enable("roslyn") in config/lsp.lua.
--
-- Requirements (installed outside this config, like the other LSP servers):
--   * Neovim >= 0.12.0 and a .NET SDK (`dotnet` on PATH)
--   * The Roslyn language server binary. This config has no mason, so install
--     it manually and make sure it is on PATH:
--       dotnet tool install -g roslyn-language-server --prerelease \
--         --source https://pkgs.dev.azure.com/azure-public/vside/_packaging/vs-impl/nuget/v3/index.json
--
-- Use `:Roslyn target` to pick a solution when a repo has more than one.
return {
	"seblyng/roslyn.nvim",
	opts = {
		-- Roslyn/C# settings go here, e.g.:
		-- settings = {
		-- 	["csharp|inlay_hints"] = {
		-- 		csharp_enable_inlay_hints_for_implicit_object_creation = true,
		-- 	},
		-- },
	},
}
