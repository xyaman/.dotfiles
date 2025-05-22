return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            php = { "php-cs-fixer", fallback = "lsp" },
            -- For filetypes without a formatter:
            ["_"] = { "trim_whitespace", "trim_newlines" },
        },
        notify_on_error = true,
        formatters = {
            -- Require a Prettier configuration file to format.
            prettier = { require_cwd = true },
        },
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if not vim.g.autoformat then
                return
            end

            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
    },
    init = function()
        vim.g.autoformat = true
    end,
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format()
            end,
            desc = "Format code using conform.nvim",
        },
    },
}
