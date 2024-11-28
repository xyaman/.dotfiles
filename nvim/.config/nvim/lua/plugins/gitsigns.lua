return {
    "lewis6991/gitsigns.nvim",

    config = function()
        require('gitsigns').setup({
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')
                local opts = {}
                opts.buffer = bufnr

                opts.desc = "Preview git hunk (Float Window)"
                vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, opts)

                opts.desc = "Diff the current file and split"
                vim.keymap.set('n', '<leader>gdf', gitsigns.diffthis, opts)

                -- movements
                opts.desc = "Git: Go to the next hunk"
                vim.keymap.set("n", "]g", gitsigns.next_hunk, opts)

                opts.desc = "Git: Go to the prev hunk"
                vim.keymap.set("n", "[g", gitsigns.prev_hunk, opts)
            end
        })
    end
}
