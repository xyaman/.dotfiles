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


-- Open netrw
set_keymap("n", "<leader>nt", ":Ex<CR>", opts)

-- Some expected behaviours
set_keymap("n", "Y", "yg$", opts) -- Y yanks current to end
set_keymap("n", "n", "nzzzv", opts) -- n centers the cursor
set_keymap("n", "N", "Nzzzv", opts) -- N centers the cursor
set_keymap("n", "J", "mzJ`z", opts)

-- Insert --
-- Exit with jk
set_keymap("i", "jk", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
set_keymap("v", "<", "<gv", opts)
set_keymap("v", ">", ">gv", opts)

-- Prevent copy when yanking
set_keymap("v", "p", '"_dP', opts)

-- Telescope --
-- Find files
set_keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)

-- NvimTree --
-- Toggle
set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Harpoon --
-- Show menu
set_keymap("n", "<leader>ss", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Add file
set_keymap("n", "<leader>sa", ":lua require('harpoon.mark').add_file()<CR>", opts)

-- Move to files
set_keymap("n", "<leader>sj", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
set_keymap("n", "<leader>sk", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
set_keymap("n", "<leader>sl", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
