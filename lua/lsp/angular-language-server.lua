return {
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    vim.fn.getcwd() .. "/node_modules",
    "--ngProbeLocations",
    vim.fn.getcwd() .. "/node_modules"
  },
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
  root_markers = { "angular.json", "nx.json", "project.json" },
  root_dir = function(fname)
    return vim.fs.root(fname, { "angular.json", "nx.json", "project.json" })
  end,
}
