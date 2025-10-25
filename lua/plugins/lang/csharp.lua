return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local dotnet = require("easy-dotnet")

      dotnet.setup({
        auto_bootstrap_namespace = true,
        picker = "snacks", -- Use Snacks picker instead of Telescope
      })

      -- ========================================
      -- C# / .NET Keymaps
      -- ========================================
      -- <leader>D prefix = [D]otnet commands (uppercase D)

      vim.keymap.set("n", "<leader>Db", dotnet.build_default_quickfix, {
        desc = "[D]otnet [B]uild"
      })

      vim.keymap.set("n", "<leader>Dt", dotnet.test_default, {
        desc = "[D]otnet [T]est"
      })

      vim.keymap.set("n", "<leader>Dr", dotnet.run_default, {
        desc = "[D]otnet [R]un"
      })

      vim.keymap.set("n", "<leader>Ds", dotnet.secrets, {
        desc = "[D]otnet [S]ecrets"
      })

      vim.keymap.set("n", "<leader>DR", dotnet.restore, {
        desc = "[D]otnet [R]estore"
      })

      vim.keymap.set("n", "<leader>Dc", dotnet.clean, {
        desc = "[D]otnet [C]lean"
      })
    end,
  },
}
