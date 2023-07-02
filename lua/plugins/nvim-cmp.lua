local export = {}

function export.config()
  local cmp = require("cmp")

  cmp.setup({
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
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer",  keyword_length = 5 },
      { name = "path" },
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
