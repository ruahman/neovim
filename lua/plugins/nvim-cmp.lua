local export = {}

function export.config()
	local cmp = require("cmp")

	-- setup npm completion
	require("cmp-npm").setup({})

	cmp.setup({
		-- nvim-cmp will not work without a snippets engine configured
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-Space>"] = cmp.mapping.complete(), -- invoke completion
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-e>"] = cmp.mapping.close(), -- end completion
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		},
		sources = {
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "buffer", keyword_length = 5 },
			{ name = "path" },
			{ name = "npm", keyword_length = 4 },
			{ name = "nvim_lua" },
		},
		formatting = {
			format = require("lspkind").cmp_format(),
		},
		window = {
			documentation = cmp.config.window.bordered(),
		},
		experimental = {
			ghost_text = true,
		},
	})
end

return export
