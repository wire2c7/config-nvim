local config_opts = {
  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
  sync_install = false,
  auto_install = true,
  ignore_install = { 'javascript' },
  highlight = {
    enable = true,
    disable = { 'c', 'rust' },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup(config_opts)
    end,
  }
}
