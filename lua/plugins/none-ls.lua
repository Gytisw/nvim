return {
  "nvim-lua/null-ls.nvim",
  dependencies = { "jay-babu/mason-null-ls.nvim", "williamboman/mason.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local augroup = vim.api.nvim_create_augroup("NullLs", {})

    null_ls.setup({
      sources = {
        -- Formatting
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.rustfmt,

        -- Diagnostics
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.yamllint,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = true })
            end,
          })
        end
      end,
    })
    -- REMOVED: <leader>gf - format is now <leader>cf in which.lua
  end,
}
