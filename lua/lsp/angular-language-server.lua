local util = require("lspconfig.util")

return {
  cmd = { "ngserver", "--stdio" },
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
  root_markers = { "angular.json", "nx.json", "project.json" },
  root_dir = util.root_pattern("angular.json", "nx.json", "project.json"),
}
