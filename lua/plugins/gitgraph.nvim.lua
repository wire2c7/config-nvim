local M = {
  'isakbm/gitgraph.nvim',
}

---@type I.GGConfig
M.opts = {
  symbols = {
    merge_commit = 'M',
    commit = '*',
  },
  format = {
    timestamp = '%Y-%m-%d %H:%M:%S',
    fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
  },
  hooks = {
    on_select_commit = function(commit)
      print('selected commit:', commit.hash)
    end,
    on_select_range_commit = function(from, to)
      print('selected range:', from.hash, to.hash)
    end,
  },
}

M.keys = {
  {
    '<leader>gl',
    function()
      require('gitgraph').draw({}, { all = true, max_count = 5000 })
    end,
    desc = 'GitGraph - Draw',
  },
}

return { M }
