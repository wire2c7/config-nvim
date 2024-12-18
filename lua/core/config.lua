--[[
-- core
--]]

local g = vim.g
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

local o = vim.opt

o.helplang = { 'ja', 'en' }
o.history = 512

o.formatoptions:append({
  r = false,
  o = false,
  m = true,
  M = true,
  j = true
})
o.nrformats = {
  'hex',
  'bin',
  'unsigned'
}

-- ファイル
o.autoread = true
o.backup = false
o.swapfile = false

-- クリップボード
--o.clipboard = {
--  'unnamedplus',
--  'unnamed'
--}

-- バッファ
o.hidden = true

-- 表示
o.laststatus = 3
o.list = true
o.listchars = {
  eol = '↵', -- リターン
  tab = '|=>', -- Tab
  trail = '･', -- 行末スペース
  extends = '»',
  precedes = '«',
  nbsp = '%'
}
o.number = true
o.relativenumber = true
o.scrolloff = 5
o.shortmess:append({
  a = true,
  s = true,
  I = true,
  c = true
})
o.showcmd = true
o.showmatch = true
o.showmode = true
o.showtabline = 2
o.splitbelow = true
o.splitright = true
o.syntax = 'on'
o.title = true
o.visualbell = true

if vim.fn.has('termguicolors') == 1 then
  o.termguicolors = true
end

o.pumblend = 20
o.winblend = 20

-- カーソル
o.cursorline = true
o.ruler = true
o.signcolumn = 'yes'
o.virtualedit = 'onemore'

-- コマンドライン
o.wildmenu = true

-- 文字列検索
o.hlsearch = true
o.ignorecase = true
o.includeexpr = string.gsub(vim.v.fname, '^\\/', '')
o.incsearch = true
o.smartcase = true
o.wrapscan = true

-- 入力
o.backspace = {
  'indent',
  'eol',
  'start'
}
o.completeopt:append({
  'menuone',
  'noinsert'
})
o.ttimeoutlen = 100
o.whichwrap:append({
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true
})

-- タブ
o.expandtab = true
o.shiftwidth = 2
o.smarttab = true
o.tabstop = 2

-- インデント
o.autoindent = true
o.smartindent = true

