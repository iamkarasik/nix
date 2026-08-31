local vim = vim

local jdtls_path = vim.fn.trim(vim.fn.system("command -v jdtls"))
local lombok_jar = vim.uv.os_homedir() .. "/.config/nvim/ftplugin/java/lombok.jar"
local ms_java_debug_jar = vim.uv.os_homedir() .. "/.config/nvim/ftplugin/java/java-debug.jar"

local jdtls = require("jdtls")

local root_dir = vim.fs.dirname(
	vim.fs.find({ "build.gradle", "pom.xml", "gradlew", ".git", "mvnw" }, { upward = true })[1]
)
local project_name = vim.fn.fnamemodify(root_dir, ":t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

local config = {
	cmd = {
		jdtls_path,
		"-data",
		workspace_dir,
		"--jvm-arg=-javaagent:" .. lombok_jar,
	},
	root_dir = root_dir,
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	init_options = {
		bundles = {
			ms_java_debug_jar,
		},
	},
	on_attach = function()
		jdtls.setup_dap({
			hotcodereplace = "auto",
		})
		require("jdtls.dap").setup_dap_main_class_configs()
	end,
}

jdtls.start_or_attach(config)
