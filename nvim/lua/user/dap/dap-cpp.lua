local dap = require('dap')

-- configure debug adapter, which facilitates between nvim-dap and a language-specific debugger
-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
local adapter_cmd = nil
local adapter_path = nil

if is_windows_os then
    adapter_path = "C:\\cpptools-win64\\"
    adapter_cmd = adapter_path .. "extension\\debugAdapters\\bin\\OpenDebugAD7.exe"

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = "executable",
      command = adapter_cmd,
      options = {
          detached = false
      }
    }
else
    dbg_path = require("dap-install.config.settings").options["installation_path"] .. "ccppr_vsc/"
    adapter_cmd = dbg_path .. "extension/debugAdapters/bin/OpenDebugAD7"

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = "executable",
      command = adapter_cmd,
    }
end

local dbg_cmd = nil
if is_windows_os then
    dbg_cmd = "C:\\MinGW\\bin\\gdb.exe"
else
    dbg_cmd = "/usr/bin/gdb"
end

dap.configurations.cpp = {
  -- launch exe
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    miDebuggerPath = dbg_cmd,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      local input = vim.fn.input("Input args: ")
      return require("user.dap.dap-util").str2argtable(input)
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
      {
        description = 'enable pretty printing',
        text = '-enable-pretty-printing',
        ignoreFailures = false
      },
    },
  },
  -- attach process
  {
    name = "Attach process",
    type = "cppdbg",
    request = "attach",
    miDebuggerPath = dbg_cmd,
    processId = require('dap.utils').pick_process,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    setupCommands = {
      {
        description = 'enable pretty printing',
        text = '-enable-pretty-printing',
        ignoreFailures = false
      },
    },
  },
  -- attach server
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerPath = dbg_cmd, cwd = '${workspaceFolder}',
    miDebuggerServerAddress = 'localhost:1234',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
  },
}

-- setup other language
dap.configurations.c = dap.configurations.cpp
