return {
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Required dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',

        -- Shows variable values inline as virtual text
        'theHamsta/nvim-dap-virtual-text',
    },
    keys = {
        -- <leader>d prefix = [D]ebug commands
        {
            '<leader>dc',
            function()
                require('dap').continue()
            end,
            desc = '[D]ebug: Start/Continue',
        },
        {
            '<leader>di',
            function()
                require('dap').step_into()
            end,
            desc = '[D]ebug: Step [I]nto',
        },
        {
            '<leader>do',
            function()
                require('dap').step_over()
            end,
            desc = '[D]ebug: Step [O]ver',
        },
        {
            '<leader>dO',
            function()
                require('dap').step_out()
            end,
            desc = '[D]ebug: Step Out',
        },
        {
            '<leader>db',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = '[D]ebug: Toggle [B]reakpoint',
        },
        {
            '<leader>dB',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = '[D]ebug: Conditional Breakpoint',
        },
        {
            '<leader>dt',
            function()
                require('dapui').toggle()
            end,
            desc = '[D]ebug: [T]oggle UI',
        },
        {
            '<leader>dl',
            function()
                require('dap').run_last()
            end,
            desc = '[D]ebug: Run [L]ast',
        },
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        -- optional
        -- require('mason-nvim-dap').setup {
        --     automatic_installation = true,
        --     handlers = {},
        --     ensure_installed = {
        --         'delve',
        --     },
        -- }

        -- Dap UI setup
        dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Automatically open/close DAP UI
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Setup virtual text to show variable values inline
        require("nvim-dap-virtual-text").setup()

        -- ========================================
        -- .NET Debugger Adapter (netcoredbg)
        -- ========================================
        local netcoredbg_path = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg"
        if vim.fn.has("win32") == 1 then
            netcoredbg_path = netcoredbg_path .. ".exe"
        end

        dap.adapters.coreclr = {
            type = "executable",
            command = netcoredbg_path,
            args = { "--interpreter=vscode" },
        }

        -- C# Debugging Configurations
        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "Launch .NET application",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
                end,
            },
            {
                type = "coreclr",
                name = "Attach to .NET process",
                request = "attach",
                processId = require("dap.utils").pick_process,
            },
        }
    end,
}
