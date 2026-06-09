return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    -- Default config is good, but we'll customize keymaps
    modes = {
      -- Enable flash in operator-pending mode (e.g., d<leader><leader>w)
      char = {
        enabled = true,
        jump_labels = true,
      },
    },
  },
  keys = {
    -- Main flash jump (using gj prefix for "go jump")
    {
      "gjs",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "[S]earch jump",
    },
    -- Treesitter-based jump (smart word/function boundaries)
    {
      "gjt",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "[T]reesitter jump",
    },
    -- Jump to line
    {
      "gjl",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { mode = "search", forward = true },
          label = { after = { 0, 0 } },
          pattern = "^"
        })
      end,
      desc = "Jump to [L]ine",
    },
    -- Word jump
    {
      "gjw",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = [[\<\w]],
          search = { mode = "search" },
        })
      end,
      desc = "Jump to [W]ord",
    },
    -- Search with flash
    {
      "gj/",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = {
            mode = "search",
            max_length = 0,
          },
          label = { after = { 0, 0 } },
          pattern = "^",
        })
      end,
      desc = "Jump via [/]search",
    },
    -- Toggle flash search in command mode
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
