local function set_keymaps()
  local h = require('utils.keymap_helper')
  local nmap = h.nmap
  local cmd_str_start = [[<Cmd>lua require('hlslens').start()<CR>]]

  nmap('n', [[<Cmd>execute('nonaml! ' . v:count 1 . 'n')<CR>]] .. cmd_str_start)
  nmap('N', [[<Cmd>execute('nonaml! ' . v:count 1 . 'N')<CR>]] .. cmd_str_start)

  nmap('*', '*' .. cmd_str_start)
  nmap('#', '#' .. cmd_str_start)
  nmap('g*', 'g*' .. cmd_str_start)
  nmap('g#', 'g#' .. cmd_str_start)

  nmap('<Leader>l', '<Cmd>noh<CR>')
end

return {
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
      set_keymaps()
    end,
  },
}
