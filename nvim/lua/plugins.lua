local plugins = {
    -- telescope
    {src = 'https://github.com/nvim-telescope/telescope.nvim',},
    -- blink
    {src = 'https://github.com/Saghen/blink.cmp',},
    -- lspconfig
    {src = 'https://github.com/neovim/nvim-lspconfig'},
    -- toggleterm
    {src = 'https://github.com/akinsho/toggleterm.nvim'},
    -- autopairs
    {src = 'https://github.com/windwp/nvim-autopairs'},
    -- treesitter
    {src = 'https://github.com/nvim-treesitter/nvim-treesitter'},
    -- blankline
    {src = 'https://github.com/lukas-reineke/indent-blankline.nvim'},
    -- trouble
    {src = 'https://github.com/folke/trouble.nvim'},
    -- bufferline
    {src = 'https://github.com/akinsho/bufferline.nvim'},
    -- nui (noice)
    {src = 'https://github.com/MunifTanjim/nui.nvim'},
    -- notify (noice)
    {src = 'https://github.com/rcarriga/nvim-notify'},
    -- noice
    {src = 'https://github.com/folke/noice.nvim'},
    -- plenary (codecompanion)
    {src = 'https://github.com/nvim-lua/plenary.nvim'},
    -- codecompanion
    {src = 'https://github.com/olimorris/codecompanion.nvim'},
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
-- blankline
require("plugins.blankline")
-- trouble
require("plugins.trouble")
-- bufferline
require("plugins.bufferline")
-- noify
require("plugins.notify")
-- noice
require("plugins.noice")
-- codecompanion
require("plugins.codecompanion")

