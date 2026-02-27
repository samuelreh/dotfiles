# Dotfiles

Personal dotfiles for macOS development environment. Manages shell, git, Neovim, tmux, and terminal configuration.
## Installation

```bash
git clone https://github.com/samuelreh/dotfiles.git
cd dotfiles
./install.sh
```

The install script symlinks dotfiles to `~/.<name>` and config directories to `~/.config/<name>`. Existing files are backed up with a `.bak` suffix.

**Symlinked files:** `gitconfig`, `gitignore`, `zshrc`, `zprofile`, `tmux.conf`

**Symlinked config dirs:** `nvim`, `ghostty`

## Shell (Zsh)

Uses [Oh My Zsh](https://ohmyz.sh/) with a minimal custom prompt (`cyan dir + yellow ✗`).

**Plugins:** `git`

**Key features:**
- Vi mode enabled (`set -o vi`)
- [fzf](https://github.com/junegunn/fzf) integration for fuzzy file finding and completion
- [direnv](https://direnv.net/) for per-directory environment variables
- Auto-starts [tmux](https://github.com/tmux/tmux) on shell launch (attaches to `main` session)

**Language managers:** rbenv (Ruby)

**PATH additions:** `~/.local/bin`, PostgreSQL 16, Node.js 24, `.dotnet`

**Custom function:**
- `wt` — Shell wrapper for the `worktree` CLI with `cd` integration for `switch`, `new`, and `add` subcommands

## Git

**Signing:** SSH key signing via 1Password (`op-ssh-sign`)

**Aliases:**

| Alias | Command | Description |
|---|---|---|
| `st` | `status` | Short status |
| `ci` | `commit -v` | Commit with diff |
| `co` | `checkout` | Checkout |
| `di` | `diff` | Diff |
| `dc` | `diff --cached` | Diff staged changes |
| `amend` | `commit --amend` | Amend last commit |
| `aa` | `add --all` | Stage all changes |
| `ff` | `merge --ff-only` | Fast-forward merge |
| `pullff` | `pull --ff-only` | Fast-forward pull |
| `fa` | `fetch --all` | Fetch all remotes |
| `pom` | `push origin master` | Push to origin/master |
| `br` | `for-each-ref ...` | List branches sorted by last commit date |
| `dfw` | `diff --ignore-space-change` | Diff ignoring whitespace |
| `r` | `log -20` | Recent 20 commits |
| `ra` | `log -20 --all` | Recent 20 commits across all branches |

**Behavior:**
- Editor: Neovim
- Push default: current branch
- Pull: always rebase
- Auto-setup rebase on new branches
- Credentials: macOS Keychain (via 1Password SSH signing)
- Git LFS enabled

**Global gitignore:** `.swp`, `.swo`, `.tags`, `tags`, `.DS_STORE`, `pyrightconfig.json`, `.vim`, `.mypy_cache`, `scratch/`

## Neovim

Uses [LazyVim](https://www.lazyvim.org/) with [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

**Color scheme:** [Catppuccin Mocha](https://github.com/catppuccin/nvim) with custom subtle diff highlights

**LazyVim extras:** mini-diff, dotnet, git, ruby, svelte, toml, yaml

**Plugins:**

| Plugin | Purpose |
|---|---|
| catppuccin/nvim | Catppuccin Mocha color scheme |
| sindrets/diffview.nvim | Side-by-side git diff viewer and file history |
| christoomey/vim-tmux-navigator | Seamless `C-h/j/k/l` navigation between vim and tmux panes |
| folke/snacks.nvim | Picker with grep word under cursor (`<leader>*`) |
| neovim/nvim-lspconfig | LSP configuration (Ruby LSP via rbenv) |
| stevearc/conform.nvim | Formatting (rubocop via rbenv) |
| mfussenegger/nvim-lint | Linting (rubocop, erb_lint via rbenv) |

**Disabled plugins:** `noice.nvim` (to fix `:!` command escape codes), `telescope.nvim` (replaced by snacks picker)

**Custom keymaps:**

| Mapping | Action |
|---|---|
| `<C-w>\|` | Vertical split |
| `<C-w>-` | Horizontal split |
| `<leader>gd` | Open diffview |
| `<leader>gD` | Close diffview |
| `<leader>gh` | File history (current file) |
| `<leader>gH` | File history (all files) |
| `<leader>gm` | Diff against origin/main merge-base |
| `<leader>*` | Grep word under cursor |
| `<C-h/j/k/l>` | Navigate between vim/tmux panes |

**Custom commands:**
- `:Dv [args]` — Shorthand for `:DiffviewOpen`

**Options:**
- Auto-formatting disabled on save
- Shell set to `/bin/zsh` (non-interactive, avoids fzf/oh-my-zsh escape codes)
- rbenv shims prepended to PATH for Mason compatibility
- Ruby tools (ruby-lsp, rubocop, erb_lint) bypass Mason and use rbenv-managed gems directly

## Tmux

Prefix key: `C-a`

**Key bindings:**

| Mapping | Action |
|---|---|
| `prefix + h/j/k/l` | Navigate panes (vim-style) |
| `Shift-Left/Right` or `M-h/l` | Switch windows |
| `prefix + \|` | Vertical split (in current path) |
| `prefix + -` | Horizontal split (in current path) |
| `prefix + q` | Kill pane |
| `prefix + r` | Reload tmux config |
| `C-h/j/k/l` | Seamless vim/tmux pane navigation |

**Copy mode (vi):**
- `v` to start selection, `C-v` for rectangle toggle, `y` to yank (copies to macOS clipboard)

**Settings:**
- Mouse enabled
- Vi mode keys
- 1-indexed windows and panes with auto-renumbering
- Bells/activity notifications disabled

**Theme:** [Catppuccin Mocha](https://github.com/catppuccin/tmux) with rounded window status style

**Plugins (via [TPM](https://github.com/tmux-plugins/tpm)):**
- `tmux-sensible` — Sensible defaults
- `tmux-yank` — System clipboard integration
- `catppuccin/tmux` — Theme

**Terminal:** True color (`tmux-256color`) with extended keys support for Ghostty and xterm-256color

## Ghostty

[Ghostty](https://ghostty.org/) terminal emulator configuration:

- **Font:** FiraCode Nerd Font Light, size 12.5
- **Theme:** Catppuccin Mocha
- **macOS:** Option key acts as Alt

## Planned Work

Recommendations for additional plugins and configurations to consider.

### Shell

- **[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)** — Fish-like inline suggestions from command history as you type. Pairs well with the existing fzf integration.
- **[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)** — Real-time command syntax highlighting in the terminal. Helps catch typos before hitting enter.
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** — Smarter `cd` that learns your most-visited directories. Much faster than typing full paths or using `cd -`.
- **[Starship](https://starship.rs/)** — Cross-shell prompt with git status, language versions, and command duration built in. Could replace the custom Oh My Zsh prompt with richer info.

### Neovim

- **[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)** — Select, move, and swap functions/classes/arguments using treesitter-aware text objects (e.g., `vaf` to select a function, `]m` to jump to next method).
- **[flash.nvim](https://github.com/folke/flash.nvim)** — Enhanced motion plugin for jumping anywhere on screen with minimal keystrokes. LazyVim extra available.
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** — Debug Adapter Protocol client for step-through debugging directly in Neovim. LazyVim extra available for Ruby and other languages.
- **[copilot.vim](https://github.com/zbirenbaum/copilot.lua)** or **[codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim)** — AI code completion and chat within Neovim. LazyVim extras available for Copilot.
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** — Highlight and search TODO/FIXME/HACK comments across the project. LazyVim extra available.
- **[trouble.nvim](https://github.com/folke/trouble.nvim)** — Pretty diagnostics list for navigating errors, warnings, and LSP references in a unified panel.

### Tmux

- **[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)** — Save and restore tmux sessions (windows, panes, layouts) across system restarts. No more rebuilding your workspace after a reboot.
- **[tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)** — Continuous auto-saving of tmux sessions. Works with tmux-resurrect for fully automatic session persistence.
- **[tmux-fzf](https://github.com/sainnhe/tmux-fzf)** — Fuzzy-find tmux sessions, windows, panes, and commands. Natural fit with the existing fzf setup.

### Git

- **[delta](https://github.com/dandavtez/delta)** — Syntax-highlighted, side-by-side diffs in the terminal with line numbers. Drop-in replacement for the default git pager.
- **[git-absorb](https://github.com/tummychow/git-absorb)** — Automatically fixup staged changes into the correct prior commits during interactive rebases. Great for keeping commit history clean.

### General

- **[Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)** — Add a `Brewfile` to version-control all Homebrew dependencies (fzf, ripgrep, direnv, neovim, etc.) so the full environment can be reproduced with `brew bundle`.
- **[mise](https://mise.jdx.dev/)** — Unified runtime version manager that can replace rbenv (and handle Node.js, Python, Go, etc.) with a single tool and `.mise.toml` config per project.

## Prerequisites

- macOS (Apple Silicon / Homebrew in `/opt/homebrew`)
- [Oh My Zsh](https://ohmyz.sh/)
- [Neovim](https://neovim.io/)
- [Ghostty](https://ghostty.org/)
- [tmux](https://github.com/tmux/tmux) + [TPM](https://github.com/tmux-plugins/tpm)
- [rbenv](https://github.com/rbenv/rbenv)
- [fzf](https://github.com/junegunn/fzf)
- [direnv](https://direnv.net/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Node.js](https://nodejs.org/) (required by LazyVim)
- [1Password](https://1password.com/) (for SSH key signing)
- [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts)
