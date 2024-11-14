local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- open neovim dotfiles
vim.keymap.set("n", "<leader>vim", "<cmd>e ~/.dotfiles/nvim/.config/nvim/<CR>");

-- paste the word in x mode, but doesn't override the yank content
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


-- Normal --
-- Better window window navigation
-- vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
-- vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
-- vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
-- vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Open netrw
-- vim.api.nvim_set_keymap("n", "<leader>nt", ":Ex<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>nt", ":Oil<CR>", opts)

-- Some expected behaviours
vim.api.nvim_set_keymap("n", "Y", "yg$", opts)   -- Y yanks current to end
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts) -- n centers the cursor
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts) -- N centers the cursor
vim.api.nvim_set_keymap("n", "J", "mzJ`z", opts)
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts)
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)

-- Insert --
-- Exit with jk
vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quickfix / Location lists
vim.keymap.set("n", "<leader>ck", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>cj", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>lk", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>lj", "<cmd>lprev<CR>zz")

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(e)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>zz")
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>zz")
  end
})

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>Telescope colorscheme<CR>", opts)
