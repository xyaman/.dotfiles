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
require("lsp")

require("lazy").setup("plugins", {
    ui = { border = "rounded" },
    change_detection = { notify = false },
    rocks = { enabled = false },
})

-- vim.cmd("colorscheme rose-pine")
vim.cmd.colorscheme("oh-lucy-evening")

-- set treesitter context highlight
vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "#6D5978" })

-- Enable the new experimental command-line features.
require("vim._extui").enable({})
