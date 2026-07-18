return {
  "otavioschwanck/arrow.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    show_icons = true,
    leader_key = "<leader>mm", -- open the bookmark menu
    buffer_leader_key = "<leader>mB", -- per-buffer line bookmarks (kept off native `m`)
    window = { border = "rounded" },
  },
  keys = {
    { "<leader>mt", function() require("arrow.persist").toggle() end, desc = "[T]oggle bookmark (current file)" },
    { "]m", function() require("arrow.persist").next() end, desc = "Next book[M]ark" },
    { "[m", function() require("arrow.persist").previous() end, desc = "Previous book[M]ark" },
  },
}
