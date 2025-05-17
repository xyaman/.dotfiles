return {
    "danymat/neogen", 
    config = true,
    keys = {
        {
            "<leader>nf",
            function ()
                require("neogen").generate()
            end,
            desc = "Insert documentation"
        }
    }
}
