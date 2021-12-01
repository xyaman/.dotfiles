vim.g.mapleader = " " -- global leader

require("xyaman")

vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Show relative line numbers
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.shiftround = true            -- Round indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4               -- Indent size 4 spaces
vim.opt.termguicolors = true
vim.opt.wrap = false

-- theme
vim.o.background = "dark"

-- treesitter
require'nvim-treesitter.configs'.setup{highlight = {enable = true}}

vim.cmd([[colorscheme gruvbox]])
vim.cmd([[autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE]]) -- Transparent background

-- logos syntax
vim.cmd([[autocmd BufNewFile,BufRead *.x set filetype=logos]])

-- highlight on yank
vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 150})
augroup END
]])

-- Rust settings
vim.g.rustfmt_autosave = 1 -- Format on save rust

-- Go settings
require('go').setup()
vim.cmd([[autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()]])

-- keybindings
local map = vim.api.nvim_set_keymap

map('n', '<leader>nt', ':Ex<cr>', {noremap = true, silent = true}) -- Go to previous buffer

map('n', '<leader>bp', ':w <bar> :bprev<cr>', {noremap = true, silent = true}) -- Go to previous buffer
map('n', '<leader>bn', ':w <bar> :bnext<cr>', {noremap = true, silent = true}) -- Go to next buffer
map('n', '<leader>bd', ':bd<cr>', {noremap = true}) -- Close buffer

-- telescope keybindings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true}) -- open Telescope file zsf
map("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", {noremap = true}) -- open Telescope file browser

-- lsp keybindings are in lsp.lua file (mainly because of reduce mess and on_attach)

map("n", "Y", "yg$", {noremap = true})
map("n", "n", "nzzzv", {noremap = true})
map("n", "N", "Nzzzv", {noremap = true})
map("n", "J", "mzJ`z", {noremap = true})
