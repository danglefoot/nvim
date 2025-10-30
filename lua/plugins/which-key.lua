return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 300,
    icons = {
      rules = false,
      breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
      separator = "󱦰  ", -- symbol used between a key and it's label
      group = "󰹍 ", -- symbol prepended to a group
    },
    plugins = {
      spelling = {
        enabled = false,
      },
    },
    win = {
      height = {
        max = math.huge,
      },
    },
    spec = {
      {
        mode = { "n", "v" },
        -- Main groups (organized alphabetically for clarity)
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Debug" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>G", group = "Git Actions" },
        { "<leader>l", group = "LSP" },
        { "<leader>n", group = ".NET" },
        { "<leader>R", group = "Replace" },
        { "<leader>s", group = "Search" },
        { "<leader>u", group = "UI/Toggle" },
        { "<leader>w", group = "Window" },
        { "<leader>W", group = "Workspace" },
        { "<leader>x", group = "Diagnostics" },

        -- Navigation groups
        { "[",         group = "Previous" },
        { "]",         group = "Next" },
        { "g",         group = "Goto" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
