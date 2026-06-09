return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        disable_inline_completion = false, -- Enable ghost text suggestions
        keymaps = {
          accept_suggestion = "<Tab>",     -- Accept full suggestion
          clear_suggestion = "<C-e>",      -- Dismiss/clear suggestion
          accept_word = "<M-f>",           -- Accept next word only
        },
        color = {
          suggestion_color = "#8aabd4",    -- Pale blue-gray to distinguish from comments
          cterm = 110,                     -- Terminal color code (blue-gray)
        },
      })

      -- Toggle Supermaven on/off
      vim.keymap.set("n", "<leader>ua", function()
        require("supermaven-nvim.api").toggle()
      end, { desc = "Toggle [A]I" })
    end,
  },
}
