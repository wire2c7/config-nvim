local cmd = vim.cmd
local user_cmd = vim.api.nvim_create_user_command

-- ターミナルモードカスタム起動
user_cmd('T', function(opts)
  cmd('split')
  cmd('wincmd j')
  cmd('resize 20')

  if opts.args == '' and vim.fn.has('win64') == 1 then
    cmd('terminal "C:\\Program Files\\PowerShell\\7\\pwsh.exe"')
  else
    cmd('terminal ' .. opts.args)
  end
end, { nargs = '*' })
