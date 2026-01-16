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
    -- Theme
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
    { "tiagovla/tokyodark.nvim", lazy = false },
    { "catppuccin/nvim", lazy = false },
    { "ellisonleao/gruvbox.nvim", lazy = false },
    { "rebelot/kanagawa.nvim", lazy = false },
    { "rose-pine/neovim", lazy = false },
    { "sainnhe/everforest", lazy = false },
    { "EdenEast/nightfox.nvim", lazy = false },
    { "jacoborus/tender.vim", lazy = false },

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
    { "nvim-neotest/nvim-nio" },
    { "MunifTanjim/nui.nvim" },

    -- Multi-LLM Chat (Ollama/OpenAI/etc)
    { "Robitx/gp.nvim" },

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
    { "folke/which-key.nvim" },

    -- Todo Comments (TODO/FIXME highlighting)
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
