---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable-next-line: missing-fields
    config = {
      ---@diagnostic disable-next-line: missing-fields
      tsserver = {
        commands = {
          OrganizeImports = {
            function()
              vim.lsp.buf.execute_command {
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(0) },
                title = "",
              }
            end,
            description = "Organize Imports (tsserver)",
          },
        },
      },
    },
    mappings = {
      n = {
        ["<Leader>lo"] = {
          function() vim.cmd.OrganizeImports() end,
          desc = "Organize Imports",
          cond = function() return vim.fn.exists ":OrganizeImports" > 0 end,
        },
      },
    },
  },
}
