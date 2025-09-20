vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>j', vim.cmd.Ex)
vim.keymap.set('n', '<leader>x', vim.cmd.bd)
vim.keymap.set('n', '<leader>k', vim.cmd.w)
vim.keymap.set('n', '<leader>q', vim.cmd.q)

vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y<CR>')

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format);
vim.keymap.set('n', '<leader>u', vim.pack.update)
