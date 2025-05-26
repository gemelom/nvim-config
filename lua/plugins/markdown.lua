return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'npm install',
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview' },
    },
    init = function()
      vim.g.mkdp_preview_options = {
        disable_filename = 1,
      }
      vim.g.mkdp_markdown_css = vim.fn.expand '~/.config/nvim/css/drake-vue.css'
    end,
  },
}
