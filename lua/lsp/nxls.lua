local util = require("lspconfig.util")

return {
  cmd = { "nxls", "--stdio" },
  filetypes = { "json" },
  root_markers = { "nx.json" },
  root_dir = util.root_pattern("nx.json"),
}
