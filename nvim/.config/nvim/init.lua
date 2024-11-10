require "xyaman.options"
require "xyaman.keymaps"
require "xyaman.lazy_init"
require "xyaman.colorscheme"

-- vim.cmd [[colorscheme tokyonight]]
vim.cmd [[ colorscheme gruvbox ]]
vim.cmd [[ au BufRead,BufNewFile *.zon setfiletype zig ]]
