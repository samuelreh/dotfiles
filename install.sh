#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Files that get symlinked to ~/.<name>
files=(gitconfig gitignore zshrc zprofile tmux.conf)

# Config directories that get symlinked to ~/.config/<name>
config_dirs=(nvim ghostty starship)

for name in "${files[@]}"; do
  target="$HOME/.$name"
  source="$DOTFILES_DIR/$name"
  if [ -L "$target" ]; then
    echo "Updating symlink $target"
    rm "$target"
  elif [ -e "$target" ]; then
    echo "Backing up $target to $target.bak"
    mv "$target" "$target.bak"
  fi
  ln -s "$source" "$target"
  echo "Linked $target -> $source"
done

mkdir -p "$HOME/.config"
for name in "${config_dirs[@]}"; do
  target="$HOME/.config/$name"
  source="$DOTFILES_DIR/config/$name"
  if [ -L "$target" ]; then
    echo "Updating symlink $target"
    rm "$target"
  elif [ -e "$target" ]; then
    echo "Backing up $target to $target.bak"
    mv "$target" "$target.bak"
  fi
  ln -s "$source" "$target"
  echo "Linked $target -> $source"
done

echo "Done!"
