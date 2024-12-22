vim.g.mapleader = ' '
-- Quit with `q`
vim.keymap.set('n', 'q', 'ZQ', { desc = 'Quit' })
-- Fast save
vim.keymap.set('n', '<leader>w', ':update<CR>', { desc = 'Save File' })
-- Sudo save
vim.keymap.set('n', '<leader>r', ':w !sudo tee %<CR>', { desc = 'Save as Root' })
-- Create a new tab
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New Tab' })
-- Close the current tab
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close Tab' })
-- Change all occurrences
vim.keymap.set('n', '<leader>S', ':%s//g<Left><Left>', { desc = 'Replace All Occurrences' })
-- Change occurrences in the current line
vim.keymap.set('n', '<leader>s', ':s//g<Left><Left>', { desc = 'Replace in Line' })
-- Replace all occurrences (case-insensitive)
vim.keymap.set('n', '<leader>iS', ':%s//gi<Left><Left>', { desc = 'Replace All (Ignore Case)' })
-- Replace in the current line (case-insensitive)
vim.keymap.set('n', '<leader>is', ':s//gi<Left><Left>', { desc = 'Replace in Line (Ignore Case)' })
-- Double Esc to clear search highlights
vim.keymap.set('n', '<Esc><Esc>', '<Esc>:nohlsearch<CR><Esc>', { silent = true, desc = 'Clear Search Highlight' })
-- Ex mode
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
-- Lazy.nvim keybinding
vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { desc = 'Open Lazy Plugin Manager' })
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- Telescope Git
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Find Git Files' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
-- Telescope Grep search
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
-- Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git Status' })
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Git diff') end, { desc = 'Git Diff' })
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Git commit') end, { desc = 'Git Commit' })
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Git push') end, { desc = 'Git Push' })
vim.keymap.set({ 'n' }, '<C-k>', function()       require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })
vim.keymap.set({ 'n' }, '<Leader>k', function()
    vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })
