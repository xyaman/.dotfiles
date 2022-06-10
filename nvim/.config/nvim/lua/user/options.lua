vim.opt.clipboard = "unnamedplus" -- https://vim.fandom.com/wiki/Accessing_the_system_clipboard
vim.opt.number = true             -- shows line number
vim.opt.relativenumber = true     -- shows relative line numbers
vim.opt.cursorline = true        -- highlights the current line
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.tabstop = 2               -- number of spaces for tab
vim.opt.shiftwidth = 2            -- number of spaces for indentation 
vim.opt.ignorecase = false        -- ignore search in search patterns
vim.opt.swapfile = false          -- creates a swapfile
vim.opt.splitbelow = true         -- force all horizontal splits go below of current window
vim.opt.splitright = true         -- force all vertical splits go to the right of current window
vim.opt.updatetime = 300          -- faster completion (3000ms default)
vim.opt.wrap = false              -- displays line as one long line
vim.opt.scrolloff = 8
vim.opt.completeopt = { "menuone", "noselect" }

vim.cmd [[set iskeyword+=-]]

-- highlight on yank
vim.cmd [[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 150})
augroup END
]]

-- Global variables (Languages ex.)
vim.g.zig_fmt_autosave = true
