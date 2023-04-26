return {
  n = {
    -- Buffer nav with Tab
    ["<Tab>"] = ":bn<CR>",
    ["<S-Tab>"] = ":bp<CR>",
    -- Gitlinker
    ["<leader>gy"] = { function() require("gitlinker").get_buf_range_url "n" end, desc = "URL on remote" },
  },
  v = {
    -- Gitlinker
    ["<leader>gy"] = { function() require("gitlinker").get_buf_range_url "v" end, desc = "URL on remote" },
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
