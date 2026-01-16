return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true, auto_accept = false },
      panel = { enabled = false },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
      },
    })
  end,
}
