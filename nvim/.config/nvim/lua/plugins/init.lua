return {
    -- ---@type LazySpec
    {
        {
            "aileot/nvim-thyme",
            version = "~v1.0.0",
            dependencies = {
                { "https://git.sr.ht/~technomancy/fennel" },
            },
            lazy = false,
            priority = 1000,
            build = ":lua require('thyme').setup(); vim.cmd('ThymeCacheClear')",
            init = function()
                local thyme_cache_prefix = vim.fn.stdpath("cache") .. "/thyme/compiled"
                -- if the directory doesn't already exist, it might get dropped
                -- from runtimepath. it's a no-op if the directory already exists
                vim.fn.mkdir(thyme_cache_prefix, "p")
                vim.opt.rtp:prepend(thyme_cache_prefix)
            end,
            config = function()
                table.insert(package.loaders, function(...)
                    return require("thyme").loader(...)
                end)
                require("thyme").setup()
            end,
        },
    },
}
