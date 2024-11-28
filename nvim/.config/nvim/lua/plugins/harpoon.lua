return {
    "ThePrimeagen/harpoon",

    branch = "harpoon2",

    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-s>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>j", function() harpoon:list():select(1) end, { desc = "harpoon 1" })
        vim.keymap.set("n", "<leader>k", function() harpoon:list():select(2) end, { desc = "harpoon 2" })
        vim.keymap.set("n", "<leader>l", function() harpoon:list():select(3) end, { desc = "harpoon 3" })
        vim.keymap.set("n", "<leader>;", function() harpoon:list():select(4) end, { desc = "harpoon 4" })
    end,
}
