return {
  cargo = {
    buildScripts = {
      enable = true,
    },
  },
  procMacro = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    disabled = { "unresolved-proc-macro" },
    enableExperimental = true,
  },
}
