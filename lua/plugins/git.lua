return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- local icons = require('config.icons')
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        status_formatter = nil,
        update_debounce = 200,
        max_file_length = 40000,
        preview_config = {
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        -- yadm = { enable = false },

        on_attach = function(bufnr)
          -- Use ]h and [h for git hunks (standard convention)
          vim.keymap.set("n", "]h", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Next git hunk" })
          vim.keymap.set("n", "[h", require("gitsigns").prev_hunk, { buffer = bufnr, desc = "Previous git hunk" })
        end,
      })
    end,
    keys = {
      -- Hunk operations (using ]h and [h for next/prev, see on_attach above)
      {
        "<leader>ghp",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "[P]review hunk",
      },
      {
        "<leader>ghs",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "[S]tage hunk",
      },
      {
        "<leader>ghu",
        function()
          require("gitsigns").undo_stage_hunk()
        end,
        desc = "[U]ndo stage hunk",
      },
      {
        "<leader>ghr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "[R]eset hunk",
      },
      -- Buffer/Blame operations
      {
        "<leader>ghb",
        function()
          require("gitsigns").blame_line()
        end,
        desc = "[B]lame line",
      },
      {
        "<leader>gR",
        function()
          require("gitsigns").reset_buffer()
        end,
        desc = "[R]eset buffer",
      },
      -- Diff operations
      {
        "<leader>gD",
        function()
          vim.cmd("Gitsigns diffthis HEAD")
        end,
        desc = "[D]iff HEAD",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- not git, but it's okay
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>uu",
        ":UndotreeToggle<CR>",
        desc = "[U]ndoTree",
      },
    },
  },
}
