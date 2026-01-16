return {
  "Robitx/gp.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("gp").setup({
      openai_api_key = "dummy_key",
      providers = {
        ollama = {
          endpoint = "http://localhost:11434/v1/chat/completions",
        },
      },
    })
  end,
}
