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
			-- Set a linter
			diagnostics.cue_fmt,
			diagnostics.shellcheck,
		},
		-- NOTE: You can remove this on attach function to disable format on save
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.api.nvim_create_autocmd("BufWritePre", {
					desc = "Auto format before save",
					pattern = "<buffer>",
					callback = function()
						vim.lsp.buf.formatting_sync(nil, 2000)
					end,
				})
			end
		end,
	}
end
