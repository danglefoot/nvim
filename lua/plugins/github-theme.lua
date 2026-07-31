return {
  -- GitHub's official themes ported to Neovim, following macOS appearance the
  -- same way Ghostty does. `github_light_high_contrast` / `github_dark_dimmed`
  -- match Ghostty's "GitHub Light High Contrast" and "GitHub Dark Dimmed".
  --
  -- NOTE: we intentionally do NOT use auto-dark-mode.nvim here. It detects the
  -- system appearance via `defaults read -g AppleInterfaceStyle`, which reads a
  -- cached plist that can lag the live GUI appearance (it kept reporting "Dark"
  -- while macOS was actually Light). AppleScript's `appearance preferences`
  -- reflects the current state reliably, so we poll that directly.
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        -- Paint the theme's own backgrounds. The GitHub light/dark palettes are
        -- designed against their real bg (#ffffff / #0d1117); transparency makes
        -- the light variant look washed out against the terminal background.
        transparent = false,
      },
    },
    config = function(_, opts)
      require("github-theme").setup(opts)

      local applied -- "light" | "dark", avoids redundant :colorscheme calls

      local function apply(is_dark)
        local want = is_dark and "dark" or "light"
        if want == applied then
          return
        end
        applied = want
        vim.o.background = want
        vim.cmd.colorscheme(is_dark and "github_dark_dimmed" or "github_light_high_contrast")
      end

      local function sync()
        vim.system(
          {
            "osascript",
            "-e",
            'tell application "System Events" to tell appearance preferences to get dark mode',
          },
          { text = true },
          vim.schedule_wrap(function(res)
            local out = (res.stdout or ""):gsub("%s+", "")
            if out == "true" then
              apply(true)
            elseif out == "false" then
              apply(false)
            end
            -- any other output (e.g. osascript error) leaves the theme as-is
          end)
        )
      end

      sync() -- apply on startup

      -- Re-check when returning to Neovim and on a light interval, so toggling
      -- macOS appearance updates nvim without a restart.
      vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, { callback = sync })
      local timer = vim.uv.new_timer()
      timer:start(3000, 3000, vim.schedule_wrap(sync))
    end,
  },
}
