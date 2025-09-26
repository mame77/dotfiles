require("toggleterm").setup({
    direction = 'float',
})

vim.keymap.set("n", "<leader>o", vim.cmd.ToggleTerm)
