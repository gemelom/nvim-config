return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function(_, opts)
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup(opts)

      local repl_group = vim.api.nvim_create_augroup('dap-repl-blink-keymaps', { clear = true })

      vim.api.nvim_create_autocmd('FileType', {
        group = repl_group,
        pattern = 'dap-repl',
        callback = function(event)
          local cmp = require 'blink.cmp'

          local function feed(key)
            local keys = vim.api.nvim_replace_termcodes(key, true, false, true)
            vim.api.nvim_feedkeys(keys, 'in', false)
          end

          vim.keymap.set('i', '<CR>', function()
            if cmp.is_menu_visible() then
              cmp.accept()
            else
              feed '<CR>'
            end
          end, {
            buffer = event.buf,
            silent = true,
            desc = 'DAP REPL confirm completion or execute',
          })

          vim.keymap.set('i', '<Tab>', function()
            if cmp.is_menu_visible() then
              cmp.select_next()
            else
              feed '<Tab>'
            end
          end, {
            buffer = event.buf,
            silent = true,
            desc = 'DAP REPL next completion item',
          })

          vim.keymap.set('i', '<S-Tab>', function()
            if cmp.is_menu_visible() then
              cmp.select_prev()
            else
              feed '<S-Tab>'
            end
          end, {
            buffer = event.buf,
            silent = true,
            desc = 'DAP REPL previous completion item',
          })
        end,
      })

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
