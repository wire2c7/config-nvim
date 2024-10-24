local M = {}

local modes = {
  'n', -- Normal
  'v', -- Visual
  'i', -- Insert
  'c', -- Cmdline
  'o', -- Operator-pending
  't', -- Terminal
}

local default_opts = { silent = true }

local function set(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts or default_opts)
end

for _, mode in pairs(modes) do
  M[mode .. 'map'] = function(lhs, rhs, opts)
    set(mode, lhs, rhs, opts)
  end
end

M['map'] = set

return M
