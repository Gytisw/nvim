return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    require("toggleterm").setup({
      direction = "float",
    })
    -- REMOVED: All keybindings - they are now in which.lua for consistency
  end,
}
