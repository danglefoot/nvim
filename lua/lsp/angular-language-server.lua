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
  handlers = {
    -- Filter out duplicate TypeScript diagnostics from Angular LS
    -- Keep Angular-specific diagnostics (templates, decorators, etc.)
    ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      if result and result.diagnostics then
        -- Filter diagnostics: keep only Angular-specific ones in TypeScript files
        local filtered = {}
        for _, diagnostic in ipairs(result.diagnostics) do
          local source = diagnostic.source or ""
          local message = diagnostic.message or ""

          -- Keep all diagnostics in HTML files (Angular templates)
          local uri = result.uri
          if uri:match("%.html$") then
            table.insert(filtered, diagnostic)
          -- In TypeScript files, only keep Angular-specific diagnostics
          elseif source:match("^ng") or source:match("angular") or
                 message:match("@Component") or message:match("@Injectable") or
                 message:match("template") or message:match("selector") then
            table.insert(filtered, diagnostic)
          end
          -- Otherwise skip (let vtsls handle general TypeScript diagnostics)
        end
        result.diagnostics = filtered
      end
      vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
    end,
  },
}
