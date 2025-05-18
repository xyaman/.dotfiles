return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            -- For filetypes without a formatter:
            ['_'] = { 'trim_whitespace', 'trim_newlines' },
        },
        formatters = {
            -- Require a Prettier configuration file to format.
            prettier = { require_cwd = true },
        },
    },
    keys = {
        { "<leader>cf", function() require("conform").format() end, desc = "Format code using conform.nvim" }
    }
}
