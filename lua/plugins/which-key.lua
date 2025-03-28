return {
  'folke/which-key.nvim',
  opts = function(_, opts)
    table.insert(opts.spec[1], { '<leader>a', group = 'ai' })
    table.insert(opts.spec[1], { '<leader>i', group = 'input method' })
  end,
}
