return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  config = function()
    require("bqf").setup({
      auto_resize_height = true,
      func_map = {
        prev = "<",
        next = ">",
        stdev = "<",
        toggle = "<leader>t",
      },
      quickfix = {
        func_map = {
          fix = "<leader>f",
          sfix = "<leader>s",
        },
      },
    })
  end,
}
