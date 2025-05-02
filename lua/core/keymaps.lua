local keymapper = require('utils.keymapper')

-- リーダーキー
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local M = {
  -- ノーマルモード
  n = {
    -- 行移動
    { 'j', 'gj' },
    { 'k', 'gk' },
    { 'gj', 'j', { remap = true } },
    { 'gk', 'k', { remap = true } },
    -- 文字削除
    { 'x', '"_x', { desc = 'Delete a character at the cursor position (not registered)' } },
    { 'X', 'b"_dw', { desc = 'Delete a word at the cursor position (not registered)' } },
    { 's', '"_s', { desc = 'Substitute a character at the cursor position (not registered)' } },
    { 'S', 'b"_cw', { desc = 'Substitute a word at the cursor position (not registered)' } },
    { 'c', '"_c', { desc = 'Delete {motion} text (not registered) and start insert' } },
    { 'C', '<Nop>' },
    -- ハイライト解除
    { '<Esc><Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Unhighlight' } },
    -- タブ
    { '[t', '<Cmd>tabprevious<CR>', { desc = 'Switch to previous tab' } },
    { ']t', '<Cmd>tabnext<CR>', { desc = 'Switch to next tab' } },
    -- バッファ
    { '[b', '<Cmd>bprevious<CR>', { desc = 'Switch to previous buffer' } },
    { ']b', '<Cmd>bnext<CR>', { desc = 'Switch to next buffer' } },
    -- マクロ
    { 'q', '<Nop>' },
    { 'Q', 'q' },
    -- quickfix
    { '[q', '<Cmd>cprevious<CR>' },
    { ']q', '<Cmd>cnext<CR>' },
  },
  -- ビジュアルモード
  v = {
    -- 行移動
    { 'j', 'gj' },
    { 'k', 'gk' },
    { 'gj', 'j', { remap = true } },
    { 'gk', 'k', { remap = true } },
  },
  -- インサートモード
  i = {},
  -- コマンドラインモード
  c = {},
  -- ターミナルモード
  t = {
    -- Terminal-Job モード
    { '<Esc>', '<C-\\><C-n>', { desc = 'Exit from Terminal-Job mode' } },
  },
}

-- キー設定反映
table.unpack = table.unpack or unpack
for mode, keymaps in pairs(M) do
  for _, keymap in ipairs(keymaps) do
    keymapper[mode .. 'map'](table.unpack(keymap))
  end
end

