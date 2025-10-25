# Keymap Reorganization Summary

## Changes Made

### 1. Fixed `<leader>d` Conflict ✅
**Problem**: Both Dotnet and Debug used conflicting prefixes

**Solution**:
- **`<leader>d`** → Debug/DAP (more common in Neovim community)
  - `<leader>dc` - Continue/Start
  - `<leader>di` - Step Into
  - `<leader>do` - Step Over
  - `<leader>dO` - Step Out
  - `<leader>db` - Toggle Breakpoint
  - `<leader>dB` - Conditional Breakpoint
  - `<leader>dt` - Toggle UI
  - `<leader>dl` - Run Last

- **`<leader>D`** → Dotnet (.NET commands)
  - `<leader>Db` - Build
  - `<leader>Dt` - Test
  - `<leader>Dr` - Run
  - `<leader>Ds` - Secrets
  - `<leader>DR` - Restore
  - `<leader>Dc` - Clean

### 2. Fixed Git Hunk Navigation Conflict ✅
**Problem**: Both gitsigns and snacks.words used `]]`/`[[`

**Solution**:
- **Git hunks** → `]h` / `[h` (standard convention)
- **Word references** → `]]` / `[[` (snacks.words)

### 3. Consolidated LSP Keymaps ✅
**Problem**: LSP keymaps duplicated across files

**Solution**:
- Removed `<leader>cf` from keymaps.lua (kept in conform.lua)
- Added comments clarifying where LSP keymaps are defined
- Keep both `<leader>c` (Code) and `<leader>l` (LSP) for flexibility

### 4. Added Which-Key Group Names ✅
**Problem**: Groups showing "X keymaps" instead of names

**Solution**: Added clear group descriptions:
```lua
{ "<leader>b", group = "Buffer" },
{ "<leader>c", group = "Code" },
{ "<leader>d", group = "Debug" },
{ "<leader>D", group = "Dotnet" },
{ "<leader>f", group = "Find" },
{ "<leader>g", group = "Git" },
{ "<leader>G", group = "Git Actions" },
{ "<leader>l", group = "LSP" },
{ "<leader>n", group = "Nx/Angular" },
{ "<leader>R", group = "Replace" },
{ "<leader>s", group = "Search" },
{ "<leader>u", group = "UI/Toggle" },
{ "<leader>W", group = "Workspace" },
{ "<leader>x", group = "Diagnostics" },
```

## Complete Keymap Reference

### Buffer Operations (`<leader>b`)
- `<leader>bd` - Delete buffer
- `<leader>bo` - Close other buffers

### Code Actions (`<leader>c`)
- `<leader>ca` - Code action
- `<leader>cr` - Rename symbol
- `<leader>cf` - Format (from conform.lua)
- `<leader>cR` - Rename file
- `<leader>cs` - Symbols (Trouble)
- `<leader>cl` - LSP Definitions/references (Trouble)
- `<leader>cm` - Mason

### Debug (`<leader>d`)
- `<leader>dc` - Continue/Start
- `<leader>di` - Step Into
- `<leader>do` - Step Over
- `<leader>dO` - Step Out
- `<leader>db` - Toggle Breakpoint
- `<leader>dB` - Conditional Breakpoint
- `<leader>dt` - Toggle UI
- `<leader>dl` - Run Last

### Dotnet (`<leader>D`)
- `<leader>Db` - Build
- `<leader>Dt` - Test
- `<leader>Dr` - Run
- `<leader>Ds` - Secrets
- `<leader>DR` - Restore
- `<leader>Dc` - Clean

### Find/Files (`<leader>f`)
- `<leader>ff` - Find files
- `<leader>fg` - Git files
- `<leader>fc` - Config files
- `<leader>fp` - Projects
- `<leader>fr` - Recent

### Git Pickers (`<leader>g`)
- `<leader>gg` - Lazygit
- `<leader>gb` - Branches
- `<leader>gl` - Log
- `<leader>gL` - Log line
- `<leader>gs` - Status
- `<leader>gS` - Stash
- `<leader>gd` - Diff
- `<leader>gf` - File log
- `<leader>gB` - Browse

### Git Actions (`<leader>G`)
- `<leader>Gs` - Stage hunk
- `<leader>Gr` - Reset hunk
- `<leader>GR` - Reset buffer
- `<leader>Gu` - Undo stage
- `<leader>Gp` - Preview hunk
- `<leader>Gd` - Diff HEAD
- `<leader>Gl` - Blame
- `<leader>Gk` - Prev hunk
- `<leader>Gj` - Next hunk
- `<leader>GU` - UndoTree

