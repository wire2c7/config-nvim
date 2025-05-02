local mapper = require('utils.keymapper')

local buf = vim.lsp.buf
local diag = vim.diagnostic

vim.lsp.enable({
  -- Lua
  'lua_ls',

  -- Rust
  'rust_analyzer',
})

mapper.nmap('ge', diag.open_float)
mapper.nmap('[d', diag.goto_prev)
mapper.nmap(']d', diag.goto_next)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    local function nmap(lhs, rhs)
      mapper.nmap(lhs, rhs, opts)
    end
    local function imap(lhs, rhs)
      mapper.imap(lhs, rhs, opts)
    end

    -- ホバー情報
    nmap('K', buf.hover)
    -- 定義ジャンプ
    nmap('gd', buf.definition)
    -- 型定義ジャンプ
    nmap('grt', buf.type_definition)
    -- フォーマッティング
    nmap('gf', function()
      buf.format({ async = true })
    end)

    nmap('<C-k>', buf.signature_help)
    imap('<C-k>', buf.signature_help)

    nmap('gwa', buf.add_workspace_folder)
    nmap('gwr', buf.remove_workspace_folder)
    nmap('gwl', function()
      print(vim.inspect(buf.list_workspace_folders()))
    end)
  end,
})

diag.config({
  virtual_lines = true,
})
