local cmd = vim.cmd
local user_cmd = vim.api.nvim_create_user_command

-- ターミナルモードカスタム起動
user_cmd('T', function(opts)
  cmd('split')
  cmd('wincmd j')
  cmd('resize 20')

  cmd('terminal ' .. opts.args)
end, { nargs = '*' })
