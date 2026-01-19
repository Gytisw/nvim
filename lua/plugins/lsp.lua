return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- Detect platform - only auto-install on macOS
      local is_android = vim.loop.os_uname().sysname == "Android" or vim.env.TERMUX == "1"
      
      local setup_opts = {
        automatic_installation = true,
      }
      
      -- Only auto-install LSPs on macOS, not on Android/Termux
      if not is_android then
        setup_opts.ensure_installed = {
          "lua_ls",      -- Lua Language Server
          "clangd",      -- C/C++
          "pyright",     -- Python
          "ts_ls",       -- TypeScript/JavaScript
          "rust_analyzer",  -- Rust (lspconfig name)
          "gopls",       -- Go
          "jsonls",      -- JSON
          "yamlls",      -- YAML
          "bashls",      -- Bash
          "cssls",       -- CSS
          "html",        -- HTML
        }
      else
        -- On Android, skip auto-installation entirely
        setup_opts.automatic_installation = false
        setup_opts.ensure_installed = {}
      end
      
      require("mason-lspconfig").setup(setup_opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- Set up diagnostic signs
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        
        -- LSP keybindings
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
        
        -- Format on save
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

      -- Configure diagnostic signs
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
