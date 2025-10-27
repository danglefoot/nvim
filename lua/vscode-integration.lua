-- ============================================================================
-- VS Code Neovim Integration
-- ============================================================================
-- This file contains settings specifically for when Neovim is running
-- inside VS Code via the vscode-neovim extension.
--
-- When vim.g.vscode exists, most plugins are disabled (handled in lazy.nvim)
-- but keymaps and basic Vim settings still apply.
-- ============================================================================

-- Load core keymaps that work in VS Code
-- (editing, movement, text objects - things that enhance Vim behavior)
require("config.keymaps")

-- VS Code specific keymaps using VS Code commands
local vscode = require("vscode-neovim")

-- ============================================================================
-- Window Navigation
-- ============================================================================
vim.keymap.set("n", "<C-h>", function()
  vscode.action("workbench.action.navigateLeft")
end, { desc = "Navigate Left" })

vim.keymap.set("n", "<C-l>", function()
  vscode.action("workbench.action.navigateRight")
end, { desc = "Navigate Right" })

vim.keymap.set("n", "<C-k>", function()
  vscode.action("workbench.action.navigateUp")
end, { desc = "Navigate Up" })

vim.keymap.set("n", "<C-j>", function()
  vscode.action("workbench.action.navigateDown")
end, { desc = "Navigate Down" })

-- ============================================================================
-- Window Splits
-- ============================================================================
vim.keymap.set("n", "<leader>sv", function()
  vscode.action("workbench.action.splitEditor")
end, { desc = "Split Vertical" })

vim.keymap.set("n", "<leader>sh", function()
  vscode.action("workbench.action.splitEditorDown")
end, { desc = "Split Horizontal" })

-- ============================================================================
-- File Operations
-- ============================================================================
vim.keymap.set("n", "<leader><space>", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>o", function()
  vscode.action("workbench.action.showAllEditors")
end, { desc = "Show All Buffers" })

vim.keymap.set("n", "<leader>/", function()
  vscode.action("workbench.action.findInFiles")
end, { desc = "Search in Files" })

-- ============================================================================
-- LSP Actions (use VS Code's LSP)
-- ============================================================================
vim.keymap.set("n", "gd", function()
  vscode.action("editor.action.revealDefinition")
end, { desc = "Go to Definition" })

vim.keymap.set("n", "gr", function()
  vscode.action("editor.action.goToReferences")
end, { desc = "Go to References" })

vim.keymap.set("n", "gI", function()
  vscode.action("editor.action.goToImplementation")
end, { desc = "Go to Implementation" })

vim.keymap.set("n", "<leader>ca", function()
  vscode.action("editor.action.codeAction")
end, { desc = "Code Action" })

vim.keymap.set("n", "<leader>cr", function()
  vscode.action("editor.action.rename")
end, { desc = "Rename Symbol" })

vim.keymap.set("n", "<leader>cs", function()
  vscode.action("workbench.action.gotoSymbol")
end, { desc = "Go to Symbol (Outline)" })

vim.keymap.set("n", "<leader>cf", function()
  vscode.action("editor.action.formatDocument")
end, { desc = "Format Document" })

-- Diagnostics
vim.keymap.set("n", "]d", function()
  vscode.action("editor.action.marker.next")
end, { desc = "Next Diagnostic" })

vim.keymap.set("n", "[d", function()
  vscode.action("editor.action.marker.prev")
end, { desc = "Previous Diagnostic" })

-- ============================================================================
-- Buffer/Tab Management
-- ============================================================================
vim.keymap.set("n", "<leader>bd", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close Buffer" })

vim.keymap.set("n", "<leader>bo", function()
  vscode.action("workbench.action.closeOtherEditors")
end, { desc = "Close Other Buffers" })

-- ============================================================================
-- Explorer
-- ============================================================================
vim.keymap.set("n", "<leader>e", function()
  vscode.action("workbench.action.toggleSidebarVisibility")
  vscode.action("workbench.files.action.focusFilesExplorer")
end, { desc = "Toggle Explorer" })

-- ============================================================================
-- Terminal
-- ============================================================================
vim.keymap.set("n", "<C-/>", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Toggle Terminal" })

-- ============================================================================
-- Git
-- ============================================================================
vim.keymap.set("n", "<leader>gg", function()
  vscode.action("workbench.view.scm")
  vscode.action("workbench.scm.focus")
end, { desc = "Source Control" })

-- ============================================================================
-- Debug
-- ============================================================================
vim.keymap.set("n", "<leader>da", function()
  vscode.action("workbench.action.debug.selectandstart")
end, { desc = "[D]ebug: Select [A]nd Start" })

vim.keymap.set("n", "<leader>dc", function()
  vscode.action("workbench.action.debug.continue")
end, { desc = "[D]ebug: [C]ontinue" })

vim.keymap.set("n", "<leader>dt", function()
  vscode.action("workbench.action.debug.stop")
end, { desc = "[D]ebug: S[t]op" })

vim.keymap.set("n", "<leader>do", function()
  vscode.action("workbench.action.debug.stepOver")
end, { desc = "[D]ebug: Step [O]ver" })

vim.keymap.set("n", "<leader>db", function()
  vscode.action("editor.debug.action.toggleBreakpoint")
end, { desc = "[D]ebug: Toggle [B]reakpoint" })

vim.keymap.set("n", "<leader>de", function()
  vscode.action("editor.debug.action.showDebugHover")
end, { desc = "[D]ebug: Show [E]xpression" })

-- ============================================================================
-- Comments (if not using a comment plugin)
-- ============================================================================
vim.keymap.set("n", "gcc", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Toggle Comment" })

vim.keymap.set("v", "gc", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Toggle Comment" })
