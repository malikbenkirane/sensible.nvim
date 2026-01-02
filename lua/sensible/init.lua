local M = {}

M.setup = function(opts)

  vim.api.nvim_create_user_command('SensibleShiftWidth', function(opts)
    local columns = opts.fargs[1] or "2"
    vim.cmd('set sw='..columns..' ts='..columns)
  end, {
    desc = 'Set both shiftwidth and tabstop',
    nargs = '?',
  })

  -- SensibleCursor
  vim.api.nvim_create_user_command('SensibleGuicursor', function(_)
    vim.cmd('set guicursor=a:block-Cursor')
  end, {
    desc = 'set guicursor to a:block-Cursor'
  })

  -- SensibleNetrw

  vim.api.nvim_create_user_command('SensibleNetrwFirefoxMacOs', function(_)
    local firefox = "/Applications/Firefox.app/Contents/MacOS/firefox"
    vim.g.netrw_browsex_viewer = firefox -- gx
  end, {})

  -- SensibleCommand

  vim.api.nvim_create_user_command('SensibleCommand', function(_)

    vim.keymap.set('n', ':', 'q:i')

    vim.api.nvim_create_user_command("SensibleCmdlineLastCommand", function()
      local seq = vim.api.nvim_replace_termcodes('q:<Esc>k', true, false, true)
      vim.api.nvim_feedkeys(seq, 'n', false)
    end, {})

    vim.api.nvim_create_user_command("SensibleCmdlineDefault", function()
      local seq = vim.api.nvim_replace_termcodes(':', true, false, true)
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
    end,
    ["netrw_firefox_macos"] = function()
      vim.cmd('SensibleNetrwFirefoxMacOs')
    end,
    ["a:block-Cursor"] = function()
      vim.cmd('SensibleGuicursor')
    end,
  }
  for _, opt in pairs(opts) do
    settings[opt]()
  end
end

return M


-- Inspirational Credits
-- https://codeberg.org/willhbr/dotfiles/src/branch/main/vim/vimrc --
