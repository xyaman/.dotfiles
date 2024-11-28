return {
    {
        "samharju/yeet.nvim",
        opts = {
            clear_before_yeet = false,
            cache_window_opts = {
                relative = "editor",
                row = (vim.o.lines - 15) * 0.5,
                col = (vim.o.columns - math.ceil(0.6 * vim.o.columns)) * 0.5,
                width = math.ceil(0.6 * vim.o.columns),
                height = 15,
                border = "rounded",
                title = "Yeet",
            },
        },
        keys = {
            {
                "<leader>yl",
                function() require("yeet").list_cmd() end,
                desc = "Yeet cmd"
            },
            {
                "<leader>ye",
                function() require("yeet").execute() end,
                desc = "Yeet execute"
            },
            {
                "<leader>yt",
                function() require("yeet").select_target() end,
                desc = "Yeet select target"
            },
        },
    },
}
