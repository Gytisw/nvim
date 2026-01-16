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
      -- Sources configuration
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      -- Source handler configuration
      source_selector = {
        winbar = true,
        content = {
          source_statusline = {
            highlight = "NeoTreeSourceName",
          },
        },
      },
      -- Window configuration
      window = {
        position = "left",
        width = 35,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["\\"] = "close_window",
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel", -- Cancel preview mode
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["a"] = "add_directory",
          ["A"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- Copy name
          ["m"] = "move", -- Move name
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
        },
      },
      -- Filesystem configuration
      filesystem = {
        window = {
          mappings = {
            ["\\"] = "close_window",
            ["<C-h>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder_directory",
            ["f"] = "filter_on_submit",
            ["<C-c>"] = "clear_filter",
            ["<bs>"] = "toggle_hidden",
          },
        },
        -- Filtering configuration
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
            "node_modules",
          },
          never_show = {},
        },
        -- Follow current file
        follow_current_file = {
          enabled = true,
        },
        -- Use indentation for nested items
        indent_markers = {
          enabled = true,
        },
        -- Git status integration
        git_status_async = true,
        -- Hijack netrw
        hijack_netrw_behavior = "open_current",
      },
      -- Buffers configuration
      buffers = {
        window = {
          mappings = {
            ["bd"] = "buffer_delete",
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
          },
        },
        follow_current_file = {
          enabled = true,
        },
      },
      -- Git status configuration
      git_status = {
        window = {
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gf"] = "git_fetch",
          },
        },
      },
      -- Document symbols configuration
      document_symbols = {
        kinds = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = "ﴯ ",
          Method = "ƒ ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = "ﲁ ",
          String = "𝓈 ",
          Number = " ",
          Boolean = "◩ ",
          Array = " ",
          Object = "⦿ ",
          Key = " ",
          Null = "NULL ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      },
      -- Event handling
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })

    -- Keybinding to toggle neo-tree
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>nt", ":Neotree filesystem reveal left<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>nb", ":Neotree buffers reveal left<CR>", { desc = "Toggle buffer explorer" })
    vim.keymap.set("n", "<leader>ng", ":Neotree git_status reveal left<CR>", { desc = "Toggle git status" })
    vim.keymap.set("n", "<leader>ns", ":Neotree document_symbols reveal left<CR>", { desc = "Toggle document symbols" })
  end,
}
