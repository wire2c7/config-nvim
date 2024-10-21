local api = vim.api
local cmd = vim.cmd

local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

local opt_local = vim.opt_local

-- 
local group_init = augroup('init', {})
autocmd({ 'BufReadPost', 'BufNewFile' }, {
  group = group_init,
  pattern = { '*.bat' },
  callback = function()

    opt_local.fileencoding = 'cp932'

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

