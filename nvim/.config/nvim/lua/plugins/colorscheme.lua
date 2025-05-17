return {
    { "ellisonleao/gruvbox.nvim", opts = { transparent_mode = true, }, },
    {
        "ficcdaf/ashen.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            hl = {
                force_override = {
                    LineNr = { fg = "#555555", bg = "NONE" },
                    CursorLineNr = { fg = "#c0c0c0", bg = "NONE", bold = true },
                },
            },
        },
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            disable_background = true,
            extend_background_behind_borders = true,
            dim_inactive_background = false,
            styles = {
                transparency = true,
            },
            highlight_groups = {
                TelescopeBorder = { fg = "highlight_high", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "none" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "text", bg = "none" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
            },
        },
    },
}
