return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  },
  event = "BufReadPre",
  config = function()
    require("todo-comments").setup()
  end,
}
