# 📋 Neovim Configuration - Keybindings & Commands Cheat Sheet

> *Because remembering 200+ keybindings is a superpower. Or a disorder.*

---

## 🎯 Legend

| Symbol | Meaning |
|--------|---------|
| `<leader>` | Spacebar (default leader key) |
| `<C-x>` | Ctrl + x |
| `<M-x>` | Alt/Option + x |
| `<S-x>` | Shift + x |
| `<CR>` | Enter/Return |
| `nv` | Normal + Visual mode |
| `i` | Insert mode |
| `v` | Visual mode |
| `n` | Normal mode |

---

## 🚀 General Navigation

### Movement

| Keybinding | Mode | Description |
|------------|------|-------------|
| `h` | n | Move left |
| `j` | n | Move down |
| `k` | n | Move up |
| `l` | n | Move right |
| `w` | n | Forward by word |
| `b` | n | Backward by word |
| `e` | n | End of word |
| `ge` | n | End of previous word |
| `0` | n | Start of line |
| `$` | n | End of line |
| `^` | n | First non-blank character |
| `gg` | n | First line |
| `G` | n | Last line |
| `{` | n | Previous paragraph |
| `}` | n | Next paragraph |
| `(` | n | Previous sentence |
| `)` | n | Next sentence |
| `<C-d>` | n | Half-page down |
| `<C-u>` | n | Half-page up |
| `<C-f>` | n | Full page forward |
| `<C-b>` | n | Full page backward |

