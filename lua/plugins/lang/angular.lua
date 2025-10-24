return {
  {
    "Equilibris/nx.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Required by nx.nvim for picker
      "nvim-lua/plenary.nvim",
    },
    opts = {
      nx_cmd_root = "npx nx",
    },
    keys = {
      { "<leader>nx", "<cmd>Telescope nx actions<CR>", desc = "[N]x actions" },
    },
  },
}
