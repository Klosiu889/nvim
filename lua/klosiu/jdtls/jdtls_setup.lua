local M = {}

function M:setup()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = "/home/klosiu/.local/share/nvim/jdtls-workspace/" .. project_name
    local config = {
        cmd = {
            "/usr/lib/jvm/java-25-openjdk/bin/java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens",
            "java.base/java.util=ALL-UNNAMED",
            "--add-opens",
            "java.base/java.lang=ALL-UNNAMED",
            "-javaagent:" .. "/home/klosiu/.local/share/nvim/mason/packages/jdtls/lombok.jar",
            "-jar",
            "/home/klosiu/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
            "-configuration",
            "/home/klosiu/.local/share/nvim/mason/packages/jdtls/config_linux",
            "-data",
            workspace_dir,
        },

        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),

        settings = {
            java = "/usr/lib/jvm/java-25-openjdk/bin/java",
        },

        init_options = {
            bundles = {},
        },
    }

    require("jdtls").start_or_attach(config)
end

return M
