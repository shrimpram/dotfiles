local config = {
  cmd = { "/opt/homebrew/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  init_options = {
    bundles = {
      vim.fn.glob(
        "~/Documents/src/github.com/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
        1
      ),
    },
  },
}
require("jdtls").start_or_attach(config)
require("jdtls.setup").add_commands()
-- require("jdtls").setup_dap()
require("jdtls").setup_dap({ javaExec = "/opt/homebrew/opt/openjdk/bin/java" })
