---@type LazyConfig
require("lazy").setup({
  -- TODO: change `branch="v4"` to `version="^4"` on release
  { "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" },
  -- AstroCommunity: import any community modules here
  -- TODO: Remove branch v4 on release
  { "AstroNvim/astrocommunity", branch = "v4" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  -- import/override with your plugins
  { import = "plugins" },
} --[[@as LazySpec]], {
  install = { colorscheme = { "catppuccin", "astrodark", "habamax" } },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
