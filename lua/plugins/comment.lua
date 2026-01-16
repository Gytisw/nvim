return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      -- Add a space between the marker and the line
      padding = true,
      -- Enable keybindings for normal and visual mode
      sticky = true,
      -- Pre/Post hooks for additional functionality
      hooks = {
        -- Called before creating the comment
        pre = function()
          -- Can add custom logic here
        end,
        -- Called after creating the comment
        post = function()
          -- Can add custom logic here
        end,
      },
      -- Function to check if a line should be ignored
      ignore = "^$",
      -- Function to get the comment string
      get_commentstring = function()
        return require("Comment.utils").get_commentstring()
      end,
      -- Enable enhanced comment patterns
      enhanced = true,
      -- Enable comment toggling for linewise comments
      t = {
        -- Enable mapping for toggling
        basic = true,
        -- Enable extra mappings
        extra = {
          -- Add empty comment above
          above = "gcO",
          -- Add empty comment below
          below = "gco",
          -- Add comment at end of line
          eol = "gcA",
        },
      },
      -- Keybindings
      mappings = {
        -- Basic mappings
        basic = true,
        -- Extra mappings
        extra = true,
        -- Extended mappings (using ts_textobjects)
        extended = true,
      },
      -- Enable .dot-repeat support
      opleader = {
        line = "gc",
        block = "gb",
      },
      -- Enable operator-pending mappings
      opmode = "v",
      -- Pre/Post hooks
      pre_hook = function(ctx)
        local U = require("Comment.utils")

        local location = nil
        if ctx.ctype == U.ctype.block then
          location = require("Comment.lib").get_cursor_location()
        elseif ctx.range.srow == ctx.range.erow then
          location = require("Comment.lib").get_cursor_location()
        end

        return location
      end,
      post_hook = function(ctx)
        -- Called after commenting
      end,
    })
  end,
}
