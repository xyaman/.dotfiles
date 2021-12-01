local lsp = require "lspconfig"
local cmp = require "cmp"


local lspkind = require "lspkind"
lspkind.init()

local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.api.nvim_set_keymap("n", "<leader>ca", ":Lspsaga code_action<cr>", {noremap = true})

-- nvim-cmp setup
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<cr>"] = cmp.mapping.confirm({select = true}),
    ["<C-y>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 4 },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        luasnip = "[snip]",
      },
    },
  },
  experimental = {
    ghost_text = true
  }
})

-- lsp keybindings
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap=true, silent=false }

  buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>df", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- My lsp servers
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.rust_analyzer.setup{on_attach = on_attach, capabilities = capabilities}
lsp.gopls.setup{on_attach = on_attach, capabilities = capabilities}
lsp.clangd.setup{on_attach = on_attach, capabilities = capabilities}
lsp.zls.setup{on_attach = on_attach, capabilities = capabilities}
lsp.sourcekit.setup{}
lsp.texlab.setup{on_attach = on_attach, capabilities = capabilities}
lsp.pylsp.setup{on_attach = on_attach, capabilities = capabilities}

--[[
lsp.sumneko_lua.setup{
  cmd = { "./bin/Linux/lua-language-server" };
  settings = {
      Lua = {
        runtime = {
            version = "LuaJIT",
            kl
--]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,noselect"
