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
        { "<leader>a", group = "Angular" },
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Debug" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>gh", group = "Git Hunk" },
        { "<leader>i", group = "AI" },
        { "<leader>l", group = "List" },
        { "<leader>m", group = "Bookmarks" },
        { "<leader>mm", desc = "Open menu" },
        { "<leader>mB", desc = "Buffer line marks" },
        { "<leader>n", group = ".NET" },
        { "<leader>O", group = "Obsidian" },
        { "<leader>R", group = "Replace" },
        { "<leader>s", group = "Search" },
        { "<leader>u", group = "UI/Toggle" },
        { "<leader>W", group = "Workspace" },
        { "<leader>x", group = "Diagnostics" },
        { "<leader>y", group = "Yank/Copy" },

        -- Navigation groups
        { "[",         group = "Previous" },
        { "]",         group = "Next" },
        { "g",         group = "Goto" },
        { "gj",        group = "Jump" },
        { "s",         group = "Surround", mode = { "x" } },
        { "z",         group = "Fold" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        Snacks.win({
          file = vim.fn.stdpath("config") .. "/KEYMAPS.md",
          width = 0.85,
          height = 0.9,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "no",
            statuscolumn = " ",
            conceallevel = 2,
          },
        })
      end,
      desc = "Keymap cheat sheet",
    },
    {
      "<leader>sK",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "[K]eymaps (buffer-local)",
    },
  },
}
