local opts = { noremap = true, silent = true }

-- ============================================================================
-- EDITING & MOVEMENT
-- ============================================================================

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Redo with U (more convenient than Ctrl+r)
vim.keymap.set("n", "U", "<C-r>", opts)

-- Move selected line / block of text in visual mode (VSCode-like)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Remap for dealing with visual line wraps
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better indenting (stay in visual mode)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Delete to void register (black hole) - doesn't affect clipboard
-- Note: For paste-over-without-losing-yank, use yanky cycling (p then <c-p>)
vim.keymap.set({ "n", "v" }, "<leader>D", '"_d', { desc = "Delete to void (keep clipboard)" })

-- Copy everything between { and } including the brackets
vim.keymap.set("n", "YY", "va{Vy", opts)

-- Move to start/end of line (H=Home, L=Last)
vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- ============================================================================
-- BUFFER & NAVIGATION
-- ============================================================================

-- Navigate buffers with arrow keys
vim.keymap.set("n", "<Right>", ":bnext<CR>", opts)
vim.keymap.set("n", "<Left>", ":bprevious<CR>", opts)

-- Close all other buffers (keep current)
vim.keymap.set("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      pcall(vim.api.nvim_buf_delete, buf, { force = false })
    end
  end
end, { desc = "[B]uffer [O]nly (close others)" })

-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================

-- Fast quitting
vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- ============================================================================
-- GIT COMMANDS
-- ============================================================================

-- Git commit (using Lazygit for better UX)
vim.keymap.set("n", "<leader>gc", function()
  require("snacks").lazygit({ args = { "commit" } })
end, { desc = "Git Commit" })

-- Git push
vim.keymap.set("n", "<leader>gp", function()
  require("snacks").lazygit({ args = { "push" } })
end, { desc = "Git Push" })

-- ============================================================================
-- WINDOW/PANE MANAGEMENT
-- ============================================================================
-- Use native Ctrl-w commands: <C-w>v (vsplit), <C-w>s (split), <C-w>c (close), etc.

-- Navigate splits with Ctrl+hjkl (handled by vim-tmux-navigator plugin on macOS/Linux)
-- Fallback for Windows where tmux-navigator is disabled
if vim.fn.has("win32") == 1 then
  vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
  vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
  vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
  vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })
end

-- Resize panes
vim.keymap.set("n", "+", ":vertical resize +5<CR>", opts)
vim.keymap.set("n", "_", ":vertical resize -5<CR>", opts)
vim.keymap.set("n", "=", ":resize +5<CR>", opts)
vim.keymap.set("n", "-", ":resize -5<CR>", opts)

-- ============================================================================
-- SEARCH & NAVIGATION
-- ============================================================================

-- Center cursor after search navigation
vim.keymap.set("n", "n", "nzzv", opts)
vim.keymap.set("n", "N", "Nzzv", opts)
vim.keymap.set("n", "*", "*zzv", opts)
vim.keymap.set("n", "#", "#zzv", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

-- Clear search highlights with Esc
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)

-- ============================================================================
-- MARKS
-- ============================================================================

-- List all marks
vim.keymap.set("n", "<leader>lm", ":marks<CR>", { desc = "[L]ist [M]arks" })

-- Delete mark
vim.keymap.set("n", "dm", function()
  local mark = vim.fn.input("Delete mark: ")
  if mark ~= "" then
    vim.cmd("delmarks " .. mark)
    print("Deleted mark '" .. mark .. "'")
  end
end, { desc = "[D]elete [M]ark" })

-- Delete all marks in current buffer
vim.keymap.set("n", "dm!", ":delmarks!<CR>", { desc = "[D]elete all [M]arks in buffer" })

-- Next/previous mark (by line)
vim.keymap.set("n", "]'", function()
  vim.cmd("normal! ]'")
end, { desc = "Next mark (line)" })

vim.keymap.set("n", "['", function()
  vim.cmd("normal! ['")
end, { desc = "Previous mark (line)" })

-- Next/previous mark (exact position)
vim.keymap.set("n", "]`", function()
  vim.cmd("normal! ]`")
end, { desc = "Next mark (position)" })

vim.keymap.set("n", "[`", function()
  vim.cmd("normal! [`")
end, { desc = "Previous mark (position)" })

-- ============================================================================
-- UTILITIES
-- ============================================================================

-- Split line with X (opposite of J which joins)
vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- List notifications
vim.keymap.set("n", "<leader>ln", function()
  require("snacks").notifier.show_history()
end, { desc = "[L]ist [N]otifications" })

-- Copy file paths (for Claude Code integration)
vim.keymap.set("n", "<leader>yr", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
  print("Copied relative path: " .. vim.fn.expand("%"))
end, { desc = "[Y]ank [R]elative path" })

vim.keymap.set("n", "<leader>ya", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  print("Copied absolute path: " .. vim.fn.expand("%:p"))
end, { desc = "[Y]ank [A]bsolute path" })

-- Open Lazy plugin manager
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy Plugin Manager" })

-- ============================================================================
-- LSP KEYMAPS
-- ============================================================================
-- NOTE: Most LSP keymaps are defined in autocmds.lua via LspAttach
-- These are global keymaps that work even without LSP attached

-- Diagnostic navigation
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { desc = "[L]ist [D]iagnostics in quickfix" })

-- Code actions
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
-- NOTE: <leader>cf is defined in conform.lua for formatting

-- ============================================================================
-- TERMINAL
-- ============================================================================

-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ============================================================================
-- NOTE: Additional keymaps are defined in plugin configurations:
-- - Snacks.nvim: File finding, git, LSP pickers (lua/plugins/snacks.lua)
-- - DAP: Debugging keymaps (lua/plugins/debug/*.lua)
-- - C#: Dotnet commands (lua/plugins/lang/csharp.lua)
-- - Angular: Nx commands (lua/plugins/lang/angular.lua)
-- ============================================================================
