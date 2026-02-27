-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable auto-formatting on save
vim.g.autoformat = false

-- Use non-interactive shell to avoid escape code issues from fzf/oh-my-zsh
vim.o.shell = "/bin/zsh"
vim.o.shellcmdflag = "-c"

-- Prepend mise shims to PATH so Mason uses the correct runtime versions
vim.env.PATH = vim.fn.expand("~/.local/share/mise/shims") .. ":" .. vim.env.PATH
