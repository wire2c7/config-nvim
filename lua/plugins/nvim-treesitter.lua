local M = {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event = { 'BufNewFile', 'BufReadPre' },
  config = function()
    require('nvim-treesitter').setup({})

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('user__vim_treesitter_start', {}),
      callback = function()
        pcall(vim.treesitter.start)

        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
      end,
    })
  end,
}

return { M }
