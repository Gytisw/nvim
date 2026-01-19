### 1. Basic File Operations

| Command | Description |
|---------|-------------|
| `nvim` | Launch Neovim. |
| `nvim <file>` | Open a file directly from the shell. |
| `:e <file>` | Edit/overwrite the current buffer with `<file>`. |
| `:w` | Write (save) the buffer. |
| `:q` | Quit the current window. |
| `:wq`, `ZZ` | Write & quit. |
| `:q!` | Quit without saving changes. |
| `:e#` | Switch to the alternate file (previous buffer). |

---

### 2. Navigation

| Normal‑mode key | What it does |
|-----------------|--------------|
| `h`/`j`/`k`/`l` | ← ↓ ↑ → (left, down, up, right) |
| `0`, `$` | Go to line start / end |
| `gg`, `G` | First / last line |
| `w`, `b`, `e` | Word forward, word back, end of word |
| `CTRL‑f`, `CTRL‑b` | Page down / up |
| `CTRL‑d`, `CTRL‑u` | Half‑page down / up |
| `:line_number` | Go to that line number |
| `:%s/old/new/gc` | Search & replace whole file with confirmation |

---

### 3. Editing

| Normal‑mode key | What it does |
|-----------------|--------------|
| `i`, `I` | Insert before cursor / at line start |
| `a`, `A` | Append after cursor / at line end |
| `o`, `O` | Open new line below/above current, go to Insert mode |
| `x`, `X` | Delete char under / before cursor |
| `dd`, `yy`, `cc` | Delete, yank (copy), change entire line |
| `D`, `C` | Delete / change to end of line |
| `p`, `P` | Paste after / before cursor |
| `r<char>` | Replace current char with `<char>` |
| `u`, `CTRL‑r` | Undo / redo |

**Text objects (with `d`, `y`, or `c`)**

| Object | Example |
|--------|---------|
| `iw` | Inside word |
| `aw` | Around word (including surrounding whitespace) |
| `i(` / `a(` | Inside / around parentheses |
| `i{` / `a{` | Inside / around braces |

---

### 4. Search

| Normal‑mode key | What it does |
|-----------------|--------------|
| `/pattern` | Search forward for `pattern`. |
| `?pattern` | Search backward. |
| `n`, `N` | Next / previous match (respecting direction). |
| `:%s/old/new/gc` | Replace all occurrences with confirmation. |

---

### 5. Marks & Registers

| Command | Description |
|---------|-------------|
| `m{a‑z}` | Set a mark `{a‑z}`. |
| `'a` / `` `a`` | Go to line (or exact position) of mark. |
| `"ay` / `"ap` | Yank into register `a`. |
| `"0p` | Paste the most recent yank. |
| `"1p`‑`"9p` | Paste from delete registers. |

---

### 6. Windows & Buffers

| Command | What it does |
|---------|--------------|
| `:split`, `:vsplit` (or `:sp`, `:vs`) | Split horizontally / vertically. |
| `<CTRL‑w> h/j/k/l` | Move focus to left/down/up/right window. |
| `<CTRL‑w> =` | Equalize all windows. |
| `<CTRL‑w> q` | Close current window. |
| `:bnext`, `:bprev` (or `:bn`, `:bp`) | Next / previous buffer. |
| `:bdelete` (or `:bd`) | Delete a buffer. |
| `:ls`, `:buffers` | List all buffers. |

---

### 7. Tabs

| Command | What it does |
|---------|--------------|
| `:tabnew` (or `:tabe`) | New tab. |
| `<CTRL‑w> t`, `<CTRL‑w> T` | Go to next / previous tab. |
| `:tabclose` (or `:tabc`) | Close current tab. |

---

### 8. Command‑Line Mode (`:`)

| Command | What it does |
|---------|--------------|
| `:!cmd` | Execute shell command `cmd`. |
| `:%y+` | Yank entire file into system clipboard (`+`). |
| `:set number`, `:set nonumber` | Toggle line numbers. |
| `:syntax on/off` | Enable/disable syntax highlighting. |
| `:colorscheme desert` | Change theme. |

---

### 9. Plugin & LSP (quick‑start)

1. **Plugin Manager** – *Packer* (recommended for Neovim):

   ```lua
   -- init.lua snippet
   require('packer').startup(function()
     use 'wbthomason/packer.nvim'  -- self‑update
     use { 'neovim/nvim-lspconfig', config = function() require('lsp-config') end }
     use 'nvim-telescope/telescope.nvim'
   end)
   ```

2. **LSP Commands** (assuming a language server is installed):

   | Key | Action |
   |-----|--------|
   | `gd` | Go to definition. |
   | `K`  | Show hover info. |
   | `<leader>rn` | Rename symbol. |
   | `<leader>ca` | Code action (quick fix). |

3. **Fuzzy Finder** – *Telescope*:

   | Key | Action |
   |-----|--------|
   | `<leader>ff` | Find files. |
   | `<leader>fg` | Live grep. |
   | `<leader>fb` | List buffers. |

---

### 10. Quick Reference Cheat Sheet (Inline)

| Mode | Key | Action |
|------|-----|--------|
| Normal | `i` | Insert before cursor |
| Normal | `a` | Append after cursor |
| Normal | `o` | Open line below |
| Normal | `dd` | Delete line |
| Normal | `yy` | Yank (copy) line |
| Normal | `p` | Paste after cursor |
| Normal | `/pattern` | Search forward |
| Normal | `n` | Next search match |
| Normal | `u` | Undo |
| Insert | `<Esc>` | Back to Normal |
| Visual | `v` | Character‑wise visual |
| Visual | `V` | Line‑wise visual |
| Visual | `<C‑c>` | Copy to clipboard (if compiled with +clipboard) |

---

#### 🎉 Bonus: One‑Liner Cheat Sheet

```text
# Navigation
h j k l 0 $ gg G w b e CTRL-f/b d u

# Editing
i I a A o O x X dd yy cc D C p P r<chr> u CTRL-r

# Search/Replace
/ pattern ? pattern n N :%s/old/new/gc

# Windows & Buffers
:sp vsplit <CTRL-w> h/j/k/l = q :bnext/prev :bd

# Marks & Registers
m{a-z} ' ` "ay "ap "0p "1p

# LSP / Telescope
gd K <leader>rn <leader>ca <leader>ff fg fb

# Quit
:wq ZZ :q! :e#
```