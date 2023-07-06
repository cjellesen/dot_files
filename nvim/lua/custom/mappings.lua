---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.dap_all_langs = {
 plugin = true,
 n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint" },
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "Continue" },
    ["<leader>do"] = { "<cmd> DapStepOver <CR>", "Step Over" },
    ["<leader>di"] = { "<cmd> DapStepInto <CR>", "Step Into" },
    ["<leader>dx"] = { "<cmd> DapStepOut <CR>", "Step Out" },
    ["<leader>dt"] = { "<cmd> DapTerminate <CR>", "Terminate" },
    ["<leader>dr"] = { "<cmd> DapToggleRepl <CR>", "Toggle REPL" },
  }
}

M.pythonfordap = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

return M
