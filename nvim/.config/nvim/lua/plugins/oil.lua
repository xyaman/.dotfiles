return {
    "stevearc/oil.nvim",
    dependencies = {
        { "echasnovski/mini.icons", opts = {} },
    },
    opts = {
        columns = {
            "icon",
            "size",
            "mtime",
        },
        use_default_keymaps = false,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<C-p>"] = "actions.preview",
            ["<CR>"] = "actions.select",
            ["gs"] = "actions.change_sort",
            ["g."] = "actions.toggle_hidden",
            ["-"] = "actions.parent",
            ["`"] = "actions.cd",
            ["_"] = "actions.open_cwd",
            ["r"] = " <cmd>RunFile<CR>",
        },
    },
}
