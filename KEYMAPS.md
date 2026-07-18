# Neovim Keymap Cheat Sheet

> **Leader** = `Space`  ·  **LocalLeader** = `Space`
> Modes: `n` normal · `x`/`v` visual · `o` operator-pending · `t` terminal · `i` insert · `c` command-line.
> Where two mappings share a key, the buffer-local one (e.g. LSP-on-attach) wins when active.

---

## Jumping & Motion

### Flash (jump anywhere on screen) — `gj` = "go jump"
Work in `n`, `x`, `o`, so you can prefix with `d`/`v`/`y`.

| Keys | Action |
|------|--------|
| `gjs` | **Main jump** — type chars, press the label to teleport |
| `gjt` | Treesitter jump — labels whole syntax nodes |
| `gjw` | Jump to the start of any word on screen |
| `gjl` | Jump to the start of any line |
| `gj/` | Search-mode jump (labels after the match) |
| `f` `F` `t` `T` | Enhanced — show labels when a char has multiple matches |
| `;` `,` | Repeat last `f`/`t` motion |
| `<C-s>` | *(command mode)* toggle Flash while typing a `/` search |

*(In VS Code, `gjs`/`gjf`/`gjw` map to vim-easymotion instead.)*

### Cursor & line motion
| Keys | Action |
|------|--------|
| `H` / `L` | Start of line (`^`) / end of line (`g_`) — n/x/o |
| `<C-d>` / `<C-u>` | Half-page down / up, cursor centered |
| `n` / `N` | Next / prev search match, centered |
| `*` `#` `g*` `g#` | Search word under cursor, centered |
| `j` / `k` | Move by display line when no count given |
| `]]` / `[[` | Next / previous reference (Snacks words) — n/t |

### Marks (native)
| Keys | Action |
|------|--------|
| `m{a-z}` / `m{A-Z}` | Set buffer-local / global mark |
| `` `{mark} `` / `'{mark}` | Jump to mark (exact / line) |
| `]'` / `['` | Next / previous mark (line) |
| `` ]` `` / `` [` `` | Next / previous mark (position) |
| `<leader>sm` | Marks picker (Snacks) |
| `<leader>lm` | List marks (`:marks`) |
| `dm` | Delete a mark (prompts) |
| `dm!` | Delete all marks in buffer |

---

## Bookmarks — Arrow (`<leader>m`)
Persistent, curated file bookmarks (survive restarts).

| Keys | Action |
|------|--------|
| `<leader>mm` | Open bookmark menu |
| `<leader>mt` | Toggle-pin the current file |
| `]m` / `[m` | Next / previous bookmark |
| `<leader>mB` | Per-buffer line bookmarks |
| *(in menu)* | `s` toggle · `d` delete-mode · `x` remove · `e` edit · `v`/`-` split · `q` quit |

---

## Buffers & Files

| Keys | Action |
|------|--------|
| `gb` | **Snipe** buffer menu (label-jump between open buffers) |
| `<leader>o` | Buffers picker (`dd` to delete) |
| `<leader>e` | File explorer |
| `<leader><space>` | Smart find files |
| `<leader>bd` | Delete buffer |
| `<leader>bo` | Only — close all other buffers |
| `<Right>` / `<Left>` | Next / previous buffer |
| `<leader>q` | Quit (`:q!`) |
| `<leader>.` | Scratch buffer |
| `<leader>S` | Select scratch buffer |

### Find (`<leader>f`)
| Keys | Action |
|------|--------|
| `<leader>ff` | Files |
| `<leader>fg` | Git files |
| `<leader>fr` | Recent files |
| `<leader>fc` | Config file |
| `<leader>fp` | Projects |

---

## Search & Pickers (`<leader>s`)

| Keys | Action |
|------|--------|
| `<leader>/` | Grep |
| `<leader>st` | Grep |
| `<leader>sw` | Grep word (n/x) |
| `<leader>sb` / `<C-s>` | Grep open buffers |
| `<leader>sB` | Buffer lines |
| `<leader>ss` | Symbols (LSP) |
| `<leader>sd` / `<leader>sD` | Diagnostics / buffer diagnostics |
| `<leader>sj` | Jumps |
| `<leader>sk` | Keymaps |
| `<leader>sm` / `<leader>sM` | Marks / man pages |
| `<leader>s"` | Registers |
| `<leader>s/` | Search history |
| `<leader>sc` / `<leader>sC` | Command history / commands |
| `<leader>sh` / `<leader>sH` | Help pages / highlights |
| `<leader>si` | Icons |
| `<leader>sl` / `<leader>sq` | Location list / quickfix list |
| `<leader>sa` | Autocmds |
| `<leader>se` | Everywhere (all pickers) |
| `<leader>sp` | Plugin specs |
| `<leader>sR` | Resume last picker |
| `<leader>su` | Undo history |
| `<leader>sn` | Notifications |
| `<leader>sy` | Yank history |
| `<leader>:` | Command history |

