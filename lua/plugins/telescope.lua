return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          projects = {
            -- Your project.nvim configuration for Telescope goes here if needed
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>ff",
        ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>fg",
        ':lua require"telescope.builtin".live_grep({ hidden = true })<CR>',
        { noremap = true, silent = true, desc = "Live grep +hidden" }
      )
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files"})
      -- vim.keymap.set("n", "<leader>fg", builtin.live_grep( hidden = true ), { desc = "Live grep"})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("project")
    end,
  },
}

