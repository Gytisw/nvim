local builtin = require("telescope.builtin")

return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<C-n>"] = "move_selection_next",
              ["<C-p>"] = "move_selection_previous",
              ["<C-c>"] = "close",
              ["<Esc>"] = "close",
            },
            n = {
              ["<C-c>"] = "close",
              ["<Esc>"] = "close",
            },
          },
          file_ignore_patterns = {
            "node_modules",
            ".git",
            "dist",
            "build",
            "%.git",
            "%.pyc",
            "__pycache__",
            "%.o",
            "%.a",
          },
          path_display = { "smart" },
          prompt_prefix = "   ",
          selection_caret = "  ",
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            theme = "dropdown",
            hidden = true,
            previewer = false,
          },
          live_grep = {
            theme = "dropdown",
            hidden = true,
          },
          oldfiles = {
            theme = "dropdown",
            previewer = false,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
            ignore_current_buffer = true,
            sort_mru = true,
          },
          help_tags = {
            theme = "dropdown",
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          projects = {
            display_type = "full",
            active_project_color = 88,
            themes = {},
          },
        },
      })

      -- Load extensions
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("project")

      -- Keybindings using modern vim.keymap.set
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
      vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Find projects" })
    end,
  },
}
