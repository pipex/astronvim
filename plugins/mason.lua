return {
  { "williamboman/mason.nvim", opts = { PATH = "append" } },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "cssls",
        "gopls",
        "html",
        "marksman",
        "jsonls",
        "lua_ls",
        "tsserver",
        "yamlls",
        "rnix",
        "rust_analyzer",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "stylua",
        "prettierd",
        "shfmt",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "js",
      },
    },
  },
}
