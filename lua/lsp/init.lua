local mapper = require('utils.keymapper')

local lsp = vim.lsp
local diag = vim.diagnostic

-- Set log level
-- lsp.log.set_level(lsp.log.levels.ERROR)

-- Enable Language Servers
lsp.enable({
  -- Lua
  'lua_ls',

  -- Rust
  'rust_analyzer',

  -- TypeScript (JavaScript)
  'tsgo',
  -- JavaScript, TypeScript, JSON
  'biome',
})

-- Diagnostic
mapper.n('ge', diag.open_float)
diag.config({
  virtual_lines = true,
})
