return {
	lsp = {
		servers = {
			"rust_analyzer",
		},
		["server-settings"] = {
			rust_analyzer = {
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
			},
		},
	},
}
