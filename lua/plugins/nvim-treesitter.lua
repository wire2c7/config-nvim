local M = {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event = { 'BufNewFile', 'BufReadPre' },
  build = ':TSUpdate',
  lazy = false,
}

local languages = {
  'bash',
  'c_sharp',
  'c',
  'comment',
  'cpp',
  'css',
  'csv',
  'desktop',
  'dockerfile',
  'editorconfig',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
  'html',
  'javascript',
  'jq',
  'jsdoc',
  'json',
  'jsonc',
  'lua',
  'luadoc',
  'markdown_inline',
  'markdown',
  'powershell',
  'regex',
  'rust',
  'ssh_config',
  'toml',
  'tsv',
  'tsx',
  'typescript',
  'xml',
  'yaml',
  'zig',
}

function M.config()
  local nvim_treesitter = require('nvim-treesitter')
  nvim_treesitter.setup({})
  nvim_treesitter.install(languages)

  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('user__vim_treesitter_start', {}),
    callback = function()
      pcall(vim.treesitter.start)

      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end,
  })
end

return { M }
