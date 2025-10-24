return {
  config = function()
    local dap = require("dap")

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

    -- ========================================
    -- C# Debugging Configurations
    -- ========================================
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
