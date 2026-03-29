-- cool extra things for lsp like breadcrumbs and codeactions
return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({})
	end,
}
