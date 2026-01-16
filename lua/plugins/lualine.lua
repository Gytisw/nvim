return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    -- Map colorscheme names to lualine theme names
    local theme_map = {
      ["tokyonight"] = "tokyonight",
      ["tokyodark"] = "tokyodark",
      ["catppuccin"] = "catppuccin",
      ["catppuccin-mocha"] = "catppuccin",
      ["gruvbox"] = "gruvbox",
      ["gruvbox-material"] = "gruvbox",
      ["kanagawa"] = "kanagawa",
      ["rose-pine"] = "rose-pine",
      ["everforest"] = "everforest",
      ["nightfox"] = "nightfox",
      ["tender"] = "tender",
      ["nord"] = "nord",
      ["dracula"] = "dracula",
      ["onedark"] = "onedark",
      ["onedarkpro"] = "onedark",
    }

    -- Get current colorscheme and find matching lualine theme
    local colorscheme = vim.g.colors_name or "tokyonight"
    local lualine_theme = theme_map[colorscheme] or "auto"

    -- If the mapped theme doesn't exist, fall back to 'auto'
    local status_ok, theme_def = pcall(require, "lualine.themes." .. lualine_theme)
    if not status_ok then
      lualine_theme = "auto"
    end

    require("lualine").setup({
      options = {
        theme = lualine_theme,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename", "filetype" },
        lualine_x = { "encoding", "fileformat", "filesize" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
      },
      winbar = {},
      extensions = { "neo-tree", "fugitive" },
    })
  end,
}
