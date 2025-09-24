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
    {
		src = 'https://github.com/windwp/nvim-autopairs',
	},
    {
		src = 'https://github.com/nvim-treesitter/nvim-treesitter',
	},
    {
		src = 'https://github.com/lukas-reineke/indent-blankline.nvim',
	},
    {
		src = 'https://github.com/folke/trouble.nvim',
	},
    {
		src = 'https://github.com/akinsho/bufferline.nvim',
	},
}
vim.pack.add(plugins)

--telescope
require("plugins.telescope")
-- blink
require("plugins.blink")
-- toggleterm
require("plugins.toggleterm")
-- autopair
require("plugins.autopair")
-- treesitter
require("plugins.treesitter")
-- indent
require("plugins.indent")
-- trouble
require("plugins.trouble")
-- bufferline
require("plugins.bufferline")
