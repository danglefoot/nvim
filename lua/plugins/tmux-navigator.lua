return {
  "christoomey/vim-tmux-navigator",
  enabled = vim.fn.has("win32") == 0, -- Only enable on non-Windows (macOS/Linux)
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left (Tmux-aware)" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down (Tmux-aware)" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up (Tmux-aware)" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right (Tmux-aware)" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous (Tmux-aware)" },
  },
}
