local M = {}

function M:setup()
    local jdtls = require("jdtls")

    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

    if launcher_jar == "" then
        vim.notify("JDTLS launcher jar not found!", vim.log.levels.ERROR)
        return
    end

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml" }
    local root_dir = require("jdtls.setup").find_root(root_markers)

    local config = {
        cmd = {
            "/usr/lib/jvm/java-26-openjdk/bin/java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx4g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens",
            "java.base/java.util=ALL-UNNAMED",
            "--add-opens",
            "java.base/java.lang=ALL-UNNAMED",
            "-javaagent:" .. mason_path .. "/lombok.jar",
            "-jar",
            launcher_jar,
            "-configuration",
            mason_path .. "/config_linux",
            "-data",
            workspace_dir,
        },

        root_dir = root_dir,

        settings = {
            java = {
                format = {
                    enabled = true,
                    settings = {
                        url = root_dir .. "/eclipse-formatter.xml",
                        profile = "GoogleStyle",
                    },
                },
            },
        },
        init_options = {
            bundles = {},
            extendedClientCapabilities = jdtls.extendedClientCapabilities,
        },

        capabilities = require("cmp_nvim_lsp").default_capabilities(),
    }

    jdtls.start_or_attach(config)
end

return M
