
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
