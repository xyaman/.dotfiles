return {
    "stevearc/oil.nvim",
    dependencies = {
        { "echasnovski/mini.icons", opts = {} },
    },
    opts = {
        use_default_keymaps = false,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["gs"] = "actions.change_sort",
            ["g."] = "actions.toggle_hidden",
            ["<C-c>"] = "actions.close",
            ["-"] = "actions.parent",
            ["`"] = "actions.cd",
            ["_"] = "actions.open_cwd",
            ["r"] = " <cmd>RunFile<CR>",
        },
    },
}
