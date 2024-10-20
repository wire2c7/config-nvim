local plugin_name = 'williamboman/mason-lspconfig.nvim'
local dependencies = {
  { 'williamboman/mason.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
}

local mason_lspconfig_opts = {
  ensure_installed = {
    'bashls', -- Bash
    --'clangd',   -- C
    --'cmake',    -- CMake
    'cssls',    -- CSS
    'html',     -- HTML
    'jsonls',   -- JSON
    'tsserver', -- JavaScript/TypeScript
    'lua_ls',   -- Lua
    'marksman', -- Markdown
    --'taplo',    -- TOML
    --'lemminx',  -- XML
    --'yamlls',   -- YAML
  },
}

local function get_handlers()
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  return {
    function(server_name) -- default handler
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end,
    ['lua_ls'] = function()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
          },
        },
      })
    end,
    ['rust_analyzer'] = function()
      require('rust-tools').setup({})
    end,
  }
end

return {
  {
    plugin_name,
    dependencies = dependencies,
    config = function()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup(mason_lspconfig_opts)
      mason_lspconfig.setup_handlers(get_handlers())
    end,
  },
}
