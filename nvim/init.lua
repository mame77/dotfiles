-- display
vim.opt.mouse = ""
vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.wrap = false
vim.opt.scrolloff = 6
vim.opt.termguicolors = true
-- indent
vim.opt.swapfile = false 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.diagnostic.config({ virtual_text = true })
-- completion
vim.opt.pumheight = 10
vim.opt.completeopt = { "fuzzy", "menuone", "noinsert" }
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
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
    { src = 'https://github.com/stevearc/oil.nvim' }, --Oil
    { src = 'https://github.com/catppuccin/nvim' },                     -- catppuccin
});
-- require
require('mini.pick').setup()
require('mini.pairs').setup()
require('oil').setup({
    view_options = {
        show_hidden = true,
    },
    win_options = {
        winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
    },
})
require('gitsigns').setup()
require("notify").setup({ timeout = 5000, stages = "static", top_down = false })
require("noice").setup({ presets = { command_palette = true } })
require("ibl").setup({ indent = { char = "│" }, scope = { enabled = false } })
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'go', 'typescript', 'javascript', 'html', 'css' },
    auto_install = true,
    highlight = { enable = true },
})
-- lsp
vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')
-- keymap
vim.g.mapleader = ' '
vim.keymap.set({'v', 'x'},  '<leader>y', '"+y')
vim.keymap.set('n', '<leader>j', vim.cmd.Oil)
vim.keymap.set('n', '<leader>r', vim.cmd.LspRestart);
vim.keymap.set('n', '<leader>l', vim.lsp.buf.format);
vim.keymap.set('n', '<leader>f', ':Pick files<CR>');
vim.keymap.set('n', '<leader>g', ':Pick grep_live<CR>');
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>');
vim.keymap.set('n', 'grd', vim.lsp.buf.definition);
vim.keymap.set('n', 'gre', vim.diagnostic.open_float);

-- colorscheme
vim.cmd.colorscheme ('catppuccin-latte')
