return {
  'neovim/nvim-lspconfig',

  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v4.x' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
  },

  config = function()
    local lsp_zero = require('lsp-zero')

    local lsp_attach = function(client, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
      lsp_zero.buffer_autoformat()

      --- toggle inlay hints
      local function toggle_inlay_hints()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        print("inlay_hint: ", vim.lsp.inlay_hint.is_enabled())
      end

      vim.keymap.set(
        "n",
        "<leader>ih",
        toggle_inlay_hints,
        { noremap = true, silent = true }
      )
    end

    lsp_zero.extend_lspconfig({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      lsp_attach = lsp_attach,
      float_border = 'rounded',
      sign_text = true,
    })

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({}),
      -- mapping = cmp.mapping.preset.insert({
      --   -- `Enter` key to confirm completion
      --   ['<CR>'] = cmp.mapping.confirm({ select = false }),

      --   -- Ctrl+Space to trigger completion menu
      --   ['<C-Space>'] = cmp.mapping.complete(),

      --   -- Navigate between snippet placeholder
      --   ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      --   ['<C-b>'] = cmp_action.luasnip_jump_backward(),

      --   -- Scroll up and down in the completion documentation
      --   ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      --   ['<C-d>'] = cmp.mapping.scroll_docs(4),
      -- })
    })

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {},
      handlers = {
        lsp_zero.default_setup,

        lua_ls = function()
          require('lspconfig').lua_ls.setup({
            on_init = function(client)
              local path = client.workspace_folders[1].name
              if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                return
              end

              client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                  version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                  }
                }
              })
            end,
            settings = {
              Lua = {}
            }
          })
        end,

        -- vue
        volar = function()
          require('lspconfig').volar.setup({
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

          require('lspconfig').ts_ls.setup({
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
          })
        end,
      },
    })
  end
}
