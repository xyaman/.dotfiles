-- Enable LSP only after opening file, not at the startup
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        vim.lsp.enable({ "luals", "vtsls" })
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    once = true,
    callback = function(event)
        -- Some keymaps are created unconditionally when Nvim starts:
        -- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
        -- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
        -- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
        -- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
        -- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
        -- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
        -- vim.keymap.del("n", "grn");
        -- vim.keymap.del("n", "gra");
        -- vim.keymap.del("n", "grr");
        -- vim.keymap.del("n", "gri");
        -- vim.keymap.del("n", "gO");

        local opts = { buffer = event.buf }
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        --
        -- vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
        --
        -- vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        -- vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
        --
        -- vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float)
        --
        -- -- we use zz, so we need to use <cmd>
        -- vim.keymap.set("n", "[[", "<cmd>lua vim.diagnostic.setqflist()<CR>")
        -- vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>zz")
        -- vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>zz")
    end
})
