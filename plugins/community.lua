return {
  { "AstroNvim/astrocommunity",               dev = false },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = false,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- I don't need eslint for now
      local formatters = {}
      for k, v in ipairs(opts.ensure_installed) do
        if v ~= "eslint_d" then formatters[k] = v end
      end
      opts.ensure_installed = formatters

      local handlers = {}
      for k, v in pairs(opts.handlers) do
        if k ~= "eslint_d" then handlers[k] = v end
      end
      opts.handlers = handlers
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {},
  },
}
