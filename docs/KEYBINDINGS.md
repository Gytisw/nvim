# 📋 Neovim Configuration - Keybindings & Commands Cheat Sheet

> *Because remembering 100+ keybindings is a superpower. Or a disorder.*

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

## 🚀 Essential Quick Reference

```
╔═══════════════════════════════════════════════════════════════════════════════════╗
║                           ESSENTIAL SHORTCUTS                                     ║
╠═══════════════════════════════════════════════════════════════════════════════════╣
║  <leader>ff   → 🔍 Search files          <C-p>   → 🔍 Quick file search          ║
║  <leader>fg   → 📝 Live grep             <C-n>   → 📁 Toggle explorer            ║
║  <leader><sp> → 📂 Recent files          <Tab>   → AI/Complete accept            ║
║  gd           → → Go to definition       K       → 💭 Hover docs                 ║
║  gcc          → 💬 Comment toggle        ]c/[c   → Git hunk nav                  ║
║  <leader>tt   → 📦 Terminal toggle       <C-w>w  → Next window                   ║
║  <leader>xx   → ⚠️ Trouble diagnostics   <leader>→ Show all bindings             ║
║  <leader>TT   → 🎨 Change theme          <leader>oo → 📄 New tab                 ║
╚═══════════════════════════════════════════════════════════════════════════════════╝
```

Press `<leader>` to see ALL keybindings in a popup menu!

---

## 📁 Neo-tree (File Explorer)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>nt` | n | 📁 Toggle file explorer |
| `<C-n>` | n | 📁 Toggle file explorer (alternative) |
| `<leader>nb` | n | 📑 Toggle buffer explorer |
| `<leader>ng` | n | 📊 Toggle git status |
| `<leader>ns` | n | 🏷️ Toggle document symbols |

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
| `a` | Add file |
| `A` | Add directory |
| `d` | Delete file/directory |
| `r` | Rename file/directory |
| `y` | Copy to clipboard |
| `x` | Cut to clipboard |
| `p` | Paste from clipboard |
| `z` | Collapse all nodes |

---

## 🔍 Telescope (Fuzzy Finder)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>ff` | n | 🔍 Search files in project |
| `<leader>fg` | n | 📝 Live grep text |
| `<leader>fb` | n | 📑 Find open buffers |
| `<leader>fh` | n | 📖 Find help topics |
| `<leader>fp` | n | 📁 Find projects |
| `<leader><leader>` | n | 📂 Recent files |
| `<C-p>` | n | 🔍 Quick file search |
| `<leader>cD` | n | 🔍 Find diagnostics |

### Telescope Navigation (Inside Telescope)

| Keybinding | Description |
|------------|-------------|
| `<CR>` | Open selected |
| `<C-v>` | Open in vertical split |
| `<C-s>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `<C-c>` / `<Esc>` | Close telescope |
| `<C-j>` / `<C-n>` | Move selection down |
| `<C-k>` / `<C-p>` | Move selection up |

---

## 📄 Tabs

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>oo` | n | 📄 New tab |
| `<leader>oc` | n | ❌ Close tab (bdelete if last) |
| `<leader>on` | n | ➡️ Next tab |
| `<leader>op` | n | ⬅️ Previous tab |
| `<leader>of` | n | ⏮️ First tab |
| `<leader>ol` | n | ⏭️ Last tab |
| `<leader>om` | n | ↔️ Move tab |

**Note:** Visual tabline shows all open tabs at the top of the window.

---

## 📑 Buffers

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>bd` | n | ❌ Delete buffer |
| `<leader>bD` | n | ❌ Force delete buffer |
| `<leader>bn` | n | ➡️ Next buffer |
| `<leader>bp` | n | ⬅️ Previous buffer |
| `<leader>bf` | n | ⏮️ First buffer |
| `<leader>bl` | n | ⏭️ Last buffer |
| `<leader>bs` | n | 🔍 Switch buffer |

---

## 🪟 Windows

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-w>w` | n | Cycle windows |
| `<C-w>h` / `<leader>wh` | n | Window left |
| `<C-w>j` / `<leader>wj` | n | Window down |
| `<C-w>k` / `<leader>wk` | n | Window up |
| `<C-w>l` / `<leader>wl` | n | Window right |
| `<C-w>s` / `<leader>ws` | n | Split horizontal |
| `<C-w>v` / `<leader>wv` | n | Split vertical |
| `<C-w>q` / `<leader>wq` | n | ❌ Close window |
| `<C-w>o` / `<leader>wo` | n | ❌ Close other windows |
| `<C-w>=` / `<leader>w=` | n | ⇔ Equal size |
| `<C-w>_` / `<leader>w_` | n | ⇕ Maximize height |
| `<C-w>|` / `<leader>w|` | n | ⇒ Maximize width |

---

