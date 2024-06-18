local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'nvim-telescope/telescope.nvim',    tag = '0.1.6',       dependencies = { 'nvim-lua/plenary.nvim' } },
  { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
  -- { "ellisonleao/gruvbox.nvim",         priority = 1000,    config = true,                             opts = ... },
  { "catppuccin/nvim",                  name = "catppuccin", priority = 1000 },
  { "ThePrimeagen/harpoon",             branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },
  { "github/copilot.vim" },
  { "lewis6991/gitsigns.nvim" },
 -- {"ray-x/go.nvim", dependencies = { "ray-x/guihua.lua"}, config = function() require("go").setup() end, event = {"CmdlineEnter"}, ft = {"go", "gomod"}, build=':lua require("go.install").update_all_sync()'},
}

local opts = {}
require("lazy").setup(plugins, opts)

