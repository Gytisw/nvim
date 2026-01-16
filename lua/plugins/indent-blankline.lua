return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  config = function()
    require("indent_blankline").setup({
      show_end_of_line = true,
      show_current_context = true,
      use_treesitter = true,
    })
  end,
}