## 🐛 Git (gitsigns)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `]c` | n | ➡️ Next hunk |
| `[c` | n | ⬅️ Previous hunk |
| `<leader>hs` | n | + Stage git hunk |
| `<leader>hr` | n | - Reset git hunk |
| `<leader>hS` | n | ++ Stage all hunks |
| `<leader>hu` | n | ↩️ Undo stage |
| `<leader>hR` | n | ⟲ Reset buffer |
| `<leader>hp` | n | 👁️ Preview hunk |
| `<leader>hd` | n | ⏸️ Diff this |
| `<leader>hD` | n | ⏸️ Diff this (~) |
| `<leader>hb` | n | 💬 Blame line |
| `<leader>hT` | n | 👁️ Show deleted |
| `ih` | o/v | ⊙ Select hunk |

---

## ⚠️ Trouble v3 (Diagnostics)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>xx` | n | ⚠️ Toggle workspace diagnostics |
| `<leader>xX` | n | ⚠️ Toggle buffer diagnostics |
| `<leader>xs` | n | 🏷️ Toggle document symbols |
| `<leader>xq` | n | 📋 Toggle quickfix list |
| `<leader>xl` | n | 📍 Toggle location list |

### Trouble Navigation

| Keybinding | Description |
|------------|-------------|
| `<CR>` | Jump to item |
| `o` | Jump and close |
| `<C-s>` | Open in split |
| `<C-v>` | Open in vsplit |
| `q` | Close trouble |
| `r` | Refresh |

### Trouble Commands

```vim
:Trouble diagnostics toggle              " Workspace diagnostics
:Trouble diagnostics toggle filter.buf=0 " Buffer diagnostics only
:Trouble symbols toggle                  " Document symbols
:Trouble qflist toggle                   " Quickfix list
:Trouble loclist toggle                  " Location list
```

---

## 💬 Comments (Comment.nvim)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gcc` | n/v | 💬 Comment/uncomment line/selection |
| `gc` | o | Comment selection |
| `gcO` | n | Add comment above |
| `gco` | n | Add comment below |
| `gcA` | n | Add comment at end of line |

---

## 🎮 Terminal (toggleterm)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>tt` | n | 📦 Toggle terminal |
| `<leader>tf` | n | 🪟 Float terminal |
| `<leader>th` | n | ⬇️ Horizontal terminal |
| `<leader>tv` | n | ➡️ Vertical terminal |
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
| `<leader>Dt` | n | ● Toggle breakpoint |
| `<leader>Dc` | n | ▶️ Continue |
| `<leader>Do` | n | ⏭️ Step over |
| `<leader>Di` | n | ⏭️ Step into |
| `<leader>Du` | n | ⏮️ Step out |
| `<leader>Dr` | n | 🔲 Toggle REPL |
| `<leader>Dl` | n | ▶️ Run last |
| `<leader>Dw` | n | 💬 Widget hover |
| `<leader>De` | n | 🧪 Evaluate expression |
| `<leader>Db` | n | ❗ Conditional breakpoint |
| `<leader>Dp` | n | 📝 Log point |

---

## 🔧 LSP (Language Server)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `gd` | n | → Go to definition |
| `gD` | n | → Go to declaration |
| `gi` | n | → Go to implementation |
| `gr` | n | → Find references |
| `K` | n | 💭 Hover documentation |
| `<leader>ca` | n | 💡 Code actions |
| `<leader>rn` | n | 📝 Rename symbol |
| `<leader>cd` | n | 💬 Show diagnostics float |
| `<leader>cD` | n | 🔍 Find diagnostics (Telescope) |
| `<leader>cf` | n | 🎨 Format code |
| `[d` | n | ⬅️ Previous diagnostic |
| `]d` | n | ➡️ Next diagnostic |

### LSP Commands

```vim
:LspStatus            " Show available LSP servers
:LspInfo              " Show attached clients
:LspRestart           " Restart attached clients
```

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
| `<leader>lb` | n | 🤖 Toggle Bropilot |

### gp.nvim (LLM Chat)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>lgc` | n | 💬 New AI chat |
| `<leader>lgt` | n | 📎 Toggle AI chat |
| `<leader>lgr` | n | ↩️ Respond to chat |

---

## 📋 TODO Comments

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>tdt` | n | 🔍 Find TODO comments |
| `<leader>tdn` | n | ➡️ Next TODO |
| `<leader>tdp` | n | ⬅️ Previous TODO |
| `<leader>tda` | n | 📋 Show all TODOs |

---

## 🎨 Theme Picker & UI

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>TT` | n | 🎨 Change color scheme |
| `<leader>Tt` | n | 🎨 Pick theme (Telescope) |

---

