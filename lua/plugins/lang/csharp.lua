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
      -- <leader>d prefix = [D]otnet commands

      vim.keymap.set("n", "<leader>db", dotnet.build_default_quickfix, {
        desc = "[D]otnet [B]uild"
      })

      vim.keymap.set("n", "<leader>dt", dotnet.test_default, {
        desc = "[D]otnet [T]est"
      })

      vim.keymap.set("n", "<leader>dr", dotnet.run_default, {
        desc = "[D]otnet [R]un"
      })

      vim.keymap.set("n", "<leader>ds", dotnet.secrets, {
        desc = "[D]otnet [S]ecrets"
      })

      vim.keymap.set("n", "<leader>dR", dotnet.restore, {
        desc = "[D]otnet [R]estore"
      })

      vim.keymap.set("n", "<leader>dc", dotnet.clean, {
        desc = "[D]otnet [C]lean"
      })
    end,
  },
}
