-- lua/plugins/java.lua
return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
        local jdtls = require("jdtls")

        local home = os.getenv("~")
        local mason_path = home .. "/AppData/Local/nvim-data/mason/packages/jdtls"

        -- Unique data dir per project, so different projects don't clash
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = home .. "/AppData/Local/nvim-data/jdtls-workspace/" .. project_name

        local config = {
            cmd = {
                "java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.level=ALL",
                "-Xmx1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens", "java.base/java.util=ALL-UNNAMED",
                "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                "-jar", vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
                "-configuration", mason_path .. "/config_win", -- change to config_mac or config_win if needed
                "-data", workspace_dir,
            },

            root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

            settings = {
                java = {
                    inlayHints = {
                        parameterNames = { enabled = "all" },
                    },
                    signatureHelp = { enabled = true },
                    completion = {
                        favoriteStaticMembers = {
                            "org.junit.Assert.*",
                            "java.util.Objects.requireNonNull",
                        },
                    },
                },
            },

            on_attach = function(_, bufnr)
                -- Java-specific keymaps (on top of whatever global ones you have)
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "<leader>co", jdtls.organize_imports, opts)
                vim.keymap.set("n", "<leader>crv", jdtls.extract_variable, opts)
                vim.keymap.set("n", "<leader>crm", jdtls.extract_method, opts)
            end,
        }

        -- Start or attach jdtls
        jdtls.start_or_attach(config)
    end,
}
