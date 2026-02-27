return {
  -- add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      custom_highlights = function(colors)
        return {
          -- Very subtle diff backgrounds (barely tinted from base #1e1e2e)
          DiffAdd = { bg = "#1e2622" },
          DiffDelete = { bg = "#261e21" },
          DiffChange = { bg = "#1e2028" },
          DiffText = { bg = "#222530" },
        }
      end,
    },
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}