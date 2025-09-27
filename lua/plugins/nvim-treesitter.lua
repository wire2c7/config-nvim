local M = {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('user__vim_treesitter_start', {}),
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end
}

return { M }
