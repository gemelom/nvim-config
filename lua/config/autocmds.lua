local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

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

-- auto switch input method
vim.api.nvim_create_autocmd({ 'FileType', 'InsertEnter' }, {
  pattern = { 'markdown', 'text' },
  callback = function()
    vim.fn.system 'im-select.exe 2052'
  end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  callback = function()
    vim.fn.system 'im-select.exe 1033'
  end,
})

-- override LazyVim's default autocmds to disable spell check
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'wrap_spell',
  pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})
