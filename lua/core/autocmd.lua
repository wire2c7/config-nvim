local mapper = require('utils.keymapper')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local cmd = vim.cmd
local opt_local = vim.opt_local
local lsp = vim.lsp
local buf = lsp.buf

-- Windows バッチファイルを開いた場合のファイルエンコーディング
autocmd({ 'BufReadPost', 'BufNewFile' }, {
  group = augroup('user__open_windows_nt_batch_file', {}),
  pattern = { '*.bat', '*.cmd' },
  callback = function()
    opt_local.fileencoding = 'cp932'
  end,
})

-- 改行時自動コメント挿入無効化
autocmd({ 'BufEnter' }, {
  group = augroup('user__turn_off_auto_comment_insertion', {}),
  callback = function()
    opt_local.formatoptions:remove('c')
    opt_local.formatoptions:remove('r')
    opt_local.formatoptions:remove('o')
  end,
})

-- ターミナルモード
autocmd({ 'TermOpen' }, {
  group = augroup('user__open_terminal', {}),
  callback = function()
    opt_local.number = false
    opt_local.relativenumber = false
    cmd.startinsert()
  end,
})

-- Language Serverアタッチ
autocmd({ 'LspAttach' }, {
  group = augroup('user__lsp_attach', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local default_opts = { buffer = ev.buf }
    local function nmap(lhs, rhs, opts)
      mapper.n(lhs, rhs, vim.tbl_deep_extend('force', default_opts, opts or {}))
    end
    local function imap(lhs, rhs, opts)
      mapper.i(lhs, rhs, vim.tbl_deep_extend('force', default_opts, opts or {}))
    end

    -- ホバー情報
    nmap('K', buf.hover, { desc = '情報のホバー表示' })
    nmap('<C-k>', buf.signature_help, { desc = 'シグネチャを表示' })
    imap('<C-k>', buf.signature_help, { desc = 'シグネチャを表示' })

    -- 宣言ジャンプ
    nmap('gD', buf.declaration, { desc = '宣言へジャンプ' })
    -- 定義ジャンプ
    nmap('gd', buf.definition, { desc = '定義へジャンプ' })
    -- 型定義ジャンプ
    nmap('gtd', buf.type_definition, { desc = '型定義へジャンプ' })
    -- 実装ジャンプ
    nmap('gi', buf.implementation, { desc = '実装へジャンプ' })

    -- フォーマッティング
    nmap('gf', function()
      buf.format({ async = true })
    end, { desc = 'フォーマット' })

    -- コードアクション
    nmap('ga', buf.code_action, { desc = 'コードアクション表示' })
    -- リネーム
    nmap('gn', buf.rename, { desc = 'リネーム' })

    -- 参照
    nmap('gr', buf.references, { desc = '参照表示' })

    -- ワークスペース
    nmap('gwa', buf.add_workspace_folder, { desc = '現在のバッファをワークスペースへ追加' })
    nmap('gwr', buf.remove_workspace_folder, { desc = '現在のバッファをワークスペースから削除' })
    nmap('gwl', function()
      print(vim.inspect(buf.list_workspace_folders()))
    end, { desc = 'ワークスペースリストを表示' })

    local attached_client = lsp.get_client_by_id(ev.data.client_id)
    if attached_client ~= nil then
      if attached_client:supports_method('textDocument/formatting') then
        local tbl = require('lsp.disableformatting')

        -- 保存時フォーマット
        autocmd({ 'BufWritePre' }, {
          group = augroup('user__format_on_save', {}),
          buffer = ev.buf,
          callback = function()
            lsp.buf.format({
              timeout_ms = 3000,
              async = true,
              filter = function(client)
                for _, ls in ipairs(tbl) do
                  if ls == client.name then
                    return true
                  end
                end
                return false
              end,
            })
          end,
        })
      end
    end
  end,
})
