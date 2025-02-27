return {
    {"vague2k/vague.nvim", opts = {transparent = true,}},
    {"ellisonleao/gruvbox.nvim", opts = { transparent_mode = true, },},
    {"armannikoyan/rusty", opts = { transparent_mode = true, },},
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
    {"catppuccin/nvim", name = "catppuccin",},
    {
        "folke/tokyonight.nvim",
        opts = {

            transparent = true,
            style = "night",
            styles = {
                functions = {},
            },
        }
    },
}
