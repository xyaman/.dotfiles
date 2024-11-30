vim.opt.number = true         -- shows line number
vim.opt.relativenumber = true -- shows relative line numbers
vim.opt.cursorline = true     -- highlights the current line
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 4           -- number of spaces for tab
vim.opt.shiftwidth = 4        -- number of spaces for indentation
vim.opt.ignorecase = true     -- ignore search in search patterns
vim.opt.smartcase = true      -- automatically switch to a case-sensitive search if there are any capital letters
vim.opt.swapfile = false      -- creates a swapfile
vim.opt.backup = false
vim.opt.splitbelow = true     -- force all horizontal splits go below of current window
vim.opt.splitright = true     -- force all vertical splits go to the right of current window
vim.opt.updatetime = 300      -- faster completion (3000ms default)
vim.opt.wrap = false          -- displays line as one long line
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.colorcolumn = "80"
vim.opt.hlsearch = false

-- vim.opt.clipboard = "unnamedplus" -- https://vim.fandom.com/wiki/Accessing_the_system_clipboard
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- testing new option
vim.opt.guicursor = ""
vim.cmd("set iskeyword+=_")

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

-- Global variables (Languages ex.)
vim.g.zig_fmt_autosave = true
vim.cmd [[ au BufRead,BufNewFile *.zon setfiletype zig ]]
vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
