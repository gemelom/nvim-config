return {
  {
    'GCBallesteros/jupytext.nvim',
    config = true,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
    opts = {
      custom_language_formatting = {
        python = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        },
      },
    },
  },
  {
    'jmbuhr/otter.nvim',
    ft = { 'quarto', 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
  {
    'quarto-dev/quarto-nvim',
    ft = { 'quarto', 'python', 'markdown' },
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = { 'python' },
        chunks = 'all',
        diagnostics = {
          enabled = true,
          triggers = { 'BufWritePost' },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        -- NOTE: setup your own keymaps:
        hover = 'H',
        definition = 'gd',
        rename = '<leader>rn',
        references = 'gr',
        format = '<leader>gf',
      },
      codeRunner = {
        enabled = true,
        default_method = 'molten',
        -- ft_runners = {
        --   markdown = 'molten',
        --   python = 'molten',
        -- },
      },
    },
  },
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    build = ':UpdateRemotePlugins',
    ft = { 'quarto', 'python', 'markdown' },
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      vim.g.molten_output_win_max_height = 12
      vim.g.python3_host_prog = vim.fn.expand '~/miniconda3/bin/python'
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true

      vim.keymap.set('n', '<leader>mi', ':MoltenInit<CR>', { desc = 'molten init', silent = true })
      vim.keymap.set('n', '<leader>me', ':MoltenEvaluateOperator<CR>', { desc = 'evaluate operator', silent = true })
      vim.keymap.set('n', '<leader>os', ':noautocmd MoltenEnterOutput<CR>', { desc = 'open output window', silent = true })
      vim.keymap.set('n', '<leader>rr', ':MoltenReevaluateCell<CR>', { desc = 're-eval cell', silent = true })
      vim.keymap.set('v', '<leader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { desc = 'execute visual selection', silent = true })
      vim.keymap.set('n', '<leader>oh', ':MoltenHideOutput<CR>', { desc = 'close output window', silent = true })
      vim.keymap.set('n', '<leader>md', ':MoltenDelete<CR>', { desc = 'delete Molten cell', silent = true })

      local runner = require 'quarto.runner'
      vim.keymap.set('n', '<leader>rc', runner.run_cell, { desc = 'run cell', silent = true })
      vim.keymap.set('n', '<leader>ra', runner.run_above, { desc = 'run cell and above', silent = true })
      vim.keymap.set('n', '<leader>rA', runner.run_all, { desc = 'run all cells', silent = true })
      vim.keymap.set('n', '<leader>rl', runner.run_line, { desc = 'run line', silent = true })
      vim.keymap.set('v', '<leader>r', runner.run_range, { desc = 'run visual range', silent = true })
    end,
  },
}
