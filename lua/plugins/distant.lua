return {
  {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
      require('distant'):setup()
    end,
  },
  {
    'nosduco/remote-sshfs.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      mounts = {
        base_dir = vim.fn.expand '$HOME' .. '/.sshfs/', -- base directory for mount points
        unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
      },
      -- Refer to the configuration section below
      -- or leave empty for defaults
    },
  },
}
