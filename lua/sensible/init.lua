local M = {}

M.setup = function(opts)

  vim.api.nvim_create_user_command('SensibleCommand', function(_)
    vim.keymap.set('n', ':', 'q:i')
  end, {desc = 'Always open cmdline.'})

  vim.api.nvim_create_user_command('SensibleTerm', function(_)
    vim.cmd('sp|term')
    vim.api.nvim_feedkeys(':res 20\ni', 'n', false)
  end, {desc = 'Always open cmdline.'})

  vim.api.nvim_create_user_command("SensibleGitCommitAndPush", function()
    -- requires .fish/functions/push.fish
    vim.cmd('write')
    vim.cmd('term git commit --allow-empty --file % && push')
  end, {})

  vim.api.nvim_create_user_command("SensibleExplore", function()
    vim.cmd('Explore')
  end, {})

  vim.api.nvim_create_user_command("SensibleSexplore", function()
    vim.cmd('Sexplore')
  end, {})

  vim.api.nvim_create_user_command("SensibleVexplore", function()
    vim.cmd('Vexplore')
  end, {})

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
