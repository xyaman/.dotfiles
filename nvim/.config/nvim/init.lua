require "xyaman.options"
require "xyaman.keymaps"
require "xyaman.lazy_init"

vim.cmd("colorscheme rose-pine")
vim.cmd [[ au BufRead,BufNewFile *.zon setfiletype zig ]]
