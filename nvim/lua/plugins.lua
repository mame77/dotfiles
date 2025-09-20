local plugins = {
    {
        src = 'https://github.com/nvim-telescope/telescope.nvim', 
    },
    {
        src = 'https://github.com/Saghen/blink.cmp',
	},
    {
		src = 'https://github.com/neovim/nvim-lspconfig',
	},
    {
		src = 'https://github.com/akinsho/toggleterm.nvim',
	},
}
vim.pack.add(plugins)

require("plugins.telescope")
require("plugins.blink")
require("plugins.toggleterm")

