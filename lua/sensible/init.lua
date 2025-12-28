local M = {}

M.setup = function(opts)
  vim.api.nvim_create_user_command('SensibleCommand', function(_)
    vim.keymap.set('n', ':', 'q:i')
  end, {desc = 'Always open cmdline.'})
  local settings = {
    ["command"] = function()
      vim.cmd('SensibleCommand')
    end
  }
  for _, opt in pairs(opts) do
    settings[opt]()
  end
end

return M
