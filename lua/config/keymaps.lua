local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- slower C-u and C-d
keymap.set('n', '<C-u>', '15k')
keymap.set('n', '<C-d>', '15j')

-- toggle input method between English (1033) and Chinese (2052)
keymap.set('n', '<leader>im', function()
  local current_im = vim.fn.system 'im-select.exe'
  if current_im:match '2052' then
    vim.fn.system 'im-select.exe 1033'
  else
    vim.fn.system 'im-select.exe 2052'
  end
end, { desc = 'Toggle input method', noremap = true, silent = true })
