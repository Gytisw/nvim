return {
  -- Tokyo Night theme
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  -- Tokyo Dark theme
  {
    "tiagovla/tokyodark.nvim",
    name = "tokyodark",
    lazy = false,
    priority = 1000,
    config = function()
      -- Don't apply here, alpha.lua will handle it
    end,
  },
}
