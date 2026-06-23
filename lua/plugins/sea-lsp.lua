return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')
        local configs = require('lspconfig.configs')

        if not configs.sea_lsp then
            configs.sea_lsp = {
                default_config = {
                    cmd = { 'sea_lsp' },
                    filetypes = { 'sea' },
                    root_dir = function(fname)
                        return require('lspconfig.util').root_pattern('sea.toml')(fname)
                            or require('lspconfig.util').find_git_ancestor(fname)
                            or vim.fn.getcwd()
                    end,
                    settings = {},
                },
            }
        end

        lspconfig.sea_lsp.setup({})
    end,
}