### LSP (`<leader>l`)
- `<leader>la` - Code action
- `<leader>lA` - Range code actions
- `<leader>ls` - Signature help
- `<leader>lr` - Rename
- `<leader>lf` - Format
- `<leader>lc` - Copy file path and line number
- `<leader>ln` - Get highlighted line numbers

### Nx/Angular (`<leader>n`)
- `<leader>nx` - Nx actions

### Search (`<leader>s`)
- `<leader>sn` - Notifications
- `<leader>sb` - Buffer lines
- `<leader>st` - Grep
- `<leader>sw` - Word/selection
- `<leader>s"` - Registers
- `<leader>s/` - Search history
- `<leader>sa` - Autocmds
- `<leader>sc` - Command history
- `<leader>sC` - Commands
- `<leader>sd` - Diagnostics
- `<leader>sD` - Buffer diagnostics
- `<leader>sh` - Help pages
- `<leader>sH` - Highlights
- `<leader>si` - Icons
- `<leader>sj` - Jumps
- `<leader>sk` - Keymaps
- `<leader>sl` - Location list
- `<leader>sm` - Marks
- `<leader>sM` - Man pages
- `<leader>sp` - Plugin spec
- `<leader>sq` - Quickfix
- `<leader>sR` - Resume
- `<leader>su` - Undo history

### UI/Toggle (`<leader>u`)
- `<leader>uC` - Colorschemes
- `<leader>un` - Dismiss notifications
- `<leader>us` - Toggle spelling
- `<leader>uw` - Toggle wrap
- `<leader>uL` - Toggle relative number
- `<leader>ud` - Toggle diagnostics
- `<leader>ul` - Toggle line numbers
- `<leader>uc` - Toggle conceallevel
- `<leader>uT` - Toggle treesitter
- `<leader>ub` - Toggle dark background
- `<leader>uh` - Toggle inlay hints
- `<leader>ug` - Toggle indent
- `<leader>uD` - Toggle dim
- `<leader>ut` - Show key presses

### Workspace (`<leader>W`)
- `<leader>WS` - LSP Workspace symbols
- `<leader>Wa` - Add folder
- `<leader>Wr` - Remove folder
- `<leader>Wl` - List folders

### Diagnostics (`<leader>x`)
- `<leader>xx` - All diagnostics (Trouble)
- `<leader>xX` - Buffer diagnostics (Trouble)
- `<leader>xL` - Location list (Trouble)
- `<leader>xQ` - Quickfix list (Trouble)

### Other Important Keymaps

**LSP Navigation (g prefix)**
- `gd` - Goto definition
- `gD` - Goto declaration
- `gr` - References
- `gI` - Goto implementation
- `gy` - Goto type definition
- `gl` - Open diagnostic float
- `K` - Hover documentation
- `gs` - Signature documentation

**Diagnostic Navigation**
- `]d` - Next diagnostic
- `[d` - Previous diagnostic

**Git Navigation**
- `]h` - Next git hunk
- `[h` - Previous git hunk

**Word Reference Navigation**
- `]]` - Next reference
- `[[` - Previous reference

**Editing**
- `U` - Redo
- `J` (visual) - Move line down
- `K` (visual) - Move line up
- `H` - Start of line
- `L` - End of line

## Files Modified

1. `/Users/colin/.config/nvim/lua/plugins/lang/csharp.lua`
   - Changed all `<leader>d*` to `<leader>D*`

2. `/Users/colin/.config/nvim/lua/plugins/dap.lua`
   - Changed all `<leader>D*` to `<leader>d*`
   - Simplified step keymaps (removed `s` prefix)

3. `/Users/colin/.config/nvim/lua/plugins/git.lua`
   - Changed `]]`/`[[` to `]h`/`[h` for git hunks

4. `/Users/colin/.config/nvim/lua/config/keymaps.lua`
   - Removed duplicate `<leader>cf`
   - Added comments about LSP keymap locations

5. `/Users/colin/.config/nvim/lua/plugins/which-key.lua`
   - Added clear group names for all leader prefixes

## Benefits

✅ **No more conflicts** - Each prefix has a single, clear purpose
✅ **Logical organization** - Related commands grouped together
✅ **Better discoverability** - Which-key shows clear group names
✅ **Follows conventions** - Uses standard Neovim/community patterns
✅ **Muscle memory friendly** - Common actions on easy-to-reach keys

## Migration Notes

If you have muscle memory from the old keymaps:

**Old → New**
- `<leader>Dc` → `<leader>dc` (Debug continue)
- `<leader>Db` → `<leader>db` (Debug breakpoint)
- `<leader>db` → `<leader>Db` (Dotnet build)
- `<leader>dt` → `<leader>Dt` (Dotnet test)
- `<leader>dr` → `<leader>Dr` (Dotnet run)
- `]]` → `]h` (Next git hunk)
- `[[` → `[h` (Previous git hunk)
