return {
  "ahmedkhalf/project.nvim",
  
  config = function()
    require("project_nvim").setup({
      active_colors = {},
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      show_hidden = false,
      silent_chdir = false,
      exclude_dirs = {},
      datapath = vim.fn.stdpath("data"),
    })

    require("telescope").load_extension("project")

    vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<CR>", { desc = "Find projects" })
  end,
}
