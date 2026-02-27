# Dotfiles

Personal dotfiles for macOS development environment. Manages shell, git, Neovim, tmux, and terminal configuration.
## Installation

```bash
# Install Homebrew dependencies
brew bundle

# Symlink dotfiles
git clone https://github.com/samuelreh/dotfiles.git
cd dotfiles
./install.sh
```

The install script symlinks dotfiles to `~/.<name>` and config directories to `~/.config/<name>`. Existing files are backed up with a `.bak` suffix.

**Symlinked files:** `gitconfig`, `gitignore`, `zshrc`, `zprofile`, `tmux.conf`

**Symlinked config dirs:** `nvim`, `ghostty`, `starship`

**Brewfile:** Run `brew bundle` to install all dependencies (see `Brewfile` for the full list).

## Shell (Zsh)

Uses [Oh My Zsh](https://ohmyz.sh/) with [Starship](https://starship.rs/) prompt (git status, language versions, command duration).

**Plugins:** `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`

**Key features:**
- Vi mode enabled (`set -o vi`)
- [fzf](https://github.com/junegunn/fzf) integration for fuzzy file finding and completion
- [zoxide](https://github.com/ajeetdsouza/zoxide) for smarter directory navigation (`z` replaces `cd`)
- [direnv](https://direnv.net/) for per-directory environment variables
- Auto-starts [tmux](https://github.com/tmux/tmux) on shell launch (attaches to `main` session)

**Runtime manager:** [mise](https://mise.jdx.dev/) (Ruby, Node.js, Python, etc.)

**PATH additions:** `~/.local/bin`, PostgreSQL 16, Node.js 24, `.dotnet`

**Custom function:**
- `wt` — Shell wrapper for the `worktree` CLI with `cd` integration for `switch`, `new`, and `add` subcommands

## Git

**Signing:** SSH key signing via 1Password (`op-ssh-sign`)

**Pager:** [delta](https://github.com/dandavtez/delta) with side-by-side diffs, line numbers, and Catppuccin Mocha syntax theme

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
| `absorb` | `git-absorb` | Auto-fixup staged changes into prior commits |
| `r` | `log -20` | Recent 20 commits |
| `ra` | `log -20 --all` | Recent 20 commits across all branches |

**Behavior:**
- Editor: Neovim
- Push default: current branch
- Pull: always rebase
- Auto-setup rebase on new branches
- Merge conflict style: zdiff3
- Credentials: macOS Keychain (via 1Password SSH signing)
- Git LFS enabled

**Global gitignore:** `.swp`, `.swo`, `.tags`, `tags`, `.DS_STORE`, `pyrightconfig.json`, `.vim`, `.mypy_cache`, `scratch/`

## Neovim

Uses [LazyVim](https://www.lazyvim.org/) with [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

**Color scheme:** [Catppuccin Mocha](https://github.com/catppuccin/nvim) with custom subtle diff highlights

**LazyVim extras:** copilot, dap (core), flash, mini-diff, navic, todo-comments, trouble, dotnet, git, ruby, svelte, toml, yaml

**Plugins:**

| Plugin | Purpose |
|---|---|
| catppuccin/nvim | Catppuccin Mocha color scheme |
| sindrets/diffview.nvim | Side-by-side git diff viewer and file history |
| christoomey/vim-tmux-navigator | Seamless `C-h/j/k/l` navigation between vim and tmux panes |
| folke/snacks.nvim | Picker with grep word under cursor (`<leader>*`) |
| nvim-treesitter-textobjects | Treesitter-aware text objects for selecting, moving, and swapping functions/classes/parameters |
| neovim/nvim-lspconfig | LSP configuration (Ruby LSP via mise) |
| stevearc/conform.nvim | Formatting (rubocop via mise) |
| mfussenegger/nvim-lint | Linting (rubocop, erb_lint via mise) |

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
| `af`/`if` | Select around/inside function (treesitter) |
| `ac`/`ic` | Select around/inside class (treesitter) |
| `aa`/`ia` | Select around/inside parameter (treesitter) |
| `]m`/`[m` | Jump to next/previous function |
| `]]`/`[[` | Jump to next/previous class |
| `<leader>a`/`<leader>A` | Swap parameter forward/backward |

**Custom commands:**
- `:Dv [args]` — Shorthand for `:DiffviewOpen`

**Options:**
- Auto-formatting disabled on save
- Shell set to `/bin/zsh` (non-interactive, avoids fzf/oh-my-zsh escape codes)
- mise shims prepended to PATH for Mason compatibility
- Ruby tools (ruby-lsp, rubocop, erb_lint) bypass Mason and use mise-managed gems directly

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
- Session persistence via tmux-resurrect + tmux-continuum (auto-save and restore)

**Theme:** [Catppuccin Mocha](https://github.com/catppuccin/tmux) with rounded window status style

**Plugins (via [TPM](https://github.com/tmux-plugins/tpm)):**
- `tmux-sensible` — Sensible defaults
- `tmux-yank` — System clipboard integration
- `tmux-resurrect` — Save/restore sessions across restarts
- `tmux-continuum` — Continuous auto-saving of sessions
- `tmux-fzf` — Fuzzy-find sessions, windows, panes, and commands
- `catppuccin/tmux` — Theme

**Terminal:** True color (`tmux-256color`) with extended keys support for Ghostty and xterm-256color

## Ghostty

[Ghostty](https://ghostty.org/) terminal emulator configuration:

- **Font:** FiraCode Nerd Font Light, size 12.5
- **Theme:** Catppuccin Mocha
- **macOS:** Option key acts as Alt

## Planned Work

Recommendations for improving the current setup.

### Code Review Workflow

The current diffview setup (`<leader>gd` to open, `<leader>gD` to close) works well for editing within diffs but requires multiple steps to start a review. Consider these improvements:

- **Shell alias for PR review** — Add a shell function like `review() { nvim -c "DiffviewOpen origin/main...HEAD" }` to jump straight into a diffview session from the terminal. Optionally accept a branch arg: `review origin/main`.
- **[octo.nvim](https://github.com/pwntester/octo.nvim)** — Full GitHub PR review workflow inside Neovim: view PR diffs, read/write comments, approve/request changes, and merge — all without leaving the editor.
- **[gh-dash](https://github.com/dlvhdr/gh-dash)** — Terminal dashboard for GitHub PRs and issues with fuzzy search. Could serve as the entry point that launches nvim+diffview for the selected PR.

## Prerequisites

All prerequisites can be installed via `brew bundle` (see `Brewfile`).

- macOS (Apple Silicon / Homebrew in `/opt/homebrew`)
- [Oh My Zsh](https://ohmyz.sh/)
- [Starship](https://starship.rs/)
- [Neovim](https://neovim.io/)
- [Ghostty](https://ghostty.org/)
- [tmux](https://github.com/tmux/tmux) + [TPM](https://github.com/tmux-plugins/tpm)
- [mise](https://mise.jdx.dev/)
- [fzf](https://github.com/junegunn/fzf)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [direnv](https://direnv.net/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [delta](https://github.com/dandavtez/delta)
- [git-absorb](https://github.com/tummychow/git-absorb)
- [Node.js](https://nodejs.org/) (required by LazyVim)
- [1Password](https://1password.com/) (for SSH key signing)
- [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts)
