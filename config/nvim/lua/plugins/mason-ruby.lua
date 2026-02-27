-- Bypass Mason for Ruby tools - use rbenv-managed gems instead
-- See: https://github.com/mason-org/mason.nvim/issues/1777
return {
  -- Configure ruby-lsp to use rbenv shims directly (not Mason)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false, -- Don't install via Mason
          cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
        },
      },
    },
  },

  -- Configure conform.nvim to use rbenv rubocop for formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        rubocop = {
          command = vim.fn.expand("~/.rbenv/shims/rubocop"),
        },
      },
    },
  },

  -- Configure nvim-lint to use rbenv tools
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        rubocop = {
          cmd = vim.fn.expand("~/.rbenv/shims/rubocop"),
        },
        erb_lint = {
          cmd = vim.fn.expand("~/.rbenv/shims/erb_lint"),
        },
      },
    },
  },
}
