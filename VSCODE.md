# VS Code Integration

This Neovim configuration is designed to work seamlessly with both standalone Neovim and VS Code via the [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim) extension.

## Setup

### 1. Install VS Code Neovim Extension

Install the extension from the marketplace:
- Extension ID: `asvetliakov.vscode-neovim`
- Or search for "VSCode Neovim" in VS Code extensions

### 2. Configure VS Code Settings

Add to your VS Code `settings.json`:

```json
{
  "vscode-neovim.neovimExecutablePaths.darwin": "/opt/homebrew/bin/nvim",
  "vscode-neovim.neovimExecutablePaths.win32": "C:\\path\\to\\nvim.exe",
  "vscode-neovim.neovimInitVimPaths.darwin": "$HOME/.config/nvim/init.lua",
  "vscode-neovim.neovimInitVimPaths.win32": "$HOME\\AppData\\Local\\nvim\\init.lua",

  // Optional: Enable key repeat for holding down keys (macOS)
  "vscode-neovim.useCtrlKeysForNormalMode": false,
  "vscode-neovim.useCtrlKeysForInsertMode": false
}
```

### 3. Verify Installation

1. Open VS Code
2. Press `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Windows)
3. Type "Neovim" - you should see Neovim commands available
4. Try pressing `jj` or `Esc` in insert mode to verify Neovim is active

## How It Works

### Conditional Loading

The config detects when running in VS Code via `vim.g.vscode` and:

**Disables** (VS Code handles these):
- UI plugins (colorschemes, noice, snacks, which-key)
- LSP/completion (mason, nvim-lspconfig, blink.cmp)
- File navigation (telescope, snacks picker)
- Debugging (nvim-dap)
- Formatting/linting (conform, nvim-lint)
- Git UI (gitsigns)
- Treesitter highlighting
- Terminal UI
- Tmux navigation (not applicable in VS Code)

**Enables** (enhances Vim editing):
- Text objects (mini.ai, mini.surround)
- Auto pairs (mini.pairs)
- Enhanced navigation (flash.nvim)
- Smart commenting (Comment.nvim)
- All core Vim keymaps and motions

### File Structure

```
~/.config/nvim/
├── init.lua              # Detects VS Code and loads appropriate config
├── lua/
│   ├── vscode.lua        # VS Code-specific keymaps using VS Code commands
│   ├── config/
│   │   ├── keymaps.lua   # Core Vim keymaps (work in both)
│   │   ├── options.lua   # Vim options (work in both)
│   │   └── vscode-compat.lua  # Helper for plugin compatibility
│   └── plugins/
│       └── *.lua         # Plugins with conditional loading
```

## Available Keymaps in VS Code

### File Operations
- `<leader>ff` - Find files (VS Code quick open)
- `<leader>/` - Search in files
- `<leader>o` - Show all open editors/buffers
- `<leader>e` - Toggle file explorer

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `<leader>ca` - Code actions
- `<leader>cr` - Rename symbol
- `<leader>cf` - Format document

### Diagnostics
- `]d` - Next diagnostic
- `[d` - Previous diagnostic

### Buffer Management
- `<leader>bd` - Close current buffer
- `<leader>bo` - Close other buffers

### Git
- `<leader>gg` - Open source control

### Terminal
- `<C-/>` - Toggle terminal

### Comments
- `gcc` - Toggle line comment (normal mode)
- `gc` - Toggle comment (visual mode)

### Text Objects (Mini.nvim)
- `va)` - Select around parentheses
- `vi'` - Select inside quotes
- `saiw)` - Surround word with parentheses
- `sd'` - Delete surrounding quotes
- `sr)'` - Replace ) with '

### Navigation (Flash.nvim)
- `s` - Flash jump
- `S` - Flash treesitter
- `r` - Remote flash (operator mode)
- `R` - Treesitter search

### Standard Vim Keymaps
All your custom keymaps from `config/keymaps.lua` work:
- `H` / `L` - Start/end of line
- `J` / `K` - Move visual selection up/down
- `<` / `>` - Indent left/right (stays in visual mode)
- And many more...

## Cross-Platform Support

The config works on:
- ✅ macOS (standalone Neovim)
- ✅ Windows (standalone Neovim)
- ✅ macOS (VS Code + vscode-neovim)
- ✅ Windows (VS Code + vscode-neovim)

Platform-specific features:
- **Tmux Navigator**: Only enabled on macOS/Linux (not Windows)
- **Shell tools**: `shellcheck`, `shfmt` only on Unix systems
- **Debugger paths**: Automatically adjusts `.exe` extension on Windows

## Troubleshooting

### Neovim not loading in VS Code
1. Check extension is installed and enabled
2. Verify Neovim path in VS Code settings
3. Check Output panel → "Neovim" for errors

### Plugins loading in VS Code that shouldn't
- Verify `defaults.cond` is set in `lua/core/lazy.lua`
- Check that plugin has `cond = true` only if it should work in VS Code

### Keymaps not working
- Some keymaps may conflict with VS Code defaults
- Check VS Code keybindings settings
- Use `<leader>` prefix for custom commands

### Performance issues
- Disable heavy plugins in `lua/plugins/extra.lua`
- Reduce `mini.ai` n_lines if slow: `require("mini.ai").setup({ n_lines = 100 })`

## Benefits

Using Neovim with VS Code gives you:
- ✨ Powerful Vim motions and text objects
- 🚀 VS Code's excellent LSP, debugging, and UI
- 🎯 Best of both worlds without compromise
- 🔄 Seamless workflow between terminal Neovim and VS Code
- 📦 Single config for all environments
