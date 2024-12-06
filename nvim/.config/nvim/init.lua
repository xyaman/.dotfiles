-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("globals")
require("options")
require("keymaps")

require("lazy").setup("plugins", {
    ui = { border = "rounded" },
    install = { missing = false },
    change_detection = { notify = false },
})

-- vim.cmd("colorscheme vague")
vim.cmd("colorscheme rose-pine")


-- own commands
local list_tabs = function()
    local opts = {
        entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
            local entry_string = table.concat(file_names, ', ')
            return string.format('%s%s', entry_string, is_current and '*' or '')
        end,
    }
    local res = {}
    local current_tab = { number = vim.api.nvim_tabpage_get_number(0), index = nil }
    for index, tid in ipairs(vim.api.nvim_list_tabpages()) do
        local file_names = {}
        local file_paths = {}
        local file_ids = {}
        local window_ids = {}
        local is_current = current_tab.number == vim.api.nvim_tabpage_get_number(tid)
        for _, wid in ipairs(vim.api.nvim_tabpage_list_wins(tid)) do
            -- Only consider the normal windows and ignore the floating windows
            if vim.api.nvim_win_get_config(wid).relative == '' then
                local bid = vim.api.nvim_win_get_buf(wid)
                local path = vim.api.nvim_buf_get_name(bid)
                local file_name = vim.fn.fnamemodify(path, ':t')
                table.insert(file_names, file_name)
                table.insert(file_paths, path)
                table.insert(file_ids, bid)
                table.insert(window_ids, wid)
            end
        end
        if is_current then
            current_tab.index = index
        end
        table.insert(res, { file_names, file_paths, file_ids, window_ids, tid, is_current })
    end
    vim.ui.select(res, {
        prompt = 'Tabs',
        kind = 'telescope-tabs',
        format_item = function(item)
            return opts.entry_formatter(item[5], item[3], item[1], item[2], item[6])
        end,
    }, function(item)
        if item == nil then
            return
        end
        vim.api.nvim_set_current_tabpage(item[5])
    end)
end

vim.keymap.set("n", "<leader>tw", list_tabs, { desc = "List tabs" })
