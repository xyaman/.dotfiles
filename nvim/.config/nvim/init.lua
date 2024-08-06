require "xyaman.options"
require "xyaman.keymaps"
require "xyaman.lazy_init"

vim.cmd [[colorscheme tokyonight]]
vim.cmd [[ au BufRead,BufNewFile *.zon setfiletype zig ]]
