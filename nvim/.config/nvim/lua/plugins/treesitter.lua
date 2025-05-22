return {
    "nvim-treesitter/nvim-treesitter",
    -- event = { "BufReadPost", "BufNewFile" },
    -- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },

    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                enabled = true,
                -- Avoid the sticky context from growing a lot.
                max_lines = 3,
                -- Match the context lines to the source code.
                multiline_threshold = 1,
                -- Disable it when the window is too small.
                min_window_height = 20,
            },
            keys = {
                {
                    "[c",
                    function()
                        -- Jump to previous change when in diffview.
                        if vim.wo.diff then
                            return "[c"
                        else
                            vim.schedule(function()
                                require("treesitter-context").go_to_context()
                            end)
                            return "<Ignore>"
                        end
                    end,
                    desc = "Jump to upper context",
                    expr = true,
                },
            },
        },
    },

    build = ":TSUpdate",
    opts = {
        ensure_installed = {},
        sync_install = false,
        ignore_install = { "" },
        auto_install = true,
        indent = { enable = true },

        highlight = {
            enable = true,

            disable = function(_, bufnr)
                -- neovim get size of buffer
                local file_size = vim.fn.getfsize(vim.fn.bufname(bufnr))
                local file_lines = vim.api.nvim_buf_line_count(bufnr)
                return file_size > 50000 or file_lines > 50000
            end,
        },
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
