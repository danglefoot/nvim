-- ============================================================================
-- Neovim Configuration Entry Point
-- ============================================================================
-- Detects if running in VS Code and loads appropriate configuration
-- ============================================================================

if vim.g.vscode then
  -- ========================================
  -- VS Code Neovim Extension
  -- ========================================
  -- Only load minimal config for VS Code integration
  -- VS Code handles: LSP, completion, UI, colorscheme, file navigation
  -- Neovim handles: motions, keymaps, text objects, editing enhancements

  require("config.options")       -- Basic Vim options (most work in VS Code)
  require("vscode-integration")  -- VS Code specific keymaps and integration
else
  -- ========================================
  -- Standard Neovim
  -- ========================================
  -- Full configuration with all plugins and features

  require("core.mason-path")
  require("core.lsp")
  require("config.options")
  require("config.keymaps")
  require("config.autocmds")
  require("config.mason-verify")
  require("config.health-check")
  require("core.lazy")
end
