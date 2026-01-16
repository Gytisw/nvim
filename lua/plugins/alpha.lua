return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local themes = {
      { name = "tokyonight", label = "🌙 Tokyo Night", description = "Cyberpunk neon" },
      { name = "tokyodark", label = "🌃 Tokyo Dark", description = "Deep dark Tokyo" },
      { name = "catppuccin", label = "🍡 Catppuccin", description = "Soft pastel mocha" },
      { name = "gruvbox", label = "🎨 Gruvbox", description = "Vintage warm retro" },
      { name = "kanagawa", label = "🏔️ Kanagawa", description = "Japanese dragon quest" },
      { name = "rose-pine", label = "🌲 Rose Pine", description = "Natural pine tones" },
      { name = "everforest", label = "🌿 Everforest", description = "Nature forest greens" },
      { name = "nightfox", label = "🦊 Nightfox", description = "Multi-flavor nights" },
      { name = "tender", label = "🌸 Tender", description = "Warm pastel colors" },
    }

    local theme_file = vim.fn.stdpath("data") .. "/theme.json"

    local function save_theme(theme_name)
      local data = vim.json.encode({ theme = theme_name })
      vim.fn.writefile({ data }, theme_file)
    end

    local function load_theme()
      if vim.fn.filereadable(theme_file) == 1 then
        local lines = vim.fn.readfile(theme_file)
        if #lines > 0 then
          local ok, data = pcall(vim.json.decode, lines[1])
          if ok and data and data.theme then
            return data.theme
          end
        end
      end
      return nil
    end

    local function apply_theme(theme_name)
      vim.cmd.colorscheme(theme_name)
      save_theme(theme_name)
    end

    local function get_current_theme()
      local current = load_theme() or vim.g.colors_name or "tokyonight"
      for i, t in ipairs(themes) do
        if t.name == current then
          return i, t
        end
      end
      return 1, themes[1]
    end

    local saved = load_theme()
    if saved then
      vim.cmd.colorscheme(saved)
    end

    local function pick_theme()
      local _, current_theme = get_current_theme()

      require("telescope.pickers").new({}, {
        prompt_title = "🎨 Select Theme",
        finder = require("telescope.finders").new_table({
          results = themes,
          entry_maker = function(entry)
            local icon = entry.name == current_theme.name and "●" or "○"
            return {
              value = entry.name,
              display = string.format("%s %-18s | %s", icon, entry.label, entry.description),
              ordinal = entry.label,
              name = entry.name,
            }
          end,
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")

          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if selection then
              apply_theme(selection.value)
              for _, t in ipairs(themes) do
                if t.name == selection.value then
                  vim.notify(string.format("Theme: %s", t.label), vim.log.levels.INFO)
                  break
                end
              end
            end
          end)
          return true
        end,
      }):find()
    end

    _G.pick_theme = pick_theme

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

    dashboard.section.header.opts.hl = "Type"

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("p", "  Projects", "<cmd>Telescope projects<CR>"),
      dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("t", "🎨  Themes", "<cmd>lua _G.pick_theme()<CR>"),
      dashboard.button("c", "  Configuration", "<cmd>e $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    dashboard.section.footer.val = function()
      local _, theme = get_current_theme()
      return string.format("Theme: %s", theme.label)
    end
    dashboard.section.footer.opts.hl = "Comment"

    dashboard.config.layout = {
      { type = "padding", val = 4 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)

    vim.keymap.set("n", "<leader>TT", pick_theme, { desc = "Pick theme" })
  end,
}
