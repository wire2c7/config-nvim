local function set_keymaps()
  local h = require('utils.keymapper')
  local _nmap = h.nmap
  local _imap = h.imap

  local diag = vim.diagnostic
  local api = vim.api
  local buf = vim.lsp.buf

  _nmap('ge', diag.open_float)
  _nmap('[d', diag.goto_prev)
  _nmap(']d', diag.goto_next)

  api.nvim_create_autocmd('LspAttach', {
    group = api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      local opts = { buffer = ev.buf }
      local function nmap(lhs, rhs)
        _nmap(lhs, rhs, opts)
      end
      local function imap(lhs, rhs)
        _imap(lhs, rhs, opts)
      end

      -- ホバー情報
      nmap('K', buf.hover)
      -- 定義ジャンプ
      nmap('gd', buf.definition)
      -- 実装ジャンプ
      nmap('gi', buf.implementation)
      -- 型定義ジャンプ
      nmap('gt', buf.type_definition)
      -- フォーマッティング
      nmap('gf', function()
        buf.format { async = true }
      end)
      -- 参照一覧表示
      nmap('gr', buf.references)
      -- リネーム
      nmap('gn', buf.rename)
      -- 修正候補表示
      nmap('ga', buf.code_action)

      nmap('<C-k>', buf.signature_help)
      imap('<C-k>', buf.signature_help)

      nmap('gwa', buf.add_workspace_folder)
      nmap('gwr', buf.remove_workspace_folder)
      nmap('gwl', function()
        print(vim.inspect(buf.list_workspace_folders()))
      end)
    end,
  })
end

return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      set_keymaps()
    end,
  },
}
