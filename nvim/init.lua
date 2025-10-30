-- minimal configuration

--mouse
vim.opt.mouse = ""
vim.opt.guicursor = ""
-- display
vim.opt.number = true
vim.opt.relativenumber = true
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
-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.diagnostic.config({ virtual_text = true })
-- auto completion
vim.opt.pumheight = 5
vim.opt.completeopt = { "fuzzy", "menuone", "noselect" }
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

vim.pack.add({
    -- plugin
    { src = 'https://github.com/nvim-mini/mini.pick' },                 -- minipick
    { src = 'https://github.com/echasnovski/mini.pairs' },              -- minipairs
    { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' }, -- blankline
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },     -- treesitter
    { src = 'https://github.com/neovim/nvim-lspconfig' },               -- lspconfig
    -- notification
    { src = 'https://github.com/MunifTanjim/nui.nvim'},                 -- nui
    { src = 'https://github.com/rcarriga/nvim-notify'},                 -- notify
    { src = 'https://github.com/folke/noice.nvim'},                     -- noice
    -- colorscheme
    { src = 'https://github.com/folke/tokyonight.nvim' },               -- tokyonight
});
require('mini.pick').setup()
require('mini.pairs').setup()
-- blankline
require("ibl").setup({
    indent = { char = "│", },
        scope = {
        enabled = false,
        show_start = true,
        show_end = true,
    } })
-- treesitter 
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'go', 'typescript', 'javascript', 'html', 'css' },
    auto_install = true,
    highlight = { enable = true },
})
-- lsp
vim.lsp.enable('gopls')
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})
-- notify
require("notify").setup({
  timeout = 1500,
  stages = "static",
  top_down = false,
})
-- noice
require("noice").setup({
  presets = { command_palette = true },
})
-- colorscheme
vim.cmd.colorscheme('tokyonight-night')
vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#ffffff",
  bold = true,
})
--keymap
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>j', vim.cmd.Ex)
vim.keymap.set('n', '<leader>k', vim.cmd.w)
vim.keymap.set('n', '<leader>q', vim.cmd.q)
vim.keymap.set('n', '<leader>t', vim.cmd.terminal)
vim.keymap.set('n', '<leader>x', vim.cmd.bd)
vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p')
-- minipick
vim.keymap.set('n', '<leader>f', ':Pick files<CR>');
vim.keymap.set('n', '<leader>s', ':Pick grep_live<CR>');
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>');

