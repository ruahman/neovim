local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(), -- invoke completion
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }, 
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'luasnip' },
      { name = 'nvim_lua' },
    }
  })
