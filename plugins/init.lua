return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "akinsho/toggleterm.nvim", opts = { terminal_mappings = false } },
  { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },

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

  { "vito-c/jq.vim", ft = "jq" },

  {
    "ojroques/vim-oscyank",
    lazy = false,
    init = function()
      vim.cmd [[autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankRegister +"' | endif]]
      vim.g.oscyank_term = "default"
    end,
  },

  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
    init = function() vim.g.table_mode_corner = "|" end,
  },

  {
    "ruifm/gitlinker.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
