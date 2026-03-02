-- Bypass Mason for Ruby tools - use mise-managed gems instead
-- See: https://github.com/mason-org/mason.nvim/issues/1777
local shims = vim.fn.expand("~/.local/share/mise/shims")

return {
  -- Configure ruby-lsp to use mise shims directly (not Mason)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false, -- Don't install via Mason
          cmd = { shims .. "/ruby-lsp" },
        },
      },
    },
  },

  -- Configure conform.nvim to use mise rubocop for formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        rubocop = {
          command = shims .. "/rubocop",
        },
      },
    },
  },

  -- Configure nvim-lint to use mise tools
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        rubocop = {
          cmd = shims .. "/rubocop",
        },
        erb_lint = {
          cmd = shims .. "/erb_lint",
        },
      },
    },
  },
}
