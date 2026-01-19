return {
  {
    "williamboman/mason.nvim",
    config = function()
      local is_termux = vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil

      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        automatic_installation = not is_termux,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local is_termux = vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil

      local setup_opts = {
        automatic_enable = true,
      }

      if not is_termux then
        setup_opts.ensure_installed = {
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
        }
      end

      require("mason-lspconfig").setup(setup_opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local is_termux = vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil

      local cmd_clangd = is_termux and nil or { "clangd" }
      local cmd_rust_analyzer = is_termux and nil or { "rust-analyzer" }

      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })

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

      vim.lsp.config("lua_ls", {
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
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = cmd_clangd,
        offset_encoding = "utf-16",
      })

      vim.lsp.config("pyright", {
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
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        settings = {
          typescript = {
            format = { indentSize = 2, semicolons = true },
          },
          javascript = {
            format = { indentSize = 2, semicolons = true },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        cmd = cmd_rust_analyzer,
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
      })

      vim.lsp.config("gopls", {
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
      })

      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        filetypes = { "json", "jsonc" },
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = {
              enable = true,
            },
          },
        },
      })

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = require("schemastore").yaml.schemas(),
            validate = true,
          },
        },
      })

      vim.lsp.config("bashls", {
        capabilities = capabilities,
        filetypes = { "bash", "sh", "zsh" },
      })

      vim.lsp.config("cssls", {
        capabilities = capabilities,
        filetypes = { "css", "scss", "less" },
        settings = {
          css = {
            validate = true,
          },
        },
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
        filetypes = { "html", "htmldjango" },
        settings = {
          html = {
            format = {
              enable = true,
            },
          },
        },
      })

      vim.lsp.enable({
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
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          local opts = { buffer = bufnr, silent = true }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)

          if client and client.supports_method("textDocument/inlayHint") then
            pcall(vim.lsp.inlay_hint.enable, bufnr, true)
          end
        end,
      })
    end,
  },
}
