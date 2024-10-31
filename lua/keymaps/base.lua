--[[
-- keymaps.base
--]]
local keymapper = require('utils.keymapper')

-- リーダーキー
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local M = {
  -- ノーマルモード
  n = {
    -- 行移動
    { 'j',          'gj' },
    { 'k',          'gk' },
    { 'gj',         'j' },
    { 'gk',         'k' },
    -- ハイライト解除
    { '<Esc><Esc>', '<Cmd>nohlsearch<CR>',  { desc = 'Unhighlight' } },
    -- タブ
    { '[t',         '<Cmd>tabprevious<CR>', { desc = 'Switch to previous tab' } },
    { ']t',         '<Cmd>tabnext<CR>',     { desc = 'Switch to next tab' } },
    -- バッファ
    { '[b',         '<Cmd>bprevious<CR>',   { desc = 'Switch to previous buffer' } },
    { ']b',         '<Cmd>bnext<CR>',       { desc = 'Switch to next buffer' } },
    -- マクロ
    { 'q',          '<Nop>' },
    { 'Q',          'q' },
    -- quickfix
    { '[q',         '<Cmd>cprevious<CR>' },
    { ']q',         '<Cmd>cnext<CR>' },
  },
  -- ビジュアルモード
  v = {
    -- 行移動
    { 'j',  'gj' },
    { 'k',  'gk' },
    { 'gj', 'j' },
    { 'gk', 'k' },
  },
  -- インサートモード
  i = {},
  -- コマンドラインモード
  c = {},
  -- ターミナルモード
  t = {
    -- Terminal-Job モード
    { '<Esc>', '<C-\\><C-n>', { desc = 'Exit from Terminal-Job mode'} },
  },
}

-- ---

table.unpack = table.unpack or unpack
for mode, keymaps in pairs(M) do
  for _, keymap in ipairs(keymaps) do
    keymapper[mode .. 'map'](table.unpack(keymap))
  end
end

