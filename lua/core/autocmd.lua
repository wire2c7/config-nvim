local au = require('utils.autocmd')
local cmd = vim.cmd

local augroup = au.group
local autocmd = au.cmd

local opt_local = vim.opt_local

-- 
local group_vimrc = augroup('vimrc', {})
autocmd({ 'BufReadPost', 'BufNewFile' }, {
  group = group_vimrc,
  pattern = { '*.bat' },
  callback = function()

    opt_local.fileencoding = 'cp932'

  end,
})

-- 改行時自動コメント挿入
local group_off_auto_comment_insertion = augroup('off_auto_comment_insertion', {})
autocmd({ 'BufEnter' }, {
  group = group_off_auto_comment_insertion,
  callback = function()

    opt_local.formatoptions:remove('c')
    opt_local.formatoptions:remove('r')
    opt_local.formatoptions:remove('o')

  end,
})

-- ターミナルモード
local group_termopen = augroup('termopen', {})
autocmd({ 'TermOpen' }, {
  group = group_termopen,
  callback = function()

    opt_local.number = false
    opt_local.relativenumber = false
    cmd.startinsert()

  end,
})

