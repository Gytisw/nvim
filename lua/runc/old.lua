local M = {}

M.run_script_with_current_file = function()
    local current_file = vim.fn.expand('%')
    vim.cmd('write')  -- Save the current file

    -- Function to handle the output
    local function handle_output(job_id, data, event)
        if event == "stdout" or event == "stderr" then
            -- Filter out empty strings from the data
            local filtered_data = {}
            for _, line in ipairs(data) do
                if line ~= "" then
                    table.insert(filtered_data, line)
                end
            end

            -- Create a new buffer and window to display the output if there's data
            if #filtered_data > 0 then
                local buf = vim.api.nvim_create_buf(false, true)
                vim.api.nvim_buf_set_lines(buf, 0, -1, false, filtered_data)
                local win = vim.api.nvim_open_win(buf, true, {
                    relative = "editor",
                    width = math.floor(vim.o.columns * 0.8),
                    height = math.floor(vim.o.lines * 0.8),
                    row = math.floor(vim.o.lines * 0.1),
                    col = math.floor(vim.o.columns * 0.1),
                    border = "rounded"
                })

                -- Set a key mapping in the floating window to close it with 'q'
                vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<Cmd>close<CR>', { noremap = true, silent = true })
            end
        end
    end

    -- Define the Lua equivalent of your shell script
    local function run_lua_script_on_file(file)
        local output = {}
        table.insert(output, "Running script on file: " .. file)

        -- Detect file type and run appropriate command
        local file_extension = file:match("^.+(%..+)$")
        local command = nil

        if file_extension == ".c" then
            command = "cat " .. file .. " | gcc -xc - && ./a.out"
        elseif file_extension == ".py" then
            command = "python3 " .. file
        elseif file_extension == ".js" then
            command = "node " .. file
        else
            table.insert(output, "Unsupported file type: " .. file_extension)
            return output
        end

        -- Add debugging
        table.insert(output, "Executing command: " .. command)

        local handle = io.popen(command)
        local result = handle:read("*a")
        handle:close()

        if result == "" then
            table.insert(output, "No output returned from the command.")
        else
            for line in result:gmatch("[^\r\n]+") do
                table.insert(output, line)
            end
        end

        return output
    end

    -- Capture the output and handle it
    local output = run_lua_script_on_file(current_file)
    handle_output(nil, output, "stdout")
end

return M
