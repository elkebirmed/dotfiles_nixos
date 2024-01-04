return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    lazy = true,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
      },
    },
  },
}
