return {
  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      css = { rgb_fn = true },
      vue = { rgb_fn = true },
    },
  },
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    -- optionally, override the default options:
    config = function()
      require('tailwindcss-colorizer-cmp').setup {
        color_square_width = 2,
      }
    end,
  },
}
