return {
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    keys = {
      { '<leader>tp', '<cmd>TypstPreview<cr>', desc = 'Typst Preview' },
    },
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
  },
}
