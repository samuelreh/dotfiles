# Dotfiles

Personal dotfiles for macOS development environment. Manages shell configuration, git settings, and Neovim setup.

## Table of Contents

- [Shell (Zsh)](#shell-zsh)
- [Git](#git)
- [Neovim](#neovim)
- [Prerequisites](#prerequisites)

## Shell (Zsh)

Uses [Oh My Zsh](https://ohmyz.sh/) with the `zhann` theme.

**Plugins:** `git`, `ruby`, `vi-mode`

**Key bindings:**
- Vi mode enabled (`bindkey -v`)
- `Ctrl+R` for reverse history search

**Aliases:**
- `edit` -> `nvim`
- `today` -> Opens a dated notes file in VimR
- `find_and_replace` -> Perl in-place find/replace (from `profile`)

**Helper functions:**
- `kpodnames <app>` - List Kubernetes pod names for a given app selector
- `kpf <app> <port>` - Port-forward to the first pod of a given app

**Language managers:** rbenv, pyenv, nvm

**Tools:** Heroku CLI, Google Cloud SDK, autojump

## Git

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
- URLs: rewrites `git://` to `https://`
- Credentials: macOS Keychain

**Global gitignore:** `.swp`, `.swo`, `.tags`, `tags`, `.DS_STORE`, `pyrightconfig.json`, `.vim`, `.mypy_cache`, `scratch/`

## Neovim

Uses [vim-plug](https://github.com/junegunn/vim-plug) for plugin management.

**Plugins:**

| Plugin | Purpose |
|---|---|
| jellybeans.vim | Color scheme |
| denite.nvim | Fuzzy finder / search interface |
| neomru.vim | Most recently used files for Denite |
| vim-gitgutter | Git diff markers in the gutter |
| vim-fugitive | Git integration |
| jump.vim | Quick file jumping |
| coc.nvim | Intellisense / language server client |
| far.vim | Find and replace across files |
| yats.vim | TypeScript syntax highlighting |
| vim-ripgrep | Ripgrep integration |
| defx.nvim | File explorer |
| vim-go | Go development |
| vim-prettier | Code formatting (JS, TS, CSS, JSON, etc.) |
| vim-airline | Status line |
| SimpylFold | Python code folding |

**Key bindings:**

| Mapping | Action |
|---|---|
| `fi` | Find files (git-aware) |
| `fm` | Find most recently used files |
| `fb` | Find buffers |
| `ff` | Find files (recursive) |
| `fg` | Grep (via Denite + ripgrep) |
| `fs` | Grep word under cursor |
| `<leader>-` | Toggle Defx file explorer (vertical split) |
| `<leader>fr` | Global find and replace |
| `<space>` | Toggle fold (normal) / Create fold (visual) |
| `gd` | Go to definition (CoC) |
| `gy` | Go to type definition (CoC) |
| `gi` | Go to implementation (CoC) |
| `gr` | Go to references (CoC) |
| `[g` / `]g` | Previous / next diagnostic (CoC) |
| `F5` | Insert current date |

**Editor settings:**
- 2-space indentation (4 spaces for Python)
- Spaces over tabs
- Relative line numbers
- System clipboard integration
- Smart case search with highlighting

**CoC extensions:** `coc-solargraph` (Ruby), Pyright (Python), ESLint, Black (Python formatter)

## Prerequisites

- macOS
- [Oh My Zsh](https://ohmyz.sh/)
- [Neovim](https://neovim.io/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [ripgrep](https://github.com/BurntAnalytics/ripgrep) (used by Denite and vim-ripgrep)
- [Node.js](https://nodejs.org/) (required by CoC)
