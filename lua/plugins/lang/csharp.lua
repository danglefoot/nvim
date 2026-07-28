return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "cs", "csproj", "sln", "props" }, -- Load on C# files
    config = function()
      local dotnet = require("easy-dotnet")

      dotnet.setup({
        auto_bootstrap_namespace = true,
        picker = "snacks", -- Use Snacks picker instead of Telescope
        lsp = {
          enabled = true, -- Enable builtin roslyn lsp
          roslynator_enabled = true, -- Enable roslynator analyzer
          config = {
            settings = {
              -- Allow go-to-definition into decompiled sources for types
              -- from NuGet/framework assemblies (not just loaded projects)
              ["csharp|navigation"] = {
                dotnet_navigate_to_decompiled_sources = true,
              },
              ["csharp|symbol_search"] = {
                dotnet_search_reference_assemblies = true,
              },
            },
          },
        },
      })

      -- ========================================
      -- C# / .NET Keymaps
      -- ========================================
      -- <leader>n prefix = [N]ET/Dotnet commands

      vim.keymap.set("n", "<leader>nb", dotnet.build_default_quickfix, {
        desc = "[B]uild"
      })

      vim.keymap.set("n", "<leader>nt", dotnet.test_default, {
        desc = "[T]est"
      })

      vim.keymap.set("n", "<leader>nT", "<cmd>Dotnet testrunner<cr>", {
        desc = "[T]est runner UI"
      })

      vim.keymap.set("n", "<leader>nr", dotnet.run_default, {
        desc = "[R]un"
      })

      vim.keymap.set("n", "<leader>ns", dotnet.secrets, {
        desc = "[S]ecrets"
      })

      vim.keymap.set("n", "<leader>nR", dotnet.restore, {
        desc = "[R]estore"
      })

      vim.keymap.set("n", "<leader>nc", dotnet.clean, {
        desc = "[C]lean"
      })

      -- Notify when Roslyn finishes loading the solution (navigation ready).
      -- The plugin records workspace/projectInitializationComplete in
      -- solution_state but surfaces nothing, so poll that until it's stamped.
      local solution_watched = {}
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("RoslynSolutionLoaded", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client or client.name ~= "easy_dotnet" or solution_watched[client.id] then
            return
          end
          solution_watched[client.id] = true
          local start = vim.uv.now()
          local timer = vim.uv.new_timer()
          timer:start(1000, 1000, vim.schedule_wrap(function()
            if not vim.lsp.get_client_by_id(client.id) then
              timer:stop()
              timer:close()
              solution_watched[client.id] = nil
              return
            end
            local ok, roslyn = pcall(require, "easy-dotnet.roslyn.lsp")
            local state = ok and roslyn.solution_state[client.id]
            if state and state.loaded_at then
              timer:stop()
              timer:close()
              local secs = math.floor((vim.uv.now() - start) / 1000)
              vim.notify(("Roslyn: solution loaded in %ds — navigation ready"):format(secs), vim.log.levels.INFO)
            end
          end))
        end,
      })
    end,
  },
}
