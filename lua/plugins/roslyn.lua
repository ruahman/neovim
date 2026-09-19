-- C# LSP via Microsoft's Roslyn language server
-- The plugin registers and enables the `roslyn` LSP config itself (during
-- setup, called by pack.lua as require("roslyn").setup(opts)), so there is no
-- vim.lsp.enable("roslyn") in config/lsp.lua.
--
-- Requirements (installed outside this config, like the other LSP servers):
--   * Neovim >= 0.12.0 and a .NET SDK (`dotnet` on PATH)
--   * The Roslyn language server binary.
--
-- Install the server + formatter with Nix (NixOS / home-manager):
--   environment.systemPackages = [ pkgs.roslyn-ls pkgs.csharpier ];   # NixOS
--   home.packages            = [ pkgs.roslyn-ls pkgs.csharpier ];     # home-manager
-- or ad hoc:  nix shell nixpkgs#roslyn-ls nixpkgs#csharpier
--
-- The nixpkgs `roslyn-ls` package installs the binary as
-- `Microsoft.CodeAnalysis.LanguageServer` (not the `roslyn-language-server`
-- wrapper roslyn.nvim looks for by default), so the cmd is overridden below to
-- point at it. It just needs to be on PATH.
--
-- Use `:Roslyn target` to pick a solution when a repo has more than one.
local function config()
	-- Point roslyn.nvim at the nixpkgs binary. Remove this override if you
	-- install via mason / `dotnet tool` (then the plugin's default cmd works).
	if vim.fn.executable("Microsoft.CodeAnalysis.LanguageServer") == 1 then
		vim.lsp.config("roslyn", {
			cmd = {
				"Microsoft.CodeAnalysis.LanguageServer",
				"--logLevel=Information",
				"--extensionLogDirectory=" .. vim.fs.joinpath(vim.fn.stdpath("log"), "roslyn_ls"),
				"--stdio",
			},
		})
	end
end

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
	config = config,
}
