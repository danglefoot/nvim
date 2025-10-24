return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = {
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
    },
  },
  config = function()
    require("dap-vscode-js").setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal" },
    })

    local dap = require("dap")

    -- TypeScript/JavaScript debugging configurations
    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        -- ========================================
        -- 1. Debug Angular in Chrome (MOST USED)
        -- ========================================
        {
          type = "pwa-chrome",
          name = "Launch Chrome for Angular (localhost:4200)",
          request = "launch",
          url = "http://localhost:4200",
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}/src",
          skipFiles = {
            "**/node_modules/**/*",
            "**/@vite/*",
            "**/src/client/*",
          },
        },

        -- ========================================
        -- 2. Debug Angular in Edge
        -- ========================================
        {
          type = "pwa-msedge",
          name = "Launch Edge for Angular (localhost:4200)",
          request = "launch",
          url = "http://localhost:4200",
          sourceMaps = true,
          protocol = "inspector",
          port = 9223, -- Different port than Chrome
          webRoot = "${workspaceFolder}/src",
          skipFiles = {
            "**/node_modules/**/*",
            "**/@vite/*",
            "**/src/client/*",
          },
        },

        -- ========================================
        -- 3. Attach to Node.js process with --inspect
        -- ========================================
        {
          type = "pwa-node",
          request = "attach",
          processId = require("dap.utils").pick_process,
          name = "Attach to node --inspect process",
          sourceMaps = true,
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
          cwd = "${workspaceFolder}/src",
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },

        -- ========================================
        -- 4. Launch current JavaScript file (JS only)
        -- ========================================
        language == "javascript" and {
          type = "pwa-node",
          request = "launch",
          name = "Launch current file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        } or nil,
      }
    end
  end,
}
