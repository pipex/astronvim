return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.cue" },
  -- NOTE: this may not work for all language servers
  -- https://github.com/AstroNvim/AstroNvim/commit/4a8443bf46f9071f016bb94e1c2367f2c9956bf2
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
}
