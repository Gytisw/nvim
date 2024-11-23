return {
    'runc',
      keys = {
        {
            "<leader>`",
            function()
                require('runc').run_interactive_terminal()
            end,
            desc = "Run Script with Current File",
        },
    },
    dev = true,  -- Use development mode to load plugin from local directory
}
