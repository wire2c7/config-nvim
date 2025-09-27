---@alias modes 'n'|'v'|'i'|'c'|'o'|'t'
---@alias mapper fun(lhs: string, rhs: string|function, opts?: vim.keymap.set.Opts)

---@ type modes[]
local modes = {
  'n', -- Normal
  'v', -- Visual
  'i', -- Insert
  'c', -- Cmdline
  'o', -- Operator-pending
  't', -- Terminal
}

---@type { [modes]: mapper }
local M = {}

local default_opts = { silent = true }

---@param mode modes
---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
local function set(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_deep_extend('force', default_opts, opts or {}))
end

for _, mode in pairs(modes) do
  ---@type mapper
  M[mode] = function(lhs, rhs, opts)
    set(mode, lhs, rhs, opts)
  end
end

return M