---

## LSP & Code (`<leader>c`, `g…`)

### Goto / info
| Keys | Action |
|------|--------|
| `gd` | Goto definition |
| `gD` | Goto declaration |
| `gr` | References |
| `gI` | Goto implementation |
| `gy` | Goto type definition |
| `K` | Hover documentation |
| `gs` | Signature help |
| `gl` | Diagnostic float |
| `<leader>cv` | Definition in vsplit |

### Actions
| Keys | Action | Mode |
|------|--------|------|
| `<leader>ca` | Code action | n/v |
| `<leader>cr` | Rename symbol | n |
| `<leader>cR` | Rename file | n |
| `<leader>cf` | Format buffer | n/v |
| `<leader>cs` | Symbols (LSP) | n |
| `<leader>cl` | LSP references/definitions (Trouble) | n |
| `<leader>cm` | Mason | n |
| `<leader>cL` | Lint now | n |
| `<leader>cI` | Lint info | n |
| `<leader>cp` / `<leader>cP` | Swap parameter next / previous | n |

### Completion (blink.cmp + Supermaven)
| Keys | Action |
|------|--------|
| `<Tab>` | Accept Supermaven suggestion |
| `<M-f>` | Accept next word of suggestion |
| `<C-e>` | Dismiss Supermaven suggestion |

*(blink.cmp otherwise uses its default preset; `<C-f>` is unmapped.)*

---

## Diagnostics & Trouble (`<leader>x`)

| Keys | Action |
|------|--------|
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>ld` | Diagnostics to loclist |
| `<leader>xx` | Toggle diagnostics (Trouble) |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xS` | Symbols |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

---

## Git (`<leader>g`)

| Keys | Action |
|------|--------|
| `<leader>gg` | LazyGit |
| `<leader>gc` / `<leader>gp` | Commit / push (via LazyGit) |
| `<leader>gs` / `<leader>gS` | Status / stash |
| `<leader>gb` | Branches |
| `<leader>gl` / `<leader>gL` | Log / log line |
| `<leader>gd` | Diff (hunks) |
| `<leader>gf` | Log file |
| `<leader>gB` | Browse (open in browser) — n/v |
| `<leader>gD` | Diff HEAD |
| `<leader>gR` | Reset buffer |

### Hunks (`<leader>gh`, gitsigns)
| Keys | Action |
|------|--------|
| `]h` / `[h` | Next / previous hunk |
| `<leader>ghp` | Preview hunk |
| `<leader>ghs` | Stage hunk |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghb` | Blame line |

---

## Debug — DAP (`<leader>d`)

| Keys | Action |
|------|--------|
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dt` | Toggle UI |
| `<leader>dl` | Run last |

---

## Find & Replace — Spectre (`<leader>R`)

| Keys | Action |
|------|--------|
| `<leader>Rr` | Find and replace |
| `<leader>Rw` | Replace word under cursor |
| `<leader>Rf` | Replace in file |

---

## AI & Claude (`<leader>i`)

| Keys | Action | Mode |
|------|--------|------|
| `<leader>ic` | Toggle Claude | n |
| `<leader>if` | Focus Claude | n |
| `<leader>ir` | Resume Claude | n |
| `<leader>iC` | Continue Claude | n |
| `<leader>im` | Select model | n |
| `<leader>ib` | Add buffer | n |
| `<leader>is` | Send to Claude (or add file in tree) | v / tree |
| `<leader>ia` / `<leader>id` | Accept / deny diff | n |
| `<leader>ua` | Toggle AI (Supermaven) | n |

---

## Obsidian (`<leader>O`)

| Keys | Action |
|------|--------|
| `<leader>Oo` | Quick switch note |
| `<leader>On` | New note |
| `<leader>Os` | Search notes |
| `<leader>Ot` / `<leader>Oy` | Today's / yesterday's daily note |
| `<leader>Ob` | Show backlinks |
| `<leader>Og` | Follow link under cursor |
| `<leader>Ol` | Link to note (visual) |

