---@type LazySpec
return {
  "ruifm/gitlinker.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = {
            ["<Leader>gy"] = { function() require("gitlinker").get_buf_range_url "n" end, desc = "Copy permalink" },
          },
          v = {
            ["<Leader>gy"] = { function() require("gitlinker").get_buf_range_url "v" end, desc = "Copy permalink" },
          },
        },
      },
    },
  },
}
