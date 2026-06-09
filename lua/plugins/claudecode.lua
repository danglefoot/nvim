return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal_cmd = "~/.local/bin/claude",
    },
    config = true,
    keys = {
      { "<leader>ic", "<cmd>ClaudeCode<cr>",            desc = "[T]oggle Claude" },
      { "<leader>if", "<cmd>ClaudeCodeFocus<cr>",       desc = "[F]ocus Claude" },
      { "<leader>ir", "<cmd>ClaudeCode --resume<cr>",   desc = "[R]esume Claude" },
      { "<leader>iC", "<cmd>ClaudeCode --continue<cr>", desc = "[C]ontinue Claude" },
      { "<leader>im", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select [M]odel" },
      { "<leader>ib", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add [B]uffer" },
      { "<leader>is", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                desc = "[S]end to Claude" },
      {
        "<leader>is",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      { "<leader>ia", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "[A]ccept diff" },
      { "<leader>id", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "[D]eny diff" },
    },
  },
}
