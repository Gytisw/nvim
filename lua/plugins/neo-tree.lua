return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      enable_diagnostics = true,
      enable_git_status = true,
      enable_modified_markers = true,
      enable_refresh_on_write = true,
      git_status_async = true,
      git_status_use_nvimkit = false,
      hide_cursorline = false,
      hide_root_node = false,
      retain_hidden_root_indent = false,
      case_insensitive = false,
      window = {
        position = "left",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = false,
          },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
          },
          hide_by_pattern = {},
          show_hidden = false,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        show_hidden = true,
      },
      git_status = {
        window = {
          position = "right",
          width = 40,
          mappings = {
            ["<cr>"] = "open",
            ["s"] = "open_split",
            ["S"] = "open_vsplit",
            ["R"] = "refresh",
            ["?"] = "show_help",
          },
        },
      },
      document_symbols = {
        follow_cursor = true,
        custom_kinds = {},
      },
      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "ﰊ",
          default = "",
          highlight = "NeoTreeFileIcon",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "",
            untracked = "★",
            ignored = "◌",
            unstaged = " ",
            staged = "✓",
            conflict = "",
          },
        },
      },
      buffers_color = {
        modified = { fg = "warning" },
        default = "Normal",
        directory = "NeoTreeDirectory",
      },
    })
  end,
}
