local opts = { noremap = true }

vim.g.mapleader = " "

vim.keymap.set(
    "n",
    "<leader>vim",
    function()
        vim.cmd "e ~/.dotfiles/nvim/.config/nvim/"
        vim.fn.chdir("~/.dotfiles/nvim/.config/nvim/")
    end,
    { desc = "Opens vim config directory." }
)

vim.keymap.set('n', '<leader>L', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- paste the word in x mode, but doesn't override the yank content
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Open netrw
-- vim.keymap.set("n", "<leader>nt", ":Ex<CR>", opts)
vim.keymap.set("n", "<leader>nt", ":Oil<CR>", opts)

-- Terminal: use ESC to return to NORMAL mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Some expected behaviours
vim.keymap.set("n", "Y", "yg$", opts)   -- Y yanks current to end
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
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Go to the prev element in the quickfix." })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Go to the next element in the quickfix." })

vim.keymap.set("n", "<leader>gn", "<cmd>lprev<CR>zz", { desc = "Go to the prev element in the location list." })
vim.keymap.set("n", "<leader>gb", "<cmd>lnext<CR>zz", { desc = "Go to the next element in the location list." })

-- Misc
-- Opens replace with the word under the cursor selected
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI]])

-- Encodings
vim.keymap.set("n", "<leader>enc", "<cmd>!chardet %<CR>");
vim.keymap.set("n", "<leader>euc", "<cmd>e ++enc=euc-jp<CR>");
vim.keymap.set("n", "<leader>sjis", "<cmd>e ++enc=sjis<CR>");

-- See character code (tab, spaces, etc)
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>set invlist<CR>");

-- Some keymaps are created unconditionally when Nvim starts:
-- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
-- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
-- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
-- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
-- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
-- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
vim.keymap.del("n", "grn");
vim.keymap.del("n", "gra");
vim.keymap.del("n", "grr");
vim.keymap.del("n", "gri");
vim.keymap.del("n", "gO");

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        opts = { buffer = event.buf }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
        vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)

        -- we use zz, so we need to use <cmd>
        vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>zz")
        vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>zz")
    end,
})
