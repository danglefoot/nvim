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

-- File operations
vim.keymap.set("n", "<leader>ff", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>/", function()
  vscode.action("workbench.action.findInFiles")
end, { desc = "Search in Files" })

vim.keymap.set("n", "<leader>o", function()
  vscode.action("workbench.action.showAllEditors")
end, { desc = "Show All Buffers" })

-- LSP actions (use VS Code's LSP)
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
  vscode.action("editor.action.quickFix")
end, { desc = "Code Action" })

vim.keymap.set("n", "<leader>cr", function()
  vscode.action("editor.action.rename")
end, { desc = "Rename Symbol" })

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

-- Buffer/Tab management
vim.keymap.set("n", "<leader>bd", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close Buffer" })

vim.keymap.set("n", "<leader>bo", function()
  vscode.action("workbench.action.closeOtherEditors")
end, { desc = "Close Other Buffers" })

-- Explorer
vim.keymap.set("n", "<leader>e", function()
  vscode.action("workbench.view.explorer")
end, { desc = "Toggle Explorer" })

-- Terminal
vim.keymap.set("n", "<C-/>", function()
  vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Toggle Terminal" })

-- Git
vim.keymap.set("n", "<leader>gg", function()
  vscode.action("workbench.view.scm")
end, { desc = "Source Control" })

-- Comments (if not using a comment plugin)
vim.keymap.set("n", "gcc", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Toggle Comment" })

vim.keymap.set("v", "gc", function()
  vscode.action("editor.action.commentLine")
end, { desc = "Toggle Comment" })
