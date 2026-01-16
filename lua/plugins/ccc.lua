return {
  "uga-rosa/ccc.nvim",
  ft = { "css", "scss", "less", "sass", "html", "javascript", "typescript" },
  config = function()
    require("ccc").setup()
  end,
}
