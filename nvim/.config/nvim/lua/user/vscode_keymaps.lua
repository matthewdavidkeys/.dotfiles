local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- yank to system clipboard
keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)

-- paste from system clipboard
keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- better indent handling
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move text up and down
keymap('v', 'J', ':m .+1<CR>==', opts)
keymap('v', 'K', ':m .-2<CR>==', opts)
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap('v', 'p', '"_dP', opts)

-- removes highlighting after escaping vim search
keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)
keymap({ 'n', 'v' }, '<leader>t', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ 'n', 'v' }, '<leader>pe', "<cmd>lua require('vscode').action('workbench.action.showAllEditors')<CR>")
keymap({ 'n', 'v' }, '<leader>pf', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ 'n', 'v' }, '<leader>ps', "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>")
keymap({ 'n', 'v' }, '<leader>tp', "<cmd>lua require('vscode').action('workbench.action.togglePanel')<CR>")
keymap({ 'n', 'v' }, '\\', "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
