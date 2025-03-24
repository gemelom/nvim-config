local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- slower C-u and C-d
keymap.set('n', '<C-u>', '15k')
keymap.set('n', '<C-d>', '15j')
