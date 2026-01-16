return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code actions" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostics" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next diagnostic" })
      end

      -- Configure diagnostic signs using vim.diagnostic.config (non-deprecated)
      vim.diagnostic.config({
        signs = {
          severity = {
            ERROR = { text = " " },
            WARN = { text = " " },
            HINT = { text = " " },
            INFO = { text = " " },
          },
        },
        virtual_text = {
          prefix = "●",
          spacing = 4,
        },
        float = {
          border = "rounded",
          source = "always",
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Configure LSP servers using vim.lsp.config (new API)
      vim.lsp.config.lua_ls = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("data") .. "/lazy/ui/nvim.lua"] = true,
              },
            },
          },
        },
      }

      vim.lsp.config.clangd = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      vim.lsp.config.pyright = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      vim.lsp.config.ts_ls = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      vim.lsp.config.rust_analyzer = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      }

      vim.lsp.config.gopls = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
            analyses = {
              unusedvariables = true,
            },
          },
        },
      }

      vim.lsp.config.jsonls = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- IMPORTANT: This line must come after all vim.lsp.config calls
      -- It sets up all configured servers
      require("lspconfig")
    end,
  },
}
