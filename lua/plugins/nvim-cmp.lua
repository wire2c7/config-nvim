return {
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local map = cmp.mapping
      local conf = cmp.config

      cmp.setup({
        mapping = map.preset.insert({
          ['<C-d>'] = map.scroll_docs(-4),
          ['<C-f>'] = map.scroll_docs(4),
          ['<C-Space>'] = map.complete(),
          ['<C-e>'] = map.abort(),
          ['<CR>'] = map.confirm({ select = true }),
        }),
        sources = conf.sources({
          { name = 'nvim_lsp' },
        }),
      })
    end,
  },
}
