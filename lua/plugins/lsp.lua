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
      local termux_prefix = is_termux and vim.env.PREFIX or nil

      -- Helper function to create LSP command with proper environment for Termux
      local function create_lsp_cmd(executable, args, env_overrides)
        local cmd_table = { executable }
        if args then
          for _, arg in ipairs(args) do
            table.insert(cmd_table, arg)
          end
        end

        local cmd_env = nil
        if is_termux and termux_prefix then
          -- Set up environment for Termux execution
          cmd_env = {
            LD_PRELOAD = termux_prefix .. "/lib/libtermux-exec.so",
            PATH = termux_prefix .. "/bin:" .. termux_prefix .. "/usr/bin:" .. (os.getenv("PATH") or ""),
          }

          -- Merge any additional environment overrides
          if env_overrides then
            for key, value in pairs(env_overrides) do
              cmd_env[key] = value
            end
          end
        end

        return {
          cmd = cmd_table,
          cmd_env = cmd_env,
        }
      end

      -- Diagnostic signs configuration
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

      -- lua_ls configuration - cross-platform
      local lua_ls_setup = create_lsp_cmd("lua-language-server", { "--stdio" })
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        cmd = lua_ls_setup.cmd,
        cmd_env = lua_ls_setup.cmd_env,
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

      -- clangd configuration
      local clangd_setup = create_lsp_cmd("clangd", { "--offset-encoding=utf-16" })
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = clangd_setup.cmd,
        cmd_env = clangd_setup.cmd_env,
        offset_encoding = "utf-16",
      })

      -- pyright configuration
      local pyright_setup = create_lsp_cmd("pyright-langserver", { "--stdio" })
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        cmd = pyright_setup.cmd,
        cmd_env = pyright_setup.cmd_env,
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

      -- ts_ls configuration
      local ts_ls_setup = create_lsp_cmd("typescript-language-server", { "--stdio" })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        cmd = ts_ls_setup.cmd,
        cmd_env = ts_ls_setup.cmd_env,
        settings = {
          typescript = {
            format = { indentSize = 2, semicolons = true },
          },
          javascript = {
            format = { indentSize = 2, semicolons = true },
          },
        },
      })

      -- rust_analyzer configuration
      local rust_setup = create_lsp_cmd("rust-analyzer", nil)
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        cmd = rust_setup.cmd,
        cmd_env = rust_setup.cmd_env,
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

      -- gopls configuration
      local gopls_setup = create_lsp_cmd("gopls", { "serve" })
      vim.lsp.config("gopls", {
        capabilities = capabilities,
        cmd = gopls_setup.cmd,
        cmd_env = gopls_setup.cmd_env,
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

      -- jsonls configuration
      local jsonls_setup = create_lsp_cmd("json-language-server", { "--stdio" })
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        cmd = jsonls_setup.cmd,
        cmd_env = jsonls_setup.cmd_env,
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

      -- yamlls configuration
      local yamlls_setup = create_lsp_cmd("yaml-language-server", { "--stdio" })
      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        cmd = yamlls_setup.cmd,
        cmd_env = yamlls_setup.cmd_env,
        settings = {
          yaml = {
            schemas = require("schemastore").yaml.schemas(),
            validate = true,
          },
        },
      })

      -- bashls configuration - cross-platform with path detection
      local bashls_setup
      if is_termux and termux_prefix then
        -- On Termux, use PREFIX/bin path
        bashls_setup = create_lsp_cmd(termux_prefix .. "/bin/bash-language-server", { "start" })
      else
        -- On macOS/Linux, try multiple standard locations
        local bashls_paths = {
          "/opt/homebrew/bin/bash-language-server", -- Homebrew on Apple Silicon
          "/usr/local/bin/bash-language-server", -- Homebrew on Intel or system
          "bash-language-server", -- PATH lookup
        }

        local found_path = nil
        for _, path in ipairs(bashls_paths) do
          if path == "bash-language-server" then
            if vim.fn.executable(path) == 1 then
              found_path = path
              break
            end
          else
            if vim.fn.filereadable(path) == 1 then
              found_path = path
              break
            end
          end
        end

        bashls_setup = create_lsp_cmd(found_path or "bash-language-server", { "start" })
      end

      vim.lsp.config("bashls", {
        capabilities = capabilities,
        cmd = bashls_setup.cmd,
        cmd_env = bashls_setup.cmd_env,
        filetypes = { "bash", "sh", "zsh" },
        root_dir = function(fname)
          if type(fname) ~= "string" or fname == "" then
            return vim.fn.getcwd()
          end
          local ok, git_dir = pcall(vim.fs.find, ".git", { path = vim.fs.dirname(fname), upward = true })
          if not ok or type(git_dir) ~= "table" or #git_dir == 0 then
            return vim.fs.dirname(fname) or vim.fn.getcwd()
          end
          local root = git_dir[1]
          if type(root) == "string" and root ~= "" then
            return vim.fs.dirname(root) or vim.fn.getcwd()
          end
          return vim.fs.dirname(fname) or vim.fn.getcwd()
        end,
      })

      -- cssls configuration
      local cssls_setup = create_lsp_cmd("css-language-server", { "--stdio" })
      vim.lsp.config("cssls", {
        capabilities = capabilities,
        cmd = cssls_setup.cmd,
        cmd_env = cssls_setup.cmd_env,
        filetypes = { "css", "scss", "less" },
        settings = {
          css = {
            validate = true,
          },
        },
      })

      -- html configuration
      local html_setup = create_lsp_cmd("html-language-server", { "--stdio" })
      vim.lsp.config("html", {
        capabilities = capabilities,
        cmd = html_setup.cmd,
        cmd_env = html_setup.cmd_env,
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

      -- LSP server configurations by filetype
      local ft_to_lsp = {
        lua = "lua_ls",
        python = "pyright",
        typescript = "ts_ls",
        javascript = "ts_ls",
        typescriptreact = "ts_ls",
        javascriptreact = "ts_ls",
        rust = "rust_analyzer",
        go = "gopls",
        c = "clangd",
        cpp = "clangd",
        json = "jsonls",
        jsonc = "jsonls",
        yaml = "yamlls",
        bash = "bashls",
        sh = "bashls",
        zsh = "bashls",
        css = "cssls",
        scss = "cssls",
        less = "cssls",
        html = "html",
      }

      -- Auto-attach LSP clients to matching buffers
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        group = vim.api.nvim_create_augroup("LspAutoAttach", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
          local server_name = ft_to_lsp[filetype]

          if not server_name then
            return
          end

          -- Check if this LSP is already running
          for _, client in ipairs(vim.lsp.get_clients() or {}) do
            if client.name == server_name then
              -- Already running, just attach to this buffer (triggers LspAttach)
              vim.lsp.buf_attach_client(bufnr, client)
              return
            end
          end

          -- Get the server config
          local config = vim.lsp.config[server_name]
          if not config then
            return
          end

          -- Start the LSP server and attach to buffer
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local client = vim.lsp.start({
            name = server_name,
            cmd = config.cmd,
            cmd_env = config.cmd_env,
            root_dir = config.root_dir and config.root_dir(bufname) or vim.fn.getcwd(),
          })

          -- Attach the client to this buffer (this triggers LspAttach autocmd)
          if client then
            vim.lsp.buf_attach_client(bufnr, client)
          end
        end,
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
