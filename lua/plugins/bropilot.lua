return {
  "meeehdi-dev/bropilot.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("bropilot").setup({
      -- Local LLM endpoint (vLLM-MLX at port 9999)
      provider = "ollama",
      ollama_url = "http://localhost:9999",
      model = "LFM2",

      -- Auto-suggest settings
      auto_suggest = true,
      debounce = 300, -- Wait 300ms before showing suggestion

      -- Model parameters for better code suggestions
      model_params = {
        temperature = 0.2, -- Lower temperature for more deterministic output
        top_p = 0.9,
        max_tokens = 100, -- Limit response length for suggestions
      },

      -- Keybindings
      keymap = {
        accept = "<Tab>", -- Accept suggestion
        accept_word = "<C-Right>", -- Accept word
        accept_line = "<S-Right>", -- Accept line
        suggest = "<C-Down>", -- Manually trigger suggestion
        dismiss = "<C-]>", -- Dismiss suggestion
      },

      -- File types to ignore
      excluded_filetypes = {
        "yaml",
        "markdown",
        "help",
        "gitcommit",
        "terminal",
        "prompt",
      },
    })
  end,
}
