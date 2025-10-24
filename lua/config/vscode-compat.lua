-- ============================================================================
-- VS Code Compatibility Helpers
-- ============================================================================
-- Determines which plugins should be enabled/disabled when running in VS Code
-- ============================================================================

local M = {}

-- Plugins that should ONLY run in standard Neovim (disabled in VS Code)
M.neovim_only_plugins = {
  -- UI/Visual
  "gruvbox-material",
  "forest-night.nvim",
  "base16-nvim",
  "catppuccin",
  "noice.nvim",
  "snacks.nvim",
  "which-key.nvim",
  "dressing.nvim",

  -- LSP/Completion (VS Code handles these)
  "nvim-lspconfig",
  "blink.cmp",
  "mason.nvim",
  "mason-lspconfig.nvim",
  "easy-dotnet.nvim",

  -- File navigation/Pickers (VS Code handles these)
  "nx.nvim",
  "telescope.nvim",

  -- Syntax/Treesitter (VS Code handles highlighting)
  "nvim-treesitter",
  "nvim-ts-autotag",
  "rainbow-delimiters.nvim",

  -- Debugging (VS Code has built-in debugger)
  "nvim-dap",
  "nvim-dap-ui",
  "nvim-dap-vscode-js",
  "vscode-js-debug",

  -- Formatting/Linting (use VS Code extensions instead)
  "conform.nvim",
  "nvim-lint",

  -- Git (VS Code has built-in Git)
  "gitsigns.nvim",

  -- Terminal (use VS Code terminal)
  -- Note: snacks.nvim already disabled above

  -- Window management
  "vim-tmux-navigator",

  -- Status line (VS Code has its own)
  "lualine.nvim",
  "bufferline.nvim",

  -- File explorers (VS Code has built-in explorer)
  "neo-tree.nvim",
  "oil.nvim",

  -- Other UI enhancements
  "indent-blankline.nvim",
  "nvim-colorizer.lua",
  "todo-comments.nvim",
}

-- Plugins that SHOULD run in VS Code (enhance Vim editing)
M.vscode_compatible_plugins = {
  -- Text objects and motions
  "flash.nvim",              -- Enhanced navigation
  "nvim-surround",           -- Surround text objects
  "vim-repeat",              -- Repeat plugin commands with .
  "Comment.nvim",            -- Smart commenting

  -- Editing enhancements
  "mini.ai",                 -- Additional text objects (a/i)
  "mini.pairs",              -- Auto pairs

  -- Useful utilities
  "plenary.nvim",            -- Lua utility functions (dependency)
}

-- Check if a plugin should be enabled
function M.should_enable(plugin_name)
  if not vim.g.vscode then
    -- Standard Neovim: enable everything
    return true
  end

  -- VS Code: only enable compatible plugins
  for _, name in ipairs(M.vscode_compatible_plugins) do
    if plugin_name:find(name, 1, true) then
      return true
    end
  end

  return false
end

-- Get the condition function for lazy.nvim
function M.get_cond()
  return function()
    return not vim.g.vscode
  end
end

-- Get the enabled flag for lazy.nvim
function M.is_not_vscode()
  return not vim.g.vscode
end

return M
