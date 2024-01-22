---@type LazySpec
return {
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  { "akinsho/toggleterm.nvim", opts = { terminal_mappings = false } },
  { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
  { "williamboman/mason.nvim", opts = { PATH = "append" } },

  { "vito-c/jq.vim", ft = "jq" },
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy", opts = {} },

  {
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
                  if vim.v.event.operator == "y" and vim.v.event.regname == "" then
                    require("osc52").copy_register ""
                  end
                end,
              },
            },
          },
        },
      },
    },
  },
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
  {
    "ruifm/gitlinker.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              ["<Leader>gy"] = { function() require("gitlinker").get_buf_range_url "n" end, desc = "URL on remote" },
            },
            v = {
              ["<Leader>gy"] = { function() require("gitlinker").get_buf_range_url "v" end, desc = "URL on remote" },
            },
          },
        },
      },
    },
  },
}
