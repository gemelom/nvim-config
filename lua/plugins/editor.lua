return {
  {
    'keaising/im-select.nvim',
    lazy = false,
    opts = {
      default_im_select = '1033',
      default_command = 'im-select.exe',
      set_default_events = { 'InsertLeave' },
      set_previous_events = { 'InsertEnter', 'VimLeavePre' },
    },
  },
}
