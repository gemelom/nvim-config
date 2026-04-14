return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function(_, opts)
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup(opts)

      local group = 'dap-eval-keymap'

      local function set_eval_key()
        vim.keymap.set('n', 'K', dapui.eval, {
          buffer = 0,
          silent = true,
          desc = 'DAP Eval Under Cursor',
        })
      end

      local function remove_eval_key()
        pcall(vim.keymap.del, 'n', 'K', { buffer = 0 })
      end

      dap.listeners.after.event_initialized[group] = set_eval_key
      dap.listeners.after.event_stopped[group] = set_eval_key
      dap.listeners.before.event_terminated[group] = remove_eval_key
      dap.listeners.before.event_exited[group] = remove_eval_key
    end,
    opts = {
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.55,
            },
            {
              id = 'breakpoints',
              size = 0.15,
            },
            {
              id = 'stacks',
              size = 0.15,
            },
            {
              id = 'watches',
              size = 0.15,
            },
          },
          position = 'left',
          size = 40,
        },
        {
          elements = { {
            id = 'repl',
            size = 0.5,
          }, {
            id = 'console',
            size = 0.5,
          } },
          position = 'bottom',
          size = 12,
        },
      },
    },
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {
      enabled = false,
    },
  },
}
