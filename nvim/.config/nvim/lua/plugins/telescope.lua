return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",

    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },

    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "node_modules", "^zig-cache/", ".git\\" },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>tt", builtin.find_files, { desc = "Telescope files" })
        vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "Telescope grep" })

        vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope help tags" })
        vim.keymap.set("n", "<leader>tc", builtin.colorscheme, { desc = "Telescope colorscheme" })
        vim.keymap.set("n", "<leader>tk", builtin.keymaps, { desc = "Telescope keymaps" })
    end,
}
