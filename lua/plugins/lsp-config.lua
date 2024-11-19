return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        lsp = {
          stylua = {
            command = "stylua",
            args = {"--config-path", vim.fn.stdpath("config") .. "/stylua.toml"},
          },
        },
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "ts_ls", "pyright"}
      })
    end
  }
}
