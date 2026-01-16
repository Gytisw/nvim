return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      plugins = {
        spelling = {
          enabled = true,
        },
      },
      icons = {
        breadcrumb = true,
        separator = " ",
      },
      win = {
        border = "rounded",
      },
    })
  end,
}
