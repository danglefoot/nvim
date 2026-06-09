return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 10, total = 80 },
        easing = "linear",
      },
      animate_repeat = {
        delay = 80,
        duration = { step = 5, total = 30 },
        easing = "linear",
      },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = {
      win = {
        style = "terminal",
      },
    },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
      terminal = {
        bo = {
          filetype = "snacks_terminal",
        },
        wo = {
          winblend = 0,
          winhighlight = "Normal:SnacksTerminalNormal,NormalFloat:SnacksTerminalNormal,FloatBorder:SnacksTerminalBorder",
        },
        keys = {
          q = "hide",
        },
      },
    },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart find files",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command [:]history",
    },
    {
      "<leader>sn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "[N]otifications",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    -- find
    {
      "<leader>o",
      function()
        Snacks.picker.buffers({
          win = {
            input = {
              keys = {
                ["dd"] = "bufdelete",
                ["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
              },
            },
            list = { keys = { ["dd"] = "bufdelete" } },
          },
        })
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "[C]onfig file",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "[F]iles",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "[G]it files",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "[P]rojects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "[R]ecent files",
    },
    -- git
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "[B]ranches",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "[L]og",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Log [L]ine",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "[S]tatus",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "[S]tash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "[D]iff (hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Log [F]ile",
    },
    -- Grep
    {
      "<leader>sb",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Search Open [B]uffers",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.lines()
      end,
      desc = "[B]uffer lines",
    },
    {
      "<C-s>",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>st",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Grep [W]ord",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "[R]egisters",
    },
    {
      "<leader>s/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "Search [/]history",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "[A]utocmds",
    },
    {
      "<leader>se",
      function()
        Snacks.picker.pickers()
      end,
      desc = "[E]verywhere (all pickers)",
    },
    {
      "<leader>sf",
      function()
        Snacks.picker.files()
      end,
      desc = "[F]iles",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "[S]ymbols",
    },
    -- Removed duplicate mapping for <leader>sb (already defined at line 175-180)
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "[C]ommand history",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "[C]ommands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "[D]iagnostics",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer [D]iagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "[H]elp pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "[H]ighlights",
    },
    {
      "<leader>si",
      function()
        Snacks.picker.icons()
      end,
      desc = "[I]cons",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "[J]umps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "[K]eymaps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "[L]ocation list",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "[M]arks",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "[M]an pages",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "[P]lugin specs",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "[Q]uickfix list",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "[R]esume last",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "[U]ndo history",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "[C]olorschemes",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto [D]efinition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto [D]eclaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "[R]eferences",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto [I]mplementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto t[Y]pe definition",
    },
    {
      "<leader>cs",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "[S]ymbols (LSP)",
    },
    {
      "<leader>WS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "Workspace [S]ymbols",
    },
    -- Other
    {
      "<leader>uz",
      function()
        Snacks.zen()
      end,
      desc = "[Z]en mode",
    },
    {
      "<leader>uZ",
      function()
        Snacks.zen.zoom()
      end,
      desc = "[Z]oom",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Scratch buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "[S]elect scratch buffer",
    },
    -- Notification history removed - use <leader>sn to search notifications instead
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "[D]elete buffer",
    },
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "[R]ename file",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "[B]rowse (open in browser)",
      mode = { "n", "v" },
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazy[G]it",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss [N]otifications",
    },
    {
      "<c-/>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<c-_>",
      function()
        Snacks.terminal()
      end,
      desc = "which_key_ignore",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    {
      "<leader>N",
      desc = "[N]eovim news",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
