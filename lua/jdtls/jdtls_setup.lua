local M = {}
function M:setup()
    local home = vim.fn.expand("~")
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = home .. "/AppData/Local/nvim-data/jdtls-workspace2/" .. project_name

    local config = {
        cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx2g",
            "-Xms512m",
            "-XX:+UseG1GC",
            "-XX:+UseStringDeduplication",
            "--add-modules=ALL-SYSTEM",
            "--add-opens",
            "java.base/java.util=ALL-UNNAMED",
            "--add-opens",
            "java.base/java.lang=ALL-UNNAMED",
            "-jar",
            vim.fn.glob(home ..
                "/AppData/Local/nvim-data/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
            "-configuration",
            home .. "/AppData/Local/nvim-data/mason/packages/jdtls/config_win",
            "-data",
            workspace_dir,
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" },
            vim.api.nvim_buf_get_name(0)),
        settings = {
            java = {
                configuration = {
                    runtimes = {
                        {
                            name = "JavaSE-21",
                            path = vim.fn.getenv("JAVA_HOME"),
                            default = true,
                        },
                    },
                },
            },
        },
        init_options = {
            bundles = {},
        },
        on_attach = function(client, bufnr)
            client.server_capabilities.completionProvider.resolveProvider = false

            local jdtls = require("jdtls")
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set("n", "<leader>co", jdtls.organize_imports, opts)
            vim.keymap.set({ "n", "v" }, "<leader>crv", jdtls.extract_variable, opts)
            vim.keymap.set({ "n", "v" }, "<leader>crm", jdtls.extract_method, opts)
        end,
    }
    require("jdtls").start_or_attach(config)
end

return M
