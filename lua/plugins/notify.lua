return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      -- Animation style
      stages = "fade_in_slide_out",
      -- Time before dismissing notification
      timeout = 3000,
      -- Maximum width of notifications
      max_width = function()
        return math.floor(vim.o.columns * 0.7)
      end,
      -- Maximum height of notifications
      max_height = function()
        return math.floor(vim.o.lines * 0.3)
      end,
      -- Background color
      background_colour = "Normal",
      -- Minimum width
      min_width = 50,
      -- Minimum height
      min_height = 5,
      -- Render function
      render = "default",
      -- Icons
      icons = {
        DEBUG = " ",
        ERROR = " ",
        INFO = " ",
        TRACE = "✎ ",
        WARN = " ",
      },
      -- Level overrides
      level_overrides = {
        ERROR = { highlight = "ErrorMsg", default = "ERROR" },
        WARN = { highlight = "WarningMsg", default = "WARN" },
        INFO = { highlight = "Normal", default = "INFO" },
        DEBUG = { highlight = "Comment", default = "DEBUG" },
        TRACE = { highlight = "Comment", default = "TRACE" },
      },
      -- Function to override title
      title_overrides = {
        ERROR = { title = "Error" },
        WARN = { title = "Warning" },
        INFO = { title = "Info" },
        DEBUG = { title = "Debug" },
        TRACE = { title = "Trace" },
      },
    })

    -- Set notify as the default vim.notify handler
    vim.notify = require("notify")

    -- Add some custom notifications for debugging
    vim.notify.setup = function(...)
      vim.notify("Neovim configuration loaded successfully!", vim.log.levels.INFO)
    end
  end,
}
