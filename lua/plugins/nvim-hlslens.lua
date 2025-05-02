local M = {
  'kevinhwang91/nvim-hlslens',
  config = function()
    require('hlslens').setup()

    local h = require('utils.keymapper')
    local nmap = h.nmap
    local cmd_str_start = [[<Cmd>lua require('hlslens').start()<CR>]]

    nmap('n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR>]] .. cmd_str_start)
    nmap('N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR>]] .. cmd_str_start)

    nmap('*', '*' .. cmd_str_start)
    nmap('#', '#' .. cmd_str_start)
    nmap('g*', 'g*' .. cmd_str_start)
    nmap('g#', 'g#' .. cmd_str_start)

    nmap('<Leader>l', '<Cmd>noh<CR>')
  end,
}

return { M }
