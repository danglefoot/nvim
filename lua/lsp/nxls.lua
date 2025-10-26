return {
  cmd = { "nxls", "--stdio" },
  filetypes = { "json" },
  root_markers = { "nx.json" },
  root_dir = function(fname)
    return vim.fs.root(fname, { "nx.json" })
  end,
}
