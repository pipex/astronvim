---@type LazySpec
return {
  "ojroques/nvim-osc52",
  lazy = true,
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        autocmds = {
          osc52_yank = {
            {
              event = "TextYankPost",
              desc = "Copy text over OSC52",
              callback = function()
                if vim.v.event.operator == "y" and vim.v.event.regname == "" then require("osc52").copy_register "" end
              end,
            },
          },
        },
      },
    },
  },
}
