return {
  n = {
    -- Buffer nav with Tab
    ["<Tab>"] = ":bn<CR>",
    ["<S-Tab>"] = ":bp<CR>",
    -- Gitlinker
    ["<leader>gy"] = { function() require("gitlinker").get_buf_range_url "n" end, desc = "URL on remote" },
    ["<leader>lo"] = {
      function()
        vim.lsp.buf.execute_command {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
      end,
      desc = "Organize Imports",
    },
    -- map home row arrows to something more compatible with
    -- my keyboard
    [";"] = "l",
    ["l"] = "k",
    ["k"] = "j",
    ["j"] = "h",
    ["h"] = "",
  },
  v = {
    -- Gitlinker
    ["<leader>gy"] = { function() require("gitlinker").get_buf_range_url "v" end, desc = "URL on remote" },
    -- Map home row arrows to something more compatible with
    -- my keyboard
    [";"] = "l",
    ["l"] = "k",
    ["k"] = "j",
    ["j"] = "h",
    ["h"] = "",
  },
  [""] = {
    -- Use Ctrl+C to go back to normal mode (useful with ipad keyboard which does not have a esc key)
    ["<C-c>"] = "<Esc>",
  },
  t = {
    -- extra mappings for terminal navigaton
    ["<Leader><esc>"] = "<c-\\><c-n>",
    ["<Esc><esc>"] = "<c-\\><c-n>:ToggleTerm<CR>",
  },
}
