local M = {}

local api = vim.api

M.group =  api.nvim_create_augroup
M.cmd = api.nvim_create_autocmd

return M
