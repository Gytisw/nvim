return {
  "Kurama622/llm.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("llm").setup({
      providers = {
        ollama = {
          endpoint = "http://localhost:11434/v1/chat/completions",
          model = "codellama",
        },
      },
      chat = {
        keymaps = {
          send = "<C-Enter>",
          new_chat = "<leader>lc",
          close = "<leader>ld",
        },
      },
      completion = {
        enabled = true,
        trigger = "<C-l>",
      },
    })
  end,
}
