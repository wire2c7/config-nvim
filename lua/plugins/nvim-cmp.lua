local M = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'saadparwaiz1/cmp_luasnip' },
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
    },
    { 'rafamadriz/friendly-snippets' },
    { 'onsails/lspkind-nvim' },
  },
}

M.config = function()
  local cmp = require('cmp')
  local map = cmp.mapping
  local conf = cmp.config

  cmp.setup({
    snippet = {
      expand = function (args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    mapping = map.preset.insert({
      ['<C-d>'] = map.scroll_docs(-4),
      ['<C-f>'] = map.scroll_docs(4),
      ['<C-e>'] = map.abort(),
      ['<CR>'] = map.confirm({ select = true }),
    }),
    sources = conf.sources(
      {
        { name = 'nvim_lsp' },
        { name = 'luasnip', priority_weight = 20 },
      },
      {
        { name = 'buffer' },
        { name = 'path' },
      }
    ),
    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol_text',
        maxwidth = 50,
        menu = {
          buffer = '[Buffer]',
          nvim_lsp = '[LSP]',
          path = '[Path]',
          vsnip = '[Snippet]',
        },
      }),
    },
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        { name = 'path' },
      },
      {
        { name = 'cmdline' },
      }
    ),
    matching = { disallow_symbol_nonprefix_matching = false },
  })

  require('luasnip/loaders/from_vscode').lazy_load()
end

return { M }
