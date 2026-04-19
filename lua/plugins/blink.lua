return {
  {
    'saghen/blink.cmp',
    version = not vim.g.lazyvim_blink_main and '*',
    build = vim.g.lazyvim_blink_main and 'cargo build --release',
    dependencies = {
      'mayromr/blink-cmp-dap',
    },
    opts = {
      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        default = { 'lsp', 'path', 'buffer' },
        per_filetype = {
          ['dap-repl'] = { 'dap', 'buffer' },
        },
        providers = {
          dap = {
            module = 'blink-cmp-dap',
            name = 'DAP',
          },
        },
      },
      completion = {
        documentation = {
          window = {
            border = 'rounded',
          },
        },
      },
    },
  },
}
