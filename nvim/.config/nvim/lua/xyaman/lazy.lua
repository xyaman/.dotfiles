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

-- -- Harpoon --
-- -- Show menu
-- set_keymap("n", "<leader>ss", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
-- 
-- -- Add file
-- set_keymap("n", "<leader>sa", ":lua require('harpoon.mark').add_file()<CR>", opts)
-- 
-- -- Move to files
-- set_keymap("n", "<leader>sj", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
-- set_keymap("n", "<leader>sk", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
-- set_keymap("n", "<leader>sl", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>ss", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>sj", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>sk", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>sl", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>sl;", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
