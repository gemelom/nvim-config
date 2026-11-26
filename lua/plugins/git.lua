return {
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {
    'sindrets/diffview.nvim',
    opts = {
      hooks = {
        diff_buf_win_enter = function(_, winid)
          vim.wo[winid].wrap = true
        end,
      },
    },
  },
}
