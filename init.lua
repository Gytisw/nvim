-- Neovim Configuration
-- Main entry point that loads all configuration modules

require("config.options")
require("config.lazy")

-- Termux LSP auto-installer (only runs on Termux)
require("config.termux").setup()
