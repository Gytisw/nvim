-- Cross-platform LSP configuration
-- Supports: macOS, Linux, Windows, Termux (Android), proot-distro (Kali Nethunter)

-- Detect if running on Android (includes Termux and proot-distro)
local function is_android()
  -- Check kernel name for "Android" which works in both Termux and proot-distro
  local kernel = vim.fn.system({ "uname", "-s" }):gsub("%s+", "")
  if kernel:match("Linux") then
    -- On Linux, check if we're running on Android kernel
    local release = vim.fn.system({ "uname", "-r" }):gsub("%s+", "")
    -- Try multiple detection methods for proot-distro compatibility
    return (
      -- Method 1: Check kernel release (Android kernels often have -android suffix)
      release:match("android") or
      -- Method 2: Check PREFIX env var (native Termux)
      (vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil) or
      -- Method 3: Check for Android property command (works in proot-distro)
      (vim.fn.executable("getprop") == 1 and vim.fn.system("getprop ro.build.version.sdk"):gsub("%s+", "") ~= "")
    )
  end
  return false
end

-- Platform detection
local is_termux = is_android()  -- Detects Android/Termux/proot-distro
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
local termux_prefix = is_termux and vim.env.PREFIX or nil

-- Mason bin directory
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"

-- Find executable across multiple possible locations
local function find_executable(candidates)
  for _, candidate in ipairs(candidates) do
    if vim.fn.executable(candidate) == 1 then
      return candidate
    end
    -- Also check Mason bin explicitly
    local mason_path = mason_bin .. "/" .. candidate
    if vim.fn.executable(mason_path) == 1 then
      return mason_path
    end
  end
  return nil
end

-- LSP executable mappings: server_name -> { possible executables }
local lsp_executables = {
  lua_ls = { "lua-language-server" },
  clangd = { "clangd" },
  pyright = { "pyright-langserver" },
  ts_ls = { "typescript-language-server" },
  rust_analyzer = { "rust-analyzer" },
  gopls = { "gopls" },
  jsonls = { "vscode-json-language-server", "json-languageserver", "json-language-server" },
  yamlls = { "yaml-language-server" },
  bashls = { "bash-language-server" },
  cssls = { "vscode-css-language-server", "css-languageserver", "css-language-server" },
  html = { "vscode-html-language-server", "html-languageserver", "html-language-server" },
}

-- Create LSP command with proper environment
local function create_lsp_cmd(server_name, args)
  local candidates = lsp_executables[server_name] or { server_name }
  local executable = find_executable(candidates)
  
  if not executable then
    return nil
  end
  
  local cmd_table = { executable }
  if args then
    for _, arg in ipairs(args) do
      table.insert(cmd_table, arg)
    end
  end

  local cmd_env = nil
  if is_termux and termux_prefix then
    cmd_env = {
      LD_PRELOAD = termux_prefix .. "/lib/libtermux-exec.so",
      PATH = termux_prefix .. "/bin:" .. termux_prefix .. "/usr/bin:" .. mason_bin .. ":" .. (os.getenv("PATH") or ""),
    }
  end

  return {
    cmd = cmd_table,
    cmd_env = cmd_env,
    executable = executable,
  }
end

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
      local ensure_installed = {}
      
      -- Only auto-install on non-Termux platforms (Mason doesn't work well on Termux)
      if not is_termux then
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
        }
      end

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        automatic_installation = not is_termux,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Diagnostic configuration
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        virtual_text = {
          prefix = "●",
          spacing = 4,
        },
        float = {
          border = "rounded",
          source = true,
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- SchemaStore for JSON/YAML (with fallback)
      local schemastore_ok, schemastore = pcall(require, "schemastore")

      -- LSP server configurations
      local servers = {
        lua_ls = {
          args = {},
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("data") .. "/lazy"] = true,
                },
                checkThirdParty = false,
              },
              completion = { callSnippet = "Replace" },
              telemetry = { enable = false },
            },
          },
        },
        clangd = {
          args = { "--offset-encoding=utf-16" },
          offset_encoding = "utf-16",
        },
        pyright = {
          args = { "--stdio" },
          settings = {
            pyright = {
              disableOrganizeImports = false,
            },
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
        ts_ls = {
          args = { "--stdio" },
          settings = {
            typescript = { format = { indentSize = 2 } },
            javascript = { format = { indentSize = 2 } },
          },
        },
        rust_analyzer = {
          args = {},
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              procMacro = { enable = true },
              check = { command = "clippy" },
              diagnostics = { enable = true },
            },
          },
        },
        gopls = {
          args = { "serve" },
          settings = {
            gopls = {
              gofumpt = true,
              analyses = { unusedvariables = true },
              staticcheck = true,
            },
          },
        },
        jsonls = {
          args = { "--stdio" },
          filetypes = { "json", "jsonc" },
          settings = {
            json = {
              schemas = schemastore_ok and schemastore.json.schemas() or {},
              validate = { enable = true },
            },
          },
        },
        yamlls = {
          args = { "--stdio" },
          settings = {
            yaml = {
              schemas = schemastore_ok and schemastore.yaml.schemas() or {},
              validate = true,
            },
          },
        },
        bashls = {
          args = { "start" },
          filetypes = { "bash", "sh", "zsh" },
        },
        cssls = {
          args = { "--stdio" },
          filetypes = { "css", "scss", "less" },
          settings = {
            css = { validate = true },
          },
        },
        html = {
          args = { "--stdio" },
          filetypes = { "html", "htmldjango" },
          settings = {
            html = { format = { enable = true } },
          },
        },
      }

      -- Track which servers are available
      local available_servers = {}

      -- Configure each server
      for server_name, config in pairs(servers) do
        local lsp_cmd = create_lsp_cmd(server_name, config.args)
        
        if lsp_cmd then
          available_servers[server_name] = true
          
          vim.lsp.config(server_name, {
            capabilities = capabilities,
            cmd = lsp_cmd.cmd,
            cmd_env = lsp_cmd.cmd_env,
            filetypes = config.filetypes,
            settings = config.settings,
            offset_encoding = config.offset_encoding,
          })
        end
      end

      -- Enable only available servers
      local servers_to_enable = {}
      for server_name, _ in pairs(available_servers) do
        table.insert(servers_to_enable, server_name)
      end
      
      if #servers_to_enable > 0 then
        vim.lsp.enable(servers_to_enable)
      end

      -- Filetype to LSP mapping (only include available servers)
      local ft_to_lsp = {}
      local ft_mappings = {
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
      
      for ft, server in pairs(ft_mappings) do
        if available_servers[server] then
          ft_to_lsp[ft] = server
        end
      end

      -- LspAttach autocmd for keybindings
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

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

          if client.supports_method("textDocument/inlayHint") then
            pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
          end
        end,
      })

      -- Create user command to show LSP status
      vim.api.nvim_create_user_command("LspStatus", function()
        local lines = { "LSP Server Status:", "" }
        for server_name, _ in pairs(servers) do
          local status = available_servers[server_name] and "✓ Available" or "✗ Not found"
          local exec = lsp_executables[server_name] and table.concat(lsp_executables[server_name], ", ") or server_name
          table.insert(lines, string.format("  %s: %s (%s)", server_name, status, exec))
        end
        table.insert(lines, "")
        table.insert(lines, "Platform: " .. (is_termux and "Termux" or (is_windows and "Windows" or "Unix")))
        table.insert(lines, "Mason bin: " .. mason_bin)
        vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
      end, {})
    end,
  },
}
