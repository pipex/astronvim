---@type LazySpec
return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy", opts = {} },

  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
    dependencies = {
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = { options = { g = {
          table_mode_corner = "+",
        } } },
      },
    },
  },
}
