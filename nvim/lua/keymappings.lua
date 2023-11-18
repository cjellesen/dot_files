-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigating windows
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Navigate to left hand window' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Navigate to right hand window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Navigate to upper window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Navitgate to lower window' })
