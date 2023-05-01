return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "akinsho/toggleterm.nvim",     opts = { terminal_mappings = false } },
  { "rcarriga/nvim-notify",        opts = { background_colour = "#000000" } },

  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    },
  },

  { "gpanders/editorconfig.nvim", lazy = false },

  { "vito-c/jq.vim",              ft = "jq" },

  {
    "ojroques/nvim-osc52",
    init = function()
      function copy()
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then require("osc52").copy_register "" end
      end

      vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
    end,
  },

  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
    init = function() vim.g.table_mode_corner = "+" end,
  },

  {
    "ruifm/gitlinker.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
