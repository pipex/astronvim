return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    return require("astronvim.utils").extend_tbl(opts, {
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
    })
  end,
}
