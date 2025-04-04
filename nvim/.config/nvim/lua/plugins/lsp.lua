return {
	"neovim/nvim-lspconfig",

	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/nvim-cmp" },
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "onsails/lspkind.nvim" },
		{ "j-hui/fidget.nvim", opts = { notification = { window = { winblend = 0 } } } },
	},

	config = function()
		-- Add cmp_nvim_lsp capabilities settings to lspconfig
		-- This should be executed before you configure any language server
		local lspconfig_defaults = require("lspconfig").util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			sources = {
				{ name = "luasnip", keyword_length = 2 },
				{ name = "nvim_lsp" },
				{ name = "buffer", keyword_length = 3 },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = require("lspkind").cmp_format({
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[Latex]",
					},
					mode = "symbol_text", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
					show_labelDetails = true,
				}),
			},
			-- Preselect first item
			-- preselect = "item",
			-- completion = {
			--     completeopt = "menu,menuone,noinsert",
			-- },
			mapping = cmp.mapping.preset.insert({
				["<C-y>"] = cmp.mapping.confirm({ select = false }),

				-- jump to the next snippet placeholder
				["<C-f>"] = cmp.mapping(function(fallback)
					local luasnip = require("luasnip")
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				-- jump to the previous snippet placeholder
				["<C-b>"] = cmp.mapping(function(fallback)
					local luasnip = require("luasnip")
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
		})

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "»",
				},
			},
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
		})

		local hover = vim.lsp.buf.hover
		---@diagnostic disable-next-line: duplicate-set-field
		vim.lsp.buf.hover = function()
			return hover({
				border = "rounded",
				-- max_height = math.floor(vim.o.lines * 0.5),
				-- max_width = math.floor(vim.o.columns * 0.4),
			})
		end

		local signature_help = vim.lsp.buf.signature_help
		---@diagnostic disable-next-line: duplicate-set-field
		vim.lsp.buf.signature_help = function()
			return signature_help({
				border = "rounded",
				-- max_height = math.floor(vim.o.lines * 0.5),
				-- max_width = math.floor(vim.o.columns * 0.4),
			})
		end

		require("mason").setup({ PATH = "append" })
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				-- lsp_zero.default_setup,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						on_init = function(client)
							if client.workspace_folders then
								local path = client.workspace_folders[1].name
								if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
									return
								end
							end

							client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
								runtime = {
									-- Tell the language server which version of Lua you're using
									-- (most likely LuaJIT in the case of Neovim)
									version = "LuaJIT",
								},
								-- Make the server aware of Neovim runtime files
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
										-- Depending on the usage, you might want to add additional paths here.
										-- "${3rd}/luv/library"
										-- "${3rd}/busted/library",
									},
									-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
									-- library = vim.api.nvim_get_runtime_file("", true)
								},
							})
						end,
						settings = {
							Lua = {},
						},
					})
				end,

				pylsp = function ()
					require("lspconfig").pylsp.setup({
						settings = {
							pylsp = {
								plugins = {
									pycodestyle = { ignore = { "E501" }, maxLineLength = 120 },
									flake8 = { ignore = { "E501" }, maxLineLength = 120 },
									black = { line_length = 120 },
									mccabe = { enabled = false },
									pylint = { enabled = false },
									autopep8 = { enabled = false },
								},
							},
						},
					})
				end,

				phpactor = function()
					local lspconfig = require("lspconfig")
					lspconfig.phpactor.setup({
						root_dir = function(fname)
							local root = require("lspconfig/util").find_git_ancestor(fname)
							if root then
								return root
							else
								print("phpactor: no root found... Using vim.fn.getcwd()... Some functionality might not work.")
								return vim.fn.getcwd()
							end
						end,
					})
				end,

				-- vue
				volar = function()
					require("lspconfig").volar.setup({
						root_dir = require("lspconfig").util.root_pattern(
							"vue.config.js",
							"vue.config.ts",
							"nuxt.config.js",
							"nuxt.config.ts"
						),
						init_options = {
							vue = {
								hybridMode = true,
							},
						},
					})
				end,

				ts_ls = function()
					local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
					local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

					require("lspconfig").ts_ls.setup({
						-- use typescript with vue
						filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = volar_path,
									languages = { "vue" },
								},
							},
						},
						settings = {
							javascript = {
								inlayHints = {
									includeInlayEnumMemberValueHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayVariableTypeHints = false,
								},
							},
							typescript = {
								inlayHints = {
									includeInlayEnumMemberValueHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayVariableTypeHints = false,
								},
							},
						},
					})
				end,
			},
		})

		local lspconfig = require("lspconfig")
		lspconfig.zls.setup({
			cmd = { "zls" },
			root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
			settings = {
				zls = {
					enable_inlay_hints = true,
					enable_snippets = true,
					warn_style = true,
				},
			},
			-- 	vim.g.zig_fmt_parse_errors = 0
			-- 	vim.g.zig_fmt_autosave = 0
			-- end,
		})
	end,
}
