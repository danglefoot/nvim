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
    end,
  },
}
