local M = {}
local api = vim.api

function M.save()
    local buf = api.nvim_get_current_buf()

    api.nvim_buf_call(buf, function()
        vim.cmd("silent! write")
    end)
end

function M.on()
    api.nvim_create_augroup("AutoSave", {
        clear = true,
    })

    api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        callback = function()
            M.save()
        end,
        pattern = "*",
        group = "AutoSave",
    })
end

M.on()

return M
