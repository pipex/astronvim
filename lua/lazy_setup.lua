---@type LazyConfig
require("lazy").setup({
  { "AstroNvim/AstroNvim", version = "^4", import = "astronvim.plugins" },
  -- Which key is a bit buggy right now, this pins it to the latest working version
  { "folke/which-key.nvim", version = "2.1" },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  install = { colorscheme = { "catppuccin", "astrodark", "habamax" } },
  ui = { backdrop = 100 },
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
