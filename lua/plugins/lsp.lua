-- lua/plugins/lsp.lua
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- Docker Compose filetype detection
        vim.filetype.add({
            filename = {
                ["docker-compose.yml"] = "yaml.docker-compose",
                ["docker-compose.yaml"] = "yaml.docker-compose",
                ["compose.yml"] = "yaml.docker-compose",
                ["compose.yaml"] = "yaml.docker-compose",
            },
        })

        -- Setup Mason first
        require("mason").setup()

        -- Auto-enable inlay hints when lsp attaches
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                end
            end,
        })

        -- Setup mason-lspconfig with handlers
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer", "lua_ls", "pyright", "ts_ls",
                "html", "cssls", "eslint",
                "dockerls",
                "docker_compose_language_service",
            },
            automatic_installation = true,
            handlers = {
                -- Default handler for all servers
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                -- Custom handler for rust_analyzer
                ["rust_analyzer"] = function()
                    require("lspconfig").rust_analyzer.setup({
                        settings = {
                            ['rust-analyzer'] = {
                                cargo = {
                                    allFeatures = true,
                                },
                                checkOnSave = {
                                    command = "clippy",
                                },
                                inlayHints = {
                                    typeHints = {
                                        enable = true,
                                    },
                                    parameterHints = {
                                        enable = true,
                                    },
                                    chainingHints = {
                                        enable = true,
                                    },
                                },
                            },
                        },
                    })
                end,
                -- Custom handler for lua_ls
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                end,
                -- Pyright
                ["pyright"] = function()
                    require("lspconfig").pyright.setup({
                        settings = {
                            python = {
                                analysis = {
                                    autoSearchPaths = true,
                                    diagnosticMode = "workspace",
                                    useLibraryCodeForTypes = true,
                                    typeCheckingMode = "basic",
                                },
                            },
                        },
                    })
                end,
                -- TypeScript, JavaScript
                ["ts_ls"] = function()
                    require("lspconfig").ts_ls.setup({
                        settings = {
                            typescript = { inlayHints = { includeInlayParameterNameHints = "all" } },
                            javascript = { inlayHints = { includeInlayParameterNameHints = "all" } },
                        },
                    })
                end,
                -- HTML
                ["html"] = function()
                    require("lspconfig").html.setup({
                        filetypes = { "html" },
                    })
                end,
                -- CSS
                ["cssls"] = function()
                    require("lspconfig").cssls.setup({})
                end,
                -- ESLint
                ["eslint"] = function()
                    require("lspconfig").eslint.setup({
                        on_attach = function(_, bufnr)
                            vim.api.nvim_create_autocmd("BufWritePre", {
                                buffer = bufnr,
                                command = "EslintFixAll",
                            })
                        end,
                    })
                end,
                -- Docker
                ["dockerls"] = function()
                    require("lspconfig").dockerls.setup({
                        settings = {
                            docker = {
                                languageserver = {
                                    formatter = {
                                        ignoreMultilineInstructions = true,
                                    },
                                },
                            },
                        },
                    })
                end,
                -- Docker Compose
                ["docker_compose_language_service"] = function()
                    require("lspconfig").docker_compose_language_service.setup({
                        filetypes = { "yaml.docker-compose" },
                        root_dir = require("lspconfig.util").root_pattern(
                            "docker-compose.yml",
                            "docker-compose.yaml",
                            "compose.yml",
                            "compose.yaml"
                        ),
                    })
                end,
            },
        })
    end,
}
