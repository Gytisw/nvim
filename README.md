# 🚀 My Neovim Configuration

> *Because spending 40 hours configuring your editor is clearly more efficient than learning to use it properly.*

Welcome to my Neovim configuration - a carefully crafted, battle-tested setup that took approximately forever to get right. This config is designed for developers who want a powerful, productive editing experience without the carpal tunnel.

![Neovim](https://img.shields.io/badge/Neovim-0.10.0+-blueviolet?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-5.4-blue?style=for-the-badge&logo=lua)
![LazyVim](https://img.shields.io/badge/LazyVim-compatible-green?style=for-the-badge)

---

## ✨ Features

### 🧠 AI-Powered Development

Because typing code manually is so 2023, this config includes multiple AI options:

| Plugin | What It Does | Privacy |
|--------|-------------|---------|
| **Copilot.lua** | GitHub Copilot integration | ☁️ Cloud |
| **bropilot.nvim** | Local Copilot alternative | 🔒 Local (Ollama) |
| **gp.nvim** | Chat with LLMs (Ollama, OpenAI, Anthropic) | 🔒/☁️ Both |

> **Pro tip:** If you're using Ollama, bropilot gives you Copilot-like completions without sending code to the cloud. Your secrets remain... secret.

### 🎨 Beautiful UI

- **Tokyonight** theme - The only theme that makes 3 AM look productive
- **Neo-tree** - File explorer that doesn't make you want to use VS Code
- **Lualine** - Status line with **auto theme switching** and **tabline** for multi-tab editing
- **Alpha-nvim** - Dashboard so pretty you'll forget you're in a terminal
- **Theme Picker** - Pick from 9 themes (Tokyonight, Catppuccin, Gruvbox, Kanagawa, Rose Pine, Everforest, Nightfox, Tender, Tokyodark)
- **No clutter** - End-of-buffer ~ characters removed for clean look

### 🛠️ Professional Toolkit

- **LSP Support**: Lua, Python, TypeScript, Rust, Go, C/C++, JSON, and more
- **Completion**: nvim-cmp with LuaSnip for snippet magic
- **Treesitter**: Syntax highlighting that actually makes sense
- **Git Integration**: gitsigns, telescope git commands
- **Debugging**: nvim-dap for when `print()` just isn't enough

---

## 📦 Plugins

### Core Essentials

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (the only one that doesn't make you wait) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Language Server Protocol configuration |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine (the good kind) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting done right |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (faster than finding things manually) |

### Productivity Powerhouses

| Plugin | Purpose |
|--------|---------|
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Shows you what keys do before you press them |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlights TODO, FIXME, and your broken promises |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Visual indentation guides (no more counting spaces) |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Manipulate surrounding characters like a wizard |

### Git & Debugging

| Plugin | Purpose |
|--------|---------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in the gutter (no more guessing) |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics list (when things go wrong) |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol (for actual debugging) |

---

## 🚀 Quick Start

### Prerequisites

- **Neovim 0.10.0+** (older versions will work but why would you?)
- **Git** (for cloning things)
- **A terminal** (unless you enjoy pain)
- **Brain** (optional but recommended)

### Installation

```bash
# Clone this config
git clone https://github.com/yourusername/nvim-config ~/.config/nvim

# Start Neovim (Lazy will install everything)
nvim

# Go make coffee (first startup takes a moment)
```

> **Note:** On first launch, Lazy will clone and install all plugins. This is normal. The plugins are not judging you for the time it takes.

### AI Setup

#### GitHub Copilot
```vim
:Copilot setup
```
Then authenticate with GitHub. Simple as that.

#### Local with Ollama
```bash
# Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# Start Ollama
ollama serve &

# Install a coding model
ollama pull codellama

# Or use any model you prefer
ollama pull deepseek-coder
ollama pull qwen2.5-coder
```

#### Configure gp.nvim for Ollama
Edit `lua/plugins/gp.lua` and set your endpoint:
```lua
providers = {
  ollama = {
    endpoint = "http://localhost:11434/v1/chat/completions",
    model = "codellama",  -- or your preferred model
  },
}
```

---

## 📖 Documentation

### Keybindings

For a comprehensive list of all keybindings and commands, see:
👉 **[KEYBINDINGS.md](./KEYBINDINGS.md)**

> *Warning: This cheat sheet is extensive. Possibly longer than some actual documentation.*

---

## 🎛️ Configuration

### File Structure

```
nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # Plugin manager setup
│   │   └── options.lua   # Neovim options
│   └── plugins/
│       ├── *.lua         # Individual plugin configs
│       └── ...
└── README.md             # You are here
```

### Customization

**Want to change the theme?**
Use the built-in theme picker:
```vim
:lua pick_theme()  " or <leader>TT
```
Theme is saved automatically and persists across sessions.

**Want to customize the theme further?**
Edit `lua/plugins/tokyonight.lua` or `lua/config/lazy.lua`:
```lua
{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
```

**Lualine auto-theming:**
The statusline automatically switches themes to match your colorscheme. Supported themes:
- TokyoNight, TokyoDark, Catppuccin, Gruvbox, Kanagawa, Rose Pine, Everforest, Nightfox, Tender, Nord, Dracula, OneDark

**Want to add more LSP servers?**
Edit `lua/plugins/lsp.lua` and add:
```lua
vim.lsp.config.your_server = {
  on_attach = on_attach,
  capabilities = capabilities,
}
```

**Want to change keybindings?**
Check `lua/plugins/*.lua` files for plugin-specific bindings.

---

## 🧪 Performance

This config is optimized for speed:

- **Lazy loading**: Plugins only load when needed (~11ms startup with proper config)
- **Disabled runtime plugins**: gzip, tarPlugin, tohtml, tutor, zipPlugin
- **Bytecode compilation**: Lua modules are precompiled

Run profiling to see startup time:
```vim
:Lazy profile
```

---

## 🆘 Troubleshooting

### "Help, nothing works!"

1. Restart Neovim (yes, really)
2. Run `:Lazy clean` then `:Lazy sync`
3. Check your Neovim version: `nvim --version`
4. Cry softly (optional but effective)

### "AI isn't working!"

- **Copilot**: Run `:Copilot status` to check authentication
- **Ollama**: Make sure `ollama serve` is running
- **gp.nvim**: Check `lua/plugins/gp.lua` for correct endpoint

### "Where is [feature]?"

Check the [KEYBINDINGS.md](./KEYBINDINGS.md) file. If it's not there, it probably doesn't exist... yet.

### "Help, nothing shows in which-key!"

Press `<leader>` to see all available keybindings. All keybindings are now registered with clear descriptions.

### "Lualine statusline isn't showing!"

1. Run `:Lazy sync` to ensure the config is loaded
2. Check `:lua print(require('lualine').get_config())` to verify setup
3. The statusline should automatically match your colorscheme theme

### "How do I use tabs?"

This config supports full tab functionality:
- `<leader>to` - Open new tab
- `<leader>tc` - Close tab
- `<leader>tn` / `<leader>tp` - Next/Previous tab
- `<leader>tf` / `<leader>tl` - First/Last tab
- Visual tabline shows all open tabs with buffer names

---

## 📝 Acknowledgments

- **@folke** - For lazy.nvim, which-key, tokyonight, and basically making Neovim usable
- **The Neovim team** - For making the best text editor better
- **Stack Overflow** - For all the answers I copied without understanding
- **Coffee** - The real plugin powering this config

---

## 📜 License

MIT License - Because sharing is caring.

---

## 🤝 Contributing

Found a bug? Have a suggestion? Want to tell me about a plugin I missed?

1. Open an issue
2. Or better yet, fix it and PR
3. Or even better, just use it and enjoy

---

> *"I used to think Neovim was difficult. Then I spent 6 hours configuring it. Now I think it's difficult."*
> 
> — Everyone who has ever configured Neovim

---

**Happy hacking!** 🚀

*P.S. If you're reading this, you probably should have been working instead of configuring your editor.*

*Last updated: January 2026 - Added <leader>n for Neotree, tab support, 100+ keybindings, fillchars, cleaned duplicates*
