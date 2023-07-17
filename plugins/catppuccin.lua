return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    transparent_background = true,
    term_colors = false,
    styles = {
      comments = { "italic" },
      functions = { "italic" },
      keywords = { "italic" },
      strings = {},
      variables = { "italic" },
    },
    integrations = {
      treesitter = true,
      telescope = true,
      which_key = true,
      dashboard = false,
      neogit = true,
      bufferline = true,
      markdown = true,
    },
  },
}
