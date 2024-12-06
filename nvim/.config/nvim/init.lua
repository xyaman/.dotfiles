-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("functions")
require("options")
require("keymaps")
require("commands")

require("lazy").setup("plugins", {
    ui = { border = "rounded" },
    install = { missing = false },
    change_detection = { notify = false },
})

-- vim.cmd("colorscheme vague")
vim.cmd("colorscheme rose-pine")
