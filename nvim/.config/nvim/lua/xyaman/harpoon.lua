--[[
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-y> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

vim.ap
--]]
vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", {noremap = true})

vim.api.nvim_set_keymap("n", "<C-h>", ":lua require('harpoon.ui').nav_file(1)<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-t>", ":lua require('harpoon.ui').nav_file(2)<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-n>", ":lua require('harpoon.ui').nav_file(3)<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-s>", ":lua require('harpoon.ui').nav_file(4)<cr>", {noremap = true})
