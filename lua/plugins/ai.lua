return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = 'copilot2',
      providers = {
        ['copilot2'] = {
          __inherited_from = 'copilot',
          model = 'o3-mini',
        },
        ['copilot3'] = {
          __inherited_from = 'copilot',
          model = 'claude-3.7-sonnet',
        },
        ['oaipro'] = {
          __inherited_from = 'openai',
          api_key_name = 'OAIPRO_API_KEY',
          endpoint = 'https://api.oaipro.com/v1',
          model = 'claude-3-7-sonnet-20250219',
        },
        ['deepseek'] = {
          __inherited_from = 'openai',
          api_key_name = 'DEEPSEEK_API_KEY',
          endpoint = 'https://api.deepseek.com',
          model = 'deepseek-coder',
        },
        ['qianwen'] = {
          __inherited_from = 'openai',
          api_key_name = 'DASHSCOPE_API_KEY',
          endpoint = 'https://dashscope.aliyuncs.com/compatible-mode/v1',
          model = 'qwen-coder-plus-latest',
        },
        ['openrouter'] = {
          __inherited_from = 'openai',
          api_key_name = 'OPENROUTER_API_KEY',
          endpoint = 'https://openrouter.ai/api/v1',
          model = 'google/gemini-2.5-pro-preview',
        },
      },
    },
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-mini/mini.pick', -- for file_selector provider mini.pick
      'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'ibhagwan/fzf-lua', -- for file_selector provider fzf
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- disable warning messages
            verbose = false,
            -- required for Windows users
            -- use_absolute_path = false,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  {
    'olimorris/codecompanion.nvim',
    opts = {},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  { 'augmentcode/augment.vim' },
  {
    'johnseth97/codex.nvim',
    lazy = true,
    keys = {
      {
        '<leader>cc',
        function()
          require('codex').toggle()
        end,
        desc = 'Toggle Codex popup',
      },
    },
    opts = {
      keymaps = {}, -- disable internal mapping
      border = 'rounded', -- or 'double'
      width = 0.8,
      height = 0.8,
      autoinstall = true,
    },
  },
  {
    'ravitemer/mcphub.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for Job and HTTP requests
    },
    -- cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
    build = 'npm install -g mcp-hub@latest', -- Installs required mcp-hub npm module
    config = function()
      require('mcphub').setup {
        -- Required options
        port = 4000, -- Port for MCP Hub server
        config = vim.fn.expand '~/mcpservers.json', -- Absolute path to config file

        -- Optional options
        on_ready = function(hub)
          -- Called when hub is ready
        end,
        on_error = function(err)
          -- Called on errors
        end,
        log = {
          level = vim.log.levels.WARN,
          to_file = false,
          file_path = nil,
          prefix = 'MCPHub',
        },
      }
    end,
  },
  {
    'greggh/claude-code.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for git operations
    },
    config = function()
      require('claude-code').setup()
    end,
  },
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    keys = {
      { '<leader>a', nil, desc = 'AI/Claude Code' },
      { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
      { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
      { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
      { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
      { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
      { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
      {
        '<leader>as',
        '<cmd>ClaudeCodeTreeAdd<cr>',
        desc = 'Add file',
        ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles' },
      },
      -- Diff management
      { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
      { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    },
  },
}
