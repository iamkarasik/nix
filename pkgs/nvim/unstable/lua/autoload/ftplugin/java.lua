local vim = vim

local jdtls_path = vim.fn.trim(vim.fn.system("command -v jdtls"))
local lombok_jar = vim.loop.os_homedir() .. "/.config/nvim/ftplugin/java/lombok.jar"

local config = {
	cmd = {
		jdtls_path,
		"--jvm-arg=-javaagent:" .. lombok_jar,
	},
	root_dir = vim.fs.dirname(
		vim.fs.find({ "build.gradle", "pom.xml", "gradlew", ".git", "mvnw" }, { upward = true })[1]
	),
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

require("jdtls").start_or_attach(config)
