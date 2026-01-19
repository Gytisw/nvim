return {
  "Robitx/gp.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("gp").setup({
      openai_api_key = "dummy_key",
      cmd_prefix = "Gp",
      chat = {
        streaming = false,  -- Disable streaming for local LLM compatibility
      },
      providers = {
        openai = {
          endpoint = "http://localhost:9999/v1/chat/completions",
          model = "mlx-community/LFM2-2.6B-Exp-4bit",
        },
      },
      default_chat_agent = "Local-LLM",
      default_command_agent = "Local-LLM",
      agents = {
        {
          name = "Local-LLM",
          provider = "openai",
          chat = true,
          command = true,
          model = { 
            model = "mlx-community/LFM2-2.6B-Exp-4bit", 
            temperature = 0.7, 
            top_p = 0.9,
            stream = false,  -- Explicitly disable streaming
          },
          system_prompt = "You are a helpful AI coding assistant.",
        },
        { name = "ChatGPT4o", disable = true },
        { name = "ChatGPT4o-mini", disable = true },
        { name = "ChatGPT-o3-mini", disable = true },
        { name = "ChatCopilot", disable = true },
        { name = "ChatGemini", disable = true },
        { name = "ChatClaude-3-7-Sonnet", disable = true },
        { name = "ChatClaude-Sonnet-4-Thinking", disable = true },
        { name = "ChatClaude-3-5-Haiku", disable = true },
        { name = "ChatPerplexityLlama3.1-8B", disable = true },
        { name = "CodeGPT4o", disable = true },
        { name = "CodeGPT-o3-mini", disable = true },
        { name = "CodeGPT4o-mini", disable = true },
        { name = "CodeCopilot", disable = true },
        { name = "CodeGemini", disable = true },
        { name = "CodePerplexityLlama3.1-8B", disable = true },
        { name = "CodeClaude-3-7-Sonnet", disable = true },
        { name = "CodeClaude-3-5-Haiku", disable = true },
      },
    })
  end,
}
