return {
  "Kurama622/llm.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("llm").setup({
      providers = {
        -- vLLM-MLX endpoint (OpenAI-compatible)
        ollama = {
          endpoint = "http://localhost:9999/v1/chat/completions",
          model = "mlx-community/LFM2-2.6B-Exp-4bit",
        },
      },
      -- llm.nvim uses keymaps instead of commands for chat
      -- The default keymaps are set in the chat config
      chat = {
        keymaps = {
          send = "<C-Enter>",
          new_chat = "<leader>llc",  -- This triggers the chat via keymap, not command
          close = "<leader>lld",
        },
      },
      completion = {
        enabled = true,
        trigger = "<C-l>",
      },
    })
  end,
}
