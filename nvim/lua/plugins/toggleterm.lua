require("toggleterm").setup({
    direction = 'float',
})

vim.keymap.set("n", "<leader>t", vim.cmd.ToggleTerm)
