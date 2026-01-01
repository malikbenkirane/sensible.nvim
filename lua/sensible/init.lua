local M = {}

M.setup = function(opts)

  -- FIXME --
  -- vim.api.nvim_create_user_command('SensibleShiftWidth', function(_)
  --   local columns = tonumber(opt.fargs[1] or "2")
  --   vim.o.shiftwidth = columns
  --   vim.o.tabstop = columns
  -- end, {
  --   desc = 'Set both shiftwidth and tabstop',
  --   nargs = '?',
  -- })

  -- SensibleCommand

  vim.api.nvim_create_user_command('SensibleCommand', function(_)

    vim.keymap.set('n', ':', 'q:i')

    vim.api.nvim_create_user_command("SensibleCmdlineLastCommand", function()
      local seq = vim.api.nvim_replace_termcodes('q:<Esc>k', true, false, true)
      vim.api.nvim_feedkeys(seq, 'n', false)
    end, {})

    vim.api.nvim_create_user_command("SensibleCmdlineBackwardSearch", function()
      local seq = vim.api.nvim_replace_termcodes('q:<Esc>?', true, false, true)
      vim.api.nvim_feedkeys(seq, 'n', false)
    end, {})

  end, {
    desc = 'Always open cmdline.',
  })

  -- SensibleTerm

  vim.api.nvim_create_user_command('SensibleTerm', function(_)
    vim.cmd('sp|term')
    vim.api.nvim_feedkeys(':res 20\ni', 'n', false)
  end, {desc = 'Always open cmdline.'})

  -- SensibleGit

  vim.api.nvim_create_user_command("SensibleGitCommitAndPush", function()
    -- requires .fish/functions/push.fish
    vim.cmd('write')
    vim.cmd('term git commit --allow-empty --file % && push')
  end, {})

  -- SensibleJujutsuDescribe

  vim.api.nvim_create_user_command("SensibleJujutsuDescribe", function()
    vim.cmd('write ! jj describe --stdin')
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
    end,
    ["2space"] = function()
      vim.cmd('SensibleShiftWidth')
    end
  }
  for _, opt in pairs(opts) do
    settings[opt]()
  end
end

return M


-- Inspirational Credits https://codeberg.org/willhbr/dotfiles/src/branch/main/vim/vimrc --
