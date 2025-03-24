-- 2 spaces indented for some files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'javascript' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- disable autoformat for some files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'somefile' },
  callback = function()
    vim.b.autoformat = false
  end,
})
