return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        spelling = {
          enabled = true,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = " → ",
      },
      win = {
        border = "rounded",
        padding = { 1, 1, 1, 1 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      show_help = true,
      show_keys = true,
      disable = {
        buftypes = { "terminal" },
        filetypes = { "TelescopePrompt" },
      },
    })

    -- Register all keybindings with clear descriptions
    wk.add({
      -- ═══════════════════════════════════════════════════════════════
      -- FILE FINDING & TELESCOPE
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>f", group = "Find/Telescope" },
      { "<leader>ff", ":Telescope find_files<CR>", desc = "🔍 Search files in project" },
      { "<leader>fg", ":Telescope live_grep<CR>", desc = "📝 Live grep text" },
      { "<leader>fb", ":Telescope buffers<CR>", desc = "📑 Find open buffers" },
      { "<leader>fh", ":Telescope help_tags<CR>", desc = "📖 Find help topics" },
      { "<leader>fp", ":Telescope projects<CR>", desc = "📁 Find projects" },
      { "<leader><leader>", ":Telescope oldfiles<CR>", desc = "📂 Recent files" },
      { "<C-p>", ":Telescope find_files<CR>", desc = "🔍 Quick file search" },

      -- ═══════════════════════════════════════════════════════════════
      -- NEO-TREE FILE EXPLORER
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>n", group = "Neo-tree" },
      { "<leader>nt", ":Neotree filesystem reveal left<CR>", desc = "📁 Toggle file explorer" },
      { "<leader>nb", ":Neotree buffers reveal left<CR>", desc = "📑 Toggle buffer list" },
      { "<leader>ng", ":Neotree git_status reveal left<CR>", desc = "📊 Toggle git status" },
      { "<leader>ns", ":Neotree document_symbols reveal left<CR>", desc = "🏷️ Toggle symbols" },
      { "<C-n>", ":Neotree filesystem reveal left<CR>", desc = "📁 Toggle file explorer" },

      -- ═══════════════════════════════════════════════════════════════
      -- GIT SIGNS & HNKS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>h", group = "Git Hunk" },
      { "<leader>hs", ":Gitsigns stage_hunk<CR>", desc = "+ Stage git hunk" },
      { "<leader>hr", ":Gitsigns reset_hunk<CR>", desc = "- Undo git hunk" },
      { "<leader>hS", ":Gitsigns stage_buffer<CR>", desc = "++ Stage all hunks" },
      { "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", desc = "↩️ Undo stage" },
      { "<leader>hR", ":Gitsigns reset_buffer<CR>", desc = "⟲ Reset buffer" },
      { "<leader>hp", ":Gitsigns preview_hunk<CR>", desc = "👁️ Preview hunk" },
      { "<leader>hd", ":Gitsigns diffthis<CR>", desc = "⏸️ Diff this" },
      { "<leader>hD", ":Gitsigns diffthis~<CR>", desc = "⏸️ Diff this (~)" },
      { "<leader>hb", ":Gitsigns blame_line<CR>", desc = "💬 Blame line" },
      { "<leader>hT", ":Gitsigns toggle_deleted<CR>", desc = "👁️ Show deleted" },
      { "]c", ":Gitsigns next_hunk<CR>", desc = "➡️ Next hunk" },
      { "[c", ":Gitsigns prev_hunk<CR>", desc = "⬅️ Previous hunk" },
      { "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "⊙ Select hunk" },

      -- ═══════════════════════════════════════════════════════════════
      -- TROUBLE & DIAGNOSTICS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>x", group = "Trouble" },
      { "<leader>xx", ":TroubleToggle<CR>", desc = "⚠️ Toggle trouble list" },
      { "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", desc = "⚠️ Workspace diagnostics" },
      { "<leader>xd", ":TroubleToggle document_diagnostics<CR>", desc = "⚠️ Document diagnostics" },
      { "<leader>xq", ":TroubleToggle quickfix<CR>", desc = "📋 Quickfix list" },
      { "<leader>xl", ":TroubleToggle loclist<CR>", desc = "📍 Location list" },
      { "]x", ":TroubleToggleNext<CR>", desc = "➡️ Next trouble item" },
      { "[x", ":TroubleTogglePrevious<CR>", desc = "⬅️ Previous trouble item" },

      -- ═══════════════════════════════════════════════════════════════
      -- LSP & CODE ACTIONS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>c", group = "Code/LSP" },
      { "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", desc = "💡 Code actions" },
      { "<leader>cr", ":lua vim.lsp.buf.rename()<CR>", desc = "📝 Rename symbol" },
      { "<leader>cd", ":lua vim.diagnostic.open_float()<CR>", desc = "💬 Show diagnostics" },
      { "<leader>cD", ":Telescope diagnostics<CR>", desc = "🔍 Find diagnostics" },
      { "<leader>cf", ":lua vim.lsp.buf.format()<CR>", desc = "🎨 Format code" },
      { "gd", ":lua vim.lsp.buf.definition()<CR>", desc = "→ Go to definition" },
      { "gD", ":lua vim.lsp.buf.declaration()<CR>", desc = "→ Go to declaration" },
      { "gi", ":lua vim.lsp.buf.implementation()<CR>", desc = "→ Go to implementation" },
      { "gr", ":lua vim.lsp.buf.references()<CR>", desc = "→ Find references" },
      { "K", ":lua vim.lsp.buf.hover()<CR>", desc = "💭 Hover info" },
      { "[d", ":lua vim.diagnostic.goto_prev()<CR>", desc = "⬅️ Previous diagnostic" },
      { "]d", ":lua vim.diagnostic.goto_next()<CR>", desc = "➡️ Next diagnostic" },

      -- ═══════════════════════════════════════════════════════════════
      -- AI & LLM PLUGINS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>l", group = "AI/LLM" },
      { "<leader>lc", ":GpChatNew<CR>", desc = "💬 New AI chat" },
      { "<leader>ld", ":GpChatToggle<CR>", desc = "📎 Toggle AI chat" },
      { "<leader>lr", ":GpChatRespond<CR>", desc = "↩️ Respond to AI" },
      { "<leader>lb", ":BropilotPanel<CR>", desc = "🤖 Bropilot panel" },
      { "<leader>ll", ":LlmChat<CR>", desc = "💬 LLM chat" },

      -- ═══════════════════════════════════════════════════════════════
      -- THEME & UI
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>T", group = "Theme/UI" },
      { "<leader>TT", ":lua _G.pick_theme()<CR>", desc = "🎨 Change color scheme" },
      { "<leader>Tt", ":Telescope colorscheme<CR>", desc = "🎨 Pick theme (Telescope)" },

      -- ═══════════════════════════════════════════════════════════════
      -- DEBUGGING (DAP)
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>D", group = "Debug" },
      { "<leader>Dt", ":lua require('dap').toggle_breakpoint()<CR>", desc = "● Toggle breakpoint" },
      { "<leader>Dc", ":lua require('dap').continue()<CR>", desc = "▶️ Continue" },
      { "<leader>Do", ":lua require('dap').step_over()<CR>", desc = "⏭️ Step over" },
      { "<leader>Di", ":lua require('dap').step_into()<CR>", desc = "⏭️ Step into" },
      { "<leader>Du", ":lua require('dap').step_out()<CR>", desc = "⏮️ Step out" },
      { "<leader>Dr", ":lua require('dap').repl.toggle()<CR>", desc = "🔲 Toggle REPL" },
      { "<leader>Dl", ":lua require('dap').run_last()<CR>", desc = "▶️ Run last" },
      { "<leader>Dw", ":lua require('dap.ui.widgets').hover()<CR>", desc = "💬 Widget hover" },
      { "<leader>De", ":lua require('dapui').eval()<CR>", desc = "🧪 Evaluate expression" },
      { "<leader>Db", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "❗ Conditional breakpoint" },
      { "<leader>Dp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point: '))<CR>", desc = "📝 Log point" },

      -- ═══════════════════════════════════════════════════════════════
      -- TERMINAL
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>t", group = "Terminal" },
      { "<leader>tt", ":ToggleTerm<CR>", desc = "📦 Toggle terminal" },
      { "<leader>tf", ":ToggleTerm direction=float<CR>", desc = "🪟 Float terminal" },
      { "<leader>th", ":ToggleTerm direction=horizontal<CR>", desc = "⬇️ Horizontal terminal" },
      { "<leader>tv", ":ToggleTerm direction=vertical<CR>", desc = "➡️ Vertical terminal" },
      { "<C-\\>", ":ToggleTerm<CR>", desc = "📦 Toggle terminal" },

      -- ═══════════════════════════════════════════════════════════════
      -- BUFFERS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>b", group = "Buffer" },
      { "<leader>bd", ":bdelete<CR>", desc = "❌ Delete buffer" },
      { "<leader>bD", ":bdelete!<CR>", desc = "❌ Force delete buffer" },
      { "<leader>bn", ":bnext<CR>", desc = "➡️ Next buffer" },
      { "<leader>bp", ":bprevious<CR>", desc = "⬅️ Previous buffer" },
      { "<leader>bf", ":bfirst<CR>", desc = "⏮️ First buffer" },
      { "<leader>bl", ":blast<CR>", desc = "⏭️ Last buffer" },
      { "<leader>bs", ":Telescope buffers<CR>", desc = "🔍 Switch buffer" },

      -- ═══════════════════════════════════════════════════════════════
      -- WINDOWS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>w", group = "Window" },
      { "<leader>wh", "<C-w>h", desc = "⬅️ Window left" },
      { "<leader>wj", "<C-w>j", desc = "⬇️ Window down" },
      { "<leader>wk", "<C-w>k", desc = "⬆️ Window up" },
      { "<leader>wl", "<C-w>l", desc = "➡️ Window right" },
      { "<leader>ws", "<C-w>s", desc = "⬇️ Split horizontal" },
      { "<leader>wv", "<C-w>v", desc = "➡️ Split vertical" },
      { "<leader>wq", "<C-w>q", desc = "❌ Close window" },
      { "<leader>wo", "<C-w>o", desc = "❌ Close other windows" },
      { "<leader>w=", "<C-w>=", desc = "⇔ Equal size" },
      { "<leader>w_", "<C-w>_", desc = "⇕ Maximize height" },
      { "<leader>w|", "<C-w>|", desc = "⇒ Maximize width" },
      { "<leader>w+", "<C-w>+", desc = "⇕ Increase height" },
      { "<leader>w-", "<C-w>-", desc = "⇕ Decrease height" },

      -- ═══════════════════════════════════════════════════════════════
      -- TABS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>o", group = "Tabs" },
      { "<leader>oo", ":tabnew<CR>", desc = "📄 New tab" },
      { "<leader>oc", ":tabclose<CR>", desc = "❌ Close tab" },
      { "<leader>on", ":tabnext<CR>", desc = "➡️ Next tab" },
      { "<leader>op", ":tabprevious<CR>", desc = "⬅️ Previous tab" },
      { "<leader>of", ":tabfirst<CR>", desc = "⏮️ First tab" },
      { "<leader>ol", ":tablast<CR>", desc = "⏭️ Last tab" },
      { "<leader>om", ":tabmove<CR>", desc = "↔️ Move tab" },

      -- ═══════════════════════════════════════════════════════════════
      -- TODO COMMENTS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>td", group = "TODO Comments" },
      { "<leader>tdt", ":TodoTelescope<CR>", desc = "🔍 Find TODO comments" },
      { "<leader>tdn", ":lua require('todo-comments').jump_next()<CR>", desc = "➡️ Next TODO" },
      { "<leader>tdp", ":lua require('todo-comments').jump_prev()<CR>", desc = "⬅️ Previous TODO" },
      { "<leader>tda", ":lua require('todo-comments').jump_all()<CR>", desc = "📋 Show all TODOs" },

      -- ═══════════════════════════════════════════════════════════════
      -- QUIT & SESSION
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>q", group = "Quit/Session" },
      { "<leader>qq", ":qa<CR>", desc = "🚪 Quit all" },
      { "<leader>qw", ":qa!<CR>", desc = "🚪 Force quit all" },
      { "<leader>qs", ":mksession<CR>", desc = "💾 Save session" },
      { "<leader>ql", ":source Session.vim<CR>", desc = "📂 Load session" },
      { "<leader>qd", ":Obsession<CR>", desc = "📂 Toggle session" },

      -- ═══════════════════════════════════════════════════════════════
      -- ALTERNATIVE KEYS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>a", group = "Alternatives" },
      { "<leader>aa", "ggVG<CR>", desc = "Select all" },
      { "<leader>ab", "gg0o$<CR>", desc = "Select buffer content" },
      { "<leader>ac", ":Telescope commands<CR>", desc = "🔍 Find commands" },
      { "<leader>ak", ":Telescope keymaps<CR>", desc = "🔍 Find keymaps" },
      { "<leader>am", ":Telescope marks<CR>", desc = "🔍 Find marks" },

      -- ═══════════════════════════════════════════════════════════════
      -- QUICK ACTIONS
      -- ═══════════════════════════════════════════════════════════════
      { "<leader>z", group = "Quick Actions" },
      { "<leader>zz", ":ZenMode<CR>", desc = "🧘 Zen mode" },
      { "<leader>zt", ":Twilight<CR>", desc = "🌅 Twilight focus" },
      { "<leader>za", ":lua require('nvim-autopairs').toggle()<CR>", desc = "⟷ Toggle autopairs" },
      { "<leader>zi", ":lua vim.lsp.inlay_hints.enable()<CR>", desc = "📍 Toggle inlay hints" },

      -- ═══════════════════════════════════════════════════════════════
      -- UNDO/REDO ENHANCED
      -- ═══════════════════════════════════════════════════════════════
      { "u", ":undo<CR>", desc = "↩️ Undo" },
      { "<C-r>", ":redo<CR>", desc = "↪️ Redo" },
      { "U", ":redo<CR>", desc = "↪️ Redo (uppercase)" },

      -- ═══════════════════════════════════════════════════════════════
      -- SURROUND (NVIM-SURROUND)
      -- ═══════════════════════════════════════════════════════════════
      { "ys", desc = "Add surround" },
      { "ds", desc = "Delete surround" },
      { "cs", desc = "Change surround" },
      { "S", desc = "Add surround (visual)" },

      -- ═══════════════════════════════════════════════════════════════
      -- TEXT OBJECTS (NVIM-TREESITTER)
      -- ═══════════════════════════════════════════════════════════════
      { "af", desc = "Around function" },
      { "if", desc = "Inside function" },
      { "ac", desc = "Around class" },
      { "ic", desc = "Inside class" },
      { "ab", desc = "Around block" },
      { "ib", desc = "Inside block" },
      { "aa", desc = "Around parameter" },
      { "ia", desc = "Inside parameter" },
    })
  end,
}
