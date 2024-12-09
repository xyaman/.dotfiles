return {
    "ThePrimeagen/harpoon",

    branch = "harpoon2",

    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            yeet = {
                select = function(list_item, _, _)
                    require("yeet").execute(list_item.value)
                end
            }
        })

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-s>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>j", function() harpoon:list():select(1) end, { desc = "harpoon 1" })
        vim.keymap.set("n", "<leader>k", function() harpoon:list():select(2) end, { desc = "harpoon 2" })
        vim.keymap.set("n", "<leader>l", function() harpoon:list():select(3) end, { desc = "harpoon 3" })
        vim.keymap.set("n", "<leader>;", function() harpoon:list():select(4) end, { desc = "harpoon 4" })

        -- yeet (check plugins folder)
        vim.keymap.set("n", "<leader>yc",
            function() harpoon.ui:toggle_quick_menu(harpoon:list("yeet"), {title = "Harpoon Yeet"}) end, { desc = "[harpoon] yeet cmds" })
        vim.keymap.set("n", "<leader>y1", function() harpoon:list("yeet"):select(1) end, { desc = "[harpoon] yeet 1" })
        vim.keymap.set("n", "<leader>y2", function() harpoon:list("yeet"):select(2) end, { desc = "[harpoon] yeet 2" })
        vim.keymap.set("n", "<leader>y3", function() harpoon:list("yeet"):select(3) end, { desc = "[harpoon] yeet 3" })
        vim.keymap.set("n", "<leader>y4", function() harpoon:list("yeet"):select(4) end, { desc = "[harpoon] yeet 4" })
    end,
}
