local vim = vim

local jdtls_path = vim.fn.trim(vim.fn.system("command -v jdtls"))
local lombok_jar = vim.loop.os_homedir() .. "/.config/nvim/ftplugin/java/lombok.jar"
local ms_java_debug_jar = vim.loop.os_homedir() .. "/.config/nvim/ftplugin/java/com.microsoft.java.debug.plugin-0.53.1.jar"

local jdtls = require("jdtls")

local config = {
	cmd = {
		jdtls_path,
		"--jvm-arg=-javaagent:" .. lombok_jar,
	},
	root_dir = vim.fs.dirname(
		vim.fs.find({ "build.gradle", "pom.xml", "gradlew", ".git", "mvnw" }, { upward = true })[1]
	),
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	init_options = {
		bundles = {
			ms_java_debug_jar,
		},
	},
	on_attach = function()
		jdtls.setup_dap({
			hotcodereplace = "auto",
		})
		require('jdtls.dap').setup_dap_main_class_configs()
	end,
}

jdtls.start_or_attach(config)
