return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")
			-- Load friendly snippets
			require("luasnip.loaders.from_vscode").lazy_load({
				exclude = {},
			})
			
			-- Add custom snippets
			ls.add_snippets("all", {
				require("luasnip").snippet({
					trig = "hello",
				}, {
					require("luasnip").text_node("Hello, "),
					require("luasnip").insert_node(1, "world"),
					require("luasnip").text_node("!"),
				}),
				require("luasnip").snippet({
					trig = "date",
				}, {
					require("luasnip").function_node(function()
						return os.date("%Y-%m-%d")
					end, {}),
				}),
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					fields = { cmp.ItemField.Kind, cmp.ItemField.Abbr, cmp.ItemField.Menu },
					format = function(entry, vim_item)
						-- Kind icons
						local kind_icons = {
							Text = "",
							Method = "ƒ",
							Function = "",
							Constructor = "",
							Field = "",
							Variable = "",
							Class = "",
							Interface = "ﰮ",
							Module = "",
							Property = "",
							Unit = "",
							Value = "",
							Enum = "练",
							Keyword = "",
							Snippet = "∐",
							Color = "",
							File = "",
							Reference = "",
							Folder = "",
							EnumMember = "",
							Constant = "",
							Struct = "-struct",
							Event = "",
							Operator = "",
							TypeParameter = "",
						}
						vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind
						vim_item.menu = entry.source.name
						return vim_item
					end,
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.kind,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})
		end,
	},
}
