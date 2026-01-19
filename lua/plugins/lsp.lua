return {
  {
    "williamboman/mason.nvim",
    config = function()
      -- Detect Termux
      local is_termux = vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil
      
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        -- On Termux, disable automatic updates/checks
        automatic_installation = not is_termux,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- Completely skip loading on Termux
    cond = function()
      local is_termux = vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil
      local is_android = vim.loop.os_uname().sysname == "Android"
      return not is_termux and not is_android
    end,
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "lua_ls",
          "clangd",
          "pyright",
          "ts_ls",
          "rust_analyzer",
          "gopls",
          "jsonls",
          "yamlls",
          "bashls",
          "cssls",
          "html",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cond = function()
      local is_termux = vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil
      local is_android = vim.loop.os_uname().sysname == "Android"
      return not is_termux and not is_android
    end,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
        
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LSPFormatting", {}),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
          })
        end
      end

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
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      }

      vim.lsp.config.clangd = {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "clangd" },
      }

      vim.lsp.config.pyright = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          pyright = {
            disableOrganizeImports = false,
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              diagnosticMode = "workspace",
            },
          },
        },
      }

      vim.lsp.config.ts_ls = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          typescript = {
            format = { indentSize = 2, semicolons = true },
          },
          javascript = {
            format = { indentSize = 2, semicolons = true },
          },
        },
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
            check = {
              command = "clippy",
            },
            diagnostics = {
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
            staticcheck = true,
          },
        },
      }

      vim.lsp.config.jsonls = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      
      vim.lsp.config.yamlls = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      
      vim.lsp.config.bashls = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      
      vim.lsp.config.cssls = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      
      vim.lsp.config.html = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
  },
}
