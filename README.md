# My Neovim Configuration

This is my personal Neovim configuration, built to be a powerful and efficient development environment.

## Features

- **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Colorscheme:** [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- **UI:**
  - **Dashboard:** [alpha-nvim](https://github.com/goolord/alpha-nvim)
  - **File Explorer:** [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
  - **Statusline:** [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - **Notifications:** [nvim-notify](https://github.com/rcarriga/nvim-notify)
  - **Git Signs:** [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- **Development:**
  - **LSP:** [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) with [mason.nvim](https://github.com/williamboman/mason.nvim)
  - **Completions:** [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - **Formatting:** [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) (formats on save)
  - **Terminal:** [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
  - **Commenting:** [Comment.nvim](https://github.com/numToStr/Comment.nvim)
  - **Diagnostics:** [trouble.nvim](https://github.com/folke/trouble.nvim)

## Keybindings

| Keybinding      | Description                               |
| --------------- | ----------------------------------------- |
| `<leader>ff`    | Find files with Telescope                 |
| `<C-p>`         | Find files with Telescope                 |
| `<leader>fg`    | Live grep with Telescope                  |
| `<leader><leader>` | Find recent files with Telescope          |
| `<C-n>`         | Toggle file explorer (neo-tree)           |
| `<leader>gf`    | Format buffer                             |
| `<leader>t`     | Toggle terminal (toggleterm)              |
| `<leader>x`     | Toggle diagnostics list (trouble.nvim)    |
| `gd`            | Go to definition                          |
| `K`             | Hover documentation                       |
| `<leader>ca`    | Code actions                              |
| `gcc`           | Comment/uncomment current line            |
| `gc`            | Comment/uncomment selection               |

## Installation

1. Clone this repository to `~/.config/nvim`.
2. Start Neovim.

Lazy.nvim will automatically install all the plugins.
