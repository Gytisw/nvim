return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- ASCII header art
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    -- Welcome message
    dashboard.section.header.opts.hl = "Type"

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("p", "  Projects", "<cmd>Telescope projects<CR>"),
      dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("t", "  Find text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("c", "  Configuration", "<cmd>e $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = "Welcome to Neovim"
    dashboard.section.footer.opts.hl = "Comment"

    -- Layout
    dashboard.config.layout = {
      { type = "padding", val = 5 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)
  end,
}
