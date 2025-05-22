vim.api.nvim_create_user_command("ToggleFormat", function()
    vim.g.autoformat = not vim.g.autoformat
    vim.notify(string.format("%s formatting...", vim.g.autoformat and "Enabling" or "Disabling"), vim.log.levels.INFO)
end, { desc = "Toggle autoformat (conform.nvim)" })

vim.api.nvim_create_user_command("ListTabs", function()
    local tabs = {}
    local current_tab = vim.api.nvim_tabpage_get_number(0)
    for _, tid in ipairs(vim.api.nvim_list_tabpages()) do
        local file_names = {}
        local is_current = current_tab == vim.api.nvim_tabpage_get_number(tid)
        for _, wid in ipairs(vim.api.nvim_tabpage_list_wins(tid)) do
            -- Only consider the normal windows and ignore the floating windows
            if vim.api.nvim_win_get_config(wid).relative == "" then
                local bid = vim.api.nvim_win_get_buf(wid)
                local path = vim.api.nvim_buf_get_name(bid)
                local file_name = vim.fn.fnamemodify(path, ":t")
                table.insert(file_names, file_name)
            end
        end
        table.insert(tabs, { file_names, tid, is_current })
    end

    -- Prompt
    vim.ui.select(tabs, {
        prompt = "Tabs Picker",
        format_item = function(item)
            local entry_string = table.concat(item[1], ", ")
            return string.format("%s%s", entry_string, item[3] and "*" or "")
        end,
    }, function(item)
        if item ~= nil then
            vim.api.nvim_set_current_tabpage(item[2])
        end
    end)
end, { desc = "Tabs picker" })

vim.api.nvim_create_user_command("Encoding", function()
    if vim.fn.executable("chardet") == 0 then
        vim.notify("chardet is not installed", vim.log.levels.ERROR)
        return
    end

    local obj = vim.system({ "chardet", vim.api.nvim_buf_get_name(0) }, { text = true }):wait()
    local chardet, confidence = string.match(obj.stdout, ":%s*(%S+)%s+with%s+confidence%s+(%S+)")

    local encodings = {
        { chardet, confidence },
        "euc-jp",
        "sjis",
        "utf-8",
    }
    vim.ui.select(encodings, {
        prompt = "Select encoding",
        format_item = function(item)
            if type(item) == "string" then
                return item
            else
                return string.format("chardet: %s [c: %s]", item[1], item[2])
            end
        end,
    }, function(choice)
        if choice == nil then
            return
        end

        local encoding = type(choice) == "string" and choice or choice[1]
        local filename = vim.fn.expand("%:p")

        local cmd = string.format("edit ++enc=%s %s", encoding, vim.fn.fnameescape(filename))
        vim.cmd(cmd)
    end)
end, { desc = "Select encoding" })

vim.keymap.set("n", "<leader>tw", ":ListTabs<CR>", { desc = "List tabs" })
vim.keymap.set("n", "<leader>enc", ":Encoding<CR>", { desc = "List encodings" })
