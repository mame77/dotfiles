vim.pack.add({
	'https://github.com/folke/tokyonight.nvim',
    'https://github.com/shaunsingh/nord.nvim'
})

vim.cmd.colorscheme('nord')

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#ffffff",     -- 白
  bold = true,
})
