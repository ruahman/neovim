-- A small Neovim plugin for previewing native LSP's goto definition,
-- type definition, implementation, declaration and references calls in floating windows.

return {
	"rmagatti/goto-preview",
	opts = {
		default_mappings = true,
	},
	config = true,
}
