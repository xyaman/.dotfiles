P = function(v)
    print(vim.inspect(v))
    return v
end

local M = {
    P = P,
}

return M
