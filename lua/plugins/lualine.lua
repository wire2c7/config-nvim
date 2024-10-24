local opts = {
  options = {
    theme = 'onedark',
  },
}

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = opts,
  },
}