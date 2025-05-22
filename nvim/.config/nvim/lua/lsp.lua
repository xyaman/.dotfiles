-- Enable LSP only after opening file, not at the startup
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        local server_configs = {}
        local files = vim.api.nvim_get_runtime_file("lsp/*.lua", true)

        for i = 1, #files do
            table.insert(server_configs, vim.fn.fnamemodify(files[i], ":t:r"))
        end

        vim.lsp.enable(server_configs)
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    once = true,
    callback = function(args)
        -- Some keymaps are created unconditionally when Nvim starts:
        -- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
        -- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
        -- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
        -- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
        -- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
        -- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|

        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
        vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help)

        vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)

        -- -- we use zz, so we need to use <cmd>
        vim.keymap.set("n", "[[", "<cmd>lua vim.diagnostic.setqflist()<CR>")
        vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>zz")
        vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>zz")
    end,
})
