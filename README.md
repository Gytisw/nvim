# 🚀 My Neovim Configuration

> *Because spending 40 hours configuring your editor is clearly more efficient than learning to use it properly.*

Welcome to my Neovim configuration - a carefully crafted, battle-tested setup that took approximately forever to get right. This config is designed for developers who want a powerful, productive editing experience without the carpal tunnel.

![Neovim](https://img.shields.io/badge/Neovim-0.11+-blueviolet?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-5.4-blue?style=for-the-badge&logo=lua)
![Cross Platform](https://img.shields.io/badge/Cross_Platform-macOS%20%7C%20Linux%20%7C%20Windows%20%7C%20Termux-green?style=for-the-badge)

---

## ✨ Features

### 🌍 Cross-Platform Support

This configuration works seamlessly across all platforms:

| Platform | LSP Installation | Auto-Setup |
|----------|------------------|------------|
| **macOS** | Mason (automatic) | ✅ |
| **Linux** | Mason (automatic) | ✅ |
| **Windows** | Mason (automatic) | ✅ |
| **Termux (Android)** | Smart auto-installer | ✅ |

> **Termux Users**: On first launch, you'll be prompted to install missing LSP servers automatically. No manual setup required!

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

- **LSP Support**: Lua, Python, TypeScript, Rust, Go, C/C++, JSON, YAML, HTML, CSS, Bash, and more
- **Smart LSP Detection**: Automatically finds and uses installed language servers
- **Completion**: nvim-cmp with LuaSnip for snippet magic
- **Treesitter**: Syntax highlighting that actually makes sense
- **Git Integration**: gitsigns, telescope git commands
- **Diagnostics**: Trouble v3 for beautiful error/warning lists
- **Formatting**: Conform.nvim for consistent code formatting
- **Debugging**: nvim-dap for when `print()` just isn't enough

---

## 📦 Plugins

### Core Essentials

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (the only one that doesn't make you wait) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Language Server Protocol configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/Linter installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine (the good kind) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting done right |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (faster than finding things manually) |

### Productivity Powerhouses

| Plugin | Purpose |
|--------|---------|
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Shows you what keys do before you press them |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Fast, flexible code formatting |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlights TODO, FIXME, and your broken promises |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Visual indentation guides (no more counting spaces) |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Manipulate surrounding characters like a wizard |

### Git & Debugging

| Plugin | Purpose |
|--------|---------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in the gutter (no more guessing) |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics list v3 (when things go wrong) |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol (for actual debugging) |

---

## 🚀 Quick Start

### Prerequisites

- **Neovim 0.11.0+** (uses native LSP config API)
- **Git** (for cloning things)
- **A terminal** (unless you enjoy pain)
- **Node.js** (for many LSP servers)

### Installation

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this config
git clone https://github.com/yourusername/nvim-config ~/.config/nvim

# Start Neovim (Lazy will install everything)
nvim

# Go make coffee (first startup takes a moment)
```

> **Note:** On first launch, Lazy will clone and install all plugins. This is normal. The plugins are not judging you for the time it takes.

### Platform-Specific Notes

#### macOS / Linux / Windows
Mason will automatically install all configured LSP servers. No additional setup required.

#### Termux (Android)
On first launch, you'll see a prompt:

```
┌──────────────────────────────────┐
│ Missing LSP servers detected:    │
│   • Bash LSP                     │
│   • TypeScript/JavaScript LSP    │
│   • Python LSP                   │
│                                  │
│ Install now?                     │
│ [Yes] [Later] [Never]            │
└──────────────────────────────────┘
```

Select "Yes" to install everything automatically. Or run `:TermuxLspInstall` later.

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
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # Plugin manager setup
│   │   ├── options.lua         # Neovim options
│   │   └── termux.lua          # Termux LSP auto-installer
│   └── plugins/
│       ├── lsp.lua             # Cross-platform LSP configuration
│       ├── completions.lua     # nvim-cmp setup
│       ├── conform.lua         # Code formatting
│       ├── trouble.lua         # Diagnostics (v3)
│       ├── telescope.lua       # Fuzzy finder
│       ├── treesitter.lua      # Syntax highlighting
│       ├── which.lua           # Keybinding hints
│       └── ...                 # Other plugin configs
├── README.md                   # You are here
└── KEYBINDINGS.md              # Complete keybinding reference
```

### LSP Configuration

The LSP setup uses Neovim 0.11's native `vim.lsp.config()` and `vim.lsp.enable()` API:

```lua
-- Adding a new LSP server
-- In lua/plugins/lsp.lua, add to the servers table:
servers = {
  your_server = {
    args = { "--stdio" },
    filetypes = { "yourfiletype" },
    settings = {
      -- your settings
    },
  },
}

-- Then add to lsp_executables for cross-platform support:
lsp_executables = {
  your_server = { "your-server-binary", "alternative-name" },
}
```

### Customization

**Want to change the theme?**
Use the built-in theme picker:
```vim
:lua pick_theme()  " or <leader>TT
```
Theme is saved automatically and persists across sessions.

**Want to check LSP status?**
```vim
:LspStatus    " Shows available/missing LSP servers
:LspInfo      " Built-in Neovim LSP info
```

**Want to format code?**
```vim
<leader>cf    " Format with conform.nvim
```

---

## 🔧 Commands Reference

### LSP Commands

| Command | Description |
|---------|-------------|
| `:LspStatus` | Show which LSP servers are available/missing |
| `:LspInfo` | Show attached LSP clients for current buffer |
| `:LspRestart` | Restart all attached LSP clients |

### Termux Commands (Termux only)

| Command | Description |
|---------|-------------|
| `:TermuxLspInstall` | Install all missing LSP servers |
| `:TermuxLspStatus` | Show LSP installation status |
| `:TermuxLspReset` | Re-enable installation prompt |

### Formatting Commands

| Command | Description |
|---------|-------------|
| `:ConformInfo` | Show formatter status |
| `<leader>cf` | Format current buffer |

### Diagnostics Commands

| Command | Description |
|---------|-------------|
| `:Trouble diagnostics` | Open workspace diagnostics |
| `:Trouble diagnostics filter.buf=0` | Open buffer diagnostics |
| `:Trouble symbols` | Open document symbols |
| `:Trouble qflist` | Open quickfix list |

---

## 🧪 Performance

This config is optimized for speed:

- **Lazy loading**: Plugins only load when needed
- **Native LSP API**: Uses Neovim 0.11's built-in LSP configuration
- **Smart LSP detection**: Only enables LSPs that are actually installed
- **Disabled runtime plugins**: gzip, tarPlugin, tohtml, tutor, zipPlugin
- **Bytecode compilation**: `vim.loader.enable()` for faster Lua loading

Run profiling to see startup time:
```vim
:Lazy profile
```

---

## 📱 Termux (Android) Support

This configuration has first-class support for Termux on Android.

### How It Works

1. **Automatic Detection**: The config detects when running on Termux
2. **Smart PATH Handling**: Adds Termux-specific paths and environment variables
3. **LSP Auto-Installer**: Prompts to install missing LSP servers on first launch
4. **Optimized Settings**: Reduces resource usage for mobile devices

### Manual Installation (if needed)

If the auto-installer doesn't work, you can install LSPs manually:

```bash
# Install base packages
pkg install nodejs npm python clang

# Install Node-based LSPs
npm install -g bash-language-server
npm install -g typescript typescript-language-server
npm install -g vscode-langservers-extracted  # json, css, html
npm install -g yaml-language-server
npm install -g pyright

# Install pkg-based LSPs
pkg install lua-language-server gopls rust-analyzer
```

### Supported LSPs on Termux

| LSP | Language | Install Method |
|-----|----------|----------------|
| lua-language-server | Lua | pkg |
| bash-language-server | Bash/Shell | npm |
| typescript-language-server | TypeScript/JavaScript | npm |
| pyright | Python | npm |
| vscode-langservers-extracted | JSON/HTML/CSS | npm |
| yaml-language-server | YAML | npm |
| clangd | C/C++ | pkg (clang) |
| gopls | Go | pkg |
| rust-analyzer | Rust | pkg |

---

## 🆘 Troubleshooting

### "Help, nothing works!"

1. Restart Neovim (yes, really)
2. Run `:Lazy clean` then `:Lazy sync`
3. Check your Neovim version: `nvim --version` (need 0.11+)
4. Run `:checkhealth` for diagnostics

### "LSP isn't working!"

1. Run `:LspStatus` to see which servers are available
2. Run `:LspInfo` to see attached clients
3. Check if the executable is in PATH: `:!which lua-language-server`
4. On Termux: Run `:TermuxLspInstall` to install missing servers

### "Trouble shows no diagnostics!"

Make sure you're using the correct Trouble v3 commands:
- `:Trouble diagnostics toggle` (workspace)
- `:Trouble diagnostics toggle filter.buf=0` (current buffer)

### "AI isn't working!"

- **Copilot**: Run `:Copilot status` to check authentication
- **Ollama**: Make sure `ollama serve` is running
- **gp.nvim**: Check `lua/plugins/gp.lua` for correct endpoint

### "Formatting isn't working!"

1. Run `:ConformInfo` to see formatter status
2. Make sure the formatter is installed (e.g., `stylua`, `prettier`)
3. Check if there's a config file in your project

---

## 📝 Changelog

### January 2026 (Latest)

- **🚀 Neovim 0.11 Native LSP**: Migrated to `vim.lsp.config()` and `vim.lsp.enable()` API
- **🌍 Cross-Platform LSP**: Intelligent executable detection for all platforms
- **📱 Termux Auto-Installer**: Automatic LSP installation on Android
- **🔧 Trouble v3**: Updated to new Trouble API with better diagnostics
- **⚡ Performance**: Removed accidental JIT disable, faster startup
- **🔄 Fixed**: Correct VSCode language server names (vscode-json-language-server, etc.)
- **🗑️ Removed**: Deprecated lsp-inlayhints.nvim (using native inlay hints)
- **📋 Commands**: Added `:LspStatus`, `:TermuxLspInstall`, `:TermuxLspStatus`

---

## 📝 Acknowledgments

- **@folke** - For lazy.nvim, which-key, tokyonight, trouble.nvim, and basically making Neovim usable
- **@williamboman** - For mason.nvim, making LSP installation painless
- **@stevearc** - For conform.nvim, making formatting just work
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

> *"I used to think Neovim was difficult. Then I spent 6 hours configuring it. Now I think it's even more difficult but at least it looks pretty."*
> 
> — Everyone who has ever configured Neovim

---

**Happy hacking!** 🚀

*P.S. If you're reading this, you probably should have been working instead of configuring your editor.*
