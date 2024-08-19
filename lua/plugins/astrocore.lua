---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        wrap = true, -- soft wrap lines
        linebreak = true, -- linebreak soft wrap at words
        list = true,
        listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
        showbreak = "↪ ",
      },
    },
    mappings = {
      n = {
        -- Buffer nav with Tab
        ["<Tab>"] = ":bn<CR>",
        ["<S-Tab>"] = ":bp<CR>",
        -- map home row arrows to something more compatible with
        -- my keyboard
        [";"] = "l",
        ["l"] = "k",
        ["k"] = "j",
        ["j"] = "h",
        ["h"] = "",
      },
      v = {
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
      -- t = {
      --   -- extra mappings for terminal navigaton
      --   ["<Leader><esc>"] = "<c-\\><c-n>",
      --   ["<Esc><esc>"] = "<c-\\><c-n>:ToggleTerm<CR>",
      -- },
    },
  },
}
