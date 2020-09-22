#!/usr/bin/env sh
set -e

OSTYPE=$(uname -s)
DOTREPO="https://github.com/derbalkon/dotfiles.git"

if [ "$OSTYPE" = "Darwin" ]; then
  # install homebrew if it's missing
  if ! command -v brew >/dev/null 2>&1; then
    echo ">>> Installing homebrew.."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  # install homebrew packages
  if [ -f "$HOME/.Brewfile" ]; then
    echo ">>> Installing brew packages.."
    brew bundle --global
  fi
  # set up once dotfiles repo has been cloned
  echo ">>> Cloning the dotfiles repo and setting up"
  yadm clone "$DOTREPO" --bootstrap
fi

echo "Done."