return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        statuscolumn = { enabled = false },
        dashboard = { enabled = true },
        picker = { enabled = true },

        bigfile = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        words = { enabled = false },
    },
    keys = {
        -- Top Pickers & Explorer
        {
            "<leader>tt",
            function()
                Snacks.picker.files()
            end,
            desc = "Picker Files",
        },
        {
            "<leader>tg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Picker Grep",
        },
        {
            "<leader>th",
            function()
                Snacks.picker.help()
            end,
            desc = "Picker help",
        },
        {
            "<leader>tv",
            function()
                Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Find Config File",
        },
        {
            "<leader>tc",
            function()
                Snacks.picker.colorschemes({ layout = "ivy" })
            end,
            desc = "Colorschemes",
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
    },
}
