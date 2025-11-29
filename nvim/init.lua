-- display
vim.opt.mouse = ""
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.wrap = false
vim.opt.scrolloff = 6
vim.opt.termguicolors = true
-- indent
vim.opt.swapfile = false 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.diagnostic.config({ virtual_text = true })
-- completion
vim.opt.pumheight = 5
vim.opt.completeopt = { "fuzzy", "menuone", "noselect" }
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true, })
        end
    end,
})

-- plugin
vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.pick' },                 -- minipick
    { src = 'https://github.com/echasnovski/mini.pairs' },              -- minipairs
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },             -- gitsigns
    { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' }, -- ibl
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },     -- treesitter
    { src = 'https://github.com/neovim/nvim-lspconfig' },               -- lspconfig
    { src = 'https://github.com/MunifTanjim/nui.nvim' },                -- nui
    { src = 'https://github.com/rcarriga/nvim-notify' },                -- notify
    { src = 'https://github.com/folke/noice.nvim' },                    -- noice
    { src = 'https://github.com/folke/tokyonight.nvim' },               -- tokyonight

});
require('mini.pick').setup()
require('mini.pairs').setup()
require('gitsigns').setup()
require("ibl").setup({ indent = { char = "│" }, scope = { enabled = false } })
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'go', 'typescript', 'javascript', 'html', 'css' },
    auto_install = true,
    highlight = { enable = true },
})
vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
vim.lsp.config('lua_ls', {
    settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("", true) } } }
})
require("notify").setup({ timeout = 1500, stages = "static", top_down = false })
require("noice").setup({ presets = { command_palette = true } })
vim.cmd.colorscheme ('tokyonight-day')
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })

-- keymap
vim.g.mapleader = ' '
vim.keymap.set('n', 'q:', '<Nop>')

vim.keymap.set('n', '<leader>j', vim.cmd.Ex)
vim.keymap.set('n', '<leader>k', vim.cmd.w)
vim.keymap.set('n', '<leader>t', vim.cmd.term)
vim.keymap.set('n', '<C-j>', 'o<Esc>k')
vim.keymap.set({'v', 'x'}, '<leader>y', '"+y')

vim.keymap.set('n', '<leader>f', ':Pick files<CR>');
vim.keymap.set('n', '<leader>g', ':Pick grep_live<CR>');
vim.keymap.set('n', '<leader>r', ':Pick buffers<CR>');
vim.keymap.set('n', '[p', '<cmd>Gitsigns prev_hunk<CR>')
vim.keymap.set('n', '[n', '<cmd>Gitsigns next_hunk<CR>')

