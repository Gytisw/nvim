return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      -- Configuration
      position = "bottom", -- Position of the list
      height = 10, -- Height of the list
      width = 50, -- Width of the list
      icons = true, -- Use icons
      mode = "document_diagnostics", -- Default mode
      fold_open = "", -- Icon for open folds
      fold_closed = "", -- Icon for closed folds
      group = true, -- Group results by type
      spacing = 1, -- Spacing between items
      action_keys = {
        -- Key mappings
        close = "q", -- Close the list
        cancel = "<esc>", -- Cancel the list
        refresh = "r", -- Refresh the list
        jump = "<cr>", -- Jump to the location
        open_split = "<c-s>", -- Open in horizontal split
        open_vsplit = "<c-v>", -- Open in vertical split
        open_tab = "<c-t>", -- Open in new tab
        jump_close = "o", -- Jump and close
        toggle_mode = "m", -- Toggle mode
        toggle_preview = "P", -- Toggle preview
        preview = "p", -- Preview
        hover = "h", -- Hover
      },
      -- Filter configuration
      filter = {
        -- Default patterns to ignore
        pattern = {},
      },
      -- Triggers
      triggers = {
        "open",
        "refresh",
      },
      -- Sign configuration
      signs = {
        -- Icons for different severities
        error = " ",
        warning = " ",
        hint = " ",
        information = " ",
        other = " ",
      },
      -- Use symbol instead of severity icon
      use_diagnostic_signs = true,
    })
  end,
}
