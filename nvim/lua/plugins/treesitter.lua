require('nvim-treesitter.install').update({ with_sync = true })
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'go', 'typescript', 'javascript', 'yaml', 'json', 'toml', 'html', 'css', 'query'},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