### Jump Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-o>` | n | Go back (jump history) |
| `<C-i>` | n | Go forward (jump history) |
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gr` | n | Go to references |
| `K` | n | Show hover documentation |
| `[d` | n | Previous diagnostic |
| `]d` | n | Next diagnostic |
| `<leader>d` | n | Show diagnostics in float |

---

## 📝 Editing

### Insert Mode

| Keybinding | Mode | Description |
|------------|------|-------------|
| `i` | n | Insert before cursor |
| `I` | n | Insert at line start |
| `a` | n | Insert after cursor |
| `A` | n | Insert at line end |
| `o` | n | Insert new line below |
| `O` | n | Insert new line above |
| `<C-h>` | i | Delete character before |
| `<C-w>` | i | Delete word before |
| `<C-u>` | i | Delete line before |
| `<C-j>` | i | Insert newline |
| `<C-t>` | i | Indent current line |
| `<C-d>` | i | De-indent current line |
| `<Esc>` | i | Exit insert mode |

### Visual Mode

| Keybinding | Mode | Description |
|------------|------|-------------|
| `v` | n | Enter character-wise visual |
| `V` | n | Enter line-wise visual |
| `<C-v>` | n | Enter block-wise visual |
| `gv` | n | Reselect last selection |
| `o` | v | Switch selection ends |
| `O` | v | Switch to other end |
| `J` | v | Join selected lines |

### Text Objects

| Keybinding | Mode | Description |
|------------|------|-------------|
| `iw` | v/n | Inner word |
| `aw` | v/n | A word (with space) |
| `iW` | v/n | Inner WORD |
| `aW` | v/n | A WORD |
| `ib` | v/n | Inside parentheses () |
| `ab` | v/n | Around parentheses () |
| `iB` | v/n | Inside braces {} |
| `aB` | v/n | Around braces {} |
| `i[` | v/n | Inside brackets [] |
| `a[` | v/n | Around brackets [] |
| `ip` | v/n | Inside paragraph |
| `ap` | v/n | Around paragraph |
| `it` | v/n | Inside tag |
| `at` | v/n | Around tag |
| `if` | v/n | Inside function |
| `af` | v/n | Around function |
| `ic` | v/n | Inside class |
| `ac` | v/n | Around class |

### Yank/Paste

| Keybinding | Mode | Description |
|------------|------|-------------|
| `y` | v | Yank selection |
| `yy` | n | Yank line |
| `Y` | n | Yank to end of line |
| `p` | n | Paste after cursor |
| `P` | n | Paste before cursor |
| `gp` | n | Paste and put cursor after |
| `gP` | n | Paste and put cursor before |
| `"*p` | n | Paste from clipboard |
| `"+p` | n | Paste from system clipboard |

### Delete/Change

| Keybinding | Mode | Description |
|------------|------|-------------|
| `x` | v/n | Delete character |
| `d` | v/n | Delete selection |
| `dd` | n | Delete line |
| `D` | n | Delete to end of line |
| `diw` | n | Delete inner word |
| `daw` | n | Delete a word |
| `dip` | n | Delete inner paragraph |
| `dap` | n | Delete around paragraph |
| `c` | v/n | Change selection |
| `cc` | n | Change line |
| `C` | n | Change to end of line |
| `ciw` | n | Change inner word |
| `caw` | n | Change a word |
| `s` | v/n | Substitute (delete + insert) |
| `S` | n | Substitute line |

### Undo/Redo

| Keybinding | Mode | Description |
|------------|------|-------------|
| `u` | n | Undo |
| `<C-r>` | n | Redo |
| `U` | n | Undo whole line |
| `g-` | n | Go to older state |
| `g+` | n | Go to newer state |

### Surround (nvim-surround)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `ys{motion}{char}` | n | Add surround around motion |
| `yss{char}` | n | Add surround to line |
| `yS{motion}{char}` | n | Add surround (new line) |
| `ds{char}` | n | Delete surround |
| `cs{target}{replacement}` | n | Change surround |
| `S{char}` | v | Add surround to selection |

**Examples:**
```
ysiw"         -> "word"
ysiw(         -> (word)
ds"           -> word
cs"'          -> 'word'
```

---

## 🔍 Telescope (Fuzzy Finder)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>ff` | n | Find files |
| `<C-p>` | n | Find files (alternative) |
| `<leader><leader>` | n | Recent files |
| `<leader>fb` | n | Find buffers |
| `<leader>fg` | n | Live grep |
| `<leader>fh` | n | Find help tags |
| `<leader>fp` | n | Find projects |

### Telescope Mappings (Inside Telescope)

| Keybinding | Description |
|------------|-------------|
| `<CR>` | Open selected |
| `<C-v>` | Open in vertical split |
| `<C-s>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `<C-c>` | Close telescope |
| `<C-j>` | Move selection down |
| `<C-k>` | Move selection up |

---

## 🌳 Neo-tree (File Explorer)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-n>` | n | Toggle file explorer |
| `<leader>nt` | n | Toggle file explorer |
| `<leader>nb` | n | Toggle buffer explorer |
| `<leader>ng` | n | Toggle git status |
| `<leader>ns` | n | Toggle document symbols |

### Neo-tree Navigation

| Keybinding | Description |
|------------|-------------|
| `<CR>` / `o` | Open file/directory |
| `<2-LeftMouse>` | Open file/directory |
| `h` | Go to parent directory |
| `l` | Expand directory |
| `.` | Set root to current file |
| `H` | Toggle hidden files |
| `/` | Fuzzy filter |
| `<C-c>` | Clear filter |
| `a` | Add directory |
| `A` | Add file |
| `d` | Delete file/directory |
| `r` | Rename file/directory |
| `y` | Copy to clipboard |
| `x` | Cut to clipboard |
| `p` | Paste from clipboard |
| `z` | Collapse all nodes |

---

## 🐛 Git (gitsigns)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `]c` | n | Next hunk |
| `[c` | n | Previous hunk |
| `<leader>hs` | n | Stage hunk |
| `<leader>hr` | n | Reset hunk |
| `<leader>hS` | n | Stage buffer |
| `<leader>hu` | n | Undo stage hunk |
| `<leader>hR` | n | Reset buffer |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `<leader>hd` | n | Diff this |
| `<leader>hD` | n | Diff this ~ |
| `<leader>td` | n | Toggle deleted |
| `ih` | o/v | Select hunk |

---

## ⚠️ Trouble (Diagnostics)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>x` | n | Toggle trouble list |
| `<leader>xx` | n | Toggle trouble (document diagnostics) |
| `<leader>xq` | n | Toggle quickfix list |
| `<leader>xl` | n | Toggle loclist |

### Trouble Navigation

| Keybinding | Description |
|------------|-------------|
| `<CR>` | Jump to item |
| `o` | Jump and close |
| `<C-s>` | Open in split |
| `<C-v>` | Open in vsplit |
| `<C-t>` | Open in tab |
| `q` | Close trouble |
| `r` | Refresh |

---

## 🔧 LSP (Language Server)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gr` | n | Go to references |
| `K` | n | Hover documentation |
| `<leader>ca` | n | Code actions |
| `<leader>rn` | n | Rename |
| `<leader>d` | n | Show diagnostics (float) |
| `[d` | n | Previous diagnostic |
| `]d` | n | Next diagnostic |

---

## 💬 Comments (Comment.nvim)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gcc` | n/v | Comment/uncomment line/selection |
| `gc` | o | Comment selection |
| `gcO` | n | Add comment above |
| `gco` | n | Add comment below |
| `gcA` | n | Add comment at end of line |

---

## 📦 Completion (nvim-cmp)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-Space>` | i | Trigger completion |
| `<C-b>` | i | Scroll docs up |
| `<C-f>` | i | Scroll docs down |
| `<C-e>` | i | Abort completion |
| `<CR>` | i | Confirm selection |
| `<Tab>` | i | Next item |
| `<S-Tab>` | i | Previous item |

---

## 🎮 Terminal (toggleterm)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>t` | n | Toggle terminal |
| `<C-\>` | n/t | Toggle terminal (alternate) |

### Terminal Mode

| Keybinding | Description |
|------------|-------------|
| `<Esc>` | Exit terminal mode |
| `<C-w>` | Window commands |

---

## 🔧 DAP (Debug Adapter Protocol)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>dt` | n | Toggle breakpoint |
| `<leader>dc` | n | Continue |
| `<leader>do` | n | Step over |
| `<leader>di` | n | Step into |
| `<leader>du` | n | Step out |
| `<leader>dr` | n | Toggle REPL |
| `<leader>dl` | n | Run last |
| `<leader>dw` | n | Hover |
| `<leader>de` | n | Evaluate expression |

---

## 🤖 AI Plugins

### Copilot.lua

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Tab>` | i | Accept suggestion |
| `<C-]>` | i | Dismiss suggestion |
| `<M-]>` | i | Next suggestion |
| `<M-[>` | i | Previous suggestion |

### bropilot (Local Ollama)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<Tab>` | i | Accept suggestion |
| `<M-]>` | i | Next suggestion |
| `<M-[>` | i | Previous suggestion |
| `<C-]>` | i | Dismiss suggestion |
| `<leader>bp` | n | Open bropilot panel |

### gp.nvim (LLM Chat)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `:GpChatNew` | n | New chat |
| `:GpChatToggle` | n | Toggle chat |
| `:GpChatRespond` | n | Respond to chat |
| `<C-Enter>` | i | Send message |

### llm.nvim

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>lc` | n | New chat |
| `<leader>ld` | n | Close chat |
| `<C-Enter>` | i | Send message |

---

## 📋 TODO Comments

| Keybinding | Mode | Description |
|------------|------|-------------|
| `]t` | n | Next TODO |
| `[t` | n | Previous TODO |
| `<leader>xt` | n | Toggle TODO |

---

## 🖱️ Which-Key

| Keybinding | Description |
|------------|-------------|
| `<leader>` | Show all leader keybindings |
| `<leader><leader>` | Show more bindings |
| `g` | Show g-prefixed bindings |
| `z` | Show z-prefixed bindings |

---

## 🧩 Misc Commands

### General

| Command | Description |
|---------|-------------|
| `:w` | Save file |
| `:wq` / `:x` | Save and quit |
| `:q!` | Quit without saving |
| `:qa!` | Quit all without saving |
| `:e {file}` | Edit file |
| `:sp {file}` | Split horizontal |
| `:vs {file}` | Split vertical |
| `:tabnew` | New tab |
| `:tabclose` | Close tab |
| `:tabnext` / `:tabn` | Next tab |
| `:tabprev` / `:tabp` | Previous tab |
| `:Lazy` | Open Lazy UI |
| `:Mason` | Open LSP installer |
| `:TSInstall {lang}` | Install syntax parser |
| `:TSUpdate` | Update syntax parsers |

### Treesitter

| Command | Description |
|---------|-------------|
| `:TSInstall {lang}` | Install language parser |
| `:TSUninstall {lang}` | Uninstall parser |
| `:TSUpdate` | Update all parsers |
| `:TSPlaygroundToggle` | Toggle playground |

### LSP

| Command | Description |
|---------|-------------|
| `:LspInfo` | Show LSP info |
| `:LspRestart` | Restart LSP |
| `:Mason` | Open Mason (LSP manager) |

### Git

| Command | Description |
|---------|-------------|
| `:Git` | Open git command |
| `:Gdiffsplit` | Diff split |
| `:Gstatus` | Show git status |

---

## 🎨 UI Keybindings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-w>w` | n | Cycle windows |
| `<C-w>h` | n | Window left |
| `<C-w>j` | n | Window down |
| `<C-w>k` | n | Window up |
| `<C-w>l` | n | Window right |
| `<C-w>s` | n | Split horizontal |
| `<C-w>v` | n | Split vertical |
| `<C-w>q` | n | Close window |
| `<C-w>o` | n | Only (close others) |
| `<C-w>=` | n | Equal size |
| `<C-w>_` | n | Maximize height |
| `<C-w>|` | n | Maximize width |

---

## 🎨 Theme Picker & Lualine

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>TT` | n | Open theme picker |
| `:lua pick_theme()` | n | Open theme picker (command) |

### Theme Picker Navigation

| Keybinding | Description |
|------------|-------------|
| `<CR>` | Apply selected theme |
| `<C-c>` | Cancel |
| `<C-n>` / `j` | Next theme |
| `<C-p>` / `k` | Previous theme |

### Lualine Statusline

The statusline automatically switches themes to match your colorscheme:
- Shows: mode, branch, diff, diagnostics, filename, filetype, encoding, fileformat, filesize, progress, location
- Supports: TokyoNight, Catppuccin, Gruvbox, Kanagawa, Rose Pine, Everforest, Nightfox, Tender, Nord, Dracula, OneDark

---

## 📝 Quick Reference Card

```
╔══════════════════════════════════════════════════════════════╗
║                    ESSENTIAL SHORTCUTS                       ║
╠══════════════════════════════════════════════════════════════╣
║  <leader>ff   → Find files           <C-p>   → Find files    ║
║  <leader>fg   → Live grep            <C-n>   → File explorer ║
║  <leader><sp> → Recent files         <Tab>   → AI accept     ║
║  gd           → Go to definition     K       → Hover docs    ║
║  gcc          → Comment toggle       ]c/[c]   → Git hunk     ║
║  <leader>t    → Terminal toggle      <C-w>w  → Next window   ║
║  <leader>x    → Trouble toggle       <leader> → Which-key    ║
║  <leader>TT   → Theme picker         <leader>T → Theme/UI    ║
╚══════════════════════════════════════════════════════════════╝
```

---

## 🔑 Leader Key Map

| Prefix | Description |
|--------|-------------|
| `<leader>f` | Find/Telescope |
| `<leader>g` | Git |
| `<leader>h` | Git signs/Hunk |
| `<leader>t` | Terminal |
| `<leader>x` | Trouble/Diagnostics |
| `<leader>d` | Diagnostics |
| `<leader>c` | Code/LSP |
| `<leader>l` | LLM/AI |
| `<leader>n` | Neo-tree |
| `<leader>p` | Projects |
| `<leader>b` | Buffer/AI panel |
| `<leader>T` | Theme/UI |

---

## 💡 Pro Tips

1. **Use which-key**: Press `<leader>` to see all available keybindings
2. **Learn text objects**: `iw`, `ip`, `if`, `ic` will change your life
3. **Master motions**: `f`, `F`, `t`, `T`, `;`, `,` are your friends
4. **Use marks**: `m{a-z}` to set marks, `'{a-z}` to jump
5. **Repeat with dot**: `.` repeats the last change
6. **Register magic**: `"ay` to yank to register a, `"ap` to paste from a

---

> *"I have no special talent. I am only passionately curious about Neovim keybindings."*
> 
> — Albert Einstein (probably)

---

**Happy Hacking!** 🚀

*Last updated: January 2026 - Added theme picker & lualine auto-theming*