---

## .NET (`<leader>n`) & Angular (`<leader>a`)

| Keys | Action |
|------|--------|
| `<leader>nb` | Build |
| `<leader>nt` | Test |
| `<leader>nr` / `<leader>nR` | Run / restore |
| `<leader>ns` | Secrets |
| `<leader>nc` | Clean |
| `<leader>an` | Nx actions |
| `<leader>at` | Toggle component/template |

---

## UI & Toggles (`<leader>u`)

| Keys | Action |
|------|--------|
| `<leader>us` | Spelling |
| `<leader>uw` | Wrap |
| `<leader>ul` / `<leader>uL` | Line number / relative number |
| `<leader>ud` | Diagnostics |
| `<leader>uc` | Conceal level |
| `<leader>uT` | Treesitter |
| `<leader>ub` | Dark background |
| `<leader>uh` | Inlay hints |
| `<leader>ug` | Indent guides |
| `<leader>uD` | Dim |
| `<leader>uz` / `<leader>uZ` | Zen mode / zoom |
| `<leader>uC` | Colorschemes |
| `<leader>un` | Dismiss notifications |
| `<leader>uu` | UndoTree |
| `<leader>ut` | Toggle key display (Showkeys) |

---

## Yank & Paste (yanky, `<leader>y`)

| Keys | Action | Mode |
|------|--------|------|
| `p` / `P` | Put after / before (yanky ring) | n/x |
| `<C-p>` / `<C-n>` | Cycle forward / backward through yank history | n |
| `<leader>sy` | Yank history picker | n |
| `<leader>D` | Delete to void (black hole) | n/v |
| `YY` | Copy inside `{ }` including braces | n |
| `<leader>yr` / `<leader>ya` | Copy relative / absolute file path | n |
| `<leader>yc` | Copy `path:line` | n |

---

## Windows, Panes & Tmux

| Keys | Action |
|------|--------|
| `<C-h/j/k/l>` | Move focus left/down/up/right (tmux-aware) |
| `<C-\>` | Navigate to previous (tmux-aware) |
| `+` / `_` | Vertical resize +/- 5 |
| `=` / `-` | Horizontal resize +/- 5 |
| `<C-w>v` `<C-w>s` `<C-w>c` | Native vsplit / split / close |

---

## Editing & Text Objects

| Keys | Action | Mode |
|------|--------|------|
| `U` | Redo | n |
| `J` / `K` | Move selection down / up | v |
| `<` / `>` | Indent left / right, keep selection | v |
| `X` | Split line (opposite of `J`) | n |
| `<C-a>` | Select all | n |
| `<Esc>` | Clear search highlight | n |

### Treesitter text objects (select)
| Keys | Target |
|------|--------|
| `af` / `if` | Around / inside function |
| `ac` / `ic` | Around / inside class |
| `ai` / `ii` | Around / inside if-statement |
| `al` / `il` | Around / inside loop |
| `ap` / `ip` | Around / inside parameter |

### Treesitter move
| Keys | Action |
|------|--------|
| `]f` / `[f` | Next / previous function |
| `]c` / `[c` | Next / previous class |
| `]p` / `[p` | Next / previous parameter |

### Incremental selection
| Keys | Action |
|------|--------|
| `<leader>vv` | Start selection |
| `+` / `_` | Expand / shrink node |

### mini.ai / mini.surround
| Keys | Action |
|------|--------|
| `va)` `yinq` `ci'` … | Around/inside text objects (mini.ai) |
| `sa{motion}{char}` | Surround add (e.g. `saiw)`) |
| `sd{char}` | Surround delete |
| `sr{old}{new}` | Surround replace |

---

## Workspace (`<leader>W`) & Misc

| Keys | Action |
|------|--------|
| `<leader>Wa` / `<leader>Wr` | Add / remove workspace folder |
| `<leader>Wl` | List workspace folders |
| `<leader>WS` | Workspace symbols |
| `<leader>L` | Lazy plugin manager |
| `<leader>N` | Neovim news |
| `<leader>ln` | Notification history |
| `<leader>sn` | Search notifications |
| `<C-/>` | Toggle terminal |
| `<Esc><Esc>` | Exit terminal mode |

---

*Generated 2026-07-11 from `lua/config/*` and `lua/plugins/*`. Update when keymaps change.*
