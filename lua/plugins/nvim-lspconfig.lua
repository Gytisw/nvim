return {
  "neovim/nvim-lspconfig",

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({
    {
      capabilities = capabilities,
    },
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
    lspconfig.ts_ls.setup({
      {
        capabilities = capabilities,
      },
      cmd = {
        "node",
        "--experimental-modules",
        "/data/data/com.termux/files/home/.local/share/nvim/mason/bin/typescript-language-server",
        "--stdio",
      },
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      root_dir = lspconfig.util.root_pattern(".git", "package.json", "tsconfig.json", "jsconfig.json"),
    }
    )
    lspconfig.pyright.setup({
      {
        capabilities = capabilities,
      },
      cmd = {
        "node",
        "--experimental-modules",
        "/data/data/com.termux/files/home/.local/share/nvim/mason/bin/pyright-langserver",
        "--stdio",
      },
    })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
  end,
}

