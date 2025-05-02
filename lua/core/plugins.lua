local fn = vim.fn
local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup('plugins', {
  performance = {
    cache = {
      enabled = true,
    },
  },
})
