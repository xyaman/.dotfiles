local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Normal --
-- Better window window navigation
set_keymap("n", "<C-h>", "<C-w>h", opts)
set_keymap("n", "<C-j>", "<C-w>j", opts)
set_keymap("n", "<C-k>", "<C-w>k", opts)
set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
set_keymap("n", "<S-h>", ":bprevious<CR>", opts)
set_keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Open netrw
set_keymap("n", "<leader>nt", ":Ex<CR>", opts)

-- Some expected behaviours
set_keymap("n", "Y", "yg$", opts) -- Y yanks current to end
set_keymap("n", "n", "nzzzv", opts) -- n centers the cursor
set_keymap("n", "N", "Nzzzv", opts) -- N centers the cursor
set_keymap("n", "J", "mzJ`z", opts)


-- Visual --
-- Stay in indent mode
set_keymap("v", "<", "<gv", opts)
set_keymap("v", ">", ">gv", opts)

-- Prevent copy when yanking
set_keymap("v", "p", '"_dP', opts)
