local opts = { noremap = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>vim", function()
    vim.cmd("e ~/.dotfiles/nvim/.config/nvim/")
    vim.fn.chdir("~/.dotfiles/nvim/.config/nvim/")
end, { desc = "Opens vim config directory." })

vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Copy/Pasting related keymaps
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste the word in x mode, but doesn't override the yank content
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy to system clipboard

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Open netrw
-- vim.keymap.set("n", "<leader>nt", ":Ex<CR>", opts)
vim.keymap.set("n", "-", ":Oil<CR>", opts)

-- Some expected behaviours
vim.keymap.set("n", "Y", "yg$", opts) -- Y yanks current to end
vim.keymap.set("n", "n", "nzzzv", opts) -- n centers the cursor
vim.keymap.set("n", "N", "Nzzzv", opts) -- N centers the cursor
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quickfix / Location lists
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { desc = "Go to the prev element in the quickfix." })
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "Go to the next element in the quickfix." })

vim.keymap.set("n", "<leader>gn", "<cmd>lprev<CR>zz", { desc = "Go to the prev element in the location list." })
vim.keymap.set("n", "<leader>gb", "<cmd>lnext<CR>zz", { desc = "Go to the next element in the location list." })

-- Misc
-- Opens replace with the word under the cursor selected
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI]])
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- print php pre
-- TODO: use treesitter to print variable under cursor
vim.keymap.set("n", "<leader>pr", "oecho \"<pre>\";<CR>echo \"</pre>\";<Esc>Oprint_r(")

-- Terminal related
-- use ESC to return to NORMAL mode (have some problems with TUI programs, ex lazygit)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
