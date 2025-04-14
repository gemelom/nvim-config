local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

-- 2 spaces indented for some files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'lua', 'javascript' },
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
-- helper function to check if buffer contains Chinese characters
local function contains_chinese_chars(bufnr)
  bufnr = bufnr or 0
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  for _, line in ipairs(lines) do
    -- Check for Chinese characters (Unicode ranges for common Chinese characters)
    if line:match '[\228-\233][\128-\191][\128-\191]' then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd({ 'FileType', 'InsertEnter' }, {
  pattern = { 'markdown', 'text' },
  callback = function()
    vim.fn.system 'im-select.exe 2052'
  end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  callback = function()
    local ft = vim.bo.filetype
    -- Only maintain Chinese input method if current file is markdown/text AND contains Chinese
    if (ft == 'markdown' or ft == 'text') and contains_chinese_chars() then
      vim.fn.system 'im-select.exe 2052'
    else
      vim.fn.system 'im-select.exe 1033'
    end
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
