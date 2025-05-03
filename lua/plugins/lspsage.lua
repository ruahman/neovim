-- cool extra things for lsp like breadcrumbs and codeactions
return {
	"nvimdev/lspsaga.nvim",
	after = "nvim-lspconfig",
	config = function()
		require("lspsaga").setup({})
	end,
}
