return {
    "danymat/neogen",
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "<leader>nf",
            function()
                require("neogen").generate()
            end,
            desc = "Insert documentation",
        },
    },
}
