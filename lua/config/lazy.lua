-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
      }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Themes
    { import = "plugins.tokyonight" },
    { "tiagovla/tokyodark.nvim" },
    { "catppuccin/nvim", name = "catppuccin" },
    { "f4z3r/gruvbox-material.nvim", name = "gruvbox" },
    { "rebelot/kanagawa.nvim" },
    { "rose-pine/neovim", name = "rose-pine" },
    { "neanias/everforest-nvim" },
    { "EdenEast/nightfox.nvim" },
    { "jacoborus/tender.vim" },

    -- File Explorer
    { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x" },

    -- LSP and Mason
    { import = "plugins.dap" },
    { import = "plugins.lsp" },

    -- Completion
    { import = "plugins.completions" },

    -- Telescope
    { import = "plugins.telescope" },
    { import = "plugins.project" },

    -- Statusline
    { import = "plugins.lualine" },

    -- Dashboard
    { import = "plugins.alpha" },

    -- Git
    { import = "plugins.gitsigns" },

    -- Notifications
    { import = "plugins.notify" },

    -- Commenting
    { import = "plugins.comment" },

    -- Terminal
    { import = "plugins.toggleterm" },

    -- Troubleshooting
    { import = "plugins.trouble" },

    -- Treesitter
    { import = "plugins.treesitter" },

    -- Autopairs
    { import = "plugins.nvim-autopairs" },

    -- Icons
    { "nvim-tree/nvim-web-devicons" },
    { "echasnovski/mini.icons", version = false },
    { "nvim-neotest/nvim-nio" },
    { "MunifTanjim/nui.nvim" },

    -- Multi-LLM Chat (Ollama/OpenAI/etc)
    { import = "plugins.gp" },

    -- Local Copilot Alternative (Ollama)
    { "meeehdi-dev/bropilot.nvim" },

    -- Multi-Provider LLM
    {
      "Kurama622/llm.nvim",
      dependencies = { "MunifTanjim/nui.nvim" },
    },

    -- Copilot (Enhanced)
    { "zbirenbaum/copilot.lua" },

    -- Which Key (Keybinding hints)
    { import = "plugins.which" },
    { "folke/todo-comments.nvim" },

    -- Indent Blankline (Visual indentation)
    { "lukas-reineke/indent-blankline.nvim" },

    -- Inlay Hints (TypeScript/Rust)
    { "lvimuser/lsp-inlayhints.nvim" },

    -- Color Picker (CSS/JS/TS)
    { "uga-rosa/ccc.nvim" },

    -- Better Quickfix
    { "kevinhwang91/nvim-bqf" },
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
  concurrency = 8,
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
