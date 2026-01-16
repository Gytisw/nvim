return {
  "meeehdi-dev/bropilot.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("bropilot").setup({
      ollama = {
        endpoint = "http://localhost:11434/v1/chat/completions",
        model = "codellama",
        temperature = 0.2,
        max_tokens = 500,
      },
      suggestion = {
        auto_accept = false,
        debounce = 300,
        keymaps = {
          accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
        open = "<leader>bp",
      },
    })
  end,
}
