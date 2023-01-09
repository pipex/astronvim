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
      vim.cmd [[autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif]]
      vim.g.oscyank_term = "default"
    end,
  },

  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = function()
      local M = {}
      M.snippet_engine = "luasnip"
      M.languages = {}
      M.languages.python = { template = { annotation_convention = "google_docstrings" } }
      M.languages.typescript = { template = { annotation_convention = "tsdoc" } }
      M.languages.typescriptreact = M.languages.typescript
      return M
    end,
  },

  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
    init = function() vim.g.table_mode_corner = "|" end,
  },

  {
    "vitalk/vim-simple-todo",
    lazy = false,
    init = function() vim.g.simple_todo_map_keys = false end,
  },

  {
    "preservim/vim-markdown",
    ft = "markdown",
    init = function()
      vim.g.vim_markdown_auto_insert_bullets = false
      vim.g.vim_markdown_new_list_item_indent = 0
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },

  {
    "mickael-menu/zk-nvim",
    opts = {
      picker = "telescope",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
          on_attach = require("astronvim.utils.lsp").on_attach,
          capabilities = require("astronvim.utils.lsp").capabilities,
        },
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    },
  },

  {
    "ruifm/gitlinker.nvim",
    opts = {
      opts = {
        -- action_callback = require("gitlinker.actions").open_in_browser,
        -- print_url = false,
      },
    },
  },
}
