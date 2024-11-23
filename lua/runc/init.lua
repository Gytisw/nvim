local M = {}

M.run_interactive_terminal = function()
    local current_file = vim.fn.expand('%')
    vim.cmd('write')  -- Save the current file

    -- Detect file type and prepare appropriate command
    local file_extension = current_file:match("^.+(%..+)$")
    local command = nil

    if file_extension == ".c" then
        command = "cat " .. current_file .. " | gcc -xc -lm - && ./a.out"
    elseif file_extension == ".py" then
        command = "python3 " .. current_file
    elseif file_extension == ".js" then
        command = "node " .. current_file
    elseif file_extension == ".lua" then
        command = "lua" .. current_file
    else
        print("Unsupported file type: " .. file_extension)
        return
    end

    -- Create a new terminal buffer and run the command
    vim.cmd("split | term " .. command)
end

return M
