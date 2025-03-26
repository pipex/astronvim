---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  dependencies = {
    {
      "AstroNvim/astroui",
      opts = { colorscheme = "catppuccin" } --[[@as AstroUIOpts]],
    },
  },
  ---@type CatppuccinOptions
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
      which_key = true,
      dashboard = false,
      neogit = true,
      bufferline = true,
      markdown = true,
      indent_blankline = {
        enabled = true,
        scope_color = "surface2", -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = false,
      },
    },
  },
}
