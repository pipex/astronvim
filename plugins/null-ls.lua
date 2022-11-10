local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
	-- Check supported formatters
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
	local formatting = null_ls.builtins.formatting

	-- Check supported linters
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
	local diagnostics = null_ls.builtins.diagnostics
	return {
		sources = {
			-- Set a formatter
			formatting.stylua,
			formatting.prettier,
			formatting.shfmt,
			formatting.nixpkgs_fmt,
			formatting.rustfmt,
			-- Set a linter
			diagnostics.cue_fmt,
			diagnostics.shellcheck,
		},
	}
end