## 🚪 Quit & Session

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>qq` | n | 🚪 Quit all |
| `<leader>qw` | n | 🚪 Force quit all |
| `<leader>qs` | n | 💾 Save session |
| `<leader>ql` | n | 📂 Load session |

---

## 🎯 Text Objects (Treesitter)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `af` | o/v | Around function |
| `if` | o/v | Inside function |
| `ac` | o/v | Around class |
| `ic` | o/v | Inside class |
| `ab` | o/v | Around block |
| `ib` | o/v | Inside block |
| `aa` | o/v | Around parameter |
| `ia` | o/v | Inside parameter |
| `al` | o/v | Around loop |
| `il` | o/v | Inside loop |

### Treesitter Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `]m` | n | Next function start |
| `]M` | n | Next function end |
| `[m` | n | Previous function start |
| `[M` | n | Previous function end |
| `]]` | n | Next class start |
| `][` | n | Next class end |
| `[[` | n | Previous class start |
| `[]` | n | Previous class end |

---

## ✂️ Surround (nvim-surround)

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
ysiw"         → "word"
ysiw(         → (word)
ds"           → word
cs"'          → 'word'
```

---

## 🧩 Additional Keybindings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>aa` | n | Select all |
| `<leader>ac` | n | 🔍 Find commands |
| `<leader>ak` | n | 🔍 Find keymaps |
| `<leader>am` | n | 🔍 Find marks |
| `<leader>zz` | n | 🧘 Zen mode |
| `<leader>zt` | n | 🌅 Twilight focus |
| `<leader>za` | n | ⟷ Toggle autopairs |
| `<leader>zi` | n | 📍 Toggle inlay hints |

---

## 📝 Editing

### Undo/Redo

| Keybinding | Mode | Description |
|------------|------|-------------|
| `u` | n | ↩️ Undo |
| `<C-r>` | n | ↪️ Redo |
| `U` | n | ↪️ Redo (uppercase alias) |

### Yank/Paste

| Keybinding | Mode | Description |
|------------|------|-------------|
| `y` | v | Yank selection |
| `yy` | n | Yank line |
| `Y` | n | Yank to end of line |
| `p` | n | Paste after cursor |
| `P` | n | Paste before cursor |

### Completion (nvim-cmp)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-Space>` | i | ✨ Trigger completion |
| `<CR>` | i | ✓ Confirm selection |
| `<C-e>` | i | ✕ Abort completion |
| `<Tab>` | i | Next item / Expand snippet |
| `<S-Tab>` | i | Previous item |
| `<C-b>` | i | Scroll docs up |
| `<C-f>` | i | Scroll docs down |

---

## 🔑 Leader Key Map

| Prefix | Category | Keybindings |
|--------|----------|-------------|
| `<leader>f` | Find/Telescope | ff, fg, fb, fh, fp |
| `<leader>n` | Neo-tree | nt, nb, ng, ns |
| `<leader>h` | Git Hunk | hs, hr, hS, hu, hR, hp, hd, hD, hb, hT |
| `<leader>x` | Trouble | xx, xX, xs, xq, xl |
| `<leader>c` | Code/LSP | ca, cd, cD, cf |
| `<leader>l` | AI/LLM | lb, lgc, lgt, lgr |
| `<leader>T` | Theme/UI | TT, Tt |
| `<leader>D` | Debug | Dt, Dc, Do, Di, Du, Dr, Dl, Dw, De, Db, Dp |
| `<leader>t` | Terminal | tt, tf, th, tv |
| `<leader>b` | Buffer | bd, bD, bn, bp, bf, bl, bs |
| `<leader>w` | Window | wh, wj, wk, wl, ws, wv, wq, wo |
| `<leader>o` | Tabs | oo, oc, on, op, of, ol, om |
| `<leader>td` | TODO Comments | tdt, tdn, tdp, tda |
| `<leader>q` | Quit/Session | qq, qw, qs, ql |
| `<leader>a` | Alternatives | aa, ac, ak, am |
| `<leader>z` | Quick Actions | zz, zt, za, zi |
| `<leader>rn` | Rename | LSP rename symbol |

---

## 📱 Termux Commands

These commands are only available on Termux (Android):

| Command | Description |
|---------|-------------|
| `:TermuxLspInstall` | Install all missing LSP servers |
| `:TermuxLspStatus` | Show which LSPs are installed |
| `:TermuxLspReset` | Re-enable the installation prompt |

---

## 💡 Pro Tips

1. **Use which-key**: Press `<leader>` to see ALL available keybindings organized by category
2. **Learn text objects**: `af`, `if`, `ac`, `ic` will change your life
3. **Master motions**: `f`, `F`, `t`, `T`, `;`, `,` are your friends
4. **Use marks**: `m{a-z}` to set marks, `'{a-z}` to jump
5. **Repeat with dot**: `.` repeats the last change
6. **Registers**: `"ay` to yank to register a, `"ap` to paste from a
7. **Check LSP status**: `:LspStatus` shows what's available
8. **Trouble v3**: Use `:Trouble diagnostics toggle` for the new API

---

> *"I have no special talent. I am only passionately curious about Neovim keybindings."*
>
> — Albert Einstein (probably)

---

**Happy Hacking!** 🚀

*Last updated: January 2026 - Updated for Trouble v3, Neovim 0.11 native LSP API, cross-platform support, Termux commands*
